<?php

namespace App\Models\Education;

use App\Models\TranslatedLanguages\TranslatedLanguages;
use Illuminate\Database\Eloquent\Model;

class InstitutionTranslation extends Model
{
    protected $fillable = ['institution_id', 'translated_languages_id', 'name'];

    public function institution()
    {
        return $this->belongsTo(Institution::class);
    }

    public function translatedLanguages()
    {
        return $this->belongsTo(TranslatedLanguages::class);
    }
}
