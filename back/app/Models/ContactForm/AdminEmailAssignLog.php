<?php

namespace App\Models\ContactForm;

use Illuminate\Database\Eloquent\Model;

class AdminEmailAssignLog extends Model
{
    //
    protected $table = 'admin_email_assign_logs';
    public function recievedEmail()
    {
        return $this->belongsTo(RecievedEmail::class);
    }
}
