<?php

namespace App\Models\SocialMedia;
use App\Models\Company\CompanySocialMedia;
use App\Models\ContactInfo\PersonalLink;
use Illuminate\Database\Eloquent\Model;

class SocialMedia extends Model
{
    protected $fillable = ['id', 'name'];

    public function personalLink()
    {
        return $this->hasMany(PersonalLink::class);
    }
    ////////////////////////////////////////
    public function companySocialMedia()
    {
        return $this->hasMany(CompanySocialMedia::class);
    }
    ////////////////////////////////////////////

}
