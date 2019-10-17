<?php

namespace App\Models\Company;

use App\Models\TranslatedLanguages\TranslatedLanguages;
use Illuminate\Database\Eloquent\Model;

class CompanyTypeTranslation extends Model
{
    //
    protected $table = 'company_type_translations';
    public $timestamps = false;
    public function companyType()
    {
        return $this->belongsTo(CompanyType::class);
    }
    public function translatedLanguages()
    {
        return $this->belongsTo(TranslatedLanguages::class);
    }
}
