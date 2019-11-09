<?php

namespace App\Models\ContactForm;

use App\Models\TranslatedLanguages\TranslatedLanguages;
use Illuminate\Database\Eloquent\Model;

class CSCTranslation extends Model
{
    protected $table = 'c_s_c_translations';
    public function contactSubCategory()
    {
        return $this->belongsTo(ContactSubCategory::class);
    }
    public function translatedLanguages()
    {
        return $this->belongsTo(TranslatedLanguages::class);
    }
}
