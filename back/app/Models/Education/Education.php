<?php

namespace App\Models\Education;

use App\Models\Resume;
use Illuminate\Database\Eloquent\Model;

class Education extends Model
{
    protected $dates=['from', 'to'];
    public function resume()
    {
        return $this->belongsTo(Resume::class);
    }

    public function major()
    {
        return $this->belongsTo(Major::class);
    }

    public function minor()
    {
        return $this->belongsTo(Minor::class);
    }
    public function degreeLevel()
    {
        return $this->belongsTo(DegreeLevel::class);
    }

//    public function university()
//    {
//        return $this->belongsTo(University::class);
//    }
    public function institution()
    {
        return $this->belongsTo(Institution::class);
    }

    public function projects()
    {
        return $this->hasMany(EducationProject::class);
    }
}
