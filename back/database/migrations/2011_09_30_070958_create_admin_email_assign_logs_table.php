<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateAdminEmailAssignLogsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('admin_email_assign_logs', function (Blueprint $table)
        {
            $table->increments('id');
            $table->integer('recieved_email_id')->unsigned();
            $table->integer('from_assigned_admin_user_id')->unsigned();
            $table->integer('to_assigned_admin_user_id')->unsigned();

            $table->timestamps();
            $table->foreign('to_assigned_admin_user_id')->references('id')->on('users');
            $table->foreign('from_assigned_admin_user_id')->references('id')->on('users');
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
        Schema::dropIfExists('admin_open_logs');
    }
}
