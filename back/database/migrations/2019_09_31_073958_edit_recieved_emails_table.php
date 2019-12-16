<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class EditRecievedEmailsTable extends Migration
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


            $table->foreign('last_admin_comment_id')->references('id')->on('users');
            $table->foreign('last_admin_restore_email_log_id')->references('id')->on('users');
            $table->foreign('last_admin_done_email_log_id')->references('id')->on('users');
            $table->foreign('last_admin_replied_email_id')->references('id')->on('users');

        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {

    }
}
