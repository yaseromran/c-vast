<?php

namespace App\Models\Company;

use Illuminate\Database\Eloquent\Model;
use App\Models\WorkExperience\CompanyIndustry;
class CompanyIndustriesForCompany extends Model
{
    public $timestamps = false;
    protected $table = 'company_industries_for_companies';

    public function companyIndustry()
    {
        return $this->belongsTo(CompanyIndustry::class);
    }
    public function companyProfile()
    {
        return $this->belongsTo(CompanyProfile::class);
    }
}
