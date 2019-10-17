<?php

namespace App\Models\WorkExperience;

use Illuminate\Database\Eloquent\Model;

class WorkExpCompany extends Model
{
    public function work_experience()
    {
        return $this->belongsTo(WorkExperience::class);
    }

    public function company_size()
    {
        return $this->belongsTo(CompanySize::class);
    }

    protected $fillable = [
        'work_experience_id',
        'country',
        'city',
        'name',
        'company_size_id',
        'company_website',
        'company_description',
        'verified_by_google'
    ];
}
