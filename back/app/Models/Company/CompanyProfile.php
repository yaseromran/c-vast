<?php

namespace App\Models\Company;

use App\Models\TranslatedLanguages\TranslatedLanguages;
use Illuminate\Database\Eloquent\Model;

class CompanyProfile extends Model
{

    protected $table = 'company_profiles';

    public $timestamps = false;
    public function companySize()
    {
        return $this->belongsTo(CompanySize::class);
    }
    public function company()
    {
        return $this->belongsTo(Company::class);
    }
    public function companyType()
    {
        return $this->belongsTo(CompanyType::class);
    }
    public function companyProfileTranslations()

    {
        return $this->hasMany(CompanyProfileTranslation::class);
    }
    public function companyIndustriesForCompanies()
    {
        return $this->hasMany(CompanyIndustriesForCompany::class);
    }
    public function companySpecialtiesForCompanies()
    {
        return $this->hasMany(CompanySpecialtiesForCompany::class);
    }
    public function  companySocialMedias()
    {
        return $this->hasMany(CompanySocialMedia::class);
    }
    public function company_locations()

    {
        return $this->hasMany(CompanyLocation::class);
    }
}
