<?php

namespace App\Models\TranslatedLanguages;

use App\Models\Company\Company;
use App\Models\Company\CompanyProfile;
use App\Models\Company\CompanyTypeTranslation;
use App\Models\Company\SpecialtiesTranslation;
use App\Models\ContactInfo\PhoneTypeTranslation;
use App\Models\Country\CountryTranslation;
use App\Models\Education\DegreeLevelTranslation;
use App\Models\Education\InstitutionTranslation;
use App\Models\Education\MajorParentTranslation;
use App\Models\Education\MajorTranslation;
use App\Models\Education\MinorTranslation;
use App\Models\PersonalInformation\MaritalStatusTranslation;
use App\Models\PersonalInformation\NationalityTranslation;
use App\Models\Resume;
use App\Models\WorkExperience\CompanyIndustryParentTrans;
use App\Models\WorkExperience\CompanyIndustryTranslation;
use App\Models\WorkExperience\CompanySizeTranslation;
use App\Models\Company\CompanyProfileTranslation;
use App\Models\WorkExperience\EmpTypeParentTranslation;
use Illuminate\Database\Eloquent\Model;

class TranslatedLanguages extends Model
{
    protected $fillable = ['name'];

    public function resume()
    {
        return $this->hasMany(Resume::class);
    }

    public function maritalStatusTranslation()
    {
        return $this->hasMany(MaritalStatusTranslation::class);
    }

    public function nationalityTranslation()
    {
        return $this->hasMany(NationalityTranslation::class);
    }

    public function phoneTypeTranslation()
    {
        return $this->hasMany(PhoneTypeTranslation::class);
    }

    public function institutionTranslation()
    {
        return $this->hasMany(InstitutionTranslation::class);
    }

    public function majorTranslation()
    {
        return $this->hasMany(MajorTranslation::class);
    }

    public function minorTranslation()
    {
        return $this->hasMany(MinorTranslation::class);
    }

    public function degreeLevelTranslation()
    {
        return $this->hasMany(DegreeLevelTranslation::class);
    }

    public function companyIndustryTranslation()
    {
        return $this->hasMany(CompanyIndustryTranslation::class);
    }

    public function companyIndustryParentTranslation()
    {
        return $this->hasMany(CompanyIndustryParentTrans::class);
    }

    public function empTypeTranslation()
    {
        return $this->hasMany(EmpTypeParentTranslation::class);
    }

    public function countryTranslation()
    {
        return $this->hasMany(CountryTranslation::class);
    }

    public function majorParentTranslation()
    {
        return $this->hasMany(MajorParentTranslation::class);
    }
    /////////////////////////////////////////////////////////////////
    public function companySizeTranslation()
    {
        return $this->hasMany(CompanySizeTranslation::class);
    }

    public function companyProfileTranslations()
    {
        return $this->hasMany(CompanyProfileTranslation::class);
    }
    public function specialtiesTranslations()
    {
        return $this->hasMany(SpecialtiesTranslation::class);
    }
    public function companyTypeTranslations()
    {
        return $this->hasMany(CompanyTypeTranslation::class);
    }
    public function company()
    {
        return $this->hasMany(Company::class);
    }
}
