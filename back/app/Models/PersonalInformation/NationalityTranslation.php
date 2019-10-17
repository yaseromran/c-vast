<?php

namespace App\Models\PersonalInformation;

use App\Models\TranslatedLanguages\TranslatedLanguages;
use Illuminate\Database\Eloquent\Model;

class NationalityTranslation extends Model
{
    protected $fillable = ['nationality_id', 'translated_languages_id', 'name'];

    public function nationalities()
    {
        return $this->hasOne(Nationality::class);
    }

    public function translatedLanguages()
    {
        return $this->belongsTo(TranslatedLanguages::class);
    }
}
