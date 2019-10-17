import { Component, OnInit } from '@angular/core';
import {ResumeService} from '../cv-services/resume.service';

@Component({
  selector: 'app-reume',
  templateUrl: './reume.component.html',
  styleUrls: ['./reume.component.css']
})
export class ReumeComponent implements OnInit {

   resumes ;
  translated_language;
  constructor(private resumeService: ResumeService) { }

  ngOnInit() {
     this.resumeService.getAllResumes().subscribe(
       res => {
         this.resumes = res['resumes'];
         this.translated_language = res['translated_language'];
       });
  }

}
