<?php

namespace App\Http\Controllers\Company;

use App\Http\business_logic\admin\Company\CompanyAdminRepository;
use App\Http\Controllers\ApiController;
use App\Models\Company\Company;
use App\Models\Company\CompanyLocation;
use App\Models\Company\CompanyProfile;
use App\Models\Company\CompanyIndustriesForCompany;
use App\Models\Company\CompanySpecialtiesForCompany;
use App\Models\Company\CompanySocialMedia;
use App\Models\UserRole\Role;
use App\Models\WorkExperience\CompanyIndustry;
use App\Models\TranslatedLanguages\TranslatedLanguages;
use App\Models\Company\CompanyType;
use App\Models\Company\Specialty;
use App\Models\Company\SpecialtiesTranslation;
use App\Models\Company\CompanyProfileTranslation;

use App\Models\WorkExperience\CompanySize;
use App\Models\SocialMedia\SocialMedia;
use Google_Client;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;

class CompanyController extends ApiController
{
protected  $companyAdminRepository;

    public function __construct()
    {
        $this->middleware(['auth:api', 'scopes:admin'])->only(['show_company_verfication_logs_4_admin','save_company_verfication_4_admin','show_all_company_verfication_data_4_admin','getAllCompanyData4Admin','index4Admin']);
        $this->companyAdminRepository=new CompanyAdminRepository(new Company());
    }
    /**
     *  Display a listing of the resource.
     *
     *  @return \Illuminate\Http\Response
     */
    public function index()
    {

    }
    public function  show_company_verfication_logs_4_admin($company_id)
    {
        return    $this->companyAdminRepository->show_company_verfication_logs($company_id) ;
    }
    public function  save_company_verfication_4_admin(Request $request,$company_id)
    {
        return    $this->companyAdminRepository->save_company_verfication($request,$company_id) ;
    }
    public function show_all_company_verfication_data_4_admin(){
        return response()->json([
            'companies_status' =>  $this->companyAdminRepository-> getAllCompaniesStatus() ,
            'methodCompanies_verfications'=>$this->companyAdminRepository-> getAllMethodCompaniesVerfications()


        ], 200);
    }
    public function  getAllCompanyData4Admin(Request $request)
    {

        return response()->json([
            'company_status' =>  $this->companyAdminRepository-> getAllCompanyStatus() ,
            'company_industries'=>$this->companyAdminRepository-> getAllCompanyIndustries(),
            'company_Types' =>  $this->companyAdminRepository-> getAllCompanyTypes(),
            'countries'=>$this->companyAdminRepository-> getCountries($request) ,
            'Companies_name_id'=>$this->companyAdminRepository-> getAllCompanies_name_id($request)


        ], 200);
    }



    public function index4Admin(Request $request)
    {

     // DB::enableQueryLog();
     return    $this->companyAdminRepository->all($request) ;
     //  $query = DB::getQueryLog();
     //  print_r($query);
    }
    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */

    public function create()
    {

    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $rules = [
            'company_websit' => 'string'
            , 'company_size_id' => 'integer'
            , 'company_type_id' => 'integer'
            , 'founded_year' => 'string'
            , 'founded_month' => 'string'
            ,'company_profile'=> 'required'
            , 'path_company_imagelogo' => 'image|mimes:jpeg,png,jpg,gif,svg|max:2048'
           ,  "company_industries"    => "required|array|min:1"
        ];

          $company_profile_Rules = [
            'name' => 'required|string',
            'translated_languages_id' => 'required|integer',
            'company_description' => 'string',

        ];
        $company_industries_for_company_rule=[
            'company_industry_id' => 'required|integer'
        ];
        $Date_Of_Founded_Rules = [
            'year' => 'required|string',
            'month' => 'required|string'
        ];
        $company_social_media_Rules = [
            'company_social_media_info' => 'required|string',
            'social_media_id' => 'required|integer'
        ];
        $company_specialties_for_company_rule=[
            'specialty_id' => 'required|integer'

        ];

        $this->validate($request, $rules);

        $company_specialties_for_companyRules= [
            'year' => 'required|string',
            'month' => 'required|string'
        ];

        $this->validate($request,$rules);

        $company_profile_Request = new Request($request->company_profile);

        $this->validate($company_profile_Request,$company_profile_Rules);

        $company_industries_request=new Request($request->company_industries);



            foreach ($request->company_industries as $company_industry_request)
            {


                $company_industryRequest = new Request($company_industry_request);

                $this->validate($company_industryRequest,$company_industries_for_company_rule );
            }

     /*   if ($request->hasFile('path_company_imagelogo')){
            $imagelogo = $request->file('path_company_imagelogo');
            $extension = $imagelogo->getClientOriginalExtension(); // you can also use file name
            $imagelogoName = time().'.'.$extension;
            $path = public_path().'/img';
            $uplaodimagelogoName = $imagelogo->move($path,$imagelogoName);

        }*/

        $company=new Company();
        $company->company_websit=$request['company_websit'];
        $company->company_size_id=$request['company_size_id'];
        $company->company_type_id=$request['company_type_id'];

        if ( $request['founded_year'] != null  &&  $request['founded_month'] == null )
        {

            $year = $request->founded_year;
            $month =1;
            $day = 1;
            $date_string = $year . "-" . $month . "-" . $day;
            $date_time = new \DateTime();
            $founded = $date_time->createFromFormat('Y-m-d', $date_string);
            $company->founded=$founded;
        }
        else if( $request['founded_year'] != null  &&  $request['founded_month'] != null )
        {

            $year = $request->founded_year;
            $month = $request->founded_month;
            $day = 1;
            $date_string = $year . "-" . $month . "-" . $day;
            $date_time = new \DateTime();
            $founded = $date_time->createFromFormat('Y-m-d', $date_string);

            $company->founded=$founded;

        }

        $company->save();

      //  $company  = Company::findOrFail($company->id);
        //   return $this->showOne($company);

        $company_profile=new CompanyProfile();
        $company_profile->company_id=$company->id;
        $company_profile->company_description=$company_profile_Request['company_description'];
        $company_profile->name=$company_profile_Request['name'];
        $company_profile->translated_languages_id=$company_profile_Request['translated_languages_id'];
        $company_profile->save();
        foreach ($request->company_industries as $company_industry_request)
        {
            $company_industryRequest = new Request($company_industry_request);
            $companyIndustriesForCompany=new CompanyIndustriesForCompany();
            $companyIndustriesForCompany->company_id=$company->id;
            $companyIndustriesForCompany->company_industry_id =$company_industryRequest->company_industry_id;
            $companyIndustriesForCompany->save();
        }

        if ($request->has('company_specialties'))
        {
            foreach ($request->company_specialties as $company_specialties_request)
            {
                $company_specialtiesRequest = new Request($company_specialties_request);
                $companySpecialtiesForCompany=new CompanySpecialtiesForCompany();
                $companySpecialtiesForCompany->company_id=$company->id;
                $companySpecialtiesForCompany->specialty_id =$company_specialtiesRequest->specialty_id;
                $companySpecialtiesForCompany->save();
            }
        }
        if ($request->has('company_social_media'))
        {
            $company_social_mediaRequest = new Request($request->company_social_media);
            $this->validate($company_social_mediaRequest,$company_social_media_Rules );
            $companySocialMedia =new CompanySocialMedia();
            $companySocialMedia->company_social_media_info=$company_social_mediaRequest->company_social_media_info;
            $companySocialMedia->social_media_id=$company_social_mediaRequest->social_media_id;
            $companySocialMedia->company_id=$company->id;
            $companySocialMedia->save();
        }
         $company  =  Company:: where('id', $company->id)->  with(array('companyProfile' ,'companyIndustriesForCompany','CompanySpecialtiesForCompany','companySocialMedia'))->get()  ;
        return response()->json(['company' => $company], 200);


    }


    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $company = Company::findOrFail($id)->first();
        $translated_languages_id=$company->main_language_id;
        $company  =  Company:: where('id', $id)
            ->  with(array('companyProfile','companyIndustriesForCompany','CompanySpecialtiesForCompany','companySocialMedia'))
            ->with(array('company.company_size.company_size_translation' => function ($query) use ($translated_languages_id)
            {
                $query->where('translated_languages_id', $translated_languages_id);
            }))

            ->first()  ;

        $companyType  =  CompanyType:: where('id', $company->company_type_id )  ->
        with(array('CompanyTypeTranslation'))->first()  ;
        $companySize  =  CompanySize:: where('id', $company->company_size_id )  ->
        with(array('company_size_translation'))->first()  ;
        $companyLocation  =  CompanyLocation:: where('company_id', $company->id)->get();
        return response()->json(
            [
                'company'     =>$company
                ,
                'companyType' =>$companyType

                ,
                'companyLocation'=>$companyLocation
            ]
            , 200
        );
    }

public  function  get_other_company_profile_translationLanguages(Request $request,$company_id)
{
    $companyProfile=CompanyProfile::where('company_id', $request->company_id)->first();
    if(!$companyProfile) {  return  $translatedLanguages=TranslatedLanguages::all();}
    else{
    global  $company_profile_id_for_query;
    $company_profile_id_for_query=$companyProfile->id;

        $companyProfileTranslation=CompanyProfileTranslation::where
        ([
            ['company_profile_id', '=', $companyProfile->id]
        ])->first();
        if($companyProfileTranslation==null)
        {
          return  $all_translatedLanguages=TranslatedLanguages::all();
        }
        else{
          return
              DB::table("translated_languages")->select('*')->whereNotIn('id',function($query)
              {
                  global  $company_profile_id_for_query;
                   $query->select('translated_languages_id')->from('company_profile_translations')->where('company_profile_id', $company_profile_id_for_query)->get();;

              })->get();

        }
    }

}

    public  function store_main_language(Request $request,$company_id){

        $rules = [
            'main_language_id' => 'required'
        ];
        $this->validate($request,$rules);
        $company = Company::where('id', $company_id)->update(['main_language_id' => $request['main_language_id']]);
        $show_company = Company::select('main_language_id','id as company_id')->where('id', $company_id)->first();
        return $this->showOne($show_company);


    }
    public function getTranslationLanguages()
    {
        $translatedLanguages= TranslatedLanguages::all();
        return $this->showAll($translatedLanguages);


    }

    public function companydata(Request $request,$company_id)
    {

        $company = Company::findOrFail( $company_id);
//         resume translated language
        $main_language_id = $company->main_language_id;

        if($main_language_id==null) $main_language_id=1;

        if ($request->has('main_language_id')) $main_language_id=$request['main_language_id'];
 //        $companies = Company::all();
        $company_industries = CompanyIndustry::where('verified', true)->
        with(array('companyIndustryTranslation' => function ($query) use ($main_language_id) {
            $query->where('translated_languages_id', $main_language_id);
        }))->    get();
        $specialty=Specialty::where('is_verfied', true)->
        with(array('specialtiesTranslations' => function ($query) use ($main_language_id) {
            $query->where('translated_languages_id', $main_language_id);
        }))->get();
        $company_size = CompanySize::with(array('company_size_translation' => function ($query) use ($main_language_id) {
            $query->where('translated_languages_id', $main_language_id);
        }))->get(['id']);
        $company_type = CompanyType::with(array('companyTypeTranslations' => function ($query) use ($main_language_id) {
            $query->where('translated_languages_id', $main_language_id);
        }))->get(['id']);
      /*  $specialty = Specialty::with(array('specialtiesTranslation' => function ($query) use ($main_language_id) {
            $query->where('translated_languages_id', $main_language_id);
        }))->get(['id']);*/
        $socialMedia = SocialMedia::all();

        // company_types
        return response()->json([
            'company_industries' => $company_industries,
            'specialty'=>$specialty,
            'company_size' => $company_size,
            'company_type'=>$company_type,
            'socialMedia'=> $socialMedia
            //,            'specialty'=>$specialty

        ], 200);
    }
    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {

    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }

}
