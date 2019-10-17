<?php

namespace App\Models\ContactInfo;

use App\Models\Country\Country;
use Illuminate\Database\Eloquent\Model;

class ContactNumber extends Model
{
    public function contactInformation()
    {
        return $this->belongsTo(ContactInformation::class);
    }

    public function phoneType()
    {
        return $this->belongsTo(PhoneType::class);
    }
    public function country()
    {
        return $this->belongsTo(Country::class);
    }
    protected $fillable = [
//        'phone_type',
//        'country_code',
        'phone_number',
        'contact_information_id',
        'phone_type_id',
        'country_id'

    ];
}
