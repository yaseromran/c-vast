<?php

namespace App\Models;

use App\Models\ContactInfo\ContactInformation;
use App\Models\Education\Education;
use App\Models\PersonalInformation\PersonalInformation;
use App\Models\TranslatedLanguages\TranslatedLanguages;
use App\Models\WorkExperience\WorkExperience;
use App\User;
use Illuminate\Database\Eloquent\Model;

class Resume extends Model
{
    //Model Events
    /*protected static function boot()
    {

    parent::boot();

    //When Deleting A Resume
    static::deleting(function ($resume) {

    //delete each achievement associated with it
    $resume->achievements->each->delete();
    });
    }*/

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function personalInformation()
    {
        return $this->hasOne(PersonalInformation::class);
    }

    public function contactInformation()
    {
        return $this->hasOne(ContactInformation::class);
    }

    public function educations()
    {
        return $this->hasMany(Education::class);
    }

    public function work_experiences()
    {
        return $this->hasMany(WorkExperience::class);
    }

    public function translatedLanguages()
    {
        return $this->hasOne(TranslatedLanguages::class);
    }

    protected $fillable = ['user_id', 'translated_languages_id', 'name'];
}
