<?php

namespace App\Http\Controllers\Education;

use App\Models\Education\DegreeLevel;
use App\Models\Education\DegreeLevelTranslation;
use App\Models\Education\Education;
use App\Models\Education\EducationProject;
use App\Models\Education\InstitutionTranslation;
use App\Models\Education\Major;
use App\Models\Education\MajorTranslation;
use App\Models\Education\Minor;
use App\Models\Education\MinorTranslation;
use App\Models\Education\Institution;

use App\Models\Resume;
use Illuminate\Http\Request;
use App\Http\Controllers\ApiController;
use Illuminate\Support\Facades\DB;

class EducationController extends ApiController
{
    public function __construct()
    {
        $this->middleware('jwt.auth');
    }

    public function store(Request $request)
    {
        $this->validate($request, [
            'degree_level_id' => 'required',
            'institution' => 'required',
            'isPresent' => 'required',
            'isFromMonthPresent' => 'required',
            'isToMonthPresent' => 'required',
            'resume_id' => 'required',
        ]);

        $resume = Resume::findOrFail($request['resume_id']);
        $user = auth()->user();
        if ($user->id != $resume->user->id) return $this->errorResponse('you are not authorized to do this operation', 401);

//              resume translated language
        $resume_translated_language = $resume->translated_languages_id;
        return DB::transaction(function () use ($request, $resume_translated_language, $resume) {
            $reqInstitution = $request['institution'];
            $reqMajor = $request['major'];
            $reqFrom = $request['from'];
            $reqTo = $request['to'];

            $education = new Education();
            $education->degree_level_id = $request['degree_level_id'];
            $education->resume_id = $request['resume_id'];
            $education->description = $request['description'];
            $education->save();
            // Institution
            if ($reqInstitution['id'] > 0) {
                $institution = InstitutionTranslation::where('institution_id', $reqInstitution['id'])->first();
                $education->institution_id = $institution->institution_id;
            } else { // id=-1 => new institution
                $institution = new Institution();
                $institution->verified = false;
                $institution->url = $reqInstitution['url'];
                $institution->country = $reqInstitution['country'];
                $institution->city = $reqInstitution['city'];
                $institution->street_address = $reqInstitution['street_address'];
                switch ($request['degree_level_id']) {
                    case '2' : // high school
                        $institution->institution_type_id = 1;
                        break;
                    case '1' :  // secondary school
                        $institution->institution_type_id = null;
                        break;
                    default:   // university
                        $institution->institution_type_id = 2;
                        break;
                }
                $institution->save();
                $institution_trans = new InstitutionTranslation();
                $institution_trans->name = $reqInstitution['name'];
                $institution_trans->institution_id = $institution->id;
                $institution_trans->translated_languages_id = $resume_translated_language;
                $institution_trans->save();
                $education->institution_id = $institution->id;
                $education->save();
            }
            //major
            if ($request['major_id'] == null || $request['degree_level_id'] == 1) {
                $education->major_id = null;
            } else {
                if ($request['major_id'] > 0) {
                    $major = Major::where('id', $request['major_id'])->first();
                    $education->major_id = $major->id;
                } else {
                    $major = new Major();
                    $major->verified = false;
                    if ($request['degree_level_id'] == 2) { // high school major
                        $major->institution_type_id = 1;
                    } else { // university major
                        $major->institution_type_id = 2;
                    }
                    $major->save();
                    $major_trans = new MajorTranslation();
                    $major_trans->name = $reqMajor['name'];
                    $major_trans->major_id = $major->id;
                    $major_trans->translated_languages_id = $resume_translated_language;
                    $major_trans->save();
                    $education->major_id = $major->id;
                }
            }
            if ($reqFrom['year'] != null) {

                if ($request['isFromMonthPresent'] == true) {
                    $fromMonth = $reqFrom['month'];
                    $education->isFromMonthPresent = true;

                } else {
                    $education->isFromMonthPresent = false;
                    $fromMonth = 1;
                }
                $fromYear = $reqFrom['year'];
                $fromDay = 1;
                $date_string = $fromYear . "-" . $fromMonth . "-" . $fromDay;
                $from_date_time = new \DateTime();
                $from = $from_date_time->createFromFormat('Y-m-d', $date_string);
                $education->from = $from;
            }
            if ($request['isPresent'] == false && $reqTo['year'] != null) {
                if ($request['isToMonthPresent'] == true) {
                    $toMonth = $reqTo['month'];
                    $education->isToMonthPresent = true;
                } else {
                    $toMonth = 1;
                    $education->isToMonthPresent = false;
                }

                $toYear = $reqTo['year'];
                $toDay = 1;
                $date_string = $toYear . "-" . $toMonth . "-" . $toDay;
                $to_date_time = new \DateTime();
                $to = $to_date_time->createFromFormat('Y-m-d', $date_string);
                $education->to = $to;
                $education->isPresent = false;
            } else {
                $education->to = null;
                $education->isPresent = true;
            }
            $education->grade = null;
            $education->full_grade = null;

            $educations = Education::where('resume_id', $request['resume_id'])->get();
            foreach ($educations as $ed) {
                $ed->order = $ed->order + 1;
                $ed->save();
            }
            $education->order = 1;
            $education->save();
            $NewEducation = Education::where('id', $education->id)
                ->with(['institution', 'major', 'minor', 'projects'])->
                with(array('major.majorTranslation' => function ($query) use ($resume_translated_language) {
                    $query->where('translated_languages_id', $resume_translated_language);
                }))->
                with(array('institution.institutionTranslation' => function ($query) use ($resume_translated_language) {
                    $query->where('translated_languages_id', $resume_translated_language);
                }))
                ->with(array('degreeLevel.degreeLevelTranslation' => function ($query) use ($resume_translated_language) {
                    $query->where('translated_languages_id', $resume_translated_language);
                }))
                ->first();
            return $this->showOne($NewEducation);

        });
    }

    public function show($resumeId)
    {
        $resume = Resume::findOrFail($resumeId);
        $user = auth()->user();
        if ($user->id != $resume->user->id) return $this->errorResponse('you are not authorized to do this operation', 401);

        //       resume translated language
        $resume_translated_language = $resume->translated_languages_id;

        $education = Education::where('resume_id', $resumeId)
            ->orderBy('order')
            ->with(['institution', 'major', 'minor', 'degreeLevel', 'projects'])->
            with(array('major.majorTranslation' => function ($query) use ($resume_translated_language) {
                $query->where('translated_languages_id', $resume_translated_language);
            }))->with(['major.institutionType'])->
            with(array('minor.minorTranslation' => function ($query) use ($resume_translated_language) {
                $query->where('translated_languages_id', $resume_translated_language);
            }))->
            with(array('institution.institutionTranslation' => function ($query) use ($resume_translated_language) {
                $query->where('translated_languages_id', $resume_translated_language);
            }))->with(['institution.institutionType'])
            ->with(array('degreeLevel.degreeLevelTranslation' => function ($query) use ($resume_translated_language) {
                $query->where('translated_languages_id', $resume_translated_language);
            }))
            ->get();
        return response()->json(['educations' => $education,], 200);
    }

    public function educationData($resume_id)
    {
        $resume = Resume::findOrFail($resume_id);
//         resume translated language
        $resume_translated_language = $resume->translated_languages_id;

        $degree_level_trans = DegreeLevelTranslation::where('translated_languages_id', $resume_translated_language)->get(['degree_level_id', 'name']);

        $university_majors = Major::where('verified', true)->
        where('institution_type_id', 2)->
        with(array('majorTranslation' => function ($query) use ($resume_translated_language) {
            $query->where('translated_languages_id', $resume_translated_language);
        }))->
        get(['id', 'verified', 'institution_type_id']);

        $school_majors = Major::where('verified', true)->
        where('institution_type_id', 1)->
        with(array('majorTranslation' => function ($query) use ($resume_translated_language) {
            $query->where('translated_languages_id', $resume_translated_language);
        }))->
        get(['id', 'verified', 'institution_type_id']);

        $minors = Minor::where('verified', true)->
        with(array('minorTranslation' => function ($query) use ($resume_translated_language) {
            $query->where('translated_languages_id', $resume_translated_language);
        }))
            ->get(['id', 'verified', 'major_id']);

        $universities = Institution::where('verified', true)->
        where('institution_type_id', 2)->
        with(array('institutionTranslation' => function ($query) use ($resume_translated_language) {
            $query->where('translated_languages_id', $resume_translated_language);
        }))
            ->get();
        /*       $minors_translation = MinorTranslation::where('translated_languages_id', $resume_translated_language)->
       get(['minor_id', 'name']);

       $majors_translation = MajorTranslation::where('translated_languages_id', $resume_translated_language)->
       get(['major_id', 'name']);

       $universities_translation = institutionTranslation::where('translated_languages_id', $resume_translated_language)->
       get(['institution_id', 'name']);
       $major_parent = Major::with(array('majorParent.majorParentTranslation' => function ($query) use ($resume_translated_language) {
           $query->where('translated_languages_id', $resume_translated_language);
       }))
           ->get(['id','verified','major_parent_id',]);
        */
        return response()->json([
            'degree_level_translations' => $degree_level_trans,
            'universities' => $universities,
            'university_majors' => $university_majors,
            'school_majors' => $school_majors,
            'minors' => $minors,
            /*       ' majors_translation' => $majors_translation,
                   ' minors_translation' => $minors_translation,
                   ' universities_translation' => $universities_translation,
                   'major_parent' =>$major_parent,
            */
        ]);
    }

    public function getSingleEducation($resumeId, $educationId)
    {
        $resume = Resume::findOrFail($resumeId);
        $user = auth()->user();
        if ($user->id != $resume->user->id) return $this->errorResponse('you are not authorized to do this operation', 401);
        //       resume translated language
        $resume_translated_language = $resume->translated_languages_id;

        $education = Education::where('id', $educationId)
//            ->orderBy('order')
            ->with(['institution', 'major', 'minor', 'projects'])->
            with(array('major.majorTranslation' => function ($query) use ($resume_translated_language) {
                $query->where('translated_languages_id', $resume_translated_language);
            }))->
            with(array('minor.minorTranslation' => function ($query) use ($resume_translated_language) {
                $query->where('translated_languages_id', $resume_translated_language);
            }))->
            with(array('institution.institutionTranslation' => function ($query) use ($resume_translated_language) {
                $query->where('translated_languages_id', $resume_translated_language);
            }))
            ->with(array('degreeLevel.degreeLevelTranslation' => function ($query) use ($resume_translated_language) {
                $query->where('translated_languages_id', $resume_translated_language);
            }))
            ->first();
//        $majors = Major::where('verified', true)->
//        with(array('majorTranslation' => function ($query) use ($resume_translated_language) {
//            $query->where('translated_languages_id', $resume_translated_language);
//        }))->
//        get();
//        $minors = Minor::where('verified', true)->
//        with(array('minorTranslation' => function ($query) use ($resume_translated_language) {
//            $query->where('translated_languages_id', $resume_translated_language);
//        }))
//            ->get();
//        $universities = institution::where('verified', true)->
//        with(array('institutionTranslation' => function ($query) use ($resume_translated_language) {
//            $query->where('translated_languages_id', $resume_translated_language);
//        }))->get();
        return response()->json(['education' => $education,], 200);
    }

    public function update(Request $request, Education $education)
    {
        $this->validate($request, [
            'degree_level_id' => 'required',
            'institution' => 'required',
            'isPresent' => 'required',
            'isFromMonthPresent' => 'required',
            'isToMonthPresent' => 'required',
            'resume_id' => 'required',
        ]);

        $resume = Resume::findOrFail($request['resume_id']);
        $user = auth()->user();
        if ($user->id != $resume->user->id) return $this->errorResponse('you are not authorized to do this operation', 401);

//               resume translated language
        $resume_translated_language = $resume->translated_languages_id;
        return DB::transaction(function () use ($request, $education, $resume, $resume_translated_language) {
            $reqInstitution = $request['institution'];
            $reqMajor = $request['major'];
            $reqFrom = $request['from'];
            $reqTo = $request['to'];

            $education->degree_level_id = $request['degree_level_id'];
            $education->resume_id = $request['resume_id'];
            $education->description = $request['description'];
            $education->save();

//           institution
            if ($reqInstitution['id'] > 0) {
                $institution = InstitutionTranslation::where('institution_id', $reqInstitution['id'])->first();
                $education->institution_id = $institution->institution_id;
                if ($institution->verified == false) {
                    $ins = Institution::where('id', $reqInstitution['id'])->first();
                    $ins->url = $reqInstitution['url'];
                    $ins->country = $reqInstitution['country'];
                    $ins->city = $reqInstitution['city'];
                    $ins->street_address = $reqInstitution['street_address'];
                    $ins->save();
                    switch ($request['degree_level_id']) {
                        case '2' : // high school
                            $ins->institution_type_id = 1;
                            break;
                        case '1' :  // secondary school
                            $ins->institution_type_id = null;
                            break;
                        default:   // university
                            $ins->institution_type_id = 2;
                            break;
                    }
                    $ins->save();
                    $institution_tran = InstitutionTranslation::where('institution_id', $ins->id)->
                    update([
                        'name' => $reqInstitution['name'],
                        'institution_id' => $ins['id'],
                        'translated_languages_id' => $resume_translated_language,
                    ]);

                }
            } else {
                $institution = new Institution();
                $institution->verified = false;
                $institution->url = $reqInstitution['url'];
                $institution->country = $reqInstitution['country'];
                $institution->city = $reqInstitution['city'];
                $institution->street_address = $reqInstitution['street_address'];
                switch ($request['degree_level_id']) {
                    case '2' : // high school
                        $institution->institution_type_id = 1;
                        break;
                    case '1' :  // secondary school
                        $institution->institution_type_id = null;
                        break;
                    default:   // university
                        $institution->institution_type_id = 2;
                        break;
                }
                $institution->save();
                $institution_trans = new InstitutionTranslation();
                $institution_trans->name = $reqInstitution['name'];
                $institution_trans->institution_id = $institution->id;
                $institution_trans->translated_languages_id = $resume_translated_language;
                $institution_trans->save();
                $education->institution_id = $institution->id;
            }
//          major
            if ($request['major_id'] == null || $request['degree_level_id'] == 1) {
                $education->major_id = null;
            } else {
                if ($request['major_id'] > 0) {
                    $major = Major::where('id', $request['major_id'])->first();
                    $education->major_id = $major->id;
                } else {
                    $major = new Major();
                    $major->verified = false;
                    if ($request['degree_level_id'] == 2) {  // high school
                        $major->institution_type_id = 1;
                    } else {   // university
                        $major->institution_type_id = 2;
                    }
                    $major->save();

                    $major_trans = new MajorTranslation();
                    $major_trans->name = $reqMajor['name'];
                    $major_trans->major_id = $major->id;
                    $major_trans->translated_languages_id = $resume_translated_language;
                    $major_trans->save();
                    $education->major_id = $major->id;

                }
            }


            if ($request['minor']['minor_id'] == null) {
                $education->minor_id = null;
            } else {
                if ($request['minor']['minor_id'] > 0) {
                    $minor = Minor::where('id', $request['minor']['minor_id'])->first();
                    $education->minor_id = $minor->id;
                } else {
                    $minor = new Minor();
                    $minor->verified = false;
                    $minor->major_id = $major->id;
                    $minor->save();
                    $minor_trans = new MinorTranslation();
                    $minor_trans->name = $request['minor']['name'];
                    $minor_trans->minor_id = $minor->id;
                    $minor_trans->translated_languages_id = $resume_translated_language;

                    $minor_trans->save();
                    $education->minor_id = $minor->id;
                }
            }
            if ($request->has('projects')) {
                $reqProjects = $request['projects'];
                $education->projects()->delete();
                if ($reqProjects != null) {
                    foreach ($reqProjects as $project) {
                        $pro = new EducationProject();
                        $pro->title = $project['title'];
                        $pro->description = $project['description'];
                        $pro->education_id = $education->id;
                        $pro->save();
                    }
                } else {
                    $education->projects()->delete();
                }
            }

            if ($reqFrom['year'] != null) {
                if ($request['isFromMonthPresent'] == true) {
                    $fromMonth = $reqFrom['month'];
                    $education->isFromMonthPresent = true;
                } else {
                    $fromMonth = 1;
                    $education->isFromMonthPresent = false;
                }
                $fromYear = $reqFrom['year'];
                $fromDay = 1;
                $date_string = $fromYear . "-" . $fromMonth . "-" . $fromDay;
                $from_date_time = new \DateTime();
                $from = $from_date_time->createFromFormat('Y-m-d', $date_string);
                $education->from = $from;
            } else {
                $education->isFromMonthPresent = false;
                $education->from = null;
            }

            if ($request['isPresent'] == false && $reqTo['year'] != null) {
                if ($request['isToMonthPresent'] == true) {
                    $toMonth = $reqTo['month'];
                    $education->isToMonthPresent = true;
                } else {
                    $toMonth = 1;
                    $education->isToMonthPresent = false;
                }
                $toYear = $reqTo['year'];
                $toDay = 1;
                $date_string = $toYear . "-" . $toMonth . "-" . $toDay;
                $to_date_time = new \DateTime();
                $to = $to_date_time->createFromFormat('Y-m-d', $date_string);
                $education->to = $to;
                $education->isPresent = false;
            } else {
                $education->to = null;
                $education->isPresent = true;
            }


            if ($request->has('grade')) {
                $education->grade = $request->grade;
            } else $education->grade = null;

            if ($request->has('full_grade')) {
                $education->full_grade = $request->full_grade;

            } else $education->full_grade = null;

            $education->save();
            $NewEducation = Education::where('id', $education->id)
                ->with(['institution', 'major', 'minor', 'projects'])->
                with(array('major.majorTranslation' => function ($query) use ($resume_translated_language) {
                    $query->where('translated_languages_id', $resume_translated_language);
                }))->
                with(array('minor.minorTranslation' => function ($query) use ($resume_translated_language) {
                    $query->where('translated_languages_id', $resume_translated_language);
                }))->
                with(array('institution.institutionTranslation' => function ($query) use ($resume_translated_language) {
                    $query->where('translated_languages_id', $resume_translated_language);
                }))
                ->with(array('degreeLevel.degreeLevelTranslation' => function ($query) use ($resume_translated_language) {
                    $query->where('translated_languages_id', $resume_translated_language);
                }))
                ->first();

            return $this->showOne($NewEducation);

        });


    }

    public function orderData(Request $request, $resumeId)
    {

        $resume = Resume::findOrFail($resumeId);
        $user = auth()->user();
        if ($user->id != $resume->user->id) return $this->errorResponse('you are not authorized to do this operation', 401);
        foreach ($request['orderData'] as $ed) {
            $education = Education::findOrFail($ed['educationId']);
            $education->order = $ed['orderId'];
            $education->save();
        }
        return response()->json(['success' => 'true']);
    }


    public function destroy(Education $education)
    {
        $user = auth()->user();
        $oldEducation = clone $education;
        if ($user->id != $education->resume->user_id) return $this->errorResponse('you are not authorized to do this operation', 401);
        return DB::transaction(function () use ($oldEducation, $education) {
            $education->delete();
            $educations = Education::where([['resume_id', $education->resume_id], ['order', '>', $education->order]])->get();
            foreach ($educations as $ed) {
                $ed->order = $ed->order - 1;
                $ed->save();
            }

            return $this->showOne($oldEducation);
        });
    }


}
