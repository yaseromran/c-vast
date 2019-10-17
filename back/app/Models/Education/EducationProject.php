<?php

namespace App\Models\Education;

use Illuminate\Database\Eloquent\Model;

class EducationProject extends Model
{
    public function education()
    {
        return $this->belongsTo(Education::class);
    }
}
