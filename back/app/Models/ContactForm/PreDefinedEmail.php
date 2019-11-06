<?php

namespace App\Models\ContactForm;

use Illuminate\Database\Eloquent\Model;

class PreDefinedEmail extends Model
{
    //
    protected $table = 'pre_defined_emails';
    public function contactSubCategory()
    {
        return $this->belongsTo(ContactSubCategory::class);
    }
    public function contactMainCatagory()
    {
        return $this->belongsTo(ContactMainCatagory::class);
    }
    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
