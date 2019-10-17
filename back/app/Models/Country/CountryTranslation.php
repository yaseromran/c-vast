<?php

namespace App\Models\Country;

use App\Models\TranslatedLanguages\TranslatedLanguages;
use Illuminate\Database\Eloquent\Model;

class CountryTranslation extends Model
{
    protected $fillable = ['country_id', 'translated_languages_id', 'name'];

    public function country()
    {
        return $this->hasOne(Country::class);
    }
    public function translatedLanguages()
    {
        return $this->belongsTo(TranslatedLanguages::class);
    }
}
