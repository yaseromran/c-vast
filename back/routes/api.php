<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request)
{
    return $request->user();
});

//Auth routes
Route::post('login', 'AuthController@login');
Route::post('login_user', 'AuthController@loginUser');
Route::post('register_user', 'AuthController@registerUser');
// Route for admin permissions
Route::prefix('admin')->group(function() {
    Route::post('login', 'AuthController@loginAdmin');
    Route::post('register', 'AuthController@adminRegister');
});

Route::prefix('employeer')->group(function() {
    Route::post('login', 'AuthController@loginEmployeer');
    Route::post('register', 'AuthController@employeerRegister');
});










//Resume
Route::resource('resume', 'ResumeController', ['except' => ['edit', 'create']]);
Route::get('resume/duplicate/{resumeId}', 'ResumeController@duplicate');
Route::get('resumeData/{resumeId}', 'ResumeController@resumeData');

//PersonalInfo
Route::resource('personalInformation', 'PersonalInformation\PersonalInformationController', ['except' => ['edit', 'create',]]);
Route::get('personalInfoData/{resume}', 'PersonalInformation\PersonalInformationController@personalInfoData');
//contactInfo
Route::get('contactInfoData/{resume}', 'ContactInformation\ContactInfoController@contactInfoData');
Route::resource('contactInfo', 'ContactInformation\ContactInfoController', ['except' => ['edit', 'create', 'index']]);

//eduction
Route::resource('education', 'Education\EducationController', ['except' => ['edit', 'create']]);
Route::get('education/{resumeId}/{educationId}', 'Education\EducationController@getSingleEducation');
Route::Post('education/order/{resumeId}', 'Education\EducationController@orderData');
Route::get('educationData/{resume}', 'Education\EducationController@educationData');

//workExperiences
Route::resource('workExperiences', 'WorkExperience\WorkExperienceController', ['except' => ['edit', 'create']]);


Route::Post('workExperiences/order/{resumeId}', 'WorkExperience\WorkExperienceController@orderData');
Route::get('resumes/{resume}/workExperiences', 'WorkExperience\WorkExperienceController@index');
Route::get('workExpData/{resume}', 'WorkExperience\WorkExperienceController@workExperiencesData');


////////////////////////////////////////// yaser route////////////////////////////////////

Route::resource('companyindustry', 'Company\CompanyIndustryController', ['except' => ['edit', 'create']]);
Route::resource('companytype', 'Company\CompanyTypeController', ['except' => ['edit', 'create']]);
Route::resource('companysize', 'Company\CompanySizeController', ['except' => ['edit', 'create']]);
Route::resource('specialty', 'Company\SpecialtyController', ['except' => ['edit', 'create']]);

///////////////////////////////////// company /////////////////////////////////////////////

Route::get('translationLanguages', 'Company\CompanyController@getTranslationLanguages');
Route::get('get_other_company_profile_translationLanguages/{company_id}', 'Company\CompanyController@get_other_company_profile_translationLanguages');
Route::Put('store_main_language/{company_id}', 'Company\CompanyController@store_main_language');
Route::get('companydata/{company_id}', 'Company\CompanyController@companydata');



//////////////////////////////////// company profile/////////////////////////////////////


Route::get('show_company_profile/{company_id}', 'Company\CompanyProfileController@show')->middleware(['auth:api', 'scope:admin,user']);
Route::delete('delete_profile/{company_id}', 'Company\CompanyProfileController@destroy');
Route::Post('upload_company_logo/{company_id}', 'Company\CompanyProfileController@upload_logo');
//Route::Post('store_profile', 'Company\CompanyProfileController@store');
//Route::Put('update_profile/{company_profile_id}', 'Company\CompanyProfileController@update');
Route::resource('company_profile', 'Company\CompanyProfileController', ['except' => ['edit', 'create','index','show','destroy']]);

//////////////////////////// company location /////////////////////////////////////



Route::Put('set_comapnylocatin_as_main/{company_location_id}', 'Company\CompanyLocationController@set_comapnylocatin_as_main' );

Route::get('show_all_company_location/{company_id}', 'Company\CompanyLocationController@index');

Route::get('get_main_name/{company_id}', 'Company\CompanyLocationController@get_main_name');

Route::resource('company_location', 'Company\CompanyLocationController', ['except' => ['edit', 'create','index']]);

Route::Post('signGoogle', 'Auth\LoginController@signWithGoogle');

Route::Post('signfacebook', 'Auth\LoginController@signWithFacebook');

////////////////////////////admins by  yaser ////////////////////////////////////////////

Route::get('show_all_company_4_admin', 'Company\CompanyController@index4Admin')->middleware(['auth:api', 'scope:admin']);

Route::get('show_all_company_data_4_admin', 'Company\CompanyController@getAllCompanyData4Admin')->middleware(['auth:api', 'scope:admin']);

Route::get('show_all_company_verfication_data_4_admin', 'Company\CompanyController@show_all_company_verfication_data_4_admin')->middleware(['auth:api', 'scope:admin']);

Route::Post('save_company_verfication_4_admin/{company_id}', 'Company\CompanyController@save_company_verfication_4_admin')->middleware(['auth:api', 'scope:admin']);

Route::get('show_company_verfication_logs_4_admin/{company_id}', 'Company\CompanyController@show_company_verfication_logs_4_admin')->middleware(['auth:api', 'scope:admin']);

Route::get('show_company_info_4_admin/{company_id}', 'Company\CompanyProfileController@show_company_info_4_admin')->middleware(['auth:api', 'scope:admin']);

////////////////////////////////////////// Contact Form use case///////////////////////////////////

Route::get('get_data_for_send_message', 'ContactForm\ContactFormController@get_data_for_send_message');//->middleware(['auth:api', 'scope:admin']);
Route::Post('save_message', 'ContactForm\ContactFormController@save_message');
Route::get('get_data_for_browse_messages', 'ContactForm\ContactFormController@get_data_for_browse_messages');
Route::get('get_data_for_one_message/{recieved_email_id}', 'ContactForm\ContactFormController@get_data_for_one_message');

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
