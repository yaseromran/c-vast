<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateEmploymentTypeParentTranslationsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('emp_type_parent_translations', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('emp_type_parent_id')->unsigned()->nullable();
            $table->foreign('emp_type_parent_id','emp_type_parent_foreign')->references('id')->on('employment_type_parents');

            $table->integer('translated_languages_id')->unsigned()->nullable();
            $table->foreign('translated_languages_id')->references('id')->on('translated_languages');

            $table->string('name');
//            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
       Schema::dropIfExists('emp_type_parent_translations');
    }
}
