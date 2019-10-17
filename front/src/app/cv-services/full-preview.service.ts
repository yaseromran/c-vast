import { Injectable } from '@angular/core';
import {HttpClient, HttpHeaders} from '@angular/common/http';
import {ExportUrlService} from '../shared-services/export-url.service';

@Injectable()
export class FullPreviewService {

  url = '';
  constructor(private http: HttpClient, private privateSharedURL: ExportUrlService) {
    this.privateSharedURL.publicUrl.take(1).subscribe(data => {
      this.url = data + 'resume';
    });
  }

  getFullPreview(resume_id: number) {
    let headers = new HttpHeaders().set('Content-Type', 'application/json');
    return this.http.get(this.url + '/' +  resume_id, {headers});
  }
}
