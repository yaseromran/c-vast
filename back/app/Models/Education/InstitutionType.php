<?php

namespace App\Models\Education;

use Illuminate\Database\Eloquent\Model;

class InstitutionType extends Model
{
    protected $fillable = ['id', 'type'];

    public function institution()
    {
        return $this->hasMany(Institution::class);
    }

    public function major()
    {
        return $this->hasMany(Major::class);
    }
}
