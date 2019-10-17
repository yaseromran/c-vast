import { Component, OnInit, OnDestroy, ElementRef, NgZone, ViewChild, Renderer } from '@angular/core';
import {FormArray, FormBuilder, FormGroup, FormControl, Validators, AbstractControl} from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { Observable } from 'rxjs/Observable';
import { Subscription } from 'rxjs/Subscription';
import { Subject } from 'rxjs';
import 'rxjs/add/operator/skip';
import {SelectItem} from 'primeng/api';

import { SideToFormSignalService } from '../cv-services/side-to-form-signal.service';
import { MapToFormService } from '../cv-services/map-to-form.service';
import { PersonalInformationService } from '../cv-services/personal-information.service';
import { NationalitiesInfoListClass } from './nationalities-info-list-class';

import { MapComponent } from '../map/map.component';

import { Place } from '../Models/place';
import { PersonalInformation } from '../Models/personal-information';
import { MaritalStatus } from '../Models/marital-status';
import 'rxjs/add/operator/takeUntil';
import {Nationality} from '../Models/nationality';
declare var $: any;

@Component({
  selector: 'app-personal-information',
  templateUrl: './personal-information.component.html',
  styleUrls: ['./personal-information.component.css'],
  // directives: [ MapComponent ]
})
export class PersonalInformationComponent implements OnInit, OnDestroy {


  personalInformationId: number = null;
  resumeId: number = null;
  private ngUnsubscribe: Subject<any> = new Subject();

  // maritalStatusOpts = [
  //   {'value': '', 'label': ''},
  //   {'value': 'single', 'label': 'Single'},
  //   {'value': 'engaged', 'label': 'Engaged'},
  //   {'value': 'married', 'label': 'Married'},
  //   {'value': 'widowed', 'label': 'Widowed'},
  //   {'value': 'separated', 'label': 'Separated'},
  //   {'value': 'divorced', 'label': 'Divorced'}
  // ];
   maritalStatusOpts: MaritalStatus[];

  // years = [];
  yearOpts = [];
  // months = ['January', 'February', 'March', 'April', 'May', 'June',
  //  'July', 'August', 'September', 'October', 'November', 'December'];
  monthOpts = [
    {'value': '1', 'label': 'months.january'},
    {'value': '2', 'label': 'months.february'},
    {'value': '3', 'label': 'months.march'},
    {'value': '4', 'label': 'months.april'},
    {'value': '5', 'label': 'months.may'},
    {'value': '6', 'label': 'months.june'},
    {'value': '7', 'label': 'months.july'},
    {'value': '8', 'label': 'months.august'},
    {'value': '9', 'label': 'months.september'},
    {'value': '10', 'label': 'months.october'},
    {'value': '11', 'label': 'months.november'},
    {'value': '12', 'label': 'months.december'}
  ];
  // days = [];
  dayOpts = [];
  // of31DaysMonths = ['1', '3', '5', '7', '8', '10', '12'];
  of30DaysMonths = ['4', '6', '9', '11'];
  currentYear = (new Date()).getFullYear();

  nationalityOpts = NationalitiesInfoListClass.nationalities;
  nationalityOpts2: Nationality[];

//  sideToFormSubscription: Subscription;
//  mapToFormSubscription: Subscription;
  marginLeft: string = '';

  personalForm: FormGroup;

  placeOfBirth: Place = new Place();
  birthSub: Subject<any> = new Subject();

  currentLocation: Place = new Place();
  currentSub: Subject<any> = new Subject();

  birthType: string = 'placeOfBirth';
  currentType: string = 'currentLocation';

  @ViewChild('birthSearch') public birthSearchRef: ElementRef;
  @ViewChild('currentSearch') public currentSearchRef: ElementRef;
  @ViewChild('btn') public btnRef: ElementRef;

  constructor(private fb: FormBuilder,
              private sideToFormShared: SideToFormSignalService,
              private mapToFormService: MapToFormService,
              private personalInfoService: PersonalInformationService,
              private route: ActivatedRoute,
              private router: Router) {



    for (let day = 1; day <= 31; day++) {
      // this.days.push(day);
      this.dayOpts.push({'value': day.toString(), 'label': day.toString()});
    }

    for (let year = this.currentYear; year >= 1918; year--) {
      // this.years.push(year);
      this.yearOpts.push({'value': year.toString(), 'label': year});
    }

    this.personalForm = this.fb.group({
      resume_id: [this.resumeId ? this.resumeId : '', Validators.required],
      first_name: ['', [Validators.required,
        Validators.minLength(2),
        Validators.maxLength(40),
        Validators.pattern('[a-zA-Z]+[a-zA-Z0-9._-]*')]],
      middle_name: ['', Validators.pattern('[a-zA-Z]+[a-zA-Z0-9._-]*')],
      last_name: ['', [Validators.required,
        Validators.minLength(2),
        Validators.maxLength(40),
        Validators.pattern('[a-zA-Z]+[a-zA-Z0-9._-]*')]],
      resume_title: [''],
      gender: ['', Validators.required],
      marital_status: [''] ,
      // marital_status: this.fb.group({
      //   name: ['', Validators.required],
      // }),
      marital_status_id: [''],
      nationalities: this.fb.array([
        ['', Validators.required],
      ]),
      date_of_birth: this.fb.group({
        year: ['', Validators.required],
        month: ['', Validators.required],
        day: ['', Validators.required]
      }),
      place_of_birth: this.fb.group({
        fullPlace: [''],
        country: [''],
        city: [''],
        latitude: [''],
        longitude: ['']
      }),
      current_location: this.fb.group({
        fullLocation: [''],
        country: [''],
        city: [''],
        postal_code: [''],
        street_address: [''],
        latitude: [''],
        longitude: ['']
      })
    });
  }

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

    this.initializeFormData();

    this.initializePlaceData();

    this.placeOfBirthControl.controls['fullPlace'].valueChanges.takeUntil(this.ngUnsubscribe).subscribe(
      () => {
        if (this.placeOfBirth.latitude === null && this.placeOfBirth.longitude === null) {
          this.placeOfBirthControl.controls['fullPlace'].setErrors({'incorrect': true});
        } else {
          this.placeOfBirthControl.controls['fullPlace'].setErrors(null);
        }
      }
    );

    this.currentLocationControl.controls['fullLocation'].valueChanges.takeUntil(this.ngUnsubscribe).subscribe(
      () => {
        if (this.currentLocation.latitude === null && this.currentLocation.longitude === null) {
          this.currentLocationControl.controls['fullLocation'].setErrors({'incorrect': true});
        } else {
          this.currentLocationControl.controls['fullLocation'].setErrors(null);
        }
      }
    );

  }

  placeOfBirthKeyUp($event) {
    this.placeOfBirthControl.controls['country'].setValue('');
    this.placeOfBirthControl.controls['city'].setValue('');
    this.placeOfBirthControl.controls['latitude'].setValue('');
    this.placeOfBirthControl.controls['longitude'].setValue('');
    // this.notifyBirthMap({lat: this.placeOfBirthControl.controls['latitude'].value,
    // lng: this.placeOfBirthControl.controls['longitude'].value})
  }

  currentLocationKeyUp($event) {
    this.currentLocationControl.controls['country'].setValue('');
    this.currentLocationControl.controls['city'].setValue('');
    this.currentLocationControl.controls['postal_code'].setValue('');
    this.currentLocationControl.controls['street_address'].setValue('');
    this.currentLocationControl.controls['latitude'].setValue('');
    this.currentLocationControl.controls['longitude'].setValue('');
  }

  notifyBirthMap(val) {

    this.birthSub.next(val);
  }

  notifyCurrentMap(val) {

    this.currentSub.next(val);
  }

  initializePlaceData() {
    this.mapToFormService.personalMapData.skip(1).takeUntil(this.ngUnsubscribe).subscribe(
      (place: Place) => {

        if (place.type === 'placeOfBirth') {
          this.placeOfBirth = place;
        }

        if (place.type === 'currentLocation') {
          this.currentLocation = place;
        }

        this.setPlaceOfBirthControls(this.placeOfBirth);

        this.setCurrentLocationControls(this.currentLocation);
      }
    );
  }

  initializeFormData() {
    this.route.parent.params.switchMap(
      (res) => {
        this.resumeId = res['resumeId'];
        return res['resumeId'];
      }
    ).takeUntil(this.ngUnsubscribe)
      .subscribe(
        (resumeId) => {
          this.personalInfoService.getPersonalInformationData(this.resumeId).takeUntil(this.ngUnsubscribe).subscribe(
            (res) => {
              this.maritalStatusOpts = res['marital_status_translations'] ;
              this.maritalStatusOpts.unshift({'marital_status_id': '', 'name': ''});
              this.nationalityOpts2 = res['nationality_translations'] ;
              this.nationalityOpts2.unshift({'nationality_id': '', 'name': ''});
            });
        });
    this.route.parent.params.switchMap(
        (res) => {
          this.resumeId = res['resumeId'];
          this.personalForm.controls['resume_id'].setValue(this.resumeId);
          return res['resumeId'];
        }
    ).takeUntil(this.ngUnsubscribe)
      .subscribe(
      (resumeId) => {

        this.personalInfoService.getPersonalInformation(this.resumeId).takeUntil(this.ngUnsubscribe).subscribe(
          (data: PersonalInformation) => {
          //  console.log('new data' , data);
          //  console.log('new personal' , data.personal_info[0]);
            if (data.personal_info.length){
              this.personalInformationId = data.personal_info[0].id;
            // }
            //
            // if (data) {
            //  console.log(data);
              let first_name = data.personal_info[0].first_name,
                middle_name = data.personal_info[0].middle_name,
                last_name = data.personal_info[0].last_name,
                resume_title = data.personal_info[0].resume_title,
                gender = data.personal_info[0].gender,
                marital_status_temp = data.personal_info[0].marital_status,
           //     marital_status = {'marital_status_id': marital_status_temp.marital_status_translation[0].marital_status_id, 'name': marital_status_temp.marital_status_translation[0].name},
                marital_status_id = marital_status_temp ? marital_status_temp.marital_status_translation[0].marital_status_id : '',
             //   marital_status_id = data.personal_info[0].marital_status_id,
             //   marital_status_name = marital_status_temp.marital_status_translation[0].name,
                marital_status_name = marital_status_temp ? {'marital_status_id': marital_status_temp.marital_status_translation[0].marital_status_id, 'name': marital_status_temp.marital_status_translation[0].name} : '',
                date_of_birth = new Date(data.personal_info[0].date_of_birth),
                nationalities = data.personal_info[0].nationalities,
                currentLat = data.personal_info[0].current_location.latitude,
                currentLng = data.personal_info[0].current_location.longitude,
                currentCountry = data.personal_info[0].current_location.country,
                currentCity = data.personal_info[0].current_location.city,
                postalCode = data.personal_info[0].current_location.postal_code,
                streetAddress = data.personal_info[0].current_location.street_address,

                birthLat = data.personal_info[0].place_of_birth.latitude,
                birthLng = data.personal_info[0].place_of_birth.longitude,
                birthCountry = data.personal_info[0].place_of_birth.country,
                birthCity = data.personal_info[0].place_of_birth.city;

              this.personalForm.controls['first_name'].setValue(first_name);
              this.personalForm.controls['middle_name'].setValue(middle_name);
              this.personalForm.controls['last_name'].setValue(last_name);
              this.personalForm.controls['resume_title'].setValue(resume_title);
              this.personalForm.controls['gender'].setValue(gender);
            //  this.personalForm.controls['marital_status'].setValue(marital_status);
              this.personalForm.controls['marital_status_id'].setValue(marital_status_id);
           //   this.maritalStatusControl.controls['marital_status_id'].setValue(marital_status_id);
              this.personalForm.controls['marital_status'].setValue(marital_status_name);

              this.dateOfBirthControl.controls['year'].setValue(date_of_birth.getFullYear().toString());
              this.dateOfBirthControl.controls['month'].setValue((date_of_birth.getMonth() + 1).toString());
              this.dateOfBirthControl.controls['day'].setValue(date_of_birth.getDate().toString());
              this.initializeDays(this.dateOfBirthControl.controls['month'].value, this.dateOfBirthControl.controls['year'].value);
              // this.nationalities.reset();
              this.nationalities.controls[0].setValue({'nationality_id': nationalities[0].nationality_translation[0].nationality_id , 'name': nationalities[0].nationality_translation[0].name});
              for(let i = 1; i < nationalities.length; i++) {

                let natControl = new FormControl({'nationality_id': nationalities[i].nationality_translation[0].nationality_id , 'name': nationalities[i].nationality_translation[0].name}, Validators.required);
                // this.nationalities.controls[i] = natControl;
                this.nationalities.push(natControl);
              }

              if (birthLat && birthLng) {
                let birthCoords = {
                  lat: birthLat,
                  lng: birthLng
                };
                this.notifyBirthMap(birthCoords);
                this.placeOfBirthControl.controls['fullPlace'].setValue(`${birthCountry}, ${birthCity}`);
                this.placeOfBirthControl.controls['country'].setValue(birthCountry);
                this.placeOfBirthControl.controls['city'].setValue(birthCity);
              }

              if(currentLat && currentLng) {
                let currentCoords = {
                  lat: currentLat,
                  lng: currentLng
                };
                this.notifyCurrentMap(currentCoords);
                this.currentLocationControl.controls['fullLocation'].setValue(`${currentCountry}, ${currentCity}`);
                this.currentLocationControl.controls['country'].setValue(currentCountry);
                this.currentLocationControl.controls['city'].setValue(currentCity);
                this.currentLocationControl.controls['postal_code'].setValue(postalCode);
                this.currentLocationControl.controls['street_address'].setValue(streetAddress);
              }
            }
          },
          (error) => { console.log(''); }
        );
      }
    );
  }

  setCurrentLocationControls(place: Place) {

    if (place.full == 'Dragging') {
      this.currentLocationControl.controls['fullLocation'].setValue(place.country + ', ' + place.city);
    }
    // if (place.latitude === null && place.longitude === null) {
    //  this.currentLocationControl.controls['fullLocation'].setErrors({'incorrect': true});
    // } else {
    //  this.currentLocationControl.controls['fullLocation'].setErrors(null);
    // }
    this.currentLocationControl.controls['country'].setValue(place.country);
    this.currentLocationControl.controls['city'].setValue(place.city);
    this.currentLocationControl.controls['postal_code'].setValue(place.postalCode);
    this.currentLocationControl.controls['street_address'].setValue(place.streetAddress);
    this.currentLocationControl.controls['latitude'].setValue(place.latitude);
    this.currentLocationControl.controls['longitude'].setValue(place.longitude);
  }

  setPlaceOfBirthControls(place: Place) {

    if (place.full == 'Dragging') {
      this.placeOfBirthControl.controls['fullPlace'].setValue(place.country + ', ' + place.city);
    }
    // if(place.latitude === null && place.longitude === null) {
    //  this.placeOfBirthControl.controls['fullPlace'].setErrors({'incorrect': true});
    // }else {
    //  this.placeOfBirthControl.controls['fullPlace'].setErrors(null);
    // }
    this.placeOfBirthControl.controls['country'].setValue(place.country);
    this.placeOfBirthControl.controls['city'].setValue(place.city);
    this.placeOfBirthControl.controls['latitude'].setValue(place.latitude);
    this.placeOfBirthControl.controls['longitude'].setValue(place.longitude);
  }

  addNationality($event) {
    if ($event.detail == 0) {
      return false;
    }
    $event.preventDefault();

    this.nationalities.insert( 0 , this.fb.control('', Validators.required));
  }

  removeNationality($event, i) {
    $event.preventDefault();

    this.nationalities.removeAt(i);
    this.checkNationalities();
  }

  selectNationality(index, item: AbstractControl) {
    let x  = item.value;
  //  console.log(x == 0);
    if (x === 0 || x === '') {
    //  console.log(x);
      return false;
    }
    this.nationalities.at(index).setValue(this.nationalities.at(index).value);
  //  this.nationalities.at(index).setValue(Number(this.nationalities.at(index).value));
    this.checkNationalities();
    return true;
  }

  checkNationalities() {
    let valid = [];
    let invalid = [];

    for (let index = 0; index < this.nationalities.length; index++) {
      for (let i = 0; i < this.nationalities.length; i++) {
        if (i == index) {
          //continue;
        } else {
          if (this.nationalities.at(i).value.nationality_id === this.nationalities.at(index).value.nationality_id) {
            if (!invalid.includes(i)) invalid.push(i);
            if (!invalid.includes(index)) invalid.push(index);
          }
        }
      }
    }
    for (let i = 0; i < invalid.length; i++) {
      this.nationalities.at(invalid[i]).setErrors({'incorrect': true});
    }

    for (let i = 0; i < this.nationalities.length; i++) {
      if (!invalid.includes(i)) {

        this.nationalities.at(i).setErrors(null);
      }
    }
  }

  formatDays(numOfDays: number) {
    for (let day = 1; day <= numOfDays; day++) {
      // this.days.push(day);
      this.dayOpts.push({'value': day.toString(), 'label': day.toString()});
    }
  }

  initializeDays(m: string, y: string) {
    if (this.of30DaysMonths.includes(m)) {
      // this.days = [];
      this.dayOpts = [];
      this.formatDays(30);
    } else if (m === '2'){
      if (y) {
        let year = Number(y);
        if (year % 4 === 0) {
          // this.days = [];
          this.dayOpts = [];
          this.formatDays(29);
        } else {
          // this.days = [];
          this.dayOpts = [];
          this.formatDays(28);
        }
      } else {
        // this.days = [];
        this.dayOpts = [];
        this.formatDays(31);
      }
    } else {
      // this.days = [];
      this.dayOpts = [];
      this.formatDays(31);
    }
  }

  changeMaritalStatus() {
    this.personalForm.controls['marital_status_id'].setValue(this.personalForm.controls['marital_status'].value.marital_status_id);
 //   this.personalForm.controls['marital_status_id'].setValue(this.maritalStatusControl.controls['name'].value.marital_status_id);
  }

  onChangeMonth(selectedMonth, selectedYear, selectedDay) {
    this.dateOfBirthControl.controls['day'].reset();
    this.initializeDays(selectedMonth, selectedYear);
  }

  onChangeYear(selectedYear, selectedMonth, selectedDay) {
    this.dateOfBirthControl.controls['day'].reset();
    if (selectedMonth) {
      if (selectedMonth === '2') {
        let year = Number(selectedYear);
        if (year % 4 === 0) {
          // this.days = [];
          this.dayOpts = [];
          this.formatDays(29);
        } else {
          // this.days = [];
          this.dayOpts = [];
          this.formatDays(28);
        }
      }
    }
  }

  get nationalities() {
    return (this.personalForm.controls['nationalities'] as FormArray);
  }

  get placeOfBirthControl() {
    return (this.personalForm.controls['place_of_birth'] as FormGroup);
  }

  get currentLocationControl() {
    return (this.personalForm.controls['current_location'] as FormGroup);
  }

  get dateOfBirthControl() {
    return (this.personalForm.controls['date_of_birth'] as FormGroup);
  }

  get maritalStatusControl() {
    return (this.personalForm.controls['marital_status'] as FormGroup);
  }

  ///////////////////////////////////////////////////////////////////////////////////////////////////////////
  ///////////////////////////////////////// Start Validation Rules //////////////////////////////////////////
  ///////////////////////////////////////////////////////////////////////////////////////////////////////////

  isDDValid(control: AbstractControl){
    if(control.value !== '' && control.value !== null){
      if(control.value.name !== '' && control.value.name !== null){
        return true;
      }
    }
    return false;
  }

  isInvalidNationalities() {
    return this.nationalities.touched && !this.nationalities.valid;
  }

  isInvalid(controlName: string, index?: number) {
    if (controlName === 'nationalities') {
      return !this.nationalities.at(index).valid;
    }

    if (controlName === 'fullPlace') {
      return (!this.placeOfBirthControl.controls['country'].valid || !this.placeOfBirthControl.controls['city'].valid);
    }

    if (controlName === 'fullLocation') {
      return (!this.currentLocationControl.controls['country'].valid || !this.currentLocationControl.controls['city'].valid
        || !this.currentLocationControl.controls['postal_code'].valid || !this.currentLocationControl.controls['street_address'].valid);
    }

    if (['year', 'month', 'day'].includes(controlName)) {
      return !this.dateOfBirthControl.controls[controlName].valid;
    }

    return !this.personalForm.controls[controlName].valid;
  }

  //////////////////////////////////////////////////////////////////////////////////////////////////////////
  //////////////////////////////////////// End Validation Rules ////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////////////////////////////////////////////

  submit() {
    let sendData = this.personalForm.value;
    for ( let i = 0 ; i < sendData.nationalities.length; i++ ) {
      if (sendData.nationalities[i].nationality_id) {
        sendData.nationalities[i] = sendData.nationalities[i].nationality_id;
      }
    }
    if (!this.personalForm.valid) {
       // scroll to error
    }
    if (this.personalForm.valid) {
      if (this.personalInformationId) {
        this.personalInfoService.editPersonalInformation(sendData, this.personalInformationId).toPromise().then(
            () => this.router.navigate(['resume-wrapper/', this.resumeId, 'personal-preview'])
        );
      } else {
        this.personalInfoService.addPersonalInformation(sendData).toPromise().then(
            () => this.router.navigate(['resume-wrapper/', this.resumeId, 'personal-preview'])
        );
      }
    }
  }

  ngOnDestroy() {
 //   this.sideToFormSubscription.unsubscribe();
 //   this.mapToFormSubscription.unsubscribe();
    this.ngUnsubscribe.next();
    this.ngUnsubscribe.complete();
  }


  getValueToDD(item: AbstractControl) {
    let x  = item.value;

    if (x === '00' || x === '') {
      return false;
    }
    return true;
  }

}

