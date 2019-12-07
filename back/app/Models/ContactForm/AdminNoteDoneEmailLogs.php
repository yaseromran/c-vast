<?php

namespace App\Models\ContactForm;

use App\User;
use Illuminate\Database\Eloquent\Model;

class AdminNoteDoneEmailLogs extends Model
{
    protected $table = 'admin_note_done_email_logs';

    public function recievedEmail()
    {
        return $this->belongsTo(RecievedEmail::class);
    }
    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
