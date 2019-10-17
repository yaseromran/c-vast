<?php

namespace App;

use Illuminate\Notifications\Notifiable;
use Illuminate\Foundation\Auth\User as Authenticatable;
use App\Models\Resume;
use Tymon\JWTAuth\Contracts\JWTSubject;

use Laravel\Passport\HasApiTokens;
class User extends Authenticatable // implements    JWTSubject
{
    use Notifiable,HasApiTokens;

    public function resumes(){
        return $this->hasMany(Resume::class);
    }
    const VERIFIED_USER='1';
    const UNVERIFIED_USER='0';


    protected $fillable = [
        'name', 'email', 'password','verified','verification_token'
    ];
    protected $hidden = [
        'provider_name', 'provider_id', 'password', 'remember_token',
    ];
    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */

    public static function generateVerificationCode(){
        return str_random(40);
    }

    /**
     * Get the identifier that will be stored in the subject claim of the JWT.
     *
     * @return mixed
     */
    public function getJWTIdentifier()
    {
        return $this->getKey();
    }

    /**
     * Return a key value array, containing any custom claims to be added to the JWT.
     *
     * @return array
     */
    public function getJWTCustomClaims()
    {
        return [];
    }
}
