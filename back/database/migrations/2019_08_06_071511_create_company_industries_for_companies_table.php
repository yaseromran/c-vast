<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateCompanyIndustriesForCompaniesTable extends Migration
{
    /**
     * Run the migrations.
     *
     *
     * @return void
     */
    public function up()
    {
        Schema::create('company_industries_for_companies', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('company_profile_id')->unsigned();
            $table->integer('company_industry_id')->unsigned();
            $table->timestamps();

            $table->foreign('company_profile_id')  ->references('id')->on('company_profiles');
            $table->foreign('company_industry_id') ->references('id')->on('company_industries');

        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('company_industries_for_companies');
    }
}
