<?php

namespace App\Models\Company;
use App\Models\SocialMedia\SocialMedia;
use Illuminate\Database\Eloquent\Model;

class CompanySocialMedia extends Model
{
    protected $table = 'company_social_medias';

    public $timestamps = false;
    public function companyProfile()
    {
        return $this->belongsTo(CompanyProfile::class);
    }
    public function socialMedia()
    {
        return $this->belongsTo(SocialMedia::class);
    }

}
