<?php

namespace App\Models\WorkExperience;

use App\Models\TranslatedLanguages\TranslatedLanguages;
use Illuminate\Database\Eloquent\Model;

class CompanyIndustryTranslation extends Model
{
    protected $fillable = ['company_industry_id', 'translated_languages_id', 'name'];

    public function company_industry()
    {
        return $this->belongsTo(CompanyIndustry::class);
    }

    public function translatedLanguages()
    {
        return $this->belongsTo(TranslatedLanguages::class);
    }
}
