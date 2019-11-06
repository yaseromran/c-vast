<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateRecievedEmailsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('recieved_emails', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('contact_main_catagory_id')->unsigned();
            $table->integer('contact_sub_category_id')->unsigned();
            $table->integer('delete_by_admin_user_id')->unsigned();
            $table->integer('last_admin_comment_id')->unsigned();
            $table->integer('last_admin_done_email_log_id')->unsigned();
            $table->integer('last_admin_open_log_id')->unsigned();
            $table->integer('last_admin_replied_email_id')->unsigned();
            $table->integer('last_admin_restore_email_log_id')->unsigned();
            $table->integer('translated_languages_id')->unsigned();
            $table->integer('user_id')->unsigned();

            $table->string('message') ;
            $table->string('email')->unique();
            $table->boolean('is_deleted')->default(false);
            $table->timestamp('deleted_at');
            $table->timestamps();

            $table->foreign('contact_main_catagory_id')->references('id')->on('contact_main_catagories');
            $table->foreign('contact_sub_category_id')->references('id')->on('contact_sub_categories');
            $table->foreign('user_id')->references('id')->on('users');
            $table->foreign('translated_languages_id')->references('id')->on('translated_languages');


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
