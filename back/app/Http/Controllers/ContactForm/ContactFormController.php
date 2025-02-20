<?php

namespace App\Http\Controllers\ContactForm;

use App\Models\ContactForm\AdminComment;
use App\Models\ContactForm\AdminDoneEmailLog;
use App\Models\ContactForm\AdminEmailAssignLog;
use App\Models\ContactForm\AdminNoteDoneEmailLogs;
use App\Models\ContactForm\AdminOpenLog;
use App\Models\ContactForm\AdminRepliedEmail;
use App\Models\ContactForm\AdminRestoreEmailLog;
use App\Models\ContactForm\ContactMainCatagory;
use App\Models\ContactForm\PreDefinedEmail;
use App\Models\ContactForm\RecievedEmail;
use App\User;
use Carbon\Carbon;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;
use Schema;
class ContactFormController extends Controller
{
    public function set_message_as_open($recieved_email_id)
    {
        try{
                 return     DB::transaction(function () use ($recieved_email_id)
                {

                    $recievedEmail = RecievedEmail::where('id', $recieved_email_id)->first();

                    if(!$recievedEmail)
                    {
                        return response()->json([
                            'success' => 'false',
                            'data' => 'no email found'
                        ], 200);
                    }
                    $adminOpenLog=new AdminOpenLog();
                    $adminOpenLog->recieved_email_id=$recieved_email_id;
                    $adminOpenLog->user_id= auth()->user()->id;
                    $adminOpenLog->save();

                    $recievedEmail = RecievedEmail::where('id', $recieved_email_id)->update(['last_admin_open_log_id' => $adminOpenLog->id]); // make message open
                    $recievedEmail = RecievedEmail::where('id', $recieved_email_id)->update(['last_action_name' => 'opened']);
                    $recievedEmail = RecievedEmail::where('id', $recieved_email_id)->update(['last_admin_name' => auth()->user()->name]);
                    $recievedEmail = RecievedEmail::where('id', $recieved_email_id)->update(['last_admin_action_id' =>  auth()->user()->id]);

//
                     //

                    return response()->json([
                        'success' => 'true',
                        'data' => $adminOpenLog
                        ], 200);
                    });
                      } catch (\Exception $e) {
                    DB::rollback();
                    return "error";
                    }
    }
    public function set_message_as_done($recieved_email_id)
    {
        try{
            return     DB::transaction(function () use ($recieved_email_id)
            {
                $recievedEmail = RecievedEmail::where('id', $recieved_email_id)->first();

                if(!$recievedEmail)
                {
                    return response()->json([
                        'success' => 'false',
                        'data' => 'no email found'
                    ], 200);
                }
                $adminDoneEmailLog=new AdminDoneEmailLog();
                $adminDoneEmailLog->recieved_email_id=$recieved_email_id;

                $adminDoneEmailLog->user_id=auth()->user()->id;
                $adminDoneEmailLog->save();

                $recievedEmail = RecievedEmail::where('id', $recieved_email_id)->update(['last_admin_done_email_log_id' => $adminDoneEmailLog->user_id]);
                $recievedEmail = RecievedEmail::where('id', $recieved_email_id)->update(['last_admin_note_done_email_log_id' => null]);
                $recievedEmail = RecievedEmail::where('id', $recieved_email_id)->update(['last_action_name' => 'done']);
                $recievedEmail = RecievedEmail::where('id', $recieved_email_id)->update(['last_admin_name' => auth()->user()->name]);
                $recievedEmail = RecievedEmail::where('id', $recieved_email_id)->update(['last_admin_action_id' =>  auth()->user()->id]);
                return response()->json([
                    'success' => 'true',
                    'data' => $adminDoneEmailLog
                ], 200);
                    });
        } catch ( Exception $e) {
            DB::rollback();
            return "error" +$e;
        }

    }
    public function set_message_as_not_done($recieved_email_id)
    {

        $recievedEmail = RecievedEmail::where('id', $recieved_email_id)->first();

        if($recievedEmail->last_admin_done_email_log_id==null)
        {
            return response()->json([
                'success' => 'true',
                'messages' => "email must be done befor delete: recieved_email_id ".$recieved_email_id], 200);
        }
        try{
            return     DB::transaction(function () use ($recieved_email_id)
            {
                $recievedEmail = RecievedEmail::where('id', $recieved_email_id)->first();

                if(!$recievedEmail)
                {
                    return response()->json([
                        'success' => 'false',
                        'data' => 'no email found'
                    ], 200);
                }
                $adminNoteDoneEmailLogs=new AdminNoteDoneEmailLogs();
                $adminNoteDoneEmailLogs->recieved_email_id=$recieved_email_id;
                $adminNoteDoneEmailLogs->user_id=auth()->user()->id;
                $adminNoteDoneEmailLogs->save();
                $recievedEmail = RecievedEmail::where('id', $recieved_email_id)->update(['last_admin_done_email_log_id' => null]);
                $recievedEmail = RecievedEmail::where('id', $recieved_email_id)->update(['last_admin_note_done_email_log_id' => $adminNoteDoneEmailLogs->id]);
                $recievedEmail = RecievedEmail::where('id', $recieved_email_id)->update(['last_action_name' => 'not done']);
                $recievedEmail = RecievedEmail::where('id', $recieved_email_id)->update(['last_admin_name' => auth()->user()->name]);
                $recievedEmail = RecievedEmail::where('id', $recieved_email_id)->update(['last_admin_action_id' =>  auth()->user()->id]);
                return response()->json([
                    'success' => 'true',
                    'data' => $adminNoteDoneEmailLogs
                ], 200);
                });
            } catch ( Exception $e) {
                    DB::rollback();
                    return "error";
            }

    }
    public function recieved_email_activity_log($recieved_email_id)
    {

        $temp_table='recieved_email_activity_log'.$recieved_email_id.rand(10,100);
        return     DB::transaction(function () use ($recieved_email_id,$temp_table) {

            //////////////// create temporay table 4 logs
            Schema::connection('mysql')->create($temp_table, function ($table) {
                $table->increments('id');
                $table->integer('action_id');
                $table->string('action');
                $table->string('admin')->nullable();
                $table->string('admin_id');
                $table->string('details');

                $table->timestamps();
            });


////////////// select logs from AdminOpenLog
            $select = AdminOpenLog::where('recieved_email_id', $recieved_email_id)
                ->join('users', 'users.id', '=', 'admin_open_logs.user_id')
                ->select(array('admin_open_logs.id', 'user_id', 'name', 'admin_open_logs.created_at', 'admin_open_logs.updated_at'))->selectSub(function ($query) {
                    $query->selectRaw(" ( select 'Opened' ) ");
                }, 'action')->get();
//////////////////// insert   admin_open_logs in temporay table
            foreach ($select as $onSelect) {
                DB::table($temp_table)->insert(
                    [

                        'action_id' => $onSelect->id,

                        'action' => $onSelect->action,

                        'admin' => $onSelect->name,

                        'admin_id' => $onSelect->user_id,

                        'created_at' => $onSelect->created_at,

                        'updated_at' => $onSelect->updated_at,

                        'details' => 'opened'

                    ]
                );
            };
////////////// select logs from admin_comments
            $select = AdminComment::where('recieved_email_id', $recieved_email_id)
                ->join('users', 'users.id', '=', 'admin_comments.user_id')
                ->select(array('admin_comments.id', 'comment', 'user_id', 'name', 'admin_comments.created_at', 'admin_comments.updated_at'))->selectSub(function ($query) {
                    $query->selectRaw(" ( select 'Comment' ) ");
                }, 'action')->get();
//////////////////// insert   admin_comments in temporay table
            foreach ($select as $onSelect) {
                DB::table($temp_table)->insert(
                    [

                        'action_id' => $onSelect->id,

                        'action' => $onSelect->action,

                        'admin' => $onSelect->name,

                        'admin_id' => $onSelect->user_id,

                        'created_at' => $onSelect->created_at,

                        'updated_at' => $onSelect->updated_at,

                        'details' => $onSelect->comment

                    ]
                );
            };

////////////// select logs from admin_replied_emails

            $select = AdminRepliedEmail::where('recieved_email_id', $recieved_email_id)
                ->join('users', 'users.id', '=', 'admin_replied_emails.user_id')
                ->select(array('admin_replied_emails.id', 'replyed_email_title', 'replyed_email_body', 'user_id', 'name', 'admin_replied_emails.created_at', 'admin_replied_emails.updated_at'))->selectSub(function ($query) {
                    $query->selectRaw(" ( select 'replay' ) ");
                }, 'action')->get();
//////////////////// insert   admin_replied_emails in temporay table
            foreach ($select as $onSelect) {
                DB::table($temp_table)->insert(
                    [

                        'action_id' => $onSelect->id,

                        'action' => $onSelect->action,

                        'admin' => $onSelect->name,

                        'admin_id' => $onSelect->user_id,

                        'created_at' => $onSelect->created_at,

                        'updated_at' => $onSelect->updated_at,


                        'details' => $onSelect->replyed_email_title . " " . $onSelect->replyed_email_body


                    ]
                );
            };
////////////// select logs from admin_email_assign_logs
            $select = DB::select(DB::raw(" 
            SELECT * FROM
            (
                select  `recieved_email_id` as `a_recieved_email_id`
                , admin_email_assign_logs.id as `a_id`
                , `admin_email_assign_logs`.`to_assigned_admin_user_id`
                , `name` as `to_assigned_admin_name` 
                from `admin_email_assign_logs`
                 inner join `users` 
                 on `users`.`id` = `admin_email_assign_logs`.`to_assigned_admin_user_id` 
                 where (`recieved_email_id` = " . $recieved_email_id . ")
            )  as a
            ,
            (
                 select  `recieved_email_id` as `b_recieved_email_id`
                 ,         admin_email_assign_logs.id as `b_id`,
                  `admin_email_assign_logs`.`id`,
                  `user_id` as `from_assigned_admin_id` ,
                  `name` as `from_assigned_admin_name`,
                   `admin_email_assign_logs`.`created_at`,
                   `admin_email_assign_logs`.`updated_at`,
                   (select ( select 'Assigned' )) as `action` from `admin_email_assign_logs` inner join `users` on `users`.`id` = `admin_email_assign_logs`.`user_id` 
                   where (`recieved_email_id` = " . $recieved_email_id . ")
            )   as b
            where   (`a_id`=`b_id`)     "));


//////////////////// insert   admin_email_assign_logs in temporay table
            foreach ($select as $onSelect) {
                DB::table($temp_table)->insert(
                    [

                        'action_id' => $onSelect->id,

                        'action' => $onSelect->action,

                        'admin' => $onSelect->from_assigned_admin_name,

                        'admin_id' => $onSelect->from_assigned_admin_id,

                        'created_at' => $onSelect->created_at,

                        'updated_at' => $onSelect->updated_at,


                        'details' => " assign to admin : " . $onSelect->to_assigned_admin_name . "/" . $onSelect->to_assigned_admin_user_id . " , from admin : " . $onSelect->from_assigned_admin_name . "/" . $onSelect->from_assigned_admin_id


                    ]
                );
            };


////////////// select logs from admin_done_email_logs
            $select = AdminDoneEmailLog::where('recieved_email_id', $recieved_email_id)
                ->join('users', 'users.id', '=', 'admin_done_email_logs.user_id')
                ->select(array('admin_done_email_logs.id', 'user_id', 'name', 'admin_done_email_logs.created_at', 'admin_done_email_logs.updated_at'))->selectSub(function ($query) {
                    $query->selectRaw(" ( select 'Done' ) ");
                }, 'action')->get();
//////////////////// insert   admin_done_email_logs in temporay table
            foreach ($select as $onSelect) {
                DB::table($temp_table)->insert(
                    [

                        'action_id' => $onSelect->id,

                        'action' => $onSelect->action,

                        'admin' => $onSelect->name,

                        'admin_id' => $onSelect->user_id,

                        'created_at' => $onSelect->created_at,

                        'updated_at' => $onSelect->updated_at,

                        'details' => 'Done'

                    ]
                );
            };


////////////// select logs from admin_note_done_email_logs
            $select = AdminNoteDoneEmailLogs::where('recieved_email_id', $recieved_email_id)
                ->join('users', 'users.id', '=', 'admin_note_done_email_logs.user_id')
                ->select(array('admin_note_done_email_logs.id', 'user_id', 'name', 'admin_note_done_email_logs.created_at', 'admin_note_done_email_logs.updated_at'))->selectSub(function ($query) {
                    $query->selectRaw(" ( select 'Not Done' ) ");
                }, 'action')->get();
//////////////////// insert   admin_note_done_email_logs in temporay table
            foreach ($select as $onSelect) {
                DB::table($temp_table)->insert(
                    [

                        'action_id' => $onSelect->id,

                        'action' => $onSelect->action,

                        'admin' => $onSelect->name,

                        'admin_id' => $onSelect->user_id,

                        'created_at' => $onSelect->created_at,

                        'updated_at' => $onSelect->updated_at,

                        'details' => 'No Done'

                    ]
                );
            };

////////////// select logs from admin_note_done_email_logs
            $select = AdminRestoreEmailLog::where('recieved_email_id', $recieved_email_id)
                ->join('users', 'users.id', '=', 'admin_restore_email_logs.user_id')
                ->select(array('admin_restore_email_logs.id', 'user_id', 'name', 'admin_restore_email_logs.created_at', 'admin_restore_email_logs.updated_at'))->selectSub(function ($query) {
                    $query->selectRaw(" ( select 'restore from delete' ) ");
                }, 'action')->get();
//////////////////// insert   admin_restore_email_logs in temporay table
            foreach ($select as $onSelect) {
                DB::table($temp_table)->insert(
                    [

                        'action_id' => $onSelect->id,

                        'action' => $onSelect->action,

                        'admin' => $onSelect->name,

                        'admin_id' => $onSelect->user_id,

                        'created_at' => $onSelect->created_at,

                        'updated_at' => $onSelect->updated_at,

                        'details' => 'restore from delete'

                    ]
                );
            };

            ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

            $recievedEmail = RecievedEmail::where('id', $recieved_email_id)->first();

            if ($recievedEmail->delete_by_admin_user_id != null)
            {
                $user = User::where('id', $recievedEmail->delete_by_admin_user_id)->first();


            DB::table($temp_table)->insert(
                [
                    'action_id' => $recievedEmail->id,

                    'action' => 'delete',

                    'admin' => $user->name,

                    'admin_id' => $recievedEmail->delete_by_admin_user_id,

                    'created_at' => $recievedEmail->deleted_at,

                    'updated_at' => $recievedEmail->deleted_at,

                    'details' => 'deleted'
                ]
            );
        }
/////////////////////// select all row from temporay table befor delete if

              $recieved_email_activity_log_table  =  DB::select(' SELECT * FROM '.$temp_table.' ORDER BY created_at ');


///////////////////////delete   temporay table
              Schema::connection('mysql')->drop($temp_table);
              //////////////////////// return logs data
              return $recieved_email_activity_log_table;

       }        );

    }

    public  function permanent_delete_for_deleted_message_from_archive(Request $request,$recieved_email_id)
    {
        return DB::transaction(function () use ($recieved_email_id)
        {
            $recievedEmail        = RecievedEmail::where('id', $recieved_email_id)->get();
            $adminComment         = AdminComment::where('recieved_email_id', $recieved_email_id)->delete();
            $adminDoneEmailLog    = AdminDoneEmailLog::where('recieved_email_id', $recieved_email_id)->delete();
            $adminNotDoneEmailLog    = AdminNoteDoneEmailLogs::where('recieved_email_id', $recieved_email_id)->delete();

            $adminEmailAssignLog  = AdminEmailAssignLog::where('recieved_email_id', $recieved_email_id)->delete();
            $adminEmailAssignLog  = AdminOpenLog::where('recieved_email_id', $recieved_email_id)->delete();
            $adminRepliedEmail    = AdminRepliedEmail::where('recieved_email_id', $recieved_email_id)->delete();
            $adminRepliedEmail    = AdminRepliedEmail::where('recieved_email_id', $recieved_email_id)->delete();
            $adminRepliedEmail    = AdminRepliedEmail::where('recieved_email_id', $recieved_email_id)->delete();
            $adminRestoreEmailLog = AdminRestoreEmailLog::where('recieved_email_id', $recieved_email_id)->delete();
            $recievedEmail2        = RecievedEmail::where('id', $recieved_email_id)->delete();

            return response()->json([
                'permanent delete  success' => 'true',
                'message that deleted' => $recievedEmail], 200);
        });
    }

    public function multi_permanent_delete_for_deleted_message_from_archive(Request $request)
    {
        if($request->recieved_messages_ids == null)
        {

            return response()->json([
                    'success' => 'false',
                    'messages' => 'no ids found']
                , 200);
        }
        if($request->recieved_messages_ids == null)
        {

            return response()->json([
                    'success' => 'false',
                    'messages' => 'no ids found']
                , 200);
        }
        foreach ($request->recieved_messages_ids  as $value)
        {
            if($value == null)
            {

                return response()->json([
                        'success' => 'false',
                        'messages' => 'no ids found']
                    , 200);
            }
            //$nationality = Nationality::where('name', $value)->first();
            //return $value['id'];
            $this->permanent_delete_for_deleted_message_from_archive($request,$value['id']);
        }
    }
    public function restore_multi_deleted_messages_from_archive(Request $request)
    {
        if($request->recieved_messages_ids == null)
        {

            return response()->json([
                    'success' => 'false',
                    'messages' => 'no ids found']
                , 200);
        }
        if($request->recieved_messages_ids == null)
        {

            return response()->json([
                    'success' => 'false',
                    'messages' => 'no ids found']
                , 200);
        }
        foreach ($request->recieved_messages_ids  as $value)
        {
            if($value == null)
            {

                return response()->json([
                        'success' => 'false',
                        'messages' => 'no ids found']
                    , 200);
            }
            //$nationality = Nationality::where('name', $value)->first();
            //return $value['id'];
            $this->restore_deleted_message_from_archive($request,$value['id']);
        }
        return response()->json([
                'success' => 'true',
                'messages' => 'restore deleted messages']
            , 200);
    }
    public function restore_deleted_message_from_archive(Request $request,$recieved_email_id)
    {
    $recievedEmail = RecievedEmail::where('id', $recieved_email_id)->first();
    if($recievedEmail->is_deleted==0){
        return response()->json([
            'restore success' => 'false',
            'message ' => 'this message not deleted befor'], 200);
    }
    return DB::transaction(function () use ($recieved_email_id)
    {

        $adminRestoreEmailLog=new AdminRestoreEmailLog();

        $adminRestoreEmailLog->recieved_email_id=$recieved_email_id;

        $adminRestoreEmailLog->user_id=auth()->user()->id;

        $adminRestoreEmailLog->save();

        $recievedEmail = RecievedEmail::where('id', $recieved_email_id)->update(['is_deleted' => 0,'delete_by_admin_user_id'=>null,'last_admin_restore_email_log_id'=>auth()->user()->id]);
        $recievedEmail = RecievedEmail::where('id', $recieved_email_id)->update(['last_action_name' => 'restor from delete']);
        $recievedEmail = RecievedEmail::where('id', $recieved_email_id)->update(['last_admin_name' => auth()->user()->name]);
        $recievedEmail = RecievedEmail::where('id', $recieved_email_id)->update(['last_admin_action_id' =>  auth()->user()->id]);

        $messages=RecievedEmail::where('is_deleted', 1)->
        with(array('contactSubCategory.cSCTranslation' => function ($query)  {
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
            'restore success' => 'true',
            'remind message in archive ' => $messages,
            'filters' => $filters], 200);
    });
}
    public function  get_all_deleted_message_in_archive()
    {

        $messages=RecievedEmail::where('is_deleted', 1)->
        with(array('contactSubCategory.cSCTranslation' => function ($query)  {
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
    public function  get_data_for_one_message($recieved_email_id)
    {
        return DB::transaction(function () use ($recieved_email_id)
        {
         $adminOpenLog=new AdminOpenLog();
         $adminOpenLog->recieved_email_id=$recieved_email_id;

            $adminOpenLog->user_id=auth()->user()->id;
        $adminOpenLog->save();
            $recievedEmail = RecievedEmail::where('id', $recieved_email_id)->update(['last_admin_open_log_id' => $adminOpenLog->id]); // make message open
            $recievedEmail = RecievedEmail::where('id', $recieved_email_id)->update(['last_action_name' => 'opened']);
            $recievedEmail = RecievedEmail::where('id', $recieved_email_id)->update(['last_admin_name' => auth()->user()->name]);
            $recievedEmail = RecievedEmail::where('id', $recieved_email_id)->update(['last_admin_action_id' =>  auth()->user()->id]);
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
        $resultRecievedEmail=RecievedEmail  ::where('id', $request->recieved_email_Id)->first();
        $recievedEmail = RecievedEmail::where('id', $request->recieved_email_Id)->update(['last_action_name' => 'replyed']);
        $recievedEmail = RecievedEmail::where('id', $request->recieved_email_Id)->update(['last_admin_name' => auth()->user()->name]);
        $recievedEmail = RecievedEmail::where('id', $request->recieved_email_Id)->update(['last_admin_action_id' =>  auth()->user()->id]);

        if(!$resultRecievedEmail)
        {
            return response()->json([
                'success' => 'false',
                'data' => 'no email found'
            ], 403);
        }


        if($resultRecievedEmail->last_admin_done_email_log_id!=null)
        {
            return response()->json([
                'success' => 'true',
                'messages' => "this message is done, it must be redone befor replay on it: recieved_email_id ".$request->recieved_email_Id], 200);
        }
        if($resultRecievedEmail->last_admin_open_log_id==null)
        {
            return response()->json([
                'success' => 'true',
                'messages' => "email must be opened befor make replay: recieved_email_id ".$request->recieved_email_Id], 200);
        }
        if($resultRecievedEmail->is_deleted==0)
        {
            return response()->json([
                'success' => 'true',
                'messages' => "this email must   deleted  recieved_email_id ".$request->recieved_email_Id], 200);
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
            $resultRecievedEmail->last_admin_replied_email_id=$adminRepliedEmail->user_id;
            $resultRecievedEmail->save();
            $recievedEmail = RecievedEmail::where('id',  $request->recieved_email_id)->update(['last_admin_replied_email_id' => $adminRepliedEmail->id]); // make message open
            $recievedEmail = RecievedEmail::where('id',  $request->recieved_email_id)->update(['last_action_name' => 'Replied']);
            $recievedEmail = RecievedEmail::where('id',  $request->recieved_email_id)->update(['last_admin_name' => auth()->user()->name]);
            $recievedEmail = RecievedEmail::where('id',  $request->recieved_email_id)->update(['last_admin_action_id' =>  auth()->user()->id]);

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
       $recievedEmail = RecievedEmail::where('id', $request->recieved_email_Id)->update(['last_action_name' => 'assigned']);
       $recievedEmail = RecievedEmail::where('id', $request->recieved_email_Id)->update(['last_admin_name' => auth()->user()->name]);
       $recievedEmail = RecievedEmail::where('id', $request->recieved_email_Id)->update(['last_admin_action_id' =>  auth()->user()->id]);


       if(!$resultRecievedEmail)
       {
           return response()->json([
               'success' => 'false',
               'data' => 'no email found'
           ], 403);
       }

       if($resultRecievedEmail->last_admin_done_email_log_id!=null)
       {
           return response()->json([
               'success' => 'true',
               'messages' => "this message is done , this email must be  re done befor   assign it: recieved_email_id ".$request->recieved_email_Id], 200);
       }
       if($resultRecievedEmail->last_admin_open_log_id==null)
       {
           return response()->json([
               'success' => 'true',
               'messages' => "email must be opened befor assign it: recieved_email_id ".$request->recieved_email_Id], 200);
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
    public function get_data_for_add_new_template_message_view()
    {

        $filters= ContactMainCatagory::with(array('cMCTranslation' => function ($query)  {
           // $query->where('translated_languages_id', $main_language_id);
        }))
            ->with(array('contactSubCategory.cSCTranslation' => function ($query)  {
            // $query->where('translated_languages_id', $main_language_id);
        }))->get();
        return response()->json([
            'success' => 'true',
            'data' => $filters
        ], 200);
    }
    public function save_template_message(Request $request)
    {
        $rules = [
            'contact_main_catagory_id' => 'required|integer'
            , 'contact_sub_category_id' => 'required|integer'
            , 'template_title' => 'required|string'
            , 'email_title' => 'required|string'
            , 'message' => 'required|string'

        ];
        $this->validate($request, $rules);
        $resultpreDefinedEmail=PreDefinedEmail            ::where('template_title', $request->template_title)->first();
        if($resultpreDefinedEmail)
        {
            return response()->json([
                'success' => 'false',
                'data' => 'template_title already found'
            ], 403);
        }
        $resultpreDefinedEmail=PreDefinedEmail            ::where('email_title', $request->email_title)->first();
        if($resultpreDefinedEmail)
        {
            return response()->json([
                'success' => 'false',
                'data' => 'email_title already found'
            ], 403);
        }
        $preDefinedEmail=new PreDefinedEmail();
        $preDefinedEmail->user_id= auth()->user()->id;;
        $preDefinedEmail->contact_main_catagory_id=$request->contact_main_catagory_id;
        $preDefinedEmail->contact_sub_category_id=$request->contact_sub_category_id;
        $preDefinedEmail->message = $request->message;
        $preDefinedEmail->email_title = $request->email_title;
        $preDefinedEmail->template_title = $request->template_title;
        $preDefinedEmail->save();
        return response()->json(['success' => 'true','data'=>$preDefinedEmail], 200);
    }
    public function delete_template($template_id)
    {
        $preDefinedEmail = PreDefinedEmail::where('id', $template_id)->delete();

        $preDefinedEmail=PreDefinedEmail::with(array('contactSubCategory.cSCTranslation' => function ($query)  {
            $query->where('translated_languages_id', 1);
        })) -> with(array('contactMainCatagory.cMCTranslation' => function ($query)  {
            $query->where('translated_languages_id', 1);
        }))->get( );

        $filters= ContactMainCatagory::with(array('cMCTranslation' => function ($query)  {
            // $query->where('translated_languages_id', $main_language_id);
        }))
            ->with(array('contactSubCategory.cSCTranslation' => function ($query)  {
                // $query->where('translated_languages_id', $main_language_id);
            }))

            ->get( );

        return response()->json([
            'deleted' => 'true',
            'data'=>$preDefinedEmail  ,
            'filters' => $filters ], 200);

    }
    public function show_all_templates()
    {
        $preDefinedEmail=PreDefinedEmail::with(array('contactSubCategory.cSCTranslation' => function ($query)  {
              $query->where('translated_languages_id', 1);
        })) -> with(array('contactMainCatagory.cMCTranslation' => function ($query)  {
              $query->where('translated_languages_id', 1);
        }))->get( );

        $filters= ContactMainCatagory::with(array('cMCTranslation' => function ($query)  {
                    // $query->where('translated_languages_id', $main_language_id);
         }))
          ->with(array('contactSubCategory.cSCTranslation' => function ($query)  {
                        // $query->where('translated_languages_id', $main_language_id);
          }))
                     ->get( );
        return response()->json([
            'success' => 'true',
            'data'=>$preDefinedEmail  ,
            'filters' => $filters ], 200);
    }
    public function update_template_message(Request $request,$template_id)
    {
        $preDefinedEmails=  PreDefinedEmail::get();
        return response()->json(['success' => 'true','data'=>$preDefinedEmails], 200);
    }
    public function get_data_for_update_template_message_view($template_id)
    {
        $preDefinedEmail=PreDefinedEmail::where('id',$template_id)->with(array('contactSubCategory.cSCTranslation' => function ($query)  {
            $query->where('translated_languages_id', 1);
        })) -> with(array('contactMainCatagory.cMCTranslation' => function ($query)  {
            $query->where('translated_languages_id', 1);
        }))->first( );


        $filters= ContactMainCatagory::with(array('cMCTranslation' => function ($query)  {
             $query->where('translated_languages_id',1);
        }))
            ->with(array('contactSubCategory.cSCTranslation' => function ($query)  {
                 $query->where('translated_languages_id', 1);
            }))->get();
        return response()->json([
            'success' => 'true',
            'data'=>$preDefinedEmail  ,
            'filters' => $filters ], 200);
    }
    public function save_comment(Request $request)
    {
        $rules =
        [
            'recieved_email_id' => 'required|integer'
            , 'comment' => 'required|string'
        ];
        $this->validate($request, $rules);
        $resultRecievedEmail=RecievedEmail            ::where('id', $request->recieved_email_id)->first();
        $recievedEmail = RecievedEmail::where('id', $request->recieved_email_Id)->update(['last_action_name' => 'commented']);
        $recievedEmail = RecievedEmail::where('id', $request->recieved_email_Id)->update(['last_admin_name' => auth()->user()->name]);
        $recievedEmail = RecievedEmail::where('id', $request->recieved_email_Id)->update(['last_admin_action_id' =>  auth()->user()->id]);

        if(!$resultRecievedEmail)
        {
            return response()->json([
                'success' => 'false',
                'data' => 'no email found'
            ], 403);
        }
        if($resultRecievedEmail->last_admin_done_email_log_id!=null)
        {
            return response()->json([
                'success' => 'true',
                'messages' => "email must be done befor   comment on  it: recieved_email_id ".$request->recieved_email_Id], 200);
        }
        if($resultRecievedEmail->last_admin_open_log_id==null)
        {
            return response()->json([
                'success' => 'true',
                'messages' => "email must be opened befor comment on it: recieved_email_id ".$request->recieved_email_Id], 200);
        }
        $adminComment=new AdminComment();
        $adminComment->user_id= auth()->user()->id;;
        $adminComment->recieved_email_id=$request-> recieved_email_id;
        $adminComment->comment=$request-> comment;
        $adminComment->save();

        $recievedEmail = RecievedEmail::where('id',  $request->recieved_email_id)->update(['last_admin_comment_id' => $adminComment->id]); // make message open
        $recievedEmail = RecievedEmail::where('id',  $request->recieved_email_id)->update(['last_action_name' => 'commented']);
        $recievedEmail = RecievedEmail::where('id',  $request->recieved_email_id)->update(['last_admin_name' => auth()->user()->name]);
        $recievedEmail = RecievedEmail::where('id',  $request->recieved_email_id)->update(['last_admin_action_id' =>  auth()->user()->id]);
        return response()->json(['success' => 'true','email'=>$adminComment], 200);
    }

    public function delete_recieved_message($recieved_email_id)
    {
        $recievedEmail = RecievedEmail::
            where('id', $recieved_email_id)
            ->update(
                        ['is_deleted' => 1
                         ,'delete_by_admin_user_id'=>auth()->user()->id
                         ,'last_admin_restore_email_log_id' => null
                        ]);
        $recievedEmail = RecievedEmail::where('id', $recieved_email_id)->first();
            if($recievedEmail->last_admin_done_email_log_id==null)
            {
                return response()->json([
                    'success' => 'true',
                    'messages' => "email must be done befor delete: recieved_email_id ".$recieved_email_id], 200);
            }

        if($recievedEmail->last_admin_open_log_id==null)
        {
            return response()->json([
                'success' => 'true',
                'messages' => "email must be opened befor delete it: recieved_email_id ".$recieved_email_id], 200);
        }
        return DB::transaction(function () use ($recieved_email_id) {

            $recievedEmail = RecievedEmail::where('id', $recieved_email_id)->update(['is_deleted' => 1,'delete_by_admin_user_id'=>auth()->user()->id,'last_admin_restore_email_log_id' => null]);
            $recievedEmail = RecievedEmail::where('id',  $recieved_email_id)->update(['last_action_name' => 'deleted']);
            $recievedEmail = RecievedEmail::where('id',  $recieved_email_id)->update(['last_admin_name' => auth()->user()->name]);
            $recievedEmail = RecievedEmail::where('id',  $recieved_email_id)->update(['last_admin_action_id' =>  auth()->user()->id]);
            $messages = RecievedEmail::where('is_deleted', 0)->
            with(array('contactSubCategory.cSCTranslation' => function ($query) {
                // $query->where('translated_languages_id', $main_language_id);
            }))->with(array('contactMainCatagory.cMCTranslation' => function ($query) {
                // $query->where('translated_languages_id', $main_language_id);
            }))
                ->with(array('translatedLanguages' => function ($query) {
                    // $query->where('translated_languages_id', $main_language_id);
                }))
                ->with(array('adminComment' => function ($query) {
                    $query->orderBy('id', 'desc')->take(1);
                }))
                ->with(array('adminRepliedEmail' => function ($query) {
                    $query->orderBy('id', 'desc')->take(1);
                }))
                ->with(array('adminRepliedEmail' => function ($query) {
                    $query->orderBy('id', 'desc')->take(1);
                }))
                ->with(array('user' => function ($query) {
                    // $query->where('translated_languages_id', $main_language_id);
                }))
                ->get(); // ['recieved_emails.last_admin_comment_id AS iscommented','recieved_emails.last_admin_done_email_log_id AS isDone']

            $filters = ContactMainCatagory::with(array('cMCTranslation' => function ($query) {
                // $query->where('translated_languages_id', $main_language_id);
            }))
                ->with(array('contactSubCategory.cSCTranslation' => function ($query) {
                    // $query->where('translated_languages_id', $main_language_id);
                }))
                ->get();
            return response()->json([
                'success' => 'true',
                'messages' => $messages,
                'filters' => $filters], 200);
        });
    }
    public function delete_multi_recieved_messages(Request $request)
    {
        if($request->recieved_messages_ids == null)
        {

             return response()->json([
                     'success' => 'false',
                     'messages' => 'no ids found']
                 , 200);
        }
        foreach ($request->recieved_messages_ids  as $value)
        {
            //$nationality = Nationality::where('name', $value)->first();
            //return $value['id'];
            $this->delete_recieved_message($value['id']);
        }
        return response()->json([
            'success' => 'true',
            'messages' => 'deleted']
           , 200);
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
        $messages=RecievedEmail::where('is_deleted', 0)
            ->            with(array('last_admin_name' => function ($query)  {
                // $query->where('translated_languages_id', $main_language_id);
            }))
            ->

             with(array('contactSubCategory.cSCTranslation' => function ($query)  {
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
