<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateSpecialtyTranslationsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * CREATE TABLE specialty_translations
    (

    ;




     * @return void
     */
    public function up()
    {
        Schema::create('specialty_translations', function (Blueprint $table)
        {
            $table->increments('id');
            $table->integer('specialty_id')->unsigned();
            $table->integer('translated_languages_id')->unsigned();
            $table->string('specialty_translation_name');
            $table->timestamps();
            $table->foreign('specialty_id')           ->references('id')->on('specialty');
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
        Schema::dropIfExists('specialty_translations');
    }
}
