<?php

namespace App\Http\Controllers\WorkExperience;

use App\Http\Controllers\ApiController;
use App\Models\WorkExperience\CompanyIndustryTranslation;
use App\Models\WorkExperience\CompanySize;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Auth;
use Illuminate\Support\Facades\DB;

use App\Models\Resume;
use App\Models\WorkExperience\WorkExpCompany;
use App\Models\WorkExperience\CompanyIndustry;
use App\Models\WorkExperience\EmploymentTypeParent;
use App\Models\WorkExperience\EmploymentType;
use App\Models\WorkExperience\WorkExperience;

class WorkExperienceController extends ApiController
{
    public function __construct()
    {
        $this->middleware('jwt.auth');
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index($resumeId)
    {
        $resume = Resume::findOrFail($resumeId);
        $user = auth()->user();
        if ($user->id != $resume->user->id) return $this->errorResponse('you are not authorized to do this operation', 401);
        //       resume translated language
        $resume_translated_language = $resume->translated_languages_id;

        $work_experiences = WorkExperience::where('resume_id', $resumeId)
            ->orderBy('order')
            ->with(['company', 'company_industry', 'employment_types',
                'employment_types.employment_type_parent'])
            ->with(array('company.company_size.company_size_translation' => function ($query) use ($resume_translated_language) {
                $query->where('translated_languages_id', $resume_translated_language);
            }))
            ->with(array('company_industry.companyIndustryTranslation' => function ($query) use ($resume_translated_language) {
                $query->where('translated_languages_id', $resume_translated_language);
            }))
            ->with(array('employment_types.employment_type_parent.empTypeParentTranslation' => function ($query) use ($resume_translated_language) {
                $query->where('translated_languages_id', $resume_translated_language);
            }))
            ->with(array('employment_types.employment_type_parent.parent_category.empTypeParentTranslation' => function ($query) use ($resume_translated_language) {
                $query->where('translated_languages_id', $resume_translated_language);
            }))
            ->get();
        return response()->json(['work_experiences' => $work_experiences,], 200);

    }

    public function workExperiencesData($resume_id)
    {
        $resume = Resume::findOrFail($resume_id);
//         resume translated language
        $resume_translated_language = $resume->translated_languages_id;

//        $companies = Company::all();
        $company_industries = CompanyIndustry::where('verified', true)->
        with(array('companyIndustryTranslation' => function ($query) use ($resume_translated_language) {
            $query->where('translated_languages_id', $resume_translated_language);
        }))->get(['id', 'verified']);
        $company_size = CompanySize::with(array('company_size_translation' => function ($query) use ($resume_translated_language) {
            $query->where('translated_languages_id', $resume_translated_language);
        }))->get(['id']);
//        $employment_types = EmploymentType::all();
        $employment_type_parents = EmploymentTypeParent::whereNull('parent_id')->
        with(array('empTypeParentTranslation' => function ($query) use ($resume_translated_language) {
            $query->where('translated_languages_id', $resume_translated_language);
        }))
            ->with(array('child_types.empTypeParentTranslation' => function ($query) use ($resume_translated_language) {
                $query->where('translated_languages_id', $resume_translated_language);
            }))->get(['id', 'parent_id']);

//                $company_industry_parent = CompanyIndustry::with(array('companyIndustryParent.companyIndustryParentTrans' => function ($query) use   ($resume_translated_language) {
//            $query->where('translated_languages_id', $resume_translated_language);
//        }))->get(['id', 'verified','company_industry_parent_id']);

        return response()->json([
            'company_industries' => $company_industries,
            'employment_type_parents' => $employment_type_parents,
            'company_size' => $company_size,

//            'employment_types' => $employment_types,
//            'companies' => $companies,
//                        'company_industry_parent' =>$company_industry_parent,
        ], 200);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $this->validate($request, [
            'company' => 'required',
            'job_title' => 'required',
            'from' => 'required',
            'isPresent' => 'required',
            'isFromMonthPresent' => 'required',
            'isToMonthPresent' => 'required',
            'resume_id' => 'required',
        ]);
        $resume = Resume::findOrFail($request['resume_id']);
        $user = auth()->user();
        if ($user->id != $resume->user->id)
            return $this->errorResponse('you are not authorized to do this operation', 401);

        //       resume translated language
        $resume_translated_language = $resume->translated_languages_id;

        return DB::transaction(function () use ($request, $resume_translated_language) {

            $reqCompany = $request['company'];
            $reqFrom = $request['from'];
            $reqTo = $request['to'];

            $work_exp = new WorkExperience();
            $work_exp->job_title = $request['job_title'];
            $work_exp->resume_id = $request['resume_id'];
            $work_exp->description = $request['description'];
            $work_exp->save();

            //store company
            WorkExpCompany::create([
                'work_experience_id' => $work_exp->id,
                'name' => $reqCompany['name'],
                'city' => $reqCompany['city'],
                'country' => $reqCompany['country'],
                'company_size_id' => $reqCompany['company_size_id'],
                'company_website' => $reqCompany['company_website'],
                'company_description' => $reqCompany['company_description'],
                'verified_by_google' => $reqCompany['verified_by_google'],

            ]);

            //store date
            if ($reqFrom['year'] != null) {
                if ($request['isFromMonthPresent'] == true) {
                    $fromMonth = $reqFrom['month'];
                    $work_exp->isFromMonthPresent = true;

                } else {
                    $work_exp->isFromMonthPresent = false;
                    $fromMonth = 1;
                }
                $fromYear = $reqFrom['year'];
                $fromDay = 1;
                $date_string = $fromYear . "-" . $fromMonth . "-" . $fromDay;
                $from_date_time = new \DateTime();
                $from = $from_date_time->createFromFormat('Y-m-d', $date_string);
                $work_exp->from = $from;
            }
            if ($request['isPresent'] == false && $reqTo['year'] != null) {
                if ($request['isToMonthPresent'] == true) {
                    $toMonth = $reqTo['month'];
                    $work_exp->isToMonthPresent = true;
                } else {
                    $toMonth = 1;
                    $work_exp->isToMonthPresent = false;
                }

                $toYear = $reqTo['year'];
                $toDay = 1;
                $date_string = $toYear . "-" . $toMonth . "-" . $toDay;
                $to_date_time = new \DateTime();
                $to = $to_date_time->createFromFormat('Y-m-d', $date_string);
                $work_exp->to = $to;
                $work_exp->isPresent = false;
            } else {
                $work_exp->to = null;
                $work_exp->isPresent = true;
            }

            $work_exps = WorkExperience::where('resume_id', $request['resume_id'])->get();
            foreach ($work_exps as $wo) {
                $wo->order = $wo->order + 1;
                $wo->save();
            }
            $work_exp->order = 1;
            $work_exp->save();

//            $newWorkExp = WorkExperience::where('id', $work_exp->id)->first();
//            $newWorkExp->company;
//            $newWorkExp->company_industry;
//            $newWorkExp->employment_types;
            $newWorkExp = WorkExperience::where('id', $work_exp->id)
                ->with(['company', 'company_industry', 'employment_types',
                    'employment_types.employment_type_parent'])
                ->with(array('company.company_size.company_size_translation' => function ($query) use ($resume_translated_language) {
                    $query->where('translated_languages_id', $resume_translated_language);
                }))
                ->with(array('company_industry.companyIndustryTranslation' => function ($query) use ($resume_translated_language) {
                    $query->where('translated_languages_id', $resume_translated_language);
                }))
                ->with(array('employment_types.employment_type_parent.empTypeParentTranslation' => function ($query) use ($resume_translated_language) {
                    $query->where('translated_languages_id', $resume_translated_language);
                }))
                ->with(array('employment_types.employment_type_parent.parent_category.empTypeParentTranslation' => function ($query) use ($resume_translated_language) {
                    $query->where('translated_languages_id', $resume_translated_language);
                }))
                ->first();
            return $this->showOne($newWorkExp);

        });
    }

    /**
     * Display the specified resource.
     *
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $work = WorkExperience::find($id);
        $resume_id = $work->resume_id;
        $resume = Resume::findOrFail($resume_id);
//         resume translated language
        $resume_translated_language = $resume->translated_languages_id;
        $work_exp = WorkExperience::where('id', $id)
            ->with(['company', 'company_industry', 'employment_types',
                'employment_types.employment_type_parent'])
            ->with(array('company.company_size.company_size_translation' => function ($query) use ($resume_translated_language) {
                $query->where('translated_languages_id', $resume_translated_language);
            }))
            ->with(array('company_industry.companyIndustryTranslation' => function ($query) use ($resume_translated_language) {
                $query->where('translated_languages_id', $resume_translated_language);
            }))
            ->with(array('employment_types.employment_type_parent.empTypeParentTranslation' => function ($query) use ($resume_translated_language) {
                $query->where('translated_languages_id', $resume_translated_language);
            }))
            ->with(array('employment_types.employment_type_parent.parent_category.empTypeParentTranslation' => function ($query) use ($resume_translated_language) {
                $query->where('translated_languages_id', $resume_translated_language);
            }))
            ->get();
        return $this->showAll($work_exp);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request $request
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {

        $this->validate($request, [
            'company' => 'required',
            'job_title' => 'required',
            'from' => 'required',
            'isPresent' => 'required',
            'isFromMonthPresent' => 'required',
            'isToMonthPresent' => 'required',
            'resume_id' => 'required',
        ]);
        $resume = Resume::findOrFail($request['resume_id']);
        $user = auth()->user();
        if ($user->id != $resume->user->id)
            return $this->errorResponse('you are not authorized to do this operation', 401);
        //       resume translated language
        $resume_translated_language = $resume->translated_languages_id;
        $work_exp = WorkExperience::findOrFail($id);
        return DB::transaction(function () use ($request, $work_exp, $id, $resume_translated_language) {

            $reqCompany = $request['company'];
            $reqFrom = $request['from'];
            $reqTo = $request['to'];


            $work_exp->job_title = $request['job_title'];
            $work_exp->resume_id = $request['resume_id'];
            $work_exp->description = $request['description'];
            $work_exp->save();

            // company
            if ($reqCompany != null) {
                $work_exp->company()->delete();
                WorkExpCompany::create([
                    'work_experience_id' => $work_exp->id,
                    'name' => $reqCompany['name'],
                    'city' => $reqCompany['city'],
                    'country' => $reqCompany['country'],
                    'company_size_id' => $reqCompany['company_size_id'],
                    'company_website' => $reqCompany['company_website'],
                    'company_description' => $reqCompany['company_description'],
                    'verified_by_google' => $reqCompany['verified_by_google'],

                ]);
            }

            //company industry
            $req_company_industry = $request['company_industry'];

//            if ($request->has('company_industry')) {
//                $req_company_industry = $request['company_industry'];
//                if($req_company_industry['name'] && $req_company_industry['id'] = null){
//                 $work_exp->company_industry_id = null;}
//                 else{
//                if ($req_company_industry['id'] > 0) {
//                    $company_industry = CompanyIndustry::where('name', $req_company_industry['name'])->first();
//                    $work_exp->company_industry_id = $company_industry->id;
//                } else {
//                    $company_industry = new CompanyIndustry();
//                    $company_industry->name = $req_company_industry['name'];
//                    $company_industry->verified = false;
//                    $company_industry->save();
//                    $work_exp->company_industry_id = $company_industry->id;
//                }
//            }}
            if ($req_company_industry['company_industry_id'] == null) {
                $work_exp->company_industry_id = null;
            } else {
                if ($req_company_industry['company_industry_id'] > 0) {
                    $company_industry = CompanyIndustry::where('id', $req_company_industry['company_industry_id'])->first();
                    $work_exp->company_industry_id = $company_industry->id;
                } else {
                    $newCompanyIndustry = new CompanyIndustry();
                    $newCompanyIndustry->verified = false;
                    $newCompanyIndustry->save();
                    $newCompanyIndustry_trans = new  CompanyIndustryTranslation();
                    $newCompanyIndustry_trans->name = $req_company_industry['name'];
                    $newCompanyIndustry_trans->company_industry_id = $newCompanyIndustry->id;
                    $newCompanyIndustry_trans->translated_languages_id = $resume_translated_language;
                    $newCompanyIndustry_trans->save();
                    $work_exp->company_industry_id = $newCompanyIndustry->id;
                }
            }
//            } else {
//                $work_exp->company_industry_id = null;
//            }

            //employment type
            if ($request->has('employment_types')) {

                $work_exp->employment_types()->delete();
                foreach ($request['employment_types'] as $value) {
                    $employment_typeRequest = new Request($value);
//
                    $employment_type = new EmploymentType();
//
                    $employment_type->work_experience_id = $work_exp->id;

                    $employment_type->employment_type_parent_id = $employment_typeRequest['employment_type_parent_id'];
                    $employment_type->save();
                }
            }
            //date
            if ($reqFrom['year'] != null) {

                if ($request['isFromMonthPresent'] == true) {
                    $fromMonth = $reqFrom['month'];
                    $work_exp->isFromMonthPresent = true;

                } else {
                    $work_exp->isFromMonthPresent = false;
                    $fromMonth = 1;
                }
                $fromYear = $reqFrom['year'];
                $fromDay = 1;
                $date_string = $fromYear . "-" . $fromMonth . "-" . $fromDay;
                $from_date_time = new \DateTime();
                $from = $from_date_time->createFromFormat('Y-m-d', $date_string);
                $work_exp->from = $from;
            }
            if ($request['isPresent'] == false && $reqTo['year'] != null) {
                if ($request['isToMonthPresent'] == true) {
                    $toMonth = $reqTo['month'];
                    $work_exp->isToMonthPresent = true;
                } else {
                    $toMonth = 1;
                    $work_exp->isToMonthPresent = false;
                }

                $toYear = $reqTo['year'];
                $toDay = 1;
                $date_string = $toYear . "-" . $toMonth . "-" . $toDay;
                $to_date_time = new \DateTime();
                $to = $to_date_time->createFromFormat('Y-m-d', $date_string);
                $work_exp->to = $to;
                $work_exp->isPresent = false;
            } else {
                $work_exp->to = null;
                $work_exp->isPresent = true;
            }

            $work_exp->save();

            $newWorkExp = WorkExperience::where('id', $work_exp->id)
                ->with(['company', 'company_industry', 'employment_types',
                    'employment_types.employment_type_parent'])
                ->with(array('company.company_size.company_size_translation' => function ($query) use ($resume_translated_language) {
                    $query->where('translated_languages_id', $resume_translated_language);
                }))
                ->with(array('company_industry.companyIndustryTranslation' => function ($query) use ($resume_translated_language) {
                    $query->where('translated_languages_id', $resume_translated_language);
                }))
                ->with(array('employment_types.employment_type_parent.empTypeParentTranslation' => function ($query) use ($resume_translated_language) {
                    $query->where('translated_languages_id', $resume_translated_language);
                }))
                ->with(array('employment_types.employment_type_parent.parent_category.empTypeParentTranslation' => function ($query) use ($resume_translated_language) {
                    $query->where('translated_languages_id', $resume_translated_language);
                }))
                ->first();
            return $this->showOne($newWorkExp);
        });
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $work_exp = WorkExperience::findOrFail($id);
        $user = auth()->user();
        $oldWorkExp = clone $work_exp;
        if ($user->id != $work_exp->resume->user->id) return $this->errorResponse('you are not authorized to do this operation', 401);
        return DB::transaction(function () use ($oldWorkExp, $work_exp) {
            $work_exp->employment_types()->delete();

            $work_exp->delete();
            $WorkExps = WorkExperience::where([['resume_id', $work_exp->resume_id], ['order', '>', $work_exp->order]])->get();
            foreach ($WorkExps as $wo) {
                $wo->order = $wo->order - 1;
                $wo->save();
            }
            return $this->showOne($oldWorkExp);
        });
    }

    public function orderData(Request $request, $resumeId)
    {

        $resume = Resume::findOrFail($resumeId);
        $user = auth()->user();
        if ($user->id != $resume->user->id) return $this->errorResponse('you are not authorized to do this operation', 401);
        foreach ($request['orderData'] as $wo) {
            $work_exp = WorkExperience::findOrFail($wo['workExperienceId']);
            $work_exp->order = $wo['orderId'];
            $work_exp->save();
        }
        return response()->json(['success' => 'true']);
    }
}
