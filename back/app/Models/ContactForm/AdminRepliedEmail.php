<?php

namespace App\Models\ContactForm;

use Illuminate\Database\Eloquent\Model;

class AdminRepliedEmail extends Model
{
    //
    protected $table = 'admin_replied_emails';
    public function recievedEmail()
    {
        return $this->belongsTo(RecievedEmail::class);
    }
}
