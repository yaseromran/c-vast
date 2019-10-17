<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateAdminLogsTable extends Migration
{


    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('admins_logs', function (Blueprint $table)
        {
            $table->increments('id');
            $table->integer('companies_status_id')->unsigned()->nullable();
            $table->integer('company_id')->unsigned()->nullable();

            $table->integer('company_method_verfication_id')->unsigned()->nullable();
            $table->integer('admin_id')->unsigned()->nullable();
            $table->string('admin_description');
            $table->foreign('admin_id')->references('id')->on('admins');
            $table->foreign('companies_status_id')->references('id')->on('company_statuses');
            $table->foreign('company_method_verfication_id')->references('id')->on('company_method_verfications');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('company_statuses');
    }
}
