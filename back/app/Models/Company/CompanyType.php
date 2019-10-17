<?php

namespace App\Models\Company;

use Illuminate\Database\Eloquent\Model;

class CompanyType extends Model
{
    //
    protected $table = 'company_types';
    public $timestamps = false;
    public function companyTypeTranslations()
    {
        return $this->hasMany(CompanyTypeTranslation::class);
    }
    public function companyProfile()
    {
        return $this->hasOne(CompanyProfile::class);
    }
}
