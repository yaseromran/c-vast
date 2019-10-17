<?php

namespace App\Http\Controllers\Company;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\ApiController;
use App\Models\Company\CompanyType;
use App\Models\Company\CompanyTypeTranslation;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class CompanyTypeController extends   ApiController
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
    public function index()
    {

        $companyType = CompanyType::   with(array('CompanyTypeTranslation' ))->get()  ;
           return response()->json(['companyTypes' => $companyType,], 200);
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
        $this->validate($request, ['company_type_name' => 'required', 'translated_languages_id' => 'required|integer']);
        $company_type_translations = CompanyTypeTranslation::where('company_type_name',$request['company_type_name'])->where('translated_languages_id',$request['translated_languages_id'])->first();
        if (! is_null($company_type_translations) )
        {
              return  $this->errorResponse("  '".$request['company_type_name']."' already inserted ",404);
        }
     //  return  $this->showOne($company_type_translations);
        $companyType=new CompanyType();
        $companyType->save();
        $companyTypeTranslation=new CompanyTypeTranslation();
        $companyTypeTranslation->company_type_id=$companyType->id;
        $companyTypeTranslation->company_type_name=$request['company_type_name'];
        $companyTypeTranslation->translated_languages_id=$request['translated_languages_id'];
        $companyTypeTranslation->save();
        $companyType1 = CompanyType::where('id',$companyType->id) ->
        with(array('CompanyTypeTranslation' => function ($query) use ($request) {
            $query->where('translated_languages_id', $request['translated_languages_id']);
        })) ->first();
        return $this->showOne($companyType1);

    }

    /** company_type_translations
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
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

        $this->validate($request, [ 'company_type_name' => 'required|string','translated_languages_id' => 'required|integer']);
        $companyType=  CompanyType::where('id',$id)->first();
         if (  is_null($companyType) )
         {
             return  $this->errorResponse("  there are no companyType where company_type_id=".$id ,404);
         }
        $company_type_translations = CompanyTypeTranslation:: where('translated_languages_id',$request['translated_languages_id'])->where('company_type_id',$id)->first();
        if (  is_null($company_type_translations) )
        {
            //// save new CompanyTypeTranslation row
            ///
            $company_type_translations=new CompanyTypeTranslation();
            $company_type_translations->translated_languages_id=$request['translated_languages_id'];
            $company_type_translations->company_type_id=$id;
            $company_type_translations->company_type_name=$request['company_type_name'];
            $company_type_translations->save();
        }
        else{
            // update olde CompanyTypeTranslation
            $company_type_translations->company_type_name =$request['company_type_name'];
            $company_type_translations->save();
        }
       /* $companyType = CompanyType::where('id',$companyType->id) ->
        with(array('CompanyTypeTranslation' => function ($query) use ($request) {
            $query->where('translated_languages_id', $request['translated_languages_id']);
        })) ->first(); */
        $companyType = CompanyType::where('id',$companyType->id) ->
        with(array('CompanyTypeTranslation' )) ->first();
        return $this->showOne($companyType);


        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $companyType=  CompanyType::findOrFail($id);
        $oldCompanyType = clone $companyType;
        return DB::transaction(function () use ($oldCompanyType, $companyType) {
            $companyType->CompanyTypeTranslation()->delete();

            $companyType->delete();

            return $this->showOne($oldCompanyType);
        });
    }
}
