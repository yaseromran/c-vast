<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CompanySpecialtiesForCompanyLink extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('company_specialties_for_companies', function (Blueprint $table) {
            $table->foreign('company_profile_id')->references('id')->on('company_profiles');
            $table->foreign('specialty_id')   ->references('id')->on('specialty');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        //
    }
}
