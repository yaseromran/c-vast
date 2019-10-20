<?php

namespace App\Providers;
use App\Models\UserRole\Role;
use Carbon\Carbon;
use Laravel\Passport\Passport;

use Illuminate\Support\Facades\Gate;
use Illuminate\Foundation\Support\Providers\AuthServiceProvider as ServiceProvider;

class AuthServiceProvider extends ServiceProvider
{
    /**
     * The policy mappings for the application.
     *
     * @var array
     */
    protected $policies = [
        'App\Model' => 'App\Policies\ModelPolicy',
    ];

    /**
     * Register any authentication / authorization services.
     *
     * @return void
     */
    public function boot()
    {
        $this->registerPolicies();
        $role=[];
        $result=        Role::all(['name','description']) ;
        foreach($result as $r){

            $role[$r->name]=[$r->description];
        }

        Passport::tokensCan($role);

        Passport::routes(function ($router) {
            $router->forAccessTokens();
            // Uncomment for allowing personal access tokens
            // $router->forPersonalAccessTokens();
            $router->forTransientTokens();
        });

      // Passport::tokensExpireIn(Carbon::now()->addMinutes(10));

       // Passport::refreshTokensExpireIn(Carbon::now()->addDays(10));

        //
    }
}
