<?php

namespace App\Models\WorkExperience;

use App\Models\Company\Company;
use App\Models\Company\CompanyProfile;
use Illuminate\Database\Eloquent\Model;

class CompanySize extends Model
{
    public function work_exp_company()
    {
        return $this->hasMany(WorkExpCompany::class);
    }

    public function company_size_translation()
    {
        return $this->hasMany(CompanySizeTranslation::class);
    }
    public function companyProfile()
    {
        return $this->hasOne(CompanyProfile::class);
    }
}
