<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateEducationTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('education', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('resume_id')->unsigned();
            $table->string('degree_level');
            $table->integer('university_id')->unsigned();
            $table->integer('major_id')->unsigned();
            $table->integer('minor_id')->unsigned()->nullable();
            $table->date('from')->nullable();
            $table->date('to')->nullable();
            $table->boolean('isPresent')->nullable();
            $table->float('grade')->nullable();
            $table->float('full_grade')->nullable();
            $table->foreign('university_id')->references('id')->on('universities');
            $table->foreign('major_id')->references('id')->on('majors');
            $table->foreign('minor_id')->references('id')->on('minors');
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
        Schema::dropIfExists('education');
    }
}
