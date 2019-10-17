<?php

namespace App\Models\Company;

use Illuminate\Database\Eloquent\Model;

class CompanyLocation extends Model
{
    protected $table = 'company_locations';

    public $timestamps = false;

    public function companyProfile()
    {
        return $this->belongsTo(CompanyProfile::class);
    }

}
