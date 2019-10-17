<?php

namespace App\Models\PersonalInformation;


use Illuminate\Database\Eloquent\Model;

class Nationality extends Model
{
    public function personalInformation()
    {
        return $this->belongsToMany(PersonalInformation::class, 'nationality_personal_information');
    }

    public function nationalityTranslation()
    {
        return $this->hasMany(NationalityTranslation::class);
    }

    protected $fillable = ['id'];
}
