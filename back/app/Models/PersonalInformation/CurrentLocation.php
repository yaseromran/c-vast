<?php

namespace App\Models\PersonalInformation;

use Illuminate\Database\Eloquent\Model;

class CurrentLocation extends Model
{
    public function personalInformation(){
        return $this->belongsTo(PersonalInformation::class);
    }
    protected $fillable=[
        'personal_information_id',
        'country',
        'city',
        'postal_code',
        'street_address',
        'latitude',
        'longitude'
    ];
}
