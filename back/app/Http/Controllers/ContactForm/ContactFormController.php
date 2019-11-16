<?php

namespace App\Http\Controllers\ContactForm;

use App\Models\ContactForm\AdminComment;
use App\Models\ContactForm\AdminEmailAssignLog;
use App\Models\ContactForm\AdminOpenLog;
use App\Models\ContactForm\AdminRepliedEmail;
use App\Models\ContactForm\ContactMainCatagory;
use App\Models\ContactForm\RecievedEmail;
use App\User;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;

class ContactFormController extends Controller
{


    public function get_data_for_one_message($recieved_email_id)
    {
        return DB::transaction(function () use ($recieved_email_id)
        {
        $adminOpenLog=new AdminOpenLog();
        $adminOpenLog->recieved_email_id=$recieved_email_id;

            $adminOpenLog->user_id== auth()->user()->id;
        $adminOpenLog->save();

        $resultRecievedEmail=RecievedEmail            ::where('id',$recieved_email_id)
            ->            with(array('contactSubCategory.cSCTranslation' => function ($query)  {
                // $query->where('translated_languages_id', $main_language_id);
            })) -> with(array('contactMainCatagory.cMCTranslation' => function ($query)  {
                // $query->where('translated_languages_id', $main_language_id);
            }))
                -> with(array('translatedLanguages' => function ($query)  {
                    // $query->where('translated_languages_id', $main_language_id);
                }))
                -> with(array('adminComment.user' => function ($query)  {
                    $query->orderBy('id', 'desc');
                }))
                -> with(array('adminRepliedEmail.user' => function ($query)  {
                    $query->orderBy('id', 'desc');
                }))
                -> with(array('adminRepliedEmail.user' => function ($query)  {
                    $query->orderBy('id', 'desc');
                }))
                -> with(array('user' => function ($query)  {
                    // $query->where('translated_languages_id', $main_language_id);
                }))
                ->first( );
            $resultRecievedEmail->last_admin_open_log_id=$adminOpenLog->id;
            $resultRecievedEmail->save();
        return response()->json([
            'success' => 'true',
            'data' => $resultRecievedEmail



        ], 200);
        }
        );
    }
    public function  save_replay_message(Request $request)
    {
        $rules = [
              'recieved_email_Id'   => 'required|integer'
            , 'replyed_email_title' => 'required|string|max:255'
            , 'replyed_email_body'  => 'required|string'
            , 'cc'                  => 'string|email|max:255'

        ];
        $this->validate($request, $rules);
        $resultRecievedEmail=RecievedEmail            ::where('id', $request->recieved_email_Id)->first();

        if(!$resultRecievedEmail)
        {
            return response()->json([
                'success' => 'false',
                'data' => 'no email found'
            ], 403);
        }
        return DB::transaction(function () use ($resultRecievedEmail,$request)
        {
            $adminRepliedEmail                      = new AdminRepliedEmail();
            $adminRepliedEmail->user_id                   = auth()->user()->id;
            $adminRepliedEmail->cc                  = $request->cc;
            $adminRepliedEmail->replyed_email_title = $request->replyed_email_title;
            $adminRepliedEmail->replyed_email_body  = $request->replyed_email_body;
            $adminRepliedEmail->recieved_email_Id   = $request->recieved_email_Id;
            $adminRepliedEmail->save();
            $resultRecievedEmail->last_admin_replied_email_id=$adminRepliedEmail->id;
            $resultRecievedEmail->save();
            return response()->json(
                [
                'success' => 'true',
                'data' => $adminRepliedEmail
            ], 200);
          }
          );
    }
    public function  get_data_for_assign_view()
    {
        $user=User

            ::join('role_user', 'role_user.user_id', '=', 'users.id')
            ->join('roles', 'role_user.role_id', '=', 'roles.id')
            -> where('roles.name',  'admin')

            ->get( );

        return response()->json(
            [
                'success' => 'true',
                'data' => $user
            ], 200);


    }
    public function  save_assign(Request $request)
   {
           $rules = [
           'to_assigned_admin_user_id' => 'required|integer' ,
           'recieved_email_id'=>'required|integer'


       ];
       $this->validate($request, $rules);
       $resultRecievedEmail=RecievedEmail            ::where('id', $request->recieved_email_id)->first();

       if(!$resultRecievedEmail)
       {
           return response()->json([
               'success' => 'false',
               'data' => 'no email found'
           ], 403);
       }
       $adminEmailAssignLog =new AdminEmailAssignLog();
       $adminEmailAssignLog->user_id= auth()->user()->id;;
       $adminEmailAssignLog->recieved_email_id=$request-> recieved_email_id;
       $adminEmailAssignLog-> to_assigned_admin_user_id=$request-> to_assigned_admin_user_id;
       $adminEmailAssignLog->save();
       return response()->json(
           [
               'success' => 'true',
               'admins' => $adminEmailAssignLog
           ], 200);

   }
    public function get_data_for_send_message()
    {

        $result= ContactMainCatagory::with(array('cMCTranslation' => function ($query)  {
           // $query->where('translated_languages_id', $main_language_id);
        }))
            ->with(array('contactSubCategory.cSCTranslation' => function ($query)  {
            // $query->where('translated_languages_id', $main_language_id);
        }))->get();
        return response()->json([
            'success' => 'true',
            'data' => $result
        ], 200);
    }
    public function save_comment(Request $request)
    {
        $rules = [
            'recieved_email_id' => 'required|integer'


            , 'comment' => 'required|string'


        ];
        $this->validate($request, $rules);
        $resultRecievedEmail=RecievedEmail            ::where('id', $request->recieved_email_id)->first();

        if(!$resultRecievedEmail)
        {
            return response()->json([
                'success' => 'false',
                'data' => 'no email found'
            ], 403);
        }
        $adminComment=new AdminComment();
        $adminComment->user_id= auth()->user()->id;;
        $adminComment->recieved_email_id=$request-> recieved_email_id;
        $adminComment->comment=$request-> comment;
        $adminComment->save();
        return response()->json(['success' => 'true','email'=>$adminComment], 200);
    }

    public function save_message(Request $request)
    {
        $rules = [
            'contact_main_catagory_id' => 'required|integer'
            , 'contact_sub_category_id' => 'required|integer'
            , 'email' => 'string'
            , 'message' => 'required|string'
            , 'site_lang' => 'required|integer'

        ];
        $this->validate($request, $rules);

           $recievedEmail = new RecievedEmail();
           if(  auth()->user()) {
               $recievedEmail->user_id = auth()->user()->id;
           }
           else{

               if($request->email)
               {
                   $recievedEmail->email = $request->email;

               }
               else{
                   return response()->json(['error' => ['email'=>' The email field is required..'],'code'=>422], 422);
               }
           }

        $recievedEmail->contact_main_catagory_id=$request->contact_main_catagory_id;
        $recievedEmail->contact_sub_category_id=$request->contact_sub_category_id;

        $recievedEmail->message = $request->message;
        $recievedEmail->translated_languages_id = $request->site_lang;
        $recievedEmail->save();
            return response()->json(['success' => 'true','email'=>$recievedEmail], 200);

    }
    public function get_data_for_browse_messages()
    {
$messages=RecievedEmail::with(array('contactSubCategory.cSCTranslation' => function ($query)  {
    // $query->where('translated_languages_id', $main_language_id);
})) -> with(array('contactMainCatagory.cMCTranslation' => function ($query)  {
        // $query->where('translated_languages_id', $main_language_id);
    }))
    -> with(array('translatedLanguages' => function ($query)  {
        // $query->where('translated_languages_id', $main_language_id);
    }))
    -> with(array('adminComment' => function ($query)  {
          $query->orderBy('id', 'desc')->take(1);
    }))
    -> with(array('adminRepliedEmail' => function ($query)  {
        $query->orderBy('id', 'desc')->take(1);
    }))
    -> with(array('adminRepliedEmail' => function ($query)  {
        $query->orderBy('id', 'desc')->take(1);
    }))
    -> with(array('user' => function ($query)  {
    // $query->where('translated_languages_id', $main_language_id);
    }))
    ->get( ); // ['recieved_emails.last_admin_comment_id AS iscommented','recieved_emails.last_admin_done_email_log_id AS isDone']

        $filters= ContactMainCatagory::with(array('cMCTranslation' => function ($query)  {
            // $query->where('translated_languages_id', $main_language_id);
        }))
            ->with(array('contactSubCategory.cSCTranslation' => function ($query)  {
                // $query->where('translated_languages_id', $main_language_id);
            }))

            ->get( );
        return response()->json([
            'success' => 'true',
            'messages'=>$messages  ,
            'filters' => $filters ], 200);


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
