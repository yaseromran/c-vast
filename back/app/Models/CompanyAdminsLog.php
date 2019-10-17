<?php

namespace App\Models;

use App\Admin;
use App\Models\Company\Company;
use App\Models\Company\CompanyMethodVerfication;
use App\Models\Company\CompanyStatus;
use App\User;
use Illuminate\Database\Eloquent\Model;

class CompanyAdminsLog extends Model
{
    protected $table = 'company_admins_logs';
    public $timestamps = true;
    public function user()
    {
        return $this->belongsTo(User::class);
    }
    public function companyStatus()
    {
        return $this->belongsTo(CompanyStatus::class);
    }
    public function companyMethodVerfication()
    {
        return $this->belongsTo(CompanyMethodVerfication::class);
    }
}
