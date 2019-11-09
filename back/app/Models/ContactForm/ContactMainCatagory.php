<?php

namespace App\Models\ContactForm;

use Illuminate\Database\Eloquent\Model;

class ContactMainCatagory extends Model
{

    protected $table = 'contact_main_catagories';
    public function recievedEmail ()
    {
        return $this->hasMany(RecievedEmail ::class);
    }
    public function preDefinedEmail()
    {
        return $this->hasMany(PreDefinedEmail::class);
    }
    public function contactSubCategory()
    {
        return $this->hasMany(ContactSubCategory::class);
    }
    public function cMCTranslation()
    {
        return $this->hasMany(CMCTranslation::class);
    }
}
