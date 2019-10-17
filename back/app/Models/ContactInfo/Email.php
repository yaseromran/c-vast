<?php

namespace App\Models\ContactInfo;

use Illuminate\Database\Eloquent\Model;

class Email extends Model
{
    public function contactInformation(){
        return $this->belongsTo(ContactInformation::class);
    }
    protected $fillable=[
        'email_address',
        'contact_information_id'
    ];
}
