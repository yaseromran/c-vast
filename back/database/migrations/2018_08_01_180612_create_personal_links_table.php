<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreatePersonalLinksTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('personal_links', function (Blueprint $table) {
            $table->increments('id');
            $table->string('type');
            $table->string('url');
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
        Schema::dropIfExists('personal_links');
    }
}
