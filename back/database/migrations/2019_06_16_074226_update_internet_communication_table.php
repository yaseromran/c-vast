<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class UpdateInternetCommunicationTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        //internet_communications
        Schema::table('internet_communications', function (Blueprint $table) {
            $table->integer('internet_communication_type_id')->unsigned()->nullable();
            $table->foreign('internet_communication_type_id')->references('id')->on  ('internet_communication_types');
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
