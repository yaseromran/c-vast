<?php

namespace App\Models\Education;

use App\Models\TranslatedLanguages\TranslatedLanguages;
use Illuminate\Database\Eloquent\Model;

class MajorTranslation extends Model
{
    protected $fillable = ['major_id', 'translated_languages_id', 'name'];

    public function major()
    {
        return $this->belongsTo(Major::class);
    }

    public function translatedLanguages()
    {
        return $this->belongsTo(TranslatedLanguages::class);
    }
}
