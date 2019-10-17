<?php

namespace App\Models\Education;

use App\Models\TranslatedLanguages\TranslatedLanguages;
use Illuminate\Database\Eloquent\Model;

class MinorTranslation extends Model
{
    protected $fillable = ['minor_id', 'translated_languages_id', 'name'];

    public function minor()
    {
        return $this->belongsTo(Minor::class);
    }

    public function translatedLanguages()
    {
        return $this->belongsTo(TranslatedLanguages::class);
    }
}
