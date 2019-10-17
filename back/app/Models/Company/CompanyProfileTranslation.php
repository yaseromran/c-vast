<?php

namespace App\Models\Company;

use App\Models\TranslatedLanguages\TranslatedLanguages;
use Illuminate\Database\Eloquent\Model;

class CompanyProfileTranslation extends Model
{
    protected $table = 'company_profile_translations';

    public $timestamps = false;
    public function companyProfile()
    {
        return $this->belongsTo(CompanyProfile::class);
    }
    public function translatedLanguages()
    {
        return $this->belongsTo(TranslatedLanguages::class);
    }
}
