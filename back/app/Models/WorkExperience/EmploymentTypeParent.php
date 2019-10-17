<?php

namespace App\Models\WorkExperience;

use Illuminate\Database\Eloquent\Model;

class EmploymentTypeParent extends Model
{
    public function employment_types()
    {
        return $this->hasMany(EmploymentType::class);
    }

    /**
     * Get the index name for the model.
     *
     * @return string
     */
    public function child_types()
    {
        return $this->hasMany('App\Models\WorkExperience\EmploymentTypeParent', 'parent_id', 'id');
    }
    public function parent_category()
    {
        return $this->belongsTo('App\Models\WorkExperience\EmploymentTypeParent', 'parent_id', 'id');
    }
    public function empTypeParentTranslation()
    {
        return $this->hasMany(EmpTypeParentTranslation::class);
    }
}
