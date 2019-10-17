<?php

namespace App\Models\ContactInfo;

use App\Models\TranslatedLanguages\TranslatedLanguages;
use Illuminate\Database\Eloquent\Model;

class PhoneTypeTranslation extends Model
{
    protected $fillable = ['phone_type_id', 'translated_languages_id', 'name'];

    public function phoneTypes()
    {
        return $this->hasOne(PhoneType::class);
    }

    public function translatedLanguages()
    {
        return $this->belongsTo(TranslatedLanguages::class);
    }
}
