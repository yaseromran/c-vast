<?php

namespace App\Models\Country;

use App\Models\ContactInfo\ContactNumber;
use App\Models\DrivingLicense\Driving;
use Illuminate\Database\Eloquent\Model;

class Country extends Model
{
    protected $fillable = ['id','code'];

    public function countryTranslation()
    {
        return $this->hasMany(CountryTranslation::class);
    }

    public function contactNumber()
    {
        return $this->hasOne(ContactNumber::class);
    }
    public function driving()
    {
        return $this->hasOne(Driving::class);
    }
}
