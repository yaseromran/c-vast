<?php

namespace App\Http\Controllers\Auth;
use App\User;
use Facebook\Exceptions\FacebookResponseException;
use Facebook\Exceptions\FacebookSDKException;
use Facebook\Facebook;
use Google_Client;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Carbon\Carbon;
use Google;
use App\Http\Controllers\ApiAuth\AuthController;
use Tymon\JWTAuth\Facades\JWTFactory;
use Tymon\JWTAuth\JWTAuth;
use Tymon\JWTAuth\Manager;
use Mockery;
use stdClass;
use Tymon\JWTAuth\Token;
use Tymon\JWTAuth\Factory;

use Tymon\JWTAuth\Payload;

use Tymon\JWTAuth\Http\Parser\Parser;
use Tymon\JWTAuth\Test\Stubs\UserStub;
use Tymon\JWTAuth\Exceptions\JWTException;
use Tymon\JWTAuth\Contracts\Providers\Auth;
use Tymon\JWTAuth\Exceptions\TokenInvalidException;
class LoginController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Login Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles authenticating users for the application and
    | redirecting them to your home screen. The controller uses a trait
    | to conveniently provide its functionality to your applications.
    |
    */

    use AuthenticatesUsers;

    /**
     * Where to redirect users after login.
     *
     * @var string
     */
    protected $redirectTo = '/home';

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
       // $this->middleware('guest')->except('logout');
    }
    protected $manager;
    protected $auth;
    protected $parser;

    protected $jwtAuth;
    public function  signWithFacebook(Request $request)
    {
        $token=$request->token;
        //return $token;
        $fb = new Facebook([
            'app_id' => "665166586953431",
            'app_secret' => "8bdf3419c78b4cc6f9bb700c44e62936",
            'default_graph_version' => 'v2.10',
        ]);

        try {

            $fbresponse = $fb->get('/me?fields=id,name,email', $token);

              $eventNode = $fbresponse->getGraphEvent()->all();

            $userId = $eventNode['id'];
            $email = $eventNode['email'];
            $name = $eventNode['name'];
           // return $userId ."".$email."".$name ;
            return  $this->singSocialUser(  $request) ;
        } catch (FacebookResponseException $e) {

            return "Handle this error, return a failed request to the app with either 401 or 500";
            //Handle this error, return a failed request to the app with either 401 or 500
        } catch (FacebookSDKException $e) {
            return "Handle this error, return a 500 error – something is wrong with your code".$e;
            //Handle this error, return a 500 error – something is wrong with your code
        }

    }
    public function  signWithGoogle(Request $request){


         $client = new Google_Client([
            'client_id' => '529578226439-mfu3u19a8ci7hpt8dthmi2l062o6vih8.apps.googleusercontent.com'
         ]);



        try{


            $payload = $client->verifyIdToken($request->idToken); // check idToken from google (use vpn.....)

            if ($payload) {

                $userid = $payload['sub'];
                $exp=  $payload['exp'];
                $given_name= $payload['given_name'];
                return $this->singSocialUser(  $request) ;
                   } else {

                return   response()->json(['data' =>'Invalid ID token',], 200);

            }
        }
        catch (Exception $e)
        {
            return   response()->json(['data' =>'Invalid ID token',], 200);
        }


    }
    private function  singSocialUser(Request $request) // yaser
    {
        $existingUser = User::where('email', $request->email)->first();
       if ($existingUser) {
            $authController=new AuthController();
            $token= $authController->login_by_Id($existingUser->id, true);
            return $token;
        } else {
            $newUser                    = new User();
            $newUser->provider_name     = $request->provider;
            $newUser->provider_id       = $request->id;
            $newUser->name              = $request->name ;
            $newUser->email             = $request->email ;
            $newUser->email_verified_at = Carbon::now()->toDateTimeString();
            $newUser->avatar            = $request->image;
            $newUser->verified   =1;
            $newUser->save();
            $authController=new AuthController();
            $token= $authController->login_by_Id($newUser->id, true);
            return $token;
        }
    }
}
