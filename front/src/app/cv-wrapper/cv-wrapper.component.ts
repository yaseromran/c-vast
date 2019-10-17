import { Component, OnInit } from '@angular/core';
import {ActivatedRoute, Router} from '@angular/router';
import {LangChangeEvent, TranslateService} from '@ngx-translate/core';
import {SectionsManagementService} from '../cv-services/sections-management.service';
import {Subject} from 'rxjs/Subject';

@Component({
  selector: 'cv-wrapper',
  templateUrl: './cv-wrapper.component.html',
  styleUrls: ['./cv-wrapper.component.css']
})
export class CvWrapperComponent implements OnInit {
  textDir: boolean = true;
  resumeId:  number = null;

  constructor(private  route: Router,
              private router: ActivatedRoute,
              private translate: TranslateService) {
    translate.setDefaultLang('ar');
  }

  ngOnInit() {
    this.translate.onLangChange.subscribe((event: LangChangeEvent) => {
      if (event.lang === 'ar') {
        this.textDir = true;
      } else {
        this.textDir = false;
      }
    });
    this.setResumeId();
  }

  setResumeId() {
    this.router.params.switchMap(
      (res) => {
        this.resumeId = res['resumeId'];
        return res['resumeId'];
      }).subscribe((resume_id) => {});
  }

  changeLang(lang) {
    this.translate.use(lang);
  }

  showHelper() {
    if (this.route.url.includes('preview')) {
      return false;
    } else { return true; }
  }
}
