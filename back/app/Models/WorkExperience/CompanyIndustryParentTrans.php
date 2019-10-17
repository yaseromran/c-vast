<?php

namespace App\Models\WorkExperience;

use App\Models\TranslatedLanguages\TranslatedLanguages;
use Illuminate\Database\Eloquent\Model;

class CompanyIndustryParentTrans extends Model
{
    protected $fillable = ['company_industry_parent_id', 'translated_languages_id', 'name'];

    public function companyIndustryParent()
    {
        return $this->belongsTo(CompanyIndustryParent::class);
    }

    public function translatedLanguages()
    {
        return $this->belongsTo(TranslatedLanguages::class);
    }
}
