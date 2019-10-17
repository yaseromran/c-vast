<?php

namespace App\Models\Education;

use App\Models\TranslatedLanguages\TranslatedLanguages;
use Illuminate\Database\Eloquent\Model;

class MajorParentTranslation extends Model
{
    protected $fillable = ['major_parent_id', 'translated_languages_id', 'name'];

    public function majorParent()
    {
        return $this->belongsTo(MajorParent::class);
    }

    public function translatedLanguages()
    {
        return $this->belongsTo(TranslatedLanguages::class);
    }
}
