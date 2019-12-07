<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AddRecievedEmailsTable extends Migration
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
            $table->integer('last_admin_note_done_email_log_id')->unsigned()->nullable()->after('last_admin_done_email_log_id');;
            $table->foreign('last_admin_note_done_email_log_id')->references('id')->on('admin_note_done_email_logs');
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
