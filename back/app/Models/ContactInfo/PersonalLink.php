<?php

namespace App\Models\ContactInfo;

use App\Models\SocialMedia\SocialMedia;
use Illuminate\Database\Eloquent\Model;

class PersonalLink extends Model
{
    public function contactInformation()
    {
        return $this->belongsTo(ContactInformation::class);
    }
    public function socialMedia(){
        return $this->belongsTo(SocialMedia::class);
    }
    protected $fillable=[
        'type',
        'url',
        'contact_information_id',
        'social_media_id'
    ];
}
