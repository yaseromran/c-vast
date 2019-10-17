<?php

namespace App\Http\Controllers\Company;

use App\Http\Controllers\ApiController;
use App\Models\Company\CompanyLocation;
use App\Models\Company\CompanyProfile;
use App\Models\Company\CompanyProfileTranslation;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;
class CompanyLocationController extends ApiController
{


    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $location_Rules = [
            'company_id'=> 'required',
            'country' => 'required',
            'city' => 'required',
            'postal_code' => 'required',
            'street_address' => 'required',
            'latitude' => 'required',
            'longitude' => 'required'
        ];

        $this->validate($request, $location_Rules);
        $companyProfile  =  CompanyProfile::where('company_id',$request->company_id)->first();

        if($companyProfile==null)
        {
            return response()->json(['error' => 'no compnay profile for this company id',], 400);
        }
        $company_Profile_id                     =$companyProfile->id;
        $companyLocation                        =new CompanyLocation();
        $companyLocation->company_profile_id    =$company_Profile_id;
        $companyLocation->name                  =$request->name;
        $companyLocation->is_main_office        =false;
        $companyLocation->country               =$request->country;
        $companyLocation->city                  =$request->city;
        $companyLocation->postal_code           =$request->postal_code;
        $companyLocation->street_address        =$request->street_address;
        $companyLocation->latitude              =$request->latitude;
        $companyLocation->longitude             =$request->longitude;
        $companyLocation->verified_by_google    =$request->verified_by_google;
        $companyLocation->save();
        $companyLocation  =  CompanyLocation:: where('id', $companyLocation->id) ->first()  ;

        return $this->showOne ($companyLocation);
    }
    public function  set_comapnylocatin_as_main($company_location_id)
    {
        $company_location= CompanyLocation::where('id',$company_location_id)->first();
        if ($company_location == null)
        {
            return response()->json(['error' => 'There is no for this company location id',], 400);
        }
        $company_profile_id = $company_location->company_profile_id;


    return DB::transaction(function () use ($company_profile_id,$company_location_id)
    {

        $companyLocation = CompanyLocation
            ::where('is_main_office', '=', 1)
            ->where('company_profile_id', '=', $company_profile_id)
            ->update(['is_main_office' => 0]);


        $companyLocation = CompanyLocation
            ::where('company_profile_id', '=', $company_profile_id)
            ->where('id', '=', $company_location_id)
            ->update(['is_main_office' => 1]);


        $companyLocations = CompanyLocation::where('company_profile_id', '=', $company_profile_id)->get();;
        return $this->showAll( $companyLocations);
    });
}
    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($company_location_id)
    {

        $companyLocation = CompanyLocation::where(

                 'id', '=',$company_location_id

             )->first();
        if($companyLocation==null)
        {
            return response()->json(['error' => 'no compnay location found',], 400);
        }

        return $this->showOne( $companyLocation);
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
    public function update(Request $request, $company_location_id)
    {
        $location_Rules = [

            'country' => 'required',
            'city' => 'required',
            'verified_by_google' => 'required',

            'postal_code' => 'required',
            'street_address' => 'required',
            'latitude' => 'required',
            'longitude' => 'required'

        ];

        $this->validate($request, $location_Rules);


        $companyLocation = CompanyLocation::where(


                 'id'               ,'='   ,$company_location_id
             )->first();
        if($companyLocation==null)
        {
            return response()->json(['error' => 'no compnay location found',], 400);
        }

        $companyLocation->name                  =$request->name;
        $companyLocation->country               =$request->country;
        $companyLocation->city                  =$request->city;
        $companyLocation->postal_code           =$request->postal_code;
        $companyLocation->street_address        =$request->street_address;
        $companyLocation->latitude              =$request->latitude;
        $companyLocation->longitude             =$request->longitude;
         $companyLocation->verified_by_google    =$request->verified_by_google ;

        $companyLocation->save();
        $companyLocation  =  CompanyLocation:: where('id', $companyLocation->id) ->first()  ;

        return $this->showOne ($companyLocation);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($company_location_id)
    {
        $companyLocation = CompanyLocation::where(  'id', '=',$company_location_id  )->first();
        if($companyLocation==null)
        {
            return response()->json(['error' => 'no compnay location for this company_location_id',], 400);
        }
        $company_profile_id=$companyLocation->company_profile_id;
        $companyLocation= CompanyLocation::where('id','=',$company_location_id)
            ->delete();


        $companyLocations= CompanyLocation::where('company_profile_id','=',$company_profile_id)->get();;
        return $this->showAll( $companyLocations);
    }

    public function index($company_id)
    {
        $companyProfile = CompanyProfile::where('company_id', $company_id)->first();

        if ($companyProfile == null)
        {
            return response()->json(['error' => 'no compnay profile for this company id',], 400);
        }

        $company_profile_id = $companyProfile->id;
        $companyLocations = CompanyLocation::where(

                 'company_profile_id', '=', $company_profile_id

             )->get();
        return $this->showAll($companyLocations);
    }
    public function get_main_name($company_id){
        $companyProfile = CompanyProfile::where('company_id', $company_id)->first();

        if ($companyProfile == null)
        {
            return response()->json(['error' => 'no compnay profile for this company id',], 400);
        }
        $companyProfileTranslation=CompanyProfileTranslation::where('company_profile_id', $companyProfile->id)->first();

        if ($companyProfileTranslation == null)
        {
            return response()->json(['error' => 'no compnay profile for this company id',], 400);
        }

        return response()->json(['comapny_name' => $companyProfileTranslation->name,], 400);;
    }
}
