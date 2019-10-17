<?php

namespace App\Models\ContactInfo;

use Illuminate\Database\Eloquent\Model;

class PhoneType extends Model
{
    protected $fillable = ['id'];

    public function contactNumber()
    {
        return $this->hasOne(ContactNumber::class);
    }

    public function PhoneTypeTranslation()
    {
        return $this->hasMany(PhoneTypeTranslation::class);
    }
}
