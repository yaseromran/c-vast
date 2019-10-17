<?php

namespace App\Models\Company;

use App\Models\CompanyAdminsLog;
use Illuminate\Database\Eloquent\Model;

class CompanyStatus extends Model
{
    public $timestamps = false;
    protected $table = 'company_statuses';
    public function company()
    {
        return $this->hasMany(Company::class);
    }
    public function adminsLog()
    {
        return $this->hasOne(CompanyAdminsLog::class);
    }
}
