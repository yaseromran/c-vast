<?php

namespace App\Http\Controllers;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use GuzzleHttp\Client;
use App\User;
 use Infrastructure\Auth\Exceptions\InvalidCredentialsException;
use Laravel\Passport\Passport;
use Validator;
class AuthController extends Controller
{
    /**
     * login API
     *
     * @return \Illuminate\Http\Response
     */
    public function loginUser(Request $request)
    {

        $input = $request->all();
        $validator = Validator::make($input, [
            'email' => 'required|email',
            'password' => 'required',
        ]);
        if ($validator->fails()) {

            return response()->json($validator->errors(), 417);
        }
        $email = $request->get('email');
        $password = $request->get('password');
        $credentials = $request->only(['email', 'password']);
        $user = User::Where('email', $email)->first();
        //  return $user->password.' = '.  Hash::make($password);

        if (Hash::check( $password, $user->password)) // Auth::attempt(['email' => request('email'), 'password' => request('password')]
        {
            Passport::tokensExpireIn(Carbon::now()->addDays(30));
            Passport::refreshTokensExpireIn(Carbon::now()->addDays(60));
            /* $client = new \GuzzleHttp\Client();
              // $http = new GuzzleHttp\Client;

               $response = $client->post('http://127.0.0.1:8000/oauth/token', [
                   'form_params' => [
                       'grant_type' => 'refresh_token',
                       'refresh_token' => '',
                       'client_id' => '8',
                       'client_secret' => 'xjiOZx4WVjI378nTklgk5vSMVlW2BEod5Jwf8fPP',
                       'scope' => '',
                   ],
               ]);

               return json_decode((string) $response->getBody(), true);*/
            //   $user = Auth::user();
            if($user->getRole()->name!='user')
            {
                return response()->json(['error' => 'Unauthorized'], 401);
            }
            $objToken = $user->createToken('MyApp',[$user->getRole()->name]);
            $strToken = $objToken->accessToken;

            $expiration = $objToken->token->expires_at->diffInSeconds(Carbon::now());

            return response()->json(["token_type" => "Bearer", "expires_in" => $expiration, "access_token" => $strToken],200);


            //  $success['token'] = $user->createToken('MyApp',['employeer'])->accessToken; // user or employeer or admin (from db )
            // return response()->json(['success' => $success], 200);
        }
        else
        {
            return response()->json(['error' => 'Unauthorized'], 401);
        }
    }
    public function login(Request $request)
    {

        $input = $request->all();
        $validator = Validator::make($input, [
            'email' => 'required|email',
            'password' => 'required',
        ]);
        if ($validator->fails()) {

            return response()->json($validator->errors(), 417);
        }
        $email = $request->get('email');
        $password = $request->get('password');
        $credentials = $request->only(['email', 'password']);
        $user = User::Where('email', $email)->first();
       //  return $user->password.' = '.  Hash::make($password);

        if (Hash::check( $password, $user->password)) // Auth::attempt(['email' => request('email'), 'password' => request('password')]
        {
            Passport::tokensExpireIn(Carbon::now()->addDays(30));
            Passport::refreshTokensExpireIn(Carbon::now()->addDays(60));
         /* $client = new \GuzzleHttp\Client();
           // $http = new GuzzleHttp\Client;

            $response = $client->post('http://127.0.0.1:8000/oauth/token', [
                'form_params' => [
                    'grant_type' => 'refresh_token',
                    'refresh_token' => '',
                    'client_id' => '8',
                    'client_secret' => 'xjiOZx4WVjI378nTklgk5vSMVlW2BEod5Jwf8fPP',
                    'scope' => '',
                ],
            ]);

            return json_decode((string) $response->getBody(), true);*/
         //   $user = Auth::user();

            $objToken = $user->createToken('MyApp',[$user->getRole()->name]);
            $strToken = $objToken->accessToken;

            $expiration = $objToken->token->expires_at->diffInSeconds(Carbon::now());

            return response()->json(["token_type" => "Bearer", "expires_in" => $expiration, "access_token" => $strToken],200);


          //  $success['token'] = $user->createToken('MyApp',['employeer'])->accessToken; // user or employeer or admin (from db )
           // return response()->json(['success' => $success], 200);
        }
        else
        {
            return response()->json(['error' => 'Unauthorized'], 401);
        }
    }
    public function loginEmployeer(Request $request)
    {

        $input = $request->all();
        $validator = Validator::make($input, [
            'email' => 'required|email',
            'password' => 'required',
        ]);
        if ($validator->fails()) {

            return response()->json($validator->errors(), 417);
        }
        $email = $request->get('email');
        $password = $request->get('password');
        $credentials = $request->only(['email', 'password']);
        $user = User::Where('email', $email)->first();
        //  return $user->password.' = '.  Hash::make($password);

        if (Hash::check( $password, $user->password)) // Auth::attempt(['email' => request('email'), 'password' => request('password')]
        {
            Passport::tokensExpireIn(Carbon::now()->addDays(30));
            Passport::refreshTokensExpireIn(Carbon::now()->addDays(60));
            /* $client = new \GuzzleHttp\Client();
              // $http = new GuzzleHttp\Client;

               $response = $client->post('http://127.0.0.1:8000/oauth/token', [
                   'form_params' => [
                       'grant_type' => 'refresh_token',
                       'refresh_token' => '',
                       'client_id' => '8',
                       'client_secret' => 'xjiOZx4WVjI378nTklgk5vSMVlW2BEod5Jwf8fPP',
                       'scope' => '',
                   ],
               ]);

               return json_decode((string) $response->getBody(), true);*/
            //   $user = Auth::user();
            if($user->getRole()->name!='employeer')
            {
                return response()->json(['error' => 'Unauthorized'], 401);
            }
            $objToken = $user->createToken('MyApp',[$user->getRole()->name]);
            $strToken = $objToken->accessToken;

            $expiration = $objToken->token->expires_at->diffInSeconds(Carbon::now());

            return response()->json(["token_type" => "Bearer", "expires_in" => $expiration, "access_token" => $strToken],200);


            //  $success['token'] = $user->createToken('MyApp',['employeer'])->accessToken; // user or employeer or admin (from db )
            // return response()->json(['success' => $success], 200);
        }
        else
        {
            return response()->json(['error' => 'Unauthorized'], 401);
        }
    }
    public function loginAdmin(Request $request)
    {

        $input = $request->all();
        $validator = Validator::make($input, [
            'email' => 'required|email',
            'password' => 'required',
        ]);
        if ($validator->fails()) {

            return response()->json($validator->errors(), 417);
        }
        $email = $request->get('email');
        $password = $request->get('password');
        $credentials = $request->only(['email', 'password']);
        $user = User::Where('email', $email)->first();
        //  return $user->password.' = '.  Hash::make($password);

        if (Hash::check( $password, $user->password)) // Auth::attempt(['email' => request('email'), 'password' => request('password')]
        {
            Passport::tokensExpireIn(Carbon::now()->addDays(30));
            Passport::refreshTokensExpireIn(Carbon::now()->addDays(60));
            /* $client = new \GuzzleHttp\Client();
              // $http = new GuzzleHttp\Client;

               $response = $client->post('http://127.0.0.1:8000/oauth/token', [
                   'form_params' => [
                       'grant_type' => 'refresh_token',
                       'refresh_token' => '',
                       'client_id' => '8',
                       'client_secret' => 'xjiOZx4WVjI378nTklgk5vSMVlW2BEod5Jwf8fPP',
                       'scope' => '',
                   ],
               ]);

               return json_decode((string) $response->getBody(), true);*/
            //   $user = Auth::user();
            if($user->getRole()->name!='admin')
            {
                return response()->json(['error' => 'Unauthorized'], 401);
            }
            $objToken = $user->createToken('MyApp',[$user->getRole()->name]);
            $strToken = $objToken->accessToken;

            $expiration = $objToken->token->expires_at->diffInSeconds(Carbon::now());

            return response()->json(["token_type" => "Bearer", "expires_in" => $expiration, "access_token" => $strToken],200);


            //  $success['token'] = $user->createToken('MyApp',['employeer'])->accessToken; // user or employeer or admin (from db )
            // return response()->json(['success' => $success], 200);
        }
        else
        {
            return response()->json(['error' => 'Unauthorized'], 401);
        }
    }
    public function attemptLogin($email, $password)
    {

        $user = User::Where([['email', $email],['password',   Hash::make($password)]])->first();

        if (!is_null($user)) {
            return true;
        }
        return false;
     }
    /**
     * register API
     *
     * @return \Illuminate\Http\Response
     */


    public function registerUser(Request $request)
    {
        $input = $request->all();
        $validator = Validator::make($input, [
            'name' => 'required',
            'email' => 'required|email',
            'password' => 'required',
            'c_password' => 'required|same:password',
        ]);
        if ($validator->fails()) {

            return response()->json($validator->errors(), 417);
        }
        $user = User::create([
            'name' => $request->name,
            'email' => $request->email,
            'password' => Hash::make($request->password),
        ]);
        $success['name'] = $user->name;
        $objToken =$user->createToken('MyApp',['user']);
        $success['token'] = $objToken->accessToken;
        $user->setRole($user->id, 'user');
        return response()->json(['success' => $success], 200);
    }
    /**
     * admin login API
     * @return \Illuminate\Http\Response
     */


    /**
     * admin register API
     * @return \Illuminate\Http\Response
     */
    public function adminRegister(Request $request)
    {

        $validator = Validator::make($request->all(), [
            'name' => 'required',
            'email' => 'required|email',
            'password' => 'required',
            'c_password' => 'required|same:password',
        ]);
        if ($validator->fails()) {

            return response()->json($validator->errors(), 417);
        }
        $user = User::Where('email', $request->email)->first();

        if($user!=null){   return response()->json(['error' => 'emial already exist'], 401);}
        $user = User::create([
            'name' => $request->name,
            'email' => $request->email,
            'password' => Hash::make($request->password),
        ]);

        $success['name'] = $user->name;

        $success['token'] = $user->createToken('MyApp', ['*'])->accessToken;
        $user->setRole($user->id, 'admin');

        return response()->json(['success' => $success], 200);
    }


    /**
     * admin register API
     * @return \Illuminate\Http\Response
     */
    public function employeerRegister(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required',
            'email' => 'required|email',
            'password' => 'required',
            'c_password' => 'required|same:password',
        ]);
        if ($validator->fails()) {

            return response()->json($validator->errors(), 417);
        }
        $user = User::create([
            'name' => $request->name,
            'email' => $request->email,
            'password' => Hash::make($request->password),
        ]);
        $success['name'] = $user->name;
        $success['token'] = $user->createToken('MyApp', ['employeer'])->accessToken;
        $user->setRole($user->id, 'employeer');
        return response()->json(['success' => $success], 200);
    }
}
