<?php

namespace App\Models\PersonalInformation;

use Illuminate\Database\Eloquent\Model;

class PlaceOfBirth extends Model
{
    public function personalInformation(){
        return $this->belongsTo(PersonalInformation::class);
    }
    protected $fillable=[
        'personal_information_id',
        'country',
        'city',
        'latitude',
        'longitude'
    ];
}
