<?php

namespace App\Models\Education;

use Illuminate\Database\Eloquent\Model;

class Minor extends Model
{
    public function majors()
    {
        return $this->belongsTo(Major::class);
    }

    public function education()
    {
        return $this->hasMany(Education::class);
    }
    public function minorTranslation()
    {
        return $this->hasMany(MinorTranslation::class);
    }
}
