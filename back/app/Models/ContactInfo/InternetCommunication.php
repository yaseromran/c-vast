<?php

namespace App\Models\ContactInfo;

use App\Models\InternetCommunicationType;
use Illuminate\Database\Eloquent\Model;

class InternetCommunication extends Model
{
    public function contactInformation(){
        return $this->belongsTo(ContactInformation::class);
    }
    public function internetCommunicationType(){
        return $this->belongsTo(InternetCommunicationType::class);
    }
    protected $fillable=[
        'type',
        'address',
        'contact_information_id',
        'internet_communication_type_id'

    ];
}
