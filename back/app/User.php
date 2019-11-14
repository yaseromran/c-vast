<?php

namespace App;

use App\Models\ContactForm\AdminOpenLog;
use App\Models\ContactForm\PreDefinedEmail;
use App\Models\ContactForm\RecievedEmail;
use App\Models\UserRole\Role;
use App\Models\UserRole\RoleUser;
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


    public function roles()
    {
        return $this->belongsToMany(Role::class)->withTimestamps();
    }
    public function  getRole()
    {
       return $this->roles()->first(['name'])->makeHidden('pivot');


    }
    //one role
    public function hasRole($role)
    {
        if ($this->roles()->where('name', $role)->first()) {
            return true;
        }
        return false;
    }
    //set Role for User
    public function setRole($user_id, $role)
    {
        $user = self::where('id', $user_id)->first();
        $Role = Role::where('name', $role)->first();
        if ($user != null) {
            RoleUser::create([
                'user_id' => $user->id,
                'role_id' => $Role->id
            ]);
        }
    }
    public function recievedEmail ()
    {
        return $this->hasMany(RecievedEmail ::class);
    }
    public function adminEmailAssignLog ()
    {
        return $this->hasMany(AdminEmailAssignLog ::class);
    }
    public function adminOpenLog ()
    {
        return $this->hasMany(AdminOpenLog::class);
    }
    public function preDefinedEmail()
    {
        return $this->hasMany(PreDefinedEmail::class);
    }
}
