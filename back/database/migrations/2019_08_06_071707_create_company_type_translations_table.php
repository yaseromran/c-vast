<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateCompanyTypeTranslationsTable extends Migration
{
    /**
     * Run the migrations.
     *
     *
     * @return void
     */
    public function up()
    {
        Schema::create('company_type_translations', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('translated_languages_id')->unsigned();
            $table->integer('company_type_id')->unsigned();
            $table->string('company_type_name');


            $table->timestamps();
            $table->foreign('translated_languages_id')->references('id')->on('translated_languages');
            $table->foreign('company_type_id')->references('id')->on('company_types');

        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('company_type_translations');
    }
}
