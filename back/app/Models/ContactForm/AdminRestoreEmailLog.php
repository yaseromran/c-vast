<?php

namespace App\Models\ContactForm;

use Illuminate\Database\Eloquent\Model;

class AdminRestoreEmailLog extends Model
{
    //
    protected $table = 'admin_restore_email_logs';
    public function recievedEmail()
    {
        return $this->belongsTo(RecievedEmail::class);
    }

}
