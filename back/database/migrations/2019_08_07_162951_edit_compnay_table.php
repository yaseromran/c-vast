<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class EditCompnayTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {/*

    حقل منطقي يعني ضح او خطا بحدد حالة الشركة اذا تم التحقق منا او لاء

هيدا الحقل ما بيظهر بالواجهه

لانو من عنا نحن منقرر



    */
        Schema::table('companies', function (Blueprint $table) {
            $table->boolean('is_verified')->default(false);
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
