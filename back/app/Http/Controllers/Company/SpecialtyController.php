<?php

namespace App\Http\Controllers\Company;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use App\Http\Controllers\ApiController;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Company\SpecialtiesTranslation;
use App\Models\Company\Specialty;
class SpecialtyController extends ApiController
{

    public function __construct()
    {
        $this->middleware('jwt.auth')->only('update');
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $specialty = Specialty::   with(array('SpecialtiesTranslation' ))->get()  ;
        return response()->json(['Specialtys' => $specialty,], 200);
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
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $this->validate($request, [
            'specialties_translation_name' => 'required|string'
            , 'is_verfied' => 'integer'
            , 'company_industry_id' => 'required|integer'
            , 'translated_languages_id' => 'required|integer'
        ]);
        $user = auth()->user();
        $specialtiesTranslation = SpecialtiesTranslation::where('specialties_translation_name', $request['specialties_translation_name'])->first();
        if (!is_null($specialtiesTranslation))
        {
            return $this->errorResponse("  '" . $request['specialties_translation_name'] . "' already inserted ", 404);
        }

        //  return  $this->showOne($specialtiesTranslation);


        $specialty = new Specialty();
        //if ($user->is_admin)
        {
            $specialty->is_verfied = $request['is_verfied'];
        }
        $specialty->company_industry_id=$request['company_industry_id'];
        $specialty->save();


        $specialtiesTranslation = new SpecialtiesTranslation();
        $specialtiesTranslation->specialty_id = $specialty->id;

        $specialtiesTranslation->specialties_translation_name=$request['specialties_translation_name'];
        $specialtiesTranslation->translated_languages_id=$request['translated_languages_id'];
        $specialtiesTranslation->save();
        $companyType1 = Specialty::where('id',$specialty->id) ->
        with(array('SpecialtiesTranslation' => function ($query) use ($request) {
            $query->where('translated_languages_id', $request['translated_languages_id']);
        })) ->first();
        return $this->showOne($companyType1);
    }

    /**
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
        $user = auth()->user();
        if ($user->is_admin)
        {
            return  $this->errorResponse("  not Autherized " ,404);
        }
        $this->validate($request, [
            'specialties_translation_name' => 'required|string'
            , 'is_verfied' => 'integer'
            , 'company_industry_id' => 'required|integer'
            , 'translated_languages_id' => 'required|integer'
        ]);
        $specialty=  Specialty::where('id',$id)->first();
        if (  is_null($specialty) )
        {
            return  $this->errorResponse("  there are no Specialty where specialty_id=".$id ,404);
        }
        $specialty->company_industry_id=$request['company_industry_id'];


            $specialty->is_verfied = $request['is_verfied'];

        $specialty->save();
        $specialtiesTranslation = SpecialtiesTranslation:: where('translated_languages_id',$request['translated_languages_id'])->where('specialty_id',$id)->first();
        if (  is_null($specialtiesTranslation) )
        {
            //// save new CompanyTypeTranslation row
            ///
            $specialtiesTranslation=new SpecialtiesTranslation();
            $specialtiesTranslation->translated_languages_id=$request['translated_languages_id'];
            $specialtiesTranslation->specialty_id=$id;
            $specialtiesTranslation->specialties_translation_name=$request['specialties_translation_name'];
            $specialtiesTranslation->save();
        }
        else{
            // update olde CompanyTypeTranslation
            $specialtiesTranslation->specialties_translation_name =$request['specialties_translation_name'];
            $specialtiesTranslation->save();
        }
        /* $companyType = CompanyType::where('id',$companyType->id) ->
         with(array('CompanyTypeTranslation' => function ($query) use ($request) {
             $query->where('translated_languages_id', $request['translated_languages_id']);
         })) ->first(); */
        $specialty = Specialty::where('id',$specialty->id) ->
        with(array('SpecialtiesTranslation' )) ->first();
        return $this->showOne($specialty);

    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {

        $specialty = Specialty::where('id',$id) ->
        with(array('SpecialtiesTranslation' )) ->first();

        $oldSpecialty = clone $specialty;
        return DB::transaction(function () use ($oldSpecialty, $specialty) {
            $specialty->specialtiesTranslation()->delete();

            $specialty->delete();

            return $this->showOne($oldSpecialty);
        });
    }
}
