<?php

namespace App\Models\WorkExperience;

use App\Models\TranslatedLanguages\TranslatedLanguages;
use Illuminate\Database\Eloquent\Model;

class CompanySizeTranslation extends Model
{
    protected $fillable = ['company_size__id', 'translated_languages_id', 'name'];

    public function company_size()
    {
        return $this->hasOne(CompanySize::class);
    }

    public function translatedLanguages()
    {
        return $this->belongsTo(TranslatedLanguages::class);
    }

}
