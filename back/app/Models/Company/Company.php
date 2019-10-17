<?php

namespace App\Models\Company;

use App\User;
use Illuminate\Database\Eloquent\Model;

class Company extends Model
{

    protected $table = 'companies';

    public $timestamps = false;


    public function companyProfile()
    {
        return $this->hasOne(CompanyProfile::class);
    }
    public function translatedLanguage()
    {
        return $this->belongsTo(TranslatedLanguages::class);
    }
    public function company_method_verfication()
    {
        return $this->belongsTo(CompanyMethodVerfication::class);
    }
    public function company_status()
    {
        return $this->belongsTo(CompanyStatus::class);
    }
    public function user()
    {
        return $this->belongsTo(User::class);
    }

}
