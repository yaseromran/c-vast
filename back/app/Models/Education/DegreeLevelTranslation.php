<?php

namespace App\Models\Education;

use App\Models\TranslatedLanguages\TranslatedLanguages;
use Illuminate\Database\Eloquent\Model;

class DegreeLevelTranslation extends Model
{
    protected $fillable = ['degree-level_id', 'translated_languages_id', 'name'];

    public function degreeLevel()
    {
        return $this->belongsTo(DegreeLevel::class);
    }

    public function translatedLanguages()
    {
        return $this->belongsTo(TranslatedLanguages::class);
    }
}
