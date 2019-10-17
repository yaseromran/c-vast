<?php

namespace App\Models\Education;

use Illuminate\Database\Eloquent\Model;

class MajorParent extends Model
{

    public function majors()
    {
        return $this->hasMany(Major::class);
    }

    public function majorParentTranslation()
    {
        return $this->hasMany(MajorParentTranslation::class);
    }
}
