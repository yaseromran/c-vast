<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class UpdateContactNumbersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('contact_numbers', function (Blueprint $table) {
            $table->dropColumn('phone_type');

            $table->integer('phone_type_id')->unsigned()->nullable();
            $table->foreign('phone_type_id')->references('id')->on('phone_types');

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
