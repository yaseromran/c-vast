<?php

namespace App\Models\Company;
use App\Models\WorkExperience\CompanyIndustry;
use Illuminate\Database\Eloquent\Model;

class   Specialty extends Model
{
    protected $table = 'specialty';
    public $timestamps = false;
    public function specialtyTranslations()
    {
        return $this->hasMany(SpecialtiesTranslation::class);
    }
    public function companySpecialtiesForCompanies()
    {
        return $this->hasOne(CompanySpecialtiesForCompany::class);
    }
    public function CompanyIndustry()
    {
        return $this->hasOne(CompanyIndustry::class);
    }
}
