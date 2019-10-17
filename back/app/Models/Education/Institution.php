<?php

namespace App\Models\Education;

use Illuminate\Database\Eloquent\Model;

class Institution extends Model
{
    protected $fillable = ['institution_type_id','id'];

    public function education()
    {
        return $this->hasMany(Education::class);
    }

    public function institutionTranslation()
    {
        return $this->hasMany(InstitutionTranslation::class);
    }

    public function institutionType()
    {
        return $this->belongsTo(InstitutionType::class);
    }

}
