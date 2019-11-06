<?php

namespace App\Models\ContactForm;

use Illuminate\Database\Eloquent\Model;

class AdminOpenLog extends Model
{
    //
    protected $table = 'admin_open_logs';
    public function recievedEmail()
    {
        return $this->belongsTo(RecievedEmail::class);
    }
}
