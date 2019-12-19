<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class EditColRecievedEmailsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @re2019_09_31_073958_edit_recieved_emails_table.phpturn void
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
