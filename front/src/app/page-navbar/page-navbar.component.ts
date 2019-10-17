import {Component, Input, OnInit} from '@angular/core';
import {TopToSideSignalService} from '../cv-services/top-to-side-signal.service';

@Component({
  selector: 'page-navbar',
  templateUrl: './page-navbar.component.html',
  styleUrls: ['./page-navbar.component.css']
})
export class PageNavbarComponent implements OnInit {

  @Input('resumeId') resumeId: number;

  constructor(private topShared:TopToSideSignalService) { }

  ngOnInit() {
  }
  closeSideBar(){
    this.topShared.passCollapseEvent('collapsed');

  }

}
