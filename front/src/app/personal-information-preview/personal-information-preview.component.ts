import { Component, OnInit, OnDestroy } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { Subscription } from 'rxjs/Subscription';
import { Place } from '../Models/place';

import { SideToFormSignalService } from '../cv-services/side-to-form-signal.service';
import { PersonalInformationService } from '../cv-services/personal-information.service';

import {Subject} from 'rxjs/Subject';
import 'rxjs/add/operator/takeUntil';

@Component({
  selector: 'app-personal-information-preview',
  templateUrl: './personal-information-preview.component.html',
  styleUrls: ['./personal-information-preview.component.css']
})
export class PersonalInformationPreviewComponent implements OnInit, OnDestroy {

  marginLeft: string = '';
//  subscription: Subscription;
  private ngUnsubscribe: Subject<any> = new Subject();

  currentYear = (new Date()).getFullYear();
  birthYear;
  age;

  resume_id: number = 0;
  personal_information_id: number = 0;
  first_name: string = '';
  middle_name: string = '';
  last_name: string = '';
  resume_title: string = '';
  gender: string = '';
  marital_status: string = '';
  date_of_birth: Date = null;
  string_date_of_birth: string = '';
  nationalities = [];
  place_of_birth: Place = null;
  current_location: Place = null;

  constructor(private sideToFormShared: SideToFormSignalService,
              private personalInformationService: PersonalInformationService,
              private route: ActivatedRoute,
              private router: Router) { }

  ngOnInit() {
    this.sideToFormShared.expandFormCss.takeUntil(this.ngUnsubscribe).subscribe(value => {
      if (value) {
        if (value.toString() === 'collapsed') {
          this.marginLeft = '100px';
        }
        if (value.toString() === 'expand') {
          this.marginLeft = '';
        }
      }
    });

    this.route.parent.params.switchMap(
        (res) => {
          console.log(res);
          this.resume_id = res['resumeId'];
          return this.personalInformationService.getPersonalInformation(this.resume_id);
        }
    ).takeUntil(this.ngUnsubscribe)
      .subscribe(
        (result) => {
          let data = result['personal_info']['0'];
          this.personal_information_id = data.id;
          this.first_name = data.first_name;
          this.middle_name = data.middle_name;
          this.last_name = data.last_name;
          this.resume_title = data.resume_title;
          this.gender = data.gender;
          this.marital_status = data.marital_status.marital_status_translation['0'].name;

          this.string_date_of_birth = data.date_of_birth;
          this.date_of_birth = new Date(data.date_of_birth);
          this.birthYear = this.date_of_birth.getFullYear();
          this.age = this.currentYear - this.birthYear;

          for (let nationality of data.nationalities) {
            this.nationalities.push(nationality.nationality_translation[0].name);
          }

          if (data.place_of_birth) {
            this.place_of_birth = new Place();
            this.place_of_birth.city = data.place_of_birth.city;
            this.place_of_birth.country = data.place_of_birth.country;
            this.place_of_birth.latitude = data.place_of_birth.latitude;
            this.place_of_birth.longitude = data.place_of_birth.longitude;
          }

          if (data.current_location) {
            this.current_location = new Place();
            this.current_location.city = data.current_location.city;
            this.current_location.country = data.current_location.country;
            this.current_location.latitude = data.current_location.latitude;
            this.current_location.longitude = data.current_location.longitude;
            this.current_location.postalCode = data.current_location.postalCode;
            this.current_location.streetAddress = data.current_location.streetAddress;
          }
        }
    );
  }

  ngOnDestroy() {
  //  this.subscription.unsubscribe();
    this.ngUnsubscribe.next();
    this.ngUnsubscribe.complete();
  }

  back() {
    this.router.navigate(['resume-wrapper/', this.resume_id, 'personal']);
  }

}
