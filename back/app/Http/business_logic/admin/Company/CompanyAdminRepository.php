<?php


namespace App\Http\business_logic\admin\Company;


use App\Models\Company\CompanyIndustriesForCompany;
use App\Models\Company\CompanyProfile;
use App\Models\Company\CompanyProfileTranslation;
use App\Models\CompanyAdminsLog;
use App\Http\Controllers\ApiController;
use App\Models\Company\Company;
use App\Models\Company\CompanyLocation;
use App\Models\Company\CompanyMethodVerfication;
use App\Models\Company\CompanyStatus;
use App\Models\Company\CompanyType;
use App\Models\WorkExperience\CompanyIndustry;
use App\User;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;


class CompanyAdminRepository implements CompanyAdminRepositoryInterface
{
    protected  $model;

    public function __construct(Model $model)
    {
        $this->model = $model;
    }
    public  function  show_company_verfication_logs($company_id)
    {
        $companyAdminsLog = CompanyAdminsLog::where('company_id',$company_id)
            ->select('company_admins_logs.id AS admin_log_id', 'company_admins_logs.*')
            ->with( array('user' =>function($query){
        $query->select('id','name');
                }  ))->with( array('companyMethodVerfication' =>function($query){
                $query->select('id','method_verfication_name');
            }  ))
            ->with( array('companyStatus' =>function($query){
                $query->select('id','title');
            }  ))
           ->orderBy('id', 'desc')->get()  ->makeHidden(  [ 'admin_id','company_method_verfication_id' ,'id' ]);;

        return response()->json($companyAdminsLog, 200);
    }
    public  function  save_company_verfication(Request $request,$company_id)
    {
        $rule_filter = [
            'admin_description' => 'required'
            , 'company_status_id' => 'required'
            , 'company_method_verfication_id' => 'required'

        ];
        $apiController = new ApiController();
        $apiController->validate($request,$rule_filter);
        return DB::transaction(function () use ($request,$company_id) {
            $company = Company::findOrFail($company_id)->first();
            $company->admin_user_id =  $request->user()->id;
            $company->admin_description = $request->admin_description;
            $company->company_method_verfication_id = $request->company_method_verfication_id;
            $company->company_status_id = $request->company_status_id;
            $company->save();
            $companyAdminsLog = new CompanyAdminsLog();
            $companyAdminsLog->user_id = 1;
            $companyAdminsLog->company_id=$company_id;
            $companyAdminsLog->admin_description = $request->admin_description;
            $companyAdminsLog->company_method_verfication_id = $request->company_method_verfication_id;
            $companyAdminsLog->company_status_id = $request->company_status_id;
            $companyAdminsLog->save();
            return response()->json(['success' => 'true','companyAdminsLog'=>$companyAdminsLog], 200);

        } );
    }
    public  function show_company_info(Request $request,$company_id){
        $companyProfile  =  CompanyProfile::where('company_id',$company_id)->first();
        if ($companyProfile == null)
        {
            return response()->json(['error' => 'no compnay profile for this company id',], 400);
        }
        $translated_languages_id=1;
        $companyProfileTranslations=CompanyProfileTranslation::where([['translated_languages_id','=',$translated_languages_id], ['company_profile_id', '=', $companyProfile->id]])->first();
if($companyProfileTranslations==null)
{
    $company = Company::findOrFail($companyProfile->company_id)->first();
    if($company->main_language_id!=null)
    {
        $translated_languages_id = $company->main_language_id;
    }
    $companyProfileTranslations=CompanyProfileTranslation::where([['translated_languages_id','=',$translated_languages_id], ['company_profile_id', '=', $companyProfile->id]])->first();
    if($companyProfileTranslations==null)
    {
        $translated_languages_id=0;
    }
}


        //return $companyProfileTranslations;
        if($companyProfileTranslations==null)    return response()->json(['error' => 'no compnay profile for this language',], 400);
        $companyProfile  =  CompanyProfile:: where('company_id', $company_id)
            ->with(array('company.company_status' => function ($query) use ($company_id,$translated_languages_id)
            {

                $query->select(['title', 'id']);
            })  )


            ->with(array('company.company_method_verfication' => function ($query) use ($company_id,$translated_languages_id)
            {

                $query->select(['method_verfication_name', 'id']);
            })  )
            ->with(array('companyProfileTranslations' => function ($query) use ($translated_languages_id)
            {
                if($translated_languages_id!=0) {
                    $query->where('translated_languages_id', '=', $translated_languages_id);
                }
            })  )


            ->with(array('companyIndustriesForCompanies.companyIndustry.companyIndustryTranslation' => function ($query) use ($translated_languages_id) {
                //$query->select(['created_at', 'updated_at']);
            }   ) )      ->first() ->makeHidden(  [ 'company_method_verfication_id','company_status_id','created_at','updated_at' ,'workinghours','founded','is_month','company_type_id','company_size_id','path_company_imagelogo' ])  ;

        //   $companySpecialtiesForCompany=CompanySpecialtiesForCompany ::with(array('specialties') )->get();
        if($companyProfile!=null)
        {
            $user = User::where('id', $company->admin_user_id)->first();
            return response()->json(['success' => 'true','data' => $companyProfile,'Handled by'=>$user], 200);
        }
        else
        {
            return response()->json(['success' => 'false','error' => 'no compnay profile'], 400);
        }
}
    public  function  getAllCompaniesStatus()
    {
        return $companyStatus=CompanyStatus::get(['id','title']);
    }
    public  function  getAllMethodCompaniesVerfications()
    {
        return $companyMethodVerfication=CompanyMethodVerfication::get(['id','method_verfication_name']);
    }
    public function  getAllCompanies_name_id()
    {

        return   $companies_name_id = Company
            ::join('company_profiles', 'company_profiles.company_id', '=', 'companies.id')
            ->join('company_profile_translations', 'company_profile_translations.company_profile_id', '=', 'company_profiles.id')

            ->where(function($q)
            {
                $q->whereRaw('  company_profile_translations.translated_languages_id  = 
                                                                        CASE 
                                                                            WHEN  
                                                                                    company_profile_translations.translated_languages_id  = 1 
                                                                             THEN   1 
                                                                             ELSE  
                                                                                    CASE 
                                                                                        WHEN 
                                                                                                companies.main_language_id  IS NOT NULL  
                                                                                        THEN   
                                                                                                companies.main_language_id 
                                                                                         ELSE 
                                                                                                2  
                                                                                     END  
                                                                         END ');
            })
            -> groupBy('company_profile_id')
       ->get(['company_profile_translations.name as   company_profile_translations_name','companies.id as company_id ']);
    }
    public function  getAllCompanyStatus()
    {

        return   $company_industries = CompanyStatus::get(['id', 'title'] );
    }
    public function  getAllCompanyTypes()
    {

        return   $company_industries = CompanyType::
        with(array('companyTypeTranslations' => function ($query)  {
            $query->where('translated_languages_id', 1);
        }))->get( );
    }
    public function  getAllCompanyIndustries()
    {

        return $company_industries = CompanyIndustry::where('verified', true)->
        with(array('companyIndustryTranslation' => function ($query)  {
            $query->where('translated_languages_id', 1);
        }))->get(['id', 'verified']) ;
    }
  public function  getCountries(Request $request)
  {
     return $companyLocation = CompanyLocation::get(['id','country']);
  }

    public function all(Request $request)
    {

        $rule_filter = [
            'country_name' => 'string'
            , 'company_status_id' => 'integer'
            , 'company_type_id' => 'integer'
            , 'company_indeustry_id' => 'integer'
            , 'company_name' => 'string'
            ,'company_id'=> 'integer'
        ];
        $apiController = new ApiController();
        $apiController->validate($request,$rule_filter);
        return  $sub = DB::table('companies')
                                        ->select(
                                            DB::raw(' 
                                                              company_locations.country 
                                                            , company_locations.city 
                                                            , company_statuses.title as status 
                                                            , company_statuses.id as company_status_id
                                                            , company_statuses.title as company_status_title
                                                            , companies.created_at as registraion_date_time 
                                                            , companies.id as id
                                                            , companies.admin_description as company_admin_description
                                                            , companies.company_method_verfication_id as company_method_verfication_id
                                                            , companies.contact_numner as company_contact_numbner
                                                            , companies. email as company_email
                                                              , company_method_verfications.id as  company_method_verfication_id
                                                            , company_method_verfications.method_verfication_name as  company_method_verfication_name
                                                            , company_profile_translations.name as company_name
                                                            , company_profile_translations.company_description  as company_description
                                                            , company_profile_translations.translated_languages_id as translated_language_id
                                                            , company_profiles.id as  company_profile_id
                                                            , companies.main_language_id as company_main_language_id
                                                            , company_profiles.path_company_imagelogo as logo
                                                            , company_profiles.company_websit as company_websit                                                            
                                                            , users.name as handled_by                                                            
                                                            , company_types.id as company_type_id
                                                            
                                                         
                                                            , company_industries_for_companies.id as company_indeustry_id
                                                           ')
                                                 )
                                         ->join('company_method_verfications', 'company_method_verfications.id', '=', 'companies.company_method_verfication_id')
                                         ->join('company_profiles', 'company_profiles.company_id', '=', 'companies.id')
                                         ->join('company_profile_translations', 'company_profile_translations.company_profile_id', '=', 'company_profiles.id')
                                         ->join('company_types', 'company_profiles.company_type_id', '=', 'company_types.id')
                                         ->join('company_industries_for_companies', 'company_profiles.id', '=', 'company_industries_for_companies.company_profile_id')
                                         ->join('company_locations', 'company_profiles.id', '=', 'company_locations.company_profile_id')
                                         ->leftjoin('users', 'users.id', '=', 'companies.admin_user_id')
                                         ->join('company_statuses', 'company_statuses.id', '=', 'companies.company_status_id')
                                          ->where(function($q)use($request)
                                          {




                                                  if($request->has("company_status_id")) // if field  company_status_id   exist in filter
                                                  {
                                                    $q->where('companies.company_status_id', '=', $request->company_status_id);
                                                  }
                                                  else{
                                                     // $q->where('companies.company_status_id', '>', -1);
                                                      $q->orwhereNull('companies.company_status_id');
                                                  }
                                                  if($request->has("company_id")) // if field  company_id   exist in filter
                                                  {
                                                     $q->where('companies.id', '=',  $request->company_id);
                                                  }
                                                  if($request->has("company_name")) // if field  company_name   exist in filter
                                                  {
                                                      $q ->where('company_profile_translations.name', 'like', '%' .$request->company_name. '%');
                                                  }
                                                  if($request->has("country_name")) // if field  country_name   exist in filter
                                                  {
                                                      $q ->where('company_locations.country', 'like', '%' . $request->country_name. '%');
                                                  }
                                                  if($request->has("company_name")) // if field  company_name   exist in filter
                                                  {
                                                      $q ->where('company_profile_translations.name', 'like', '%' . $request->company_name. '%');
                                                  }
                                                  if($request->has("company_type_id")) // if field  company_type_id   exist in filter
                                                  {
                                                      $q->where('company_types.id', '=',  $request->company_type_id);
                                                  }
                                                  if($request->has("company_indeustry_id")) // if field  company_indeustry_id   exist in filter
                                                  {
                                                      $q->where('company_industries_for_companies.company_industry_id', '=',  $request->company_indeustry_id);
                                                  }
                                                  // check language if english or main language or language with value 2
                                              // PS : english language id must by 1
                                              /*
                                                 $q->whereRaw('  company_profile_translations.translated_languages_id  =
                                                                        CASE
                                                                            WHEN
                                                                                    company_profile_translations.translated_languages_id  = 1
                                                                             THEN   1
                                                                             ELSE
                                                                                    CASE
                                                                                        WHEN
                                                                                                companies.main_language_id  IS NOT NULL
                                                                                        THEN
                                                                                                companies.main_language_id
                                                                                         ELSE
                                                                                                2
                                                                                     END
                                                                         END ');
                                               */
                                         })
                                        //->where(" translated_language_id = 1 ")
                                        //  ->distinct('company_profile_id')
                                       //  -> groupBy('company_profile_id')
                                         ->whereRaw('company_profile_translations.translated_languages_id in
                                                    (
                                                    
                                                       select   min(translated_languages_id)   from  company_profile_translations
                                                       where company_profile_id =  company_profiles.id
                                                     
                                                     
                                                    )   
                                                     ')
                                        ->get();









    }

    // create a new record in the database
    public function create(array $data)
    {
        return $this->model->create($data);
    }

    // update record in the database
    public function update(array $data, $id)
    {
        $record = $this->find($id);
        return $record->update($data);
    }

    // remove record from the database
    public function delete($id)
    {
        return $this->model->destroy($id);
    }

    // show the record with the given id
    public function show($id)
    {
        return $this->model-findOrFail($id);
    }

    // Get the associated model
    public function getModel()
    {
        return $this->model;
    }

    // Set the associated model
    public function setModel($model)
    {
        $this->model = $model;
        return $this;
    }

    // Eager load database relationships
    public function with($relations)
    {
        return $this->model->with($relations);
    }

}
