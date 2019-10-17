<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class DropAdminTable extends Migration
{


    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('companies', function (Blueprint $table) {
            $table->dropForeign('companies_admin_id_foreign');
            $table->dropColumn('admin_id');
        });
        Schema::table('admins_logs', function (Blueprint $table) {
        $table->dropForeign('admins_logs_admin_id_foreign');
        $table->dropColumn('admin_id');
    });
        Schema::dropIfExists('admins');
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('admins');
    }
}
