import {Component, Input, OnDestroy, OnInit} from '@angular/core';
import {TopToSideSignalService} from '../cv-services/top-to-side-signal.service';
import {Subscription} from 'rxjs/Subscription';
import 'rxjs/add/operator/skip';
import {SideToFormSignalService} from '../cv-services/side-to-form-signal.service';
import {ActivatedRoute, Router} from '@angular/router';
import {SectionsManagementService} from '../cv-services/sections-management.service';
import {Subject} from 'rxjs/Subject';

@Component({
  selector: 'sidebar',
  templateUrl: './sidebar.component.html',
  styleUrls: ['./sidebar.component.css']
})
export class SidebarComponent implements OnInit, OnDestroy {
  sideBarStatus = '' ;
  subscribe: Subscription;
  @Input('resumeId') resumeId: number;
 // @Input('cvSections') cvSections: any;
  private ngUnsubscribe: Subject<any> = new Subject();
  cvSections;
  display: boolean = false;

  constructor(private topShared: TopToSideSignalService,
              private sideToFormShared: SideToFormSignalService,
              private router: Router,
              private route: ActivatedRoute,
              private sectionsManagementService: SectionsManagementService) {
    // this.sectionsManagementService.onGetData.subscribe(res => {
    //   this.cvSections = res['data'];
    // });
  }

  ngOnInit() {
    this.subscribe = this.topShared.cssValue.skip(1).subscribe(value => {
      if (this.sideBarStatus == 'collapsed') {
        this.sideBarStatus = '';
        this.changeFormStatus('expand');

      } else {
        this.sideBarStatus = 'collapsed';
        this.changeFormStatus('collapsed');

      }
    });
    this.getCvSections();
  }

  getCvSections() {
    this.sectionsManagementService.getCvSections(this.resumeId).takeUntil(this.ngUnsubscribe).subscribe(
      (res) => {
        this.cvSections = res['data'];
      });
  }

  changeSideBarStatus() {
    if (this.sideBarStatus == 'collapsed') {
      this.sideBarStatus = '';
      this.changeFormStatus('expand');
     } else {
      this.sideBarStatus = 'collapsed';
      this.changeFormStatus('collapsed');

    }
  }

  changeFormStatus(x: String) {
    this.sideToFormShared.expandAndCollapseForm(x);
  }

  ngOnDestroy() {
    this.subscribe.unsubscribe();
  }

  displayModal() {
    this.display = !this.display;
  }
  closeModal() {
    this.display = false;
  }

  handlePopup(event: any) {
    this.cvSections = event['new'];
    this.display = false;
  }
}
