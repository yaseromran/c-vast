<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateEmploymentTypeTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('employment_types', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('employment_type_parent_id')->unsigned()->nullable();
            $table->integer('work_experience_id')->unsigned()->nullable();

            $table->foreign('employment_type_parent_id')->references('id')->on('employment_type_parents')->onDelete('cascade');
            $table->foreign('work_experience_id')->references('id')->on('work_experiences')->onDelete('cascade');

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
        Schema::dropIfExists('employment_types');
    }
}
