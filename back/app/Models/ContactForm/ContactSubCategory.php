<?php

namespace App\Models\ContactForm;

use Illuminate\Database\Eloquent\Model;

class ContactSubCategory extends Model
{
    //
    protected $table = 'contact_sub_categories';
    public function recievedEmail ()
    {
        return $this->hasMany(RecievedEmail ::class);
    }
    public function preDefinedEmail()
    {
        return $this->hasMany(PreDefinedEmail::class);
    }
    public function contactMainCatagory()
    {
        return $this->belongsTo(ContactMainCatagory::class);
    }
    public function cSCTranslation()
    {
        return $this->hasMany(CSCTranslation::class);
    }
}
