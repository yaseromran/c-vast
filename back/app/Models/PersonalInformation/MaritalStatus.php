<?php

namespace App\Models\PersonalInformation;

use Illuminate\Database\Eloquent\Model;

class MaritalStatus extends Model
{
    protected $fillable = ['id'];

    public function personalInformation()
    {
        return $this->hasOne(PersonalInformation::class);
    }

    public function maritalStatusTranslation()
    {
        return $this->hasMany(MaritalStatusTranslation::class);
    }
}
