<?php

namespace App\Models\ContactForm;

use App\Models\TranslatedLanguages\TranslatedLanguages;
use Illuminate\Database\Eloquent\Model;

class CMCTranslation extends Model
{
    protected $table = 'c_m_c_translations';
    public function contactMainCategory()
    {
        return $this->belongsTo(ContactMainCatagory::class);
    }
    public function translatedLanguages()
    {
        return $this->belongsTo(TranslatedLanguages::class);
    }
}
