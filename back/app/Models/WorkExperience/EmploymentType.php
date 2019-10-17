<?php

namespace App\Models\WorkExperience;

use Illuminate\Database\Eloquent\Model;

class EmploymentType extends Model
{
    public function work_experience()
    {
        return $this->belongsTo(WorkExperience::class);
    }

    public function employment_type_parent()
    {
        return $this->belongsTo(EmploymentTypeParent::class);
    }
    protected $fillable = ['name','employment_type_parent_id','work_experience_id'];
}
