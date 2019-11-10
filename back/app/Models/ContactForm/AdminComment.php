<?php

namespace App\Models\ContactForm;

use App\User;
use Illuminate\Database\Eloquent\Model;

class AdminComment extends Model
{
    //
    protected $table = 'admin_comments';
    public function recievedEmail()
    {
        return $this->belongsTo(RecievedEmail::class);
    }
    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
