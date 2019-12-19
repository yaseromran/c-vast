<?php

namespace App\Models\ContactForm;

use App\Models\TranslatedLanguages\TranslatedLanguages;
use App\User;
use Illuminate\Database\Eloquent\Model;

class RecievedEmail extends Model
{
    protected $table = 'recieved_emails';
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
    public function last_admin_name()
    {
        return $this->belongsTo(User::class,'last_admin_action_id');
    }
    public function adminComment()
    {
        return $this->hasMany(AdminComment::class);
    }
    public function adminDoneEmailLog()
    {
        return $this->hasMany(AdminDoneEmailLog::class);
    }
    public function adminEmailAssignLog()
    {
        return $this->hasMany(AdminEmailAssignLog::class);
    }
    public function adminOpenLog()
    {
        return $this->hasMany(AdminOpenLog::class);
    }
    public function adminRepliedEmail()
    {
        return $this->hasMany(AdminRepliedEmail::class);
    }
    public function adminRestoreEmailLog()
    {
        return $this->hasMany(AdminRestoreEmailLog::class);
    }
    public function translatedLanguages()
    {
        return $this->belongsTo(TranslatedLanguages::class);
    }
}
