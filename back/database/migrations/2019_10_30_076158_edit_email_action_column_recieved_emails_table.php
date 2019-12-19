<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class EditEmailActionColumnRecievedEmailsTable extends Migration
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
            $table->string('last_action_name')->nullable();
            $table->string('last_admin_name')->nullable();
            $table->integer('last_admin_action_id')->unsigned()->nullable();
            $table->foreign('last_admin_action_id')->references('id')->on('users');



        });
    }


}
