<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class EditColumnRecievedEmailsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('recieved_emails', function (Blueprint $table)
        {

            $table->integer('delete_by_admin_user_id')->unsigned()->nullable()->change();
            $table->integer('last_admin_comment_id')->unsigned()->nullable()->change();
            $table->integer('last_admin_done_email_log_id')->unsigned()->nullable()->change();
            $table->integer('last_admin_open_log_id')->unsigned()->nullable()->change();
            $table->integer('last_admin_replied_email_id')->unsigned()->nullable()->change();
            $table->integer('last_admin_restore_email_log_id')->unsigned()->nullable()->change();
        });
    }


}
