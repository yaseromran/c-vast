<?php

namespace App\Http\Controllers\ContactInformation;

use App\Http\Controllers\ApiController;
use App\Models\ContactInfo\ContactInformation;
use App\Models\ContactInfo\ContactNumber;
use App\Models\ContactInfo\Email;
use App\Models\ContactInfo\InternetCommunication;
use App\Models\ContactInfo\PersonalLink;
use App\Models\ContactInfo\PhoneTypeTranslation;
use App\Models\Country\Country;
use App\Models\Country\CountryTranslation;
use App\Models\InternetCommunicationType;
use App\Models\Resume;
use App\Models\SocialMedia\SocialMedia;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use function reset;
use function response;

class ContactInfoController extends ApiController
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

    private function storeValidation($request)
    {
        foreach ($request->emails as $email) {
            $emailRequest = new Request($email);
            $this->validate($emailRequest, ['email_address' => 'email']);
        }
        if ($request->has('contact_numbers')) {
            foreach ($request->contact_numbers as $number) {
                $numberRequest = new Request($number);
                $this->validate($numberRequest, [
                    'country_id' => 'required',
                    'phone_number' => 'required',
                ]);
            }
        }
        if ($request->has('internet_communications')) {
            foreach ($request->internet_communications as $account) {
                $accountRequest = new Request($account);
                $this->validate($accountRequest, [
                    'internet_communication_type_id' => 'required',
                    'address' => 'required',
                ]);
            }
        }
        if ($request->has('personal_links')) {
            foreach ($request->personal_links as $account) {
                $accountRequest = new Request($account);
                $this->validate($accountRequest, [
                    'social_media_id' => 'required',
                    'url' => 'required',
                ]);
            }
        }

    }

    public function store(Request $request)
    {

        $this->validate($request, ['emails' => 'required', 'resume_id' => 'required|integer']);
        /*
         * If CV already has Contact Information we can't add another one
         * because the relation is one to one
        */

        $resume = Resume::findOrFail($request->resume_id);

        if ($resume->contactInformation != null) {
            return $this->errorResponse('Trying To Access Filled Field', 409);
        }

        $this->storeValidation($request);


        return DB::transaction(function () use ($request, $resume) {
            $contactInfo = ContactInformation::create(['resume_id' => $request->resume_id]);

            foreach ($request->emails as $email) {
                Email::create([
                    'contact_information_id' => $contactInfo->id,
                    'email_address' => $email['email_address']
                ]);
            }
            if ($request->has('contact_numbers')) {
                foreach ($request->contact_numbers as $number) {
                    ContactNumber::create([
                        'phone_type_id' => $number['phone_type_id'],
                        'country_id' => $number['country_id'],
                        'phone_number' => $number['phone_number'],
                        'contact_information_id' => $contactInfo->id
                    ]);
                }
            }
            if ($request->has('internet_communications')) {
                foreach ($request->internet_communications as $account) {
                    InternetCommunication::create([
                        'internet_communication_type_id' => $account['internet_communication_type_id'],
                        'address' => $account['address'],
                        'contact_information_id' => $contactInfo->id

                    ]);
                }
            }
            if ($request->has('personal_links')) {
                foreach ($request->personal_links as $account) {
                    PersonalLink::create([
                        'social_media_id' => $account['social_media_id'],
                        'url' => $account['url'],
                        'contact_information_id' => $contactInfo->id
                    ]);
                }
            }
            $contactInfo->emails;
            $contactInfo->contactNumbers;
            $contactInfo->internetCommunications;
            $contactInfo->personalLinks;

            $resume_translated_language = $resume->translated_languages_id;
            $contact_information = ContactInformation::where('resume_id', $resume->id)->
            with('emails', 'internetCommunications.internetCommunicationType', 'personalLinks.socialMedia', 'contactNumbers'
            )->
            with(array('contactNumbers.phoneType.PhoneTypeTranslation' => function ($query) use ($resume_translated_language) {
                $query->where('translated_languages_id', $resume_translated_language);
            }))->
            with(array('contactNumbers.country.countryTranslation' => function ($query) use ($resume_translated_language) {
                $query->where('translated_languages_id', $resume_translated_language);
            }))
                ->first();
            return $this->showOne($contact_information);
        });
    }

    /**
     * Display the specified resource.
     *
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function show($resumeId)
    {
        $resume = Resume::findOrFail($resumeId);
        $user = auth()->user();
        if ($user->id != $resume->user->id) return $this->errorResponse('you are not authorized to do this operation', 401);
//       resume translated language
        $resume_translated_language = $resume->translated_languages_id;

        $contact_info = ContactInformation::where('resume_id', $resumeId)->
        with('emails', 'internetCommunications.internetCommunicationType', 'personalLinks.socialMedia', 'contactNumbers'
        )->
        with(array('contactNumbers.phoneType.PhoneTypeTranslation' => function ($query) use ($resume_translated_language) {
            $query->where('translated_languages_id', $resume_translated_language);
        }))->
        with(array('contactNumbers.country.countryTranslation' => function ($query) use ($resume_translated_language) {
            $query->where('translated_languages_id', $resume_translated_language);
        }))
            ->get(['id', 'resume_id']);
        return response()->json([
            'contact_informations ' => $contact_info,
        ]);
    }

    public function contactInfoData($resume_id)
    {
        $resume = Resume::findOrFail($resume_id);
//         resume translated language
        $resume_translated_language = $resume->translated_languages_id;
        $phone_type_trans = PhoneTypeTranslation::where('translated_languages_id', $resume_translated_language)->
        get(['phone_type_id', 'name']);

        $country_code = Country::with(array('countryTranslation' => function ($query) use ($resume_translated_language) {
            $query->where('translated_languages_id', $resume_translated_language);
        }))->get();
        $social_media = SocialMedia::get(['id', 'name']);
        $internet_communication = InternetCommunicationType::get(['id', 'name']);

        return response()->json([
            'Phone_type_translations' => $phone_type_trans,
            'country_codes' => $country_code,
            'social_media' => $social_media,
            'internet_communication' => $internet_communication
        ]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request $request
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, ContactInformation $contactInfo)
    {

        $resume = Resume::findOrFail($request->resume_id);
        $this->validate($request, ['emails' => 'required']);
        $this->storeValidation($request);
        return DB::transaction(function () use ($request, $contactInfo, $resume) {

            if ($contactInfo->emails != null) {
                $contactInfo->emails()->delete();
            }
            foreach ($request->emails as $email) {
                Email::create([
                    'contact_information_id' => $contactInfo->id,
                    'email_address' => $email['email_address']
                ]);
            }

            if ($request->has('contact_numbers')) {
                if ($contactInfo->contactNumbers != null) {
                    $contactInfo->contactNumbers()->delete();
                }
                foreach ($request->contact_numbers as $number) {
                    ContactNumber::create([
//                        'phone_type' => $number['phone_type'],
                        'phone_type_id' => $number['phone_type_id'],
//                        'country_code' => $number['country_code']['code'],
                        'country_id' => $number['country_id'],
                        'phone_number' => $number['phone_number'],
                        'contact_information_id' => $contactInfo->id

                    ]);
                }
            }

            if ($request->has('internet_communications')) {
                if ($contactInfo->internetCommunications != null) {
                    $contactInfo->internetCommunications()->delete();
                }
                foreach ($request->internet_communications as $account) {
                    InternetCommunication::create([
//                        'type' => $account['type'],
                        'internet_communication_type_id' => $account['internet_communication_type_id'],
                        'address' => $account['address'],
                        'contact_information_id' => $contactInfo->id]);
                }
            }

            if ($request->has('personal_links')) {
                if ($contactInfo->personalLinks != null) {
                    $contactInfo->personalLinks()->delete();
                }
                foreach ($request->personal_links as $account) {
                    PersonalLink::create([
//                        'type' => $account['type'],
                        'social_media_id' => $account['social_media_id'],
                        'url' => $account['url'],
                        'contact_information_id' => $contactInfo->id]);
                }
            }


            $resume_translated_language = $resume->translated_languages_id;
            $contact_information = ContactInformation::where('resume_id', $resume->id)->
            with('emails', 'internetCommunications.internetCommunicationType', 'personalLinks.socialMedia', 'contactNumbers')->
            with(array('contactNumbers.phoneType.PhoneTypeTranslation' => function ($query) use ($resume_translated_language) {
                $query->where('translated_languages_id', $resume_translated_language);
            }))->with(array('contactNumbers.country.countryTranslation' => function ($query) use ($resume_translated_language) {
                $query->where('translated_languages_id', $resume_translated_language);
            }))
                ->first();
            return $this->showOne($contact_information);
        });
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(ContactInformation $contactInfo)
    {
        $contactInfo->delete();
        return $this->showOne($contactInfo);
    }
}
