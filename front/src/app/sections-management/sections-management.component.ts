import {Component, EventEmitter, Input, OnDestroy, OnInit, Output} from '@angular/core';
import {Subject} from 'rxjs/Subject';
import {FormBuilder, FormControl, FormGroup} from '@angular/forms';
import {SideToFormSignalService} from '../cv-services/side-to-form-signal.service';
import {ActivatedRoute, Router} from '@angular/router';
import {SectionsManagementService} from '../cv-services/sections-management.service';
declare var $: any;

@Component({
  selector: 'app-sections-management',
  templateUrl: './sections-management.component.html',
  styleUrls: ['./sections-management.component.css']
})
export class SectionsManagementComponent implements OnInit, OnDestroy {
  marginLeft = '';
  private ngUnsubscribe: Subject<any> = new Subject();
  resumeIdTemp: number = null;
  sectionsManagementForm: FormGroup;
  @Input('resumeId') resumeId: number;
  @Input('cvSections') cvSections: any;
  @Output() closeModalPopup = new EventEmitter();
  @Output() cancelModalPopup = new EventEmitter();
  // cvSections;
  unSelected;
  selected;
  addForm: FormGroup;
  removeForm: FormGroup;
  cvSectionTemp = [];
  cvSections2 = [
    {name: 'sidebar.personalInformation', valid: 1, visible: 'personal_info_visible', fa: 'user', disabled: 'true'},
    {name: 'sidebar.contactInformation', valid: 1, visible: 'contact_info_visible', fa: 'envelope', disabled: 'true'},
    {name: 'sidebar.languages', valid: 1, visible: 'languages_visible', fa: 'language', disabled: 'true'},
    {name: 'sidebar.education', valid: 1, visible: 'education_visible', fa: 'graduation-cap', disabled: 'true'},
    {name: 'sidebar.workExperience', valid: 1, visible: 'work_exp_visible', fa: 'briefcase'},
    {name: 'sidebar.skills', valid: 1, visible: 'skill_visible', fa: 'pencil'},
    {name: 'sidebar.summary', valid: 0, visible: 'summary_visible', fa: 'sticky-note-o'},
    {name: 'sidebar.objective', valid: 0, visible: 'objective_visible', fa: 'sticky-note-o'},
    {name: 'sidebar.drivingLicence', valid: 0, visible: 'driving_visible', fa: 'car'},
    {name: 'sidebar.achievements', valid: 0, visible: 'achievement_visible', fa: 'star-half-o'},
    {name: 'sidebar.certification', valid: 0, visible: 'certification_visible', fa: 'certificate'},
    {name: 'sidebar.publications', valid: 0, visible: 'publication_visible', fa: 'copy'},
    {name: 'sidebar.projects', valid: 0, visible: 'project_visible', fa: 'copy'},
    {name: 'sidebar.portfolios', valid: 0, visible: 'portfolio_visible', fa: 'user'},
    {name: 'sidebar.training', valid: 0, visible: 'training_visible', fa: 'certificate'},
    {name: 'sidebar.membership', valid: 0, visible: 'membership_visible', fa: 'flag'},
    {name: 'sidebar.volunteers', valid: 0, visible: 'volunteer_visible', fa: 'flag'},
    {name: 'sidebar.conferencesWorkshopSeminar', valid: 0, visible: 'conference_visible', fa: 'star-half-o'},
    {name: 'sidebar.hobbiesInterests', valid: 0, visible: 'hobbies_interest_visible', fa: 'bicycle'},
    {name: 'sidebar.references', valid: 0, visible: 'reference_visible', fa: 'envelope'},
  ]

  constructor(private sideToFormShared: SideToFormSignalService,
              private fb: FormBuilder,
              private router: Router,
              private route: ActivatedRoute,
              private sectionsManagementService: SectionsManagementService) {
    this.sectionsManagementForm = this.fb.group({
      unSelected: [''],
      selected: [''],
    });
    this.addForm = this.fb.group({
      resume_id: [''],
    });
    this.removeForm = this.fb.group({
      resume_id: [''],
    });

  }

  ngOnInit() {
    this.sideToFormShared.expandFormCss.takeUntil(this.ngUnsubscribe).subscribe(value => {
      if (value === 'collapsed') {
        this.marginLeft = '100px';
      }
      if (value === 'expand') {
        this.marginLeft = '';
      }
    });
    for (let section of this.cvSections2) {

      if (section.visible == 'summary_visible') {
        section.valid = this.cvSections.summary_visible;
      }

      if (section.visible == 'objective_visible') {
        section.valid = this.cvSections.objective_visible;
      }

      if (section.visible == 'driving_visible') {
        section.valid = this.cvSections.driving_visible;
      }

      if (section.visible == 'achievement_visible') {
        section.valid = this.cvSections.achievement_visible;
      }

      if (section.visible == 'certification_visible') {
        section.valid = this.cvSections.certification_visible;
      }

      if (section.visible == 'publication_visible') {
        section.valid = this.cvSections.publication_visible;
      }

      if (section.visible == 'project_visible') {
        section.valid = this.cvSections.project_visible;
      }

      if (section.visible == 'portfolio_visible') {
        section.valid = this.cvSections.portfolio_visible;
      }

      if (section.visible == 'training_visible') {
        section.valid = this.cvSections.training_visible;
      }

      if (section.visible == 'membership_visible') {
        section.valid = this.cvSections.membership_visible;
      }

      if (section.visible == 'volunteer_visible') {
        section.valid = this.cvSections.volunteer_visible;
      }

      if (section.visible == 'conference_visible') {
        section.valid = this.cvSections.conference_visible;
      }

      if (section.visible == 'hobbies_interest_visible') {
        section.valid = this.cvSections.hobbies_interest_visible;
      }

      if (section.visible == 'reference_visible') {
        section.valid = this.cvSections.reference_visible;
      }
      if (section.visible == 'work_exp_visible') {
        section.valid = this.cvSections.work_exp_visible;
      }

      if (section.visible == 'skill_visible') {
        section.valid = this.cvSections.skill_visible;
      }
    }
    this.cvSectionTemp = this.cvSections2.map(x => Object.assign({}, x));
    this.orderSections();
    this.resumeIdTemp = this.resumeId;
    this.addForm.controls['resume_id'].setValue(this.resumeIdTemp);
    this.removeForm.controls['resume_id'].setValue(this.resumeIdTemp);

  }


  onClick(disabled: boolean) {
    if (disabled) {
      event.stopPropagation();
    }
  }

  addCvSection($event) {
    $event.preventDefault();
    let temparray = this.unSelected.map(x => Object.assign({}, x));
    for (let section of this.unselectedControl.value) {
      // console.log(section.valid);
      if (section.valid == 0) {
        for (let s of this.cvSectionTemp) {
          if (s.visible == section.visible) {
            s.valid = 1;
          }
        }
        this.orderSections();
      }
    }
    if (JSON.stringify(temparray) == JSON.stringify(this.unSelected)) {
      alert('الرجاء تحديد خيارات من الاقسام الاضافية ليتم إضافتها إلى سيرتك الذاتية.');
    }
  }

  removeCvSection($event) {
    $event.preventDefault();
    let temparray = this.selected.map(x => Object.assign({}, x));
    let bool = false;
    for (let section of this.selectedControl.value) {
      if (section.valid == 1 && (section.visible != 'personal_info_visible') && (section.visible != 'languages_visible') && (section.visible != 'education_visible') && (section.visible != 'contact_info_visible')) {
        for (let s of this.cvSectionTemp) {
          if (s.visible == section.visible) {
           bool = true;
          }
        }
      }
    }
    if (bool == false) {
        alert('الرجاء تحديد خيارات من سيرتك الذاتية ليتم إزالتها.');
    } else {
      if (confirm('Do you want to remove these section(s)? ')) {
        for (let section of this.selectedControl.value) {
          if (section.valid == 1 && (section.visible != 'personal_info_visible') && (section.visible != 'languages_visible') && (section.visible != 'education_visible') && (section.visible != 'contact_info_visible')) {
            for (let s of this.cvSectionTemp) {
              if (s.visible == section.visible) {
                s.valid = 0;
              }
            }
            this.orderSections();
          }
        }
      }
    }
  }

  cancel($event) {
    $event.preventDefault();
    this.cancelModalPopup.emit();
    $('#sidebarModal').modal('hide');
  }

  submit() {

      for (let section of this.cvSections2){
        for (let item of this.selected){
          if (section.visible == item.visible ){
            if (section.valid == 0 && item.valid == 1){
             this.addForm.addControl(item.visible,new FormControl(1));
            }
          }
        }
      }

    for (let section of this.cvSections2){
      for (let item of this.unSelected){
        if (section.visible == item.visible ){
          if (section.valid == 1 && item.valid == 0){
             this.removeForm.addControl(item.visible,new FormControl(1));
          }
        }
      }
    }

    let sendData = this.addForm.value;
    let sendData1 = this.removeForm.value;

    this.sectionsManagementService.addCvSection(sendData).subscribe(res => {});

    this.sectionsManagementService.removeCvSection(sendData1).subscribe(res => {
      this.closeModalPopup.emit({'new': res['data'], 'old': this.cvSections});
    });
    $('#sidebarModal').modal('hide');
  }
  ngOnDestroy() {

  }

  orderSections(){
    this.unSelected = [];
    this.selected = [];
    for (let section of this.cvSectionTemp) {
      if (section.valid == 0) {
        this.unSelected.push(section);
      }
      if (section.valid == 1) {
        this.selected.push(section);
      }
    }
  }


  get unselectedControl() {
    return this.sectionsManagementForm.controls['unSelected'] as FormGroup;
  }

  get selectedControl() {
    return this.sectionsManagementForm.controls['selected'] as FormGroup;
  }

}
