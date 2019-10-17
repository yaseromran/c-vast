<?php

namespace App\Models\PersonalInformation;

use App\Models\Resume;
use Illuminate\Database\Eloquent\Model;

class PersonalInformation extends Model
{
    public function resume()
    {
        return $this->belongsTo(Resume::class);
    }

    public function placeOfBirth()
    {
        return $this->hasOne(PlaceOfBirth::class);
    }

    public function currentLocation()
    {
        return $this->hasOne(CurrentLocation::class);
    }

    public function maritalStatus()
    {
        return $this->belongsTo(MaritalStatus::class);
    }

    public function nationalities()
    {
        return $this->belongsToMany(Nationality::class, 'nationality_personal_information');
    }


    Const MALE = 'male';
    Const FEMALE = 'female';
    Const OTHER = 'other';

    protected $fillable = [
        'resume_id',
        'first_name',
        'middle_name',
        'last_name',
        'profile_picture',
        'resume_title',
        'gender',
        'marital_status',
        'date_of_birth'
    ];
}
