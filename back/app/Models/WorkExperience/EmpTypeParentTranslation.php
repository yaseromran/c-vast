<?php

namespace App\Models\WorkExperience;

use App\Models\TranslatedLanguages\TranslatedLanguages;
use Illuminate\Database\Eloquent\Model;

class EmpTypeParentTranslation extends Model
{
    protected $fillable = ['emp_type_parent__id', 'translated_languages_id', 'name'];

    public function employmentTypeParent()
    {
        return $this->hasOne(EmploymentTypeParent::class);
    }

    public function translatedLanguages()
    {
        return $this->belongsTo(TranslatedLanguages::class);
    }

}
