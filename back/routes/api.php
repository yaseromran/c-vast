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
Route::get('get_data_for_browse_messages', 'ContactForm\ContactFormController@get_data_for_browse_messages')->middleware(['auth:api', 'scope:admin']);

Route::delete('delete_recieved_message/{recieved_email_id}', 'ContactForm\ContactFormController@delete_recieved_message')->middleware(['auth:api', 'scope:admin']);

Route::get('get_data_for_one_message/{recieved_email_id}', 'ContactForm\ContactFormController@get_data_for_one_message')->middleware(['auth:api', 'scope:admin']);
Route::Post('save_replay_message', 'ContactForm\ContactFormController@save_replay_message')->middleware(['auth:api', 'scope:admin']);
Route::get('get_data_for_assign_view', 'ContactForm\ContactFormController@get_data_for_assign_view')->middleware(['auth:api', 'scope:admin']);
Route::Post('assign_to', 'ContactForm\ContactFormController@save_assign')->middleware(['auth:api', 'scope:admin']);

Route::get('get_data_for_comment_view', 'ContactForm\ContactFormController@get_data_for_comment_view')->middleware(['auth:api', 'scope:admin']);
Route::Post('save_comment', 'ContactForm\ContactFormController@save_comment')->middleware(['auth:api', 'scope:admin']);

Route::get('get_data_for_add_new_template_message_view', 'ContactForm\ContactFormController@get_data_for_add_new_template_message_view')->middleware(['auth:api', 'scope:admin']);
Route::Post('save_template_message', 'ContactForm\ContactFormController@save_template_message')->middleware(['auth:api', 'scope:admin']);

Route::get('show_all_templates', 'ContactForm\ContactFormController@show_all_templates')->middleware(['auth:api', 'scope:admin']);
Route::delete('delete_template/{template_id}', 'ContactForm\ContactFormController@delete_template')->middleware(['auth:api', 'scope:admin']);


Route::get('get_data_for_update_template_message_view/{template_id}', 'ContactForm\ContactFormController@get_data_for_update_template_message_view')->middleware(['auth:api', 'scope:admin']);
 Route::get('get_all_deleted_message_in_archive', 'ContactForm\ContactFormController@get_all_deleted_message_in_archive')->middleware(['auth:api', 'scope:admin']);
 Route::put('restore_deleted_message_from_archive/{recieved_email_id}', 'ContactForm\ContactFormController@restore_deleted_message_from_archive')->middleware(['auth:api', 'scope:admin']);
 Route::delete('permanent_delete_for_deleted_message_from_archive/{recieved_email_id}', 'ContactForm\ContactFormController@permanent_delete_for_deleted_message_from_archive')->middleware(['auth:api', 'scope:admin']);

 Route::get('recieved_email_activity_log/{recieved_email_id}', 'ContactForm\ContactFormController@recieved_email_activity_log')->middleware(['auth:api', 'scope:admin']);

Route::Post('set_message_as_open/{recieved_email_id}', 'ContactForm\ContactFormController@set_message_as_open')->middleware(['auth:api', 'scope:admin']);
Route::Post('set_message_as_done/{recieved_email_id}', 'ContactForm\ContactFormController@set_message_as_done')->middleware(['auth:api', 'scope:admin']);
Route::Post('set_message_as_not_done/{recieved_email_id}', 'ContactForm\ContactFormController@set_message_as_not_done')->middleware(['auth:api', 'scope:admin']);

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
