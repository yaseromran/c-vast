<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateCompanyProfilesTable extends Migration // yaser omran
{
    /**
     * Run the migrations.
     *


     public company_sizes PK_Company_size;
    public company_types PK_company_types;
     * @return void
     */

    public function up()
    {
        Schema::create('company_profiles', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('company_id')->unsigned();
            $table->string('company_websit')->nullable();
            $table->integer('company_size_id')->unsigned()->nullable();;
            $table->integer('company_type_id')->unsigned()->nullable();
            $table->boolean('is_month')->nullable();
            $table->date('founded')->nullable();
            $table->string('path_company_imagelogo')->nullable();



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
        Schema::dropIfExists('company_profiles');
    }
}
