<?php

namespace App;

use App\Models\Company\Company;
use App\Models\Company\CompanyProfile;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Tymon\JWTAuth\Contracts\JWTSubject;
class Admin extends Authenticatable implements JWTSubject
{
    use Notifiable;

    const VERIFIED_ADMIN = '1';
    const UNVERIFIED_ADMIN = '0';


    protected $fillable = [
        'name', 'email', 'verified', 'verification_token', 'password',
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

    public static function generateVerificationCode()
    {
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

    // public function setPasswordAttribute($value)
    // {
    //     $this->attributes['password'] = bcrypt($value);
    // }

    public function company()
    {
        return $this->hasMany(Company::class);
    }
    public function adminsLog()
    {
        return $this->hasOne(CompanyAdminsLog::class);
    }
}
