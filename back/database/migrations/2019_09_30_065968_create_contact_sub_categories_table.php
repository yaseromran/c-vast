<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateContactSubCategoriesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('contact_sub_categories', function (Blueprint $table)
        {
            $table->increments('id');
            $table->string('name') ;
            $table->integer('contact_main_catagory_id')->unsigned();


            $table->timestamps();
            $table->foreign('contact_main_catagory_id')->references('id')->on('contact_main_catagories');



        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('admin_open_logs');
    }
}
