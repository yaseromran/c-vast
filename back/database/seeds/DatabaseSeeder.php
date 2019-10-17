<?php

use Illuminate\Database\Seeder;

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
use Illuminate\Support\Facades\DB;

class DatabaseSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::statement('SET FOREIGN_KEY_CHECKS=0');
        User::truncate();
        Resume::truncate();
        Objective::truncate();
        Summary::truncate();
        ContactInformation::truncate();
        Email::truncate();
        ContactNumber::truncate();
        InternetCommunication::truncate();
        PersonalLink::truncate();
        // Nationality::truncate();
        PersonalInformation::truncate();
        PlaceOfBirth::truncate();
        CurrentLocation::truncate();
        DB::table('nationality_personal_information')->truncate();



        factory(User::class, 10)->create();
        // factory(Nationality::class, 10)->create();
        factory(Resume::class, 10)->create()->each(function ($r) {

            $r->objective()->save(factory(Objective::class)->make());
            $r->summary()->save(factory(Summary::class)->make());


            $r->contactInformation()->save(factory(ContactInformation::class)->make());
            $r->contactInformation()->each(function ($c) {
                $c->emails()->save(factory(Email::class)->make());
                $c->contactNumbers()->save(factory(ContactNumber::class)->make());
                $c->internetCommunications()->save(factory(InternetCommunication::class)->make());
                $c->personalLinks()->save(factory(PersonalLink::class)->make());
            });


            $r->personalInformation()->save(factory(PersonalInformation::class)->make());
            $r->personalInformation()->each(function ($p) {
                $p->placeOfBirth()->save(factory(PlaceOfBirth::class)->make());
                $p->currentLocation()->save(factory(CurrentLocation::class)->make());
                $nationalities = Nationality::all()->random(mt_rand(1, 2))->pluck('id');
                $p->nationalities()->attach($nationalities);
            });

            $r->achievements()
                ->save(factory('App\Models\Achievements\Achievements')->make());

        });

        

    }
}
