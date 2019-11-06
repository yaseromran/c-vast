<?php

namespace App\Models\ContactForm;

use Illuminate\Database\Eloquent\Model;

class AdminDoneEmailLog extends Model
{
    //
    protected $table = 'admin_done_email_logs';
    public function recievedEmail()
    {
        return $this->belongsTo(RecievedEmail::class);
    }
}
