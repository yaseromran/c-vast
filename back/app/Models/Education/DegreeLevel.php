<?php

namespace App\Models\Education;

use Illuminate\Database\Eloquent\Model;

class DegreeLevel extends Model
{

    public function education()
    {
        return $this->hasMany(Education::class);
    }

    public function degreeLevelTranslation()
    {
        return $this->hasMany(DegreeLevelTranslation::class);
    }
}
