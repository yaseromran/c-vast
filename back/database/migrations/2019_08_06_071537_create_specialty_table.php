<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateSpecialtyTable extends Migration
{
    /**
     * Run the migrations.
     *
     *
     * @return void
     */
    public function up()
    {
        Schema::create('specialty', function (Blueprint $table)
        {
            $table->increments('id');
            $table->integer('company_industry_id')->unsigned();
            $table->boolean('is_verfied')->default(false);
            $table->timestamps();
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
        Schema::dropIfExists('specialty');
    }
}
