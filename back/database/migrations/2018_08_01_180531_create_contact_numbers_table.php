<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateContactNumbersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('contact_numbers', function (Blueprint $table) {
            $table->increments('id');
            $table->string('phone_type')->nullable();
            $table->string('country_code');
            $table->string('phone_number');
            $table->integer('contact_information_id')->unsigned();
            $table->timestamps();
            $table->foreign('contact_information_id')->references('id')->on('contact_informations')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('contact_numbers');
    }
}
