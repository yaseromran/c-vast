<?php

namespace App\Models\Company;

use App\Models\CompanyAdminsLog;
use Illuminate\Database\Eloquent\Model;

class CompanyMethodVerfication extends Model
{
    public $timestamps = false;

    public function company()
    {
        return $this->hasMany(Company::class);
    }
    public function adminsLog()
    {
        return $this->hasOne(CompanyAdminsLog::class);
    }
}
