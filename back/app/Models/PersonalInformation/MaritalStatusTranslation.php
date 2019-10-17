<?php

namespace App\Models\PersonalInformation;

use App\Models\TranslatedLanguages\TranslatedLanguages;
use Illuminate\Database\Eloquent\Model;

class MaritalStatusTranslation extends Model
{
    protected $fillable = ['marital_status_id', 'translated_languages_id', 'name'];

    public function maritalStatuses()
    {
        return $this->belongsTo(MaritalStatus::class);
    }
    public function translatedLanguages()
    {
        return $this->belongsTo(TranslatedLanguages::class);
    }
}
