<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateInternetCommunicationsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('internet_communications', function (Blueprint $table) {
            $table->increments('id');
            $table->string('type');
            $table->string('address');
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
        Schema::dropIfExists('internet_communications');
    }
}
