<?php

namespace App\Models\WorkExperience;

use App\Models\Resume;
use Illuminate\Database\Eloquent\Model;

class WorkExperience extends Model
{
    protected $dates = ['from', 'to'];

    public function resume()
    {
        return $this->belongsTo(Resume::class);
    }
    public function company()
    {
        return $this->hasOne(WorkExpCompany::class);
    }
    public function company_industry()
    {
        return $this->belongsTo(CompanyIndustry::class);
    }
    public function employment_types()
    {
        return $this->hasMany(EmploymentType::class);
    }

}
