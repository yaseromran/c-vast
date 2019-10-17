<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateCompanySpecialtiesForCompaniesTable extends Migration
{
    /**
     * Run the migrations.
     *
     *


    ALTER TABLE company_specialties_for_companies ADD CONSTRAINT FK_company_profile_idcompany_specialties_for_companies
    FOREIGN KEY (company_profile_id) REFERENCES company_profiles (id)
    ;

    ALTER TABLE company_specialties_for_companies ADD CONSTRAINT FK_specialty_idcompany_specialties_for_company
    FOREIGN KEY (specialty_id) REFERENCES specialty (id)
    ;


     * @return void
     */
    public function up()
    {
        Schema::create('company_specialties_for_companies', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('company_profile_id')->unsigned();
            $table->integer('specialty_id')->unsigned();
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
        Schema::dropIfExists('company_specialties_for_companies');
    }
}
