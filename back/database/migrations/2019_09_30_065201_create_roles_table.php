<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateRolesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('roles', function (Blueprint $table) {
            $table->increments('id');
            $table->string('name');
            $table->string('description');
            $table->timestamps();
        });
        $this->initializeRows();

    }
    public function initializeRows()
    {
        $rows = array();
        $rows['name']='admin';
        $rows['description']='admin';
        DB::table('roles')->insert($rows);

        $rows['name']='employeer';
        $rows['description']='employeer';
        DB::table('roles')->insert($rows);

        $rows['name']='user';
        $rows['description']='user';
        DB::table('roles')->insert($rows);


    }
    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('roles');
    }
}
