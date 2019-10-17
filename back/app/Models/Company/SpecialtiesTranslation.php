<?php

namespace App\Models\Company;
use App\Models\TranslatedLanguages\TranslatedLanguages;
 use Illuminate\Database\Eloquent\Model;

class SpecialtiesTranslation extends Model
{
    protected $table = 'specialty_translations';
    public $timestamps = false;
    public function specialty()
    {
        return $this->belongsTo(Specialty::class);
    }
    public function translatedLanguages()
    {
        return $this->belongsTo(TranslatedLanguages::class);
    }
}
