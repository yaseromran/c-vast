<?php

namespace App\Models\Company;

use Illuminate\Database\Eloquent\Model;

class CompanySpecialtiesForCompany extends Model
{
    public $timestamps = false;
    protected $table = 'company_specialties_for_companies';


    public function specialty()
    {
        return $this->belongsTo(Specialty::class);
    }
    public function companyProfile()
    {
        return $this->belongsTo(CompanyProfile::class);
    }
}
