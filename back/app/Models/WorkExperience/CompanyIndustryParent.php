<?php

namespace App\Models\WorkExperience;

use Illuminate\Database\Eloquent\Model;

class CompanyIndustryParent extends Model
{

    public function companyIndustries()
    {
        return $this->hasMany(CompanyIndustry::class);
    }

    public function companyIndustryParentTrans()
    {
        return $this->hasMany(CompanyIndustryParentTrans::class);
    }
}
