<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateCompanyProfileTranslationsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('company_profile_translations', function (Blueprint $table) {

            $table->increments('id');
            $table->string('company_description')->nullable();;
            $table->string('name');
            $table->integer('company_profile_id')->unsigned();
            $table->integer('translated_languages_id')->unsigned();
            $table->timestamps();
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
        Schema::dropIfExists('company_profile_translations');
    }
}
