<?php

namespace App\Http\Controllers\PersonalInformation;

use App\Models\PersonalInformation\CurrentLocation;
use App\Models\PersonalInformation\MaritalStatus;
use App\Models\PersonalInformation\MaritalStatusTranslation;
use App\Models\PersonalInformation\Nationality;
use App\Models\PersonalInformation\NationalityTranslation;
use App\Models\PersonalInformation\PersonalInformation;
use App\Models\PersonalInformation\PlaceOfBirth;
use App\Models\Resume;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Controllers\ApiController;
use Illuminate\Support\Facades\DB;

class PersonalInformationController extends ApiController
{
    public function __construct()
    {
        $this->middleware('jwt.auth');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $rules = [
            'resume_id' => 'required|integer',
            'first_name' => 'required|string',
            'last_name' => 'required|string',
            'gender' => 'required|string',
            // 'marital_status_id' => 'required',
            'date_of_birth' => 'required',
            'nationalities' => 'required'
        ];

        $DOBRules = [
            'year' => 'required|string',
            'month' => 'required|string',
            'day' => 'required|string'
        ];

//        $POBRules = [
//            'country' => 'required|string',
//            'city' => 'required|string',
//            'latitude' => 'required',
//            'longitude' => 'required'
//        ];
//
//        $CLRules = [
//            'country' => 'required|string',
//            'city' => 'required|string',
//            'postal_code' => 'required|string',
//            'street_address' => 'required|string',
//            'latitude' => 'required',
//            'longitude' => 'required'
//        ];

        $this->validate($request, $rules);

        $resume = Resume::findOrFail($request->resume_id);

        if ($resume->personalInformation !== null) {
            return $this->errorResponse("Trying To Access Filled Field.", 409);
        }

        return DB::transaction(function () use ($request, $resume, $DOBRules) {

            $DOBRequest = new Request($request->date_of_birth);

            $date_of_birth = "";
            if ($request->has('date_of_birth')) {
                $this->validate($DOBRequest, $DOBRules);
                $year = $DOBRequest->year;
                $month = $DOBRequest->month;
                $day = $DOBRequest->day;

                $date_string = $year . "-" . $month . "-" . $day;
                $date_time = new \DateTime();
                $date_of_birth = $date_time->createFromFormat('Y-m-d', $date_string);
            }

            $personalInformation = new PersonalInformation();
            $personalInformation->resume_id = $request->resume_id;
            $personalInformation->first_name = $request->first_name;
            $personalInformation->middle_name = $request->has('middle_name') ? $request->middle_name : null;
            $personalInformation->last_name = $request->last_name;
            $personalInformation->resume_title = $request->has('resume_title') ? $request->resume_title : null;
            $personalInformation->gender = $request->gender;
//            $personalInformation->marital_status = $request->marital_status;
            $personalInformation->marital_status_id = $request->has('marital_status_id') ? $request->marital_status_id : null;
            $personalInformation->date_of_birth = $date_of_birth;
            $personalInformation->save();

            if ($request->has('place_of_birth')) {
                $POBRequest = new Request($request->place_of_birth);
//                $this->validate($POBRequest, $POBRules);
                PlaceOfBirth::create([
                    'personal_information_id' => $personalInformation->id,
                    'country' => $POBRequest->country,
                    'city' => $POBRequest->city,
                    'latitude' => $POBRequest->latitude,
                    'longitude' => $POBRequest->longitude
                ]);
            }

            if ($request->has('current_location')) {
                $CLRequest = new Request($request->current_location);
//                $this->validate($CLRequest, $CLRules);
                CurrentLocation::create([
                    'personal_information_id' => $personalInformation->id,
                    'country' => $CLRequest->country,
                    'city' => $CLRequest->city,
                    'postal_code' => $CLRequest->postal_code,
                    'street_address' => $CLRequest->street_address,
                    'latitude' => $CLRequest->latitude,
                    'longitude' => $CLRequest->longitude
                ]);
            }

            if ($request->nationalities !== []) {
                foreach ($request->nationalities as $value) {
                    //$nationality = Nationality::where('name', $value)->first();
                    $personalInformation->nationalities()->attach([$value]);
                }
            }

            $personalInformation->nationalities;
            $personalInformation->currentLocation;
            $personalInformation->placeOfBirth;
            $resume_translated_language = $resume->translated_languages_id;
            $personal_info = PersonalInformation::where('resume_id', $resume->id)->
            with('placeOfBirth', 'currentLocation')->
            with(array('maritalStatus.maritalStatusTranslation' => function ($query) use ($resume_translated_language) {
                $query->where('translated_languages_id', $resume_translated_language);
            }))->
            with(array('nationalities.nationalityTranslation' => function ($query) use ($resume_translated_language) {

                $query->where('translated_languages_id', $resume_translated_language);
            }))
                ->first();
//            $personal_info = DB::table('personal_informations') //  returen marital_status_translations not as object
//                ->where('personal_informations.resume_id',$resume->id)
//                ->leftjoin('marital_statuses','marital_statuses.id','=','personal_informations.marital_status_id')
//                ->leftjoin('marital_status_translations','marital_statuses.id','=','marital_status_translations.marital_status_id')
//                ->where('marital_status_translations.translated_languages_id','=',$resume_translated_language)
////                ->select('marital_statuses.id','marital_status_translations.translated_languages_id','marital_status_translations.name')
//                ->get()
//            ;
            return $this->showOne($personal_info);

        });
    }


    /**
     * Display the specified resource.
     *
     * @param  \App\Models\PersonalInformation\PersonalInformation $personalInformation
     * @return \Illuminate\Http\Response
     */
    public function show($resumeId)
    {
        $resume = Resume::findOrFail($resumeId);
        $user = auth()->user();
        if ($user->id != $resume->user->id) return $this->errorResponse('you are not authorized to do this operation', 401);
//       resume translated language
        $resume_translated_language = $resume->translated_languages_id;

        $personal_info = PersonalInformation::where('resume_id', $resumeId)->
        with('placeOfBirth', 'currentLocation')->
        with(array('maritalStatus.maritalStatusTranslation' => function ($query) use ($resume_translated_language) {
            $query->where('translated_languages_id', $resume_translated_language);
        }))->
        with(array('nationalities.nationalityTranslation' => function ($query) use ($resume_translated_language) {
            $query->where('translated_languages_id', $resume_translated_language);
        }))->get();
        return response()->json([
            'personal_info' => $personal_info,
        ]);
    }

    public function personalInfoData($resume_id)
    {
        $resume = Resume::findOrFail($resume_id);
//         resume translated language
        $resume_translated_language = $resume->translated_languages_id;
        $marital_status_trans = MaritalStatusTranslation::where('translated_languages_id', $resume_translated_language)->
        get(['marital_status_id', 'name']);

        $nationalities_trans = NationalityTranslation::where('translated_languages_id', $resume_translated_language)->
        get(['nationality_id', 'name']);

        return response()->json([
            'marital_status_translations' => $marital_status_trans,
            'nationality_translations' => $nationalities_trans
        ]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request $request
     * @param  \App\Models\PersonalInformation\PersonalInformation $personalInformation
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, PersonalInformation $personalInformation)
    {
        $resume = Resume::findOrFail($request['resume_id']);
        $user = auth()->user();
        if ($user->id != $resume->user->id)
            return $this->errorResponse('you are not authorized to do this operation', 401);

        $rules = [
            'resume_id' => 'required|integer',
            'first_name' => 'required|string',
            'last_name' => 'required|string',
            'gender' => 'required|string',
            // 'marital_status_id' => 'required',
            'date_of_birth' => 'required',
            'nationalities' => 'required'
        ];

        $DOBRules = [
            'year' => 'required|string',
            'month' => 'required|string',
            'day' => 'required|string'
        ];

//        $POBRules = [
//            'country' => 'required|string',
//            'city' => 'required|string',
//            'latitude' => 'required',
//            'longitude' => 'required'
//        ];
//
//        $CLRules = [
//            'country' => 'required|string',
//            'city' => 'required|string',
//            'postal_code' => 'required|string',
//            'street_address' => 'required|string',
//            'latitude' => 'required',
//            'longitude' => 'required'
//        ];

        $this->validate($request, $rules);

        return DB::transaction(function () use ($request, $personalInformation, $DOBRules, $resume) {

            $date_of_birth = "";
            if ($request->has('date_of_birth')) {
                $DOBRequest = new Request($request->date_of_birth);
                $this->validate($DOBRequest, $DOBRules);
                $year = $DOBRequest->year;
                $month = $DOBRequest->month;
                $day = $DOBRequest->day;

                $date_string = $year . "-" . $month . "-" . $day;
                $date_time = new \DateTime();
                $date_of_birth = $date_time->createFromFormat('Y-m-d', $date_string);
            }
            $personalInformation->first_name = $request->first_name;
            $personalInformation->middle_name = $request->has('middle_name') ? $request->middle_name : null;
            $personalInformation->last_name = $request->last_name;
            $personalInformation->resume_title = $request->has('resume_title') ? $request->resume_title : null;
            $personalInformation->gender = $request->gender;
            $personalInformation->marital_status_id = $request->has('marital_status_id') ? $request->marital_status_id : null;

            $personalInformation->date_of_birth = $date_of_birth;
            $personalInformation->save();

            if ($request->has('place_of_birth')) {
                $personalInformation->placeOfBirth()->delete();
                $POBRequest = new Request($request->place_of_birth);
//                $this->validate($POBRequest, $POBRules);
                PlaceOfBirth::create([
                    'personal_information_id' => $personalInformation->id,
                    'country' => $POBRequest->country,
                    'city' => $POBRequest->city,
                    'latitude' => $POBRequest->latitude,
                    'longitude' => $POBRequest->longitude
                ]);
            }

            if ($request->has('current_location')) {
                $personalInformation->currentLocation()->delete();
                $CLRequest = new Request($request->current_location);
//                $this->validate($CLRequest, $CLRules);
                CurrentLocation::create([
                    'personal_information_id' => $personalInformation->id,
                    'country' => $CLRequest->country,
                    'city' => $CLRequest->city,
                    'postal_code' => $CLRequest->postal_code,
                    'street_address' => $CLRequest->street_address,
                    'latitude' => $CLRequest->latitude,
                    'longitude' => $CLRequest->longitude
                ]);
            }

            if ($request->has('nationalities')) {
                $personalInformation->nationalities()->detach();

                foreach ($request->nationalities as $value) {
                    //$nationality = Nationality::where('name', $value)->first();
                    $personalInformation->nationalities()->attach([$value]);
                }
            }

            $personalInformation->nationalities;
            $personalInformation->currentLocation;
            $personalInformation->placeOfBirth;
//       resume translated language
            $resume_translated_language = $resume->translated_languages_id;

            $personal_info = PersonalInformation::where('resume_id', $resume->id)->
            with('placeOfBirth', 'currentLocation')->
            with(array('maritalStatus.maritalStatusTranslation' => function ($query) use ($resume_translated_language) {
                $query->where('translated_languages_id', $resume_translated_language);
            }))->
            with(array('nationalities.nationalityTranslation' => function ($query) use ($resume_translated_language) {
                $query->where('translated_languages_id', $resume_translated_language);
            }))
                ->first();

            return $this->showOne($personal_info);
        });
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\PersonalInformation\PersonalInformation $personalInformation
     * @return \Illuminate\Http\Response
     */
    public function destroy(Resume $personalInformation)
    {
//        $personalInformationId = $personalInformation->personalInformation->id;
//        $personalInformation = PersonalInformation::where('id', $personalInformationId)->with(['placeOfBirth', 'currentLocation', 'nationalities'])->get();
//        return $this->showAll($personalInformation);
    }
}
