<?php

use App\Models\Achievements\Achievements ; 
use App\Models\ContactInfo\ContactInformation;
use App\Models\ContactInfo\ContactNumber;
use App\Models\ContactInfo\Email;
use App\Models\ContactInfo\InternetCommunication;
use App\Models\ContactInfo\PersonalLink;
use App\Models\ObjectiveSec\Objective;
use App\Models\PersonalInformation\CurrentLocation;
use App\Models\PersonalInformation\Nationality;
use App\Models\PersonalInformation\PersonalInformation;
use App\Models\PersonalInformation\PlaceOfBirth;
use App\Models\Resume;
use App\Models\SummarySec\Summary;
use App\User;
use Faker\Generator as Faker;


$factory->define(User::class, function (Faker $faker) {
    return [
        'name' => $faker->name,
        'email' => $faker->unique()->safeEmail,
        'password' => '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', // secret
        'remember_token' => str_random(10),
        'verified' => $verified = $faker->randomElement([User::VERIFIED_USER, User::UNVERIFIED_USER]),
        'verification_token' => $verified == User::VERIFIED_USER ? null : str_random(40)
    ];
});
$factory->define(Resume::class, function (Faker $faker) {
    return [
        'user_id' => User::all()->random()->id
    ];
});
$factory->define(Objective::class, function (Faker $faker) {
    return [
        'description' => $faker->paragraph(1),
    ];
});
$factory->define(Summary::class, function (Faker $faker) {

    return [
        'description' => $faker->paragraph(1),
    ];
});
$factory->define(ContactInformation::class, function (Faker $faker) {

    return [
    ];
});
$factory->define(Email::class, function (Faker $faker) {
    return [
        'email_address' => $faker->unique()->safeEmail,
    ];
});
$factory->define(ContactNumber::class, function (Faker $faker) {
    return [
        'phone_type' => $faker->randomElement(['work', 'personal', 'home', 'mobile']),
        'country_code' => $faker->countryCode,
        'phone_number' => $faker->phoneNumber,
    ];
});
$factory->define(InternetCommunication::class, function (Faker $faker) {
    return [
        'type' => $faker->randomElement(['skype', 'viber', 'whatsApp', 'telegram', 'google hang out', 'Line', 'just talk', 'Imo', 'AIM', 'ICQ']),
        'address' => $faker->name(),
    ];
});

$factory->define(PersonalLink::class, function (Faker $faker) {
    return [
        'type' => $faker->randomElement(['facebook', 'twitter', 'telegram', 'MySite']),
        'url' => $faker->url,
    ];
});
$factory->define(PersonalInformation::class, function (Faker $faker) {
    return [
        'first_name' => $faker->name(),
        'middle_name' => $faker->name(),
        'last_name' => $faker->name(),
        'profile_picture' => '1.jpg',
        'resume_title' => $faker->word,
        'gender' => $faker->randomElement([PersonalInformation::MALE, PersonalInformation::FEMALE]),
        'marital_status' => $faker->randomElement(['married', 'Single']),
        'date_of_birth' => $faker->date(),

    ];
});
$factory->define(PlaceOfBirth::class, function (Faker $faker) {
    return [
        'country' => $faker->country,
        'city' => $faker->city,
        'latitude' => $faker->latitude,
        'longitude' => $faker->longitude,
    ];
});
$factory->define(CurrentLocation::class, function (Faker $faker) {
    return [
        'country' => $faker->country,
        'city' => $faker->city,
        'postal_code' => $faker->postcode,
        'street_address' => $faker->address,
        'latitude' => $faker->latitude,
        'longitude' => $faker->longitude,
    ];
});
$factory->define(Nationality::class, function (Faker $faker) {
    return [
        'name' => $faker->countryISOAlpha3,
    ];
});


$factory->define(Achievements::class, function (Faker $faker) {
    return [
        'date' => $faker->dateTime($max = 'now'),
        'description' => $faker->paragraph,
        'order' => 1,
        'resume_id' => Resume::all()->random()->id 
    ];
});


