<?php

namespace App\Http\Controllers\ContactForm;

use App\Models\ContactForm\ContactMainCatagory;
use App\Models\ContactForm\RecievedEmail;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class ContactFormController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }
    public function get_data_for_send_message()
    {

        $result= ContactMainCatagory::with(array('contactSubCategory' => function ($query)  {
           // $query->where('translated_languages_id', $main_language_id);
        }))->get();
        return response()->json([
            'data' => $result



        ], 200);

    }
    public function save_message(Request $request)
    {
        $rules = [
            'contact_main_catagory_id' => 'required|integer'
            , 'contact_sub_category_id' => 'required|integer'
            , 'email' => 'required|string'
            , 'message' => 'required|string'
            , 'site_lang' => 'required|integer'

        ];
        $this->validate($request, $rules);

           $recievedEmail = new RecievedEmail();
        $recievedEmail->user_id = 1;
        $recievedEmail->contact_main_catagory_id=$request->contact_main_catagory_id;
        $recievedEmail->contact_sub_category_id=$request->contact_sub_category_id;
        $recievedEmail->email = $request->email;
        $recievedEmail->message = $request->message;
        $recievedEmail->translated_languages_id = $request->site_lang;
        $recievedEmail->save();
            return response()->json(['success' => 'true','email'=>$recievedEmail], 200);

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
        //
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
        //
    }
}
