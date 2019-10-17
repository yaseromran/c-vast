<?php

namespace App\Models;

use App\Models\ContactInfo\InternetCommunication;
use Illuminate\Database\Eloquent\Model;

class InternetCommunicationType extends Model
{
    protected $fillable = ['id', 'name'];

    public function internetCommunication()
    {
        return $this->hasMany(InternetCommunication::class);
    }
}
