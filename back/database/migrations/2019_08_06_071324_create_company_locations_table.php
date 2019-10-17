<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateCompanyLocationsTable extends Migration
{
    /**
     * Run the migrations.
     *
     *
     * @return void
     */
    public function up()
    {
        Schema::create('company_locations', function (Blueprint $table) {
            $table->increments('id');
            $table->boolean('is_main_office')->nullable();
            $table->string('city')->nullable();
            $table->string('country')->nullable();
            $table->string('name')->nullable();
            $table->string('postal_code')->nullable();
            $table->string('street_address')->nullable();
            $table->decimal('latitude',18,15)->nullable();
            $table->decimal('longitude',18,15)->nullable();
            $table->integer('company_profile_id')->unsigned()->nullable();
            $table->timestamps();
            $table->foreign('company_profile_id')->references('id')->on('company_profiles');


        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('company_locations');
    }
}
