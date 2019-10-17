import { Injectable } from '@angular/core';
import {HttpClient, HttpHeaders} from '@angular/common/http';
import 'rxjs/add/operator/take';
import {ExportUrlService} from '../shared-services/export-url.service';
import 'rxjs/add/operator/take';
@Injectable()
export class ResumeService {

  url = '';

  constructor(private http: HttpClient, private privateSharedURL: ExportUrlService) {
    this.privateSharedURL.publicUrl.take(1).subscribe(data => {
      this.url = data + 'resume';
    });
  }

  getAllResumes () {
    let headers = new HttpHeaders().set('Content-Type', 'application/json');
    return this.http.get(this.url, {headers});
  }

}
