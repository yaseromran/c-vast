<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateWorkExperienceTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('work_experiences', function (Blueprint $table)
        {
            $table->increments('id');
            $table->integer('resume_id')->unsigned();
            $table->integer('company_id')->unsigned();
            $table->integer('company_industry_id')->unsigned()->nullable();

            $table->date('from')->nullable();
            $table->date('to')->nullable();
            $table->boolean('isPresent')->nullable();
            $table->string('isFromMonthPresent')->nullable();
            $table->string('isToMonthPresent')->nullable();
            $table->text('job_title');
            $table->text('description')->nullable();




            $table->foreign('company_id')->references('id')->on('companies');
            $table->foreign('company_industry_id')->references('id')->on('company_industries');
            $table->foreign('resume_id')->references('id')->on('resumes')->onDelete('cascade');
            $table->integer('order');
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
        Schema::dropIfExists('work_experiences');
    }
}
