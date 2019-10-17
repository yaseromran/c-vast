<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateCompanySocialMediasTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('company_social_medias', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('company_profile_id')->unsigned();
            $table->string('company_social_media_info');
            $table->integer('social_media_id')->unsigned();
            $table->foreign('company_profile_id')->references('id')->on('company_profiles');
            $table->foreign('social_media_id')   ->references('id')->on('social_media');

            $table->timestamps();
        });
    }

    /*
     * Reverse the migrations.
     *
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('company_social_medias');
    }
}
