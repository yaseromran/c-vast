<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateAdminRepliedEmailsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('admin_replied_emails', function (Blueprint $table)
        {
            $table->increments('id');
            $table->string('replyed_email_body') ;
            $table->string('replyed_email_title') ;
            $table->string('cc') ;
            $table->integer('recieved_email_id')->unsigned();
            $table->integer('user_id')->unsigned();
            $table->timestamps();


            $table->foreign('user_id')->references('id')->on('users');
            $table->foreign('recieved_email_id')->references('id')->on('recieved_emails');

        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('admin_replied_emails');
    }
}
