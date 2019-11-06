<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreatePreDefinedEmailsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('pre_defined_emails', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('contact_main_catagory_id')->unsigned();
            $table->integer('contact_sub_category_id')->unsigned();

            $table->integer('user_id')->unsigned();

            $table->string('message') ;
            $table->string('email_title')->unique();

            $table->timestamps();

            $table->foreign('contact_main_catagory_id')->references('id')->on('contact_main_catagories');
            $table->foreign('contact_sub_category_id')->references('id')->on('contact_sub_categories');
            $table->foreign('user_id')->references('id')->on('users');


        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('recieved_emails');
    }
}
