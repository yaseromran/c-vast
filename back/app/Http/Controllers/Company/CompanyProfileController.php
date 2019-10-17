<?php

namespace App\Http\Controllers\Company;

use App\Http\business_logic\admin\Company\CompanyAdminRepository;
use App\Http\Controllers\ApiController;
use App\Models\Company\Company;
use App\Models\Company\CompanyIndustriesForCompany;
use App\Models\Company\CompanyProfile;
use App\Models\Company\CompanyProfileTranslation;
use App\Models\Company\CompanySocialMedia;
use App\Models\Company\CompanySpecialtiesForCompany;
use App\Models\Company\SpecialtiesTranslation;
use App\Models\Company\Specialty;
use App\Models\Resume;
use App\Models\WorkExperience\CompanyIndustry;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;

class CompanyProfileController extends ApiController
{

    public function __construct()
    {
       // $this->middleware(['auth:api', 'scopes:admin,employeer'])->except(['index', 'show']);
        $this->companyAdminRepository=new CompanyAdminRepository(new Company());
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
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
    public  function  show_company_info_4_admin(Request $request,$company_id){
        return    $this->companyAdminRepository->show_company_info($request,$company_id) ;
    }
    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)

      {   $rules =
          [
               'company_id' => 'required'
              ,'name' => 'required'
              , 'company_industries'    => 'required|array|min:1'
              , 'translated_languages_id' => 'required'
          ];

          $this->validate($request, $rules);
          // check if new or old  CompanyProfile
          $companyProfile=CompanyProfile::where('company_id', $request->company_id)->first();

        if($companyProfile==null) {
            $companyProfile = new CompanyProfile();
        }
          return DB::transaction(function () use ($request,$companyProfile)
          {


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



                $companyProfile=CompanyProfile::where('company_id', $request->company_id)->first();

              if(!($companyProfile))
               {
                   $companyProfile=new CompanyProfile();
                  $companyProfile->company_id=$request->company_id;
               }

              $companyProfile->company_websit=$request->company_websit;
              $companyProfile->company_size_id=$request->company_size_id;
              $companyProfile->company_type_id=$request->company_type_id;
              if ( $request['is_month'] == false  &&  $request['founded_date']['year'] != null )
              {

                  $year = $request['founded_date']['year'] ;
                  $month =1;
                  $day = 1;
                  $date_string = $year . "-" . $month . "-" . $day;
                  $date_time = new \DateTime();
                  $founded = $date_time->createFromFormat('Y-m-d', $date_string);
                  $companyProfile->founded=$founded;
                  $companyProfile->is_month=false;
              }
              else if($request['is_month'] == true  &&  $request['founded_date']['year'] != null  )
              {

                  $year = $request['founded_date']['year'];
                  $month = $request['founded_date']['month'];
                  $day = 1;
                  $date_string = $year . "-" . $month . "-" . $day;
                  $date_time = new \DateTime();
                  $founded = $date_time->createFromFormat('Y-m-d', $date_string);
                  $companyProfile->founded=$founded;
                  $companyProfile->is_month=true;

              }
              $companyProfile->save();

              //  is_month
              // founded
              $companyProfileTranslation=CompanyProfileTranslation::where
              ([
               ['company_profile_id', '=', $companyProfile->id],
                  ['translated_languages_id', '=',$request['translated_languages_id']]
              ])->first();

               if(!$companyProfileTranslation)
              {
                  $companyProfileTranslation=new CompanyProfileTranslation();
                  $companyProfileTranslation->company_profile_id=$companyProfile->id;
              $translated_languages_id=$request['translated_languages_id'];
              if($translated_languages_id==null)
              {
                  $company = Company::findOrFail($companyProfile->company_id)->first();
                  $translated_languages_id = $company->main_language_id;
                  if($translated_languages_id==null)$translated_languages_id=1;
              }
               $companyProfileTranslation->translated_languages_id=$translated_languages_id;
               }
              $companyProfileTranslation->company_description=$request['description'];
              $companyProfileTranslation->name=$request['name'];

              $companyProfileTranslation->save();
/////////////////////////////* delete all row in company_industries_for_companies for this company and insert new row*/////////////////
        //      $resCompanyIndustriesForCompany=CompanyIndustriesForCompany::where('company_id',$request->company_id)->delete();
              /////////////////////// insert all CompanyIndustriesForCompany////////////////////////////////



/////////////////////////////* delete all row in company_industries_for_companies for this company and insert new row*/////////////////
              $resCompanyIndustriesForCompany=CompanyIndustriesForCompany::where('company_profile_id',$companyProfile->id)->delete();

              foreach ($request->company_industries as $company_industry_request)
              {
                  $company_industryRequest = new Request($company_industry_request);
                  $companyIndustriesForCompany=new CompanyIndustriesForCompany();
                  $companyIndustriesForCompany->company_profile_id=$companyProfile->id;
                  $companyIndustriesForCompany->company_industry_id =$company_industryRequest->company_industry_id;
                  $companyIndustriesForCompany->save();
              }
/////////////////////////////* delete all row in CompanySpecialtiesForCompany for this company and insert new row*///////////////////
            //  $resCompanySpecialtiesForCompany=CompanySpecialtiesForCompany::where('company_id',$request->company_id)->delete();
              $resCompanySpecialtiesForCompany=CompanySpecialtiesForCompany::where('company_profile_id',$companyProfile->id)->delete();

///////////////////////////// insert all CompanySpecialtiesForCompany////////////////////////////////////////////////////////////////
              if ($request->has('company_specialties'))
              {
                  foreach ($request->company_specialties as $company_specialties_request)
                  {
                      $company_specialtiesRequest = new Request($company_specialties_request);
                      $companySpecialtiesForCompany=new CompanySpecialtiesForCompany();
                      $specialty=null;
                      if($company_specialtiesRequest->specialty_id<0)// if new Specialty
                      {
                          $specialty=new Specialty();
                          $specialty->is_verfied=false;
                          $specialty->company_industry_id=$company_specialtiesRequest->company_industry_id;
                          $specialty->save();
                          $specialtiesTranslation=new SpecialtiesTranslation();
                          $specialtiesTranslation->specialty_id=$specialty->id;
                          $specialtiesTranslation->translated_languages_id=$request['translated_languages_id'];
                          $specialtiesTranslation->specialty_translation_name=$company_specialtiesRequest->specialty_translation_name;
                          $specialtiesTranslation->save();

                          $companySpecialtiesForCompany->specialty_id =$specialty->id;
                      }
                      else
                      {
                          $specialty = Specialty::findOrFail($company_specialtiesRequest->specialty_id);
                          $companySpecialtiesForCompany->specialty_id =$specialty->id;
                      }


                      $companySpecialtiesForCompany->company_profile_id=$companyProfile->id;


                      $companySpecialtiesForCompany->save();
                  }
              }

              //$resCompanySocialMedia  =CompanySocialMedia::where('company_id',$request->company_id)->delete();
              $resCompanySocialMedia  =CompanySocialMedia::where('company_profile_id',$companyProfile->id)->delete();

              if ($request->has('company_social_medias'))
              {
                  foreach ($request->company_social_medias as $one_company_social_media)
                  {
                      $company_social_mediaRequest = new Request($one_company_social_media);
                      $this->validate($company_social_mediaRequest, $company_social_media_Rules);
                      $companySocialMedia = new CompanySocialMedia();
                      $companySocialMedia->company_social_media_info = $company_social_mediaRequest->company_social_media_info;
                      $companySocialMedia->social_media_id = $company_social_mediaRequest->social_media_id;
                      $companySocialMedia->company_profile_id=$companyProfile->id;
                      $companySocialMedia->save();
                  }
              }


              return $this->show( $request,$companyProfile->company_id);

          }
          );



      }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show(Request $request,$company_id)
    {


        /*

        $companySpecialtiesForCompany=CompanySpecialtiesForCompany ::with(array('specialty' ) )->get();
        return $companySpecialtiesForCompany;
         $specialty=Specialty ::with(array('companySpecialtiesForCompanies') )->get();
         return $specialty;

         */
        $companyProfile  =  CompanyProfile::where('company_id',$company_id)->first();
        if ($companyProfile == null)
        {
            return response()->json(['error' => 'no compnay profile for this company id',], 400);
        }
        $translated_languages_id=$request['translated_languages_id'];
        if($translated_languages_id==null)
        {
            $company = Company::findOrFail($companyProfile->company_id)->first();
            $translated_languages_id = $company->main_language_id;
        }

        $companyProfileTranslations=CompanyProfileTranslation::where([['translated_languages_id','=',$translated_languages_id], ['company_profile_id', '=', $companyProfile->id]])->first();
        //return $companyProfileTranslations;
        if($companyProfileTranslations==null)    return response()->json(['error' => 'no compnay profile for this language',], 400);
        $companyProfile  =  CompanyProfile:: where('company_id', $company_id)

            ->with(array('companyProfileTranslations' => function ($query) use ($company_id,$translated_languages_id)
            {
                $query->where([
                    ['translated_languages_id', '=',$translated_languages_id]
                ]
                );
            }))
            ->with(array('companySpecialtiesForCompanies.specialty.specialtyTranslations' => function ($query) use ($translated_languages_id) {
                $query->where('translated_languages_id', $translated_languages_id);
            }) )
            ->with(array('companySocialMedias.socialMedia' ) )
            ->with(array('companyType.companyTypeTranslations' => function ($query) use ($translated_languages_id) {
                $query->where('translated_languages_id', $translated_languages_id);
            }) )
            ->with(array('companyIndustriesForCompanies.companyIndustry.companyIndustryTranslation' => function ($query) use ($translated_languages_id) {
                $query->where('translated_languages_id', $translated_languages_id);
            }) )      ->first()  ;

     //   $companySpecialtiesForCompany=CompanySpecialtiesForCompany ::with(array('specialties') )->get();
        if($companyProfile!=null)
        {
            return $this->showOne($companyProfile);
        }
            else
        {
            return response()->json(['success' => 'false','error' => 'no compnay profile'], 400);
        }
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
    {   $rules =
        [
            'company_id' => 'required'
            ,'name' => 'required'
            , "company_industries"    => "required|array|min:1"
            , 'translated_languages_id' => 'required'
        ];

        $this->validate($request, $rules);

        return DB::transaction(function () use ($request,$id)
        {


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



            $companyProfile=CompanyProfile::where('id', $id)->first();

          //  if(!($companyProfile))
          //  {

          //      $companyProfile=new CompanyProfile();
          //      $companyProfile->company_id=$request->company_id;
         //   }

            $companyProfile->company_websit=$request->company_websit;
           if($request->company_size_id!=null) {
               $companyProfile->company_size_id = $request->company_size_id;
           }
            $companyProfile->company_type_id=$request->company_type_id;
            if ( $request['is_month'] == false  &&  $request['founded_date']['year'] != null )
            {

                $year = $request['founded_date']['year'] ;
                $month =1;
                $day = 1;
                $date_string = $year . "-" . $month . "-" . $day;
                $date_time = new \DateTime();
                $founded = $date_time->createFromFormat('Y-m-d', $date_string);
                $companyProfile->founded=$founded;
                $companyProfile->is_month=false;
            }
            else if($request['is_month'] == true  &&  $request['founded_date']['year'] != null  )
            {

                $year = $request['founded_date']['year'];
                $month = $request['founded_date']['month'];
                $day = 1;
                $date_string = $year . "-" . $month . "-" . $day;
                $date_time = new \DateTime();
                $founded = $date_time->createFromFormat('Y-m-d', $date_string);
                $companyProfile->founded=$founded;
                $companyProfile->is_month=true;

            }
            $companyProfile->save();

            //  is_month
            // founded
            $companyProfileTranslation=CompanyProfileTranslation::where
            ([
                ['company_profile_id', '=',$id],
                ['translated_languages_id', '=',$request['translated_languages_id']]
            ])->first();

            //return $companyProfileTranslations;
            if($companyProfileTranslation==null)    return response()->json(['error' => 'no compnay profile for this language',], 400);
          //  if(!$companyProfileTranslation)
           // {
           //     $companyProfileTranslation=new CompanyProfileTranslation();
           //     $companyProfileTranslation->company_id=$request->company_id;
            //    $companyProfileTranslation->translated_languages_id=$request['translated_languages_id'];
            //}
            $translated_languages_id=$request['translated_languages_id'];
            if($translated_languages_id==null)
            {
                $company = Company::findOrFail($companyProfile->company_id)->first();
                $translated_languages_id = $company->main_language_id;
                if($translated_languages_id==null)$translated_languages_id=1;
            }

            $companyProfileTranslation->translated_languages_id=$translated_languages_id;
            $companyProfileTranslation->company_description=$request['description'];
            $companyProfileTranslation->name=$request['name'];

            $companyProfileTranslation->save();
/////////////////////////////* delete all row in company_industries_for_companies for this company and insert new row*/////////////////
            $resCompanyIndustriesForCompany=CompanyIndustriesForCompany::where('company_profile_id',$id)->delete();
            /////////////////////// insert all CompanyIndustriesForCompany////////////////////////////////





            foreach ($request->company_industries as $company_industry_request)
            {
                $company_industryRequest = new Request($company_industry_request);
                $companyIndustriesForCompany=new CompanyIndustriesForCompany();
                $companyIndustriesForCompany->company_profile_id=$id;
                $companyIndustriesForCompany->company_industry_id =$company_industryRequest->company_industry_id;
                $companyIndustriesForCompany->save();
            }
/////////////////////////////* delete all row in CompanySpecialtiesForCompany for this company and insert new row*///////////////////
            $resCompanySpecialtiesForCompany=CompanySpecialtiesForCompany::where('company_profile_id',$id)->delete();

///////////////////////////// insert all CompanySpecialtiesForCompany////////////////////////////////////////////////////////////////
            if ($request->has('company_specialties'))
            {

                foreach ($request->company_specialties as $company_specialties_request)
                {

                    $companySpecialtiesForCompany=new CompanySpecialtiesForCompany();
                    $company_specialtiesRequest = new Request($company_specialties_request);

                    $specialty=null;
                    if($company_specialtiesRequest->specialty_id<0)// if new Specialty
                    {

                        $specialty=new Specialty();
                        $specialty->is_verfied=false;
                        $specialty->company_industry_id=$company_specialtiesRequest->company_industry_id;
                        $specialty->save();
                        $specialtiesTranslation=new SpecialtiesTranslation();
                        $specialtiesTranslation->specialty_id=$specialty->id;
                        $specialtiesTranslation->translated_languages_id=$request['translated_languages_id'];
                        $specialtiesTranslation->specialty_translation_name=$company_specialtiesRequest->specialty_translation_name;
                        $specialtiesTranslation->save();
                        //  $specialtiesTranslation->specialties_translation_name=
                        $companySpecialtiesForCompany->specialty_id =$specialty->id;
                    }
                    else{
                        // check from db if exist

                        $specialty = Specialty::find($company_specialtiesRequest->id);
                        if($specialty==null)
                        {
                            return response()->json(['error' => 'no specialty that has specialty_id='.$company_specialtiesRequest->specialty_id,], 400);
                        }
                        $companySpecialtiesForCompany->specialty_id =$specialty->id;
                    }

                    $companySpecialtiesForCompany->company_profile_id=$id;


                    $companySpecialtiesForCompany->save();
                }
            }
            $resCompanySocialMedia  =CompanySocialMedia::where('company_profile_id',$id)->delete();

            if ($request->has('company_social_medias'))
            {
                foreach ($request->company_social_medias as $one_company_social_media)
                {
                    $company_social_mediaRequest = new Request($one_company_social_media);
                    $this->validate($company_social_mediaRequest, $company_social_media_Rules);
                    $companySocialMedia = new CompanySocialMedia();
                    $companySocialMedia->company_social_media_info = $company_social_mediaRequest->company_social_media_info;
                    $companySocialMedia->social_media_id = $company_social_mediaRequest->social_media_id;
                    $companySocialMedia->company_profile_id=$id;
                    $companySocialMedia->save();
                }
            }

            return $this->show( $request,$companyProfile->company_id);


        }
        );

    }


    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request , $company_id)
    {
        $companyProfile  =  CompanyProfile::where('company_id',$company_id)->first();
        $company_Profile_id=$companyProfile->id;
        $companyProfileTranslation = CompanyProfileTranslation::where
        ([
            ['company_profile_id', '=',$company_Profile_id]
        ])->get();
        if(sizeof( $companyProfileTranslation)>1)
        {
            $resCompanyProfileTranslation  =CompanyProfileTranslation::where([
                ['company_profile_id', '=',$company_Profile_id]
                ,
                ['translated_languages_id', '=',$request['translated_languages_id']]

            ])->delete();
            return response()->json(['success' => 'true'], 200);


        }
        else{
            return DB::transaction(function () use ($company_Profile_id)
            {
                $resCompanyIndustriesForCompany =CompanyIndustriesForCompany ::where('company_profile_id',$company_Profile_id)->delete();
                $resCompanySpecialtiesForCompany=CompanySpecialtiesForCompany::where('company_profile_id',$company_Profile_id)->delete();
                $resCompanySocialMedia  =CompanySocialMedia::where('company_profile_id',$company_Profile_id)->delete();
                $resCompanyProfileTranslation  =CompanyProfileTranslation::where('company_profile_id',$company_Profile_id)->delete();
                $resCompanyProfile  =CompanyProfile::where('id',$company_Profile_id)->delete();
                return response()->json(['success' => 'true'], 200);
            });
        }

    }
    public function upload_logo(Request $request,$company_id)
    {
        $rules = [
            'path_company_imagelogo' => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:2048'
        ];
       // return $request;
         $this->validate($request,$rules);
        $companyProfile  =  CompanyProfile::where('company_id',$company_id)->first();
        if ($companyProfile == null)
        {
            return response()->json(['error' => 'no compnay profile for this company id',], 400);
        }
        if ($request->hasFile('path_company_imagelogo'))
        {
            $file = $request->file('path_company_imagelogo');
            $extension = $file->getClientOriginalExtension(); // you can also use file name
            $fileName = time().'.'.$extension;
            $path = public_path().'/img';
            $uplaod = $file->move($path,$fileName);

            $companyProfile->path_company_imagelogo=$fileName;
            return $this->showOne($companyProfile);
        }
        else
        {
            return response()->json(['error' => 'no path_company_imagelogo',], 400);
        }

      /*  $translated_languages_id = Company::findOrFail($id)->first();

        $company  =  Company:: where('id', $id)
            ->  with(array('companyProfile','companyIndustriesForCompany','CompanySpecialtiesForCompany','companySocialMedia'))
            ->with(array('company.company_size.company_size_translation' => function ($query) use ($translated_languages_id)
            {
                $query->where('translated_languages_id', $translated_languages_id);
            }))
            //-> with(array('companyType' ))
            ->first()  ;

        $companyType  =  CompanyType:: where('id', $company->company_type_id )  ->
        with(array('CompanyTypeTranslations'))->first()  ;
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
        );*/
    }

}
