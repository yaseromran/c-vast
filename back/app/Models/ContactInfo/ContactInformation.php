<?php

namespace App\Models\ContactInfo;


use App\Models\Resume;
use Illuminate\Database\Eloquent\Model;

class ContactInformation extends Model
{
    public function resume(){
        return $this->belongsTo(Resume::class);
    }

    public function emails(){
        return $this->hasMany(Email::class);
    }
    public function contactNumbers(){
        return $this->hasMany(ContactNumber::class);
    }
    public function internetCommunications(){
        return $this->hasMany(InternetCommunication::class);
    }
    public function personalLinks(){
        return $this->hasMany(PersonalLink::class);
    }



    protected $fillable=[
        'resume_id'
    ];
}
