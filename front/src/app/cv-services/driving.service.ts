import { Injectable } from '@angular/core';
import {HttpClient, HttpHeaders} from '@angular/common/http';
import {ExportUrlService} from '../shared-services/export-url.service';

@Injectable()
export class DrivingService {

  url = '';
  dataUrl = '';
  constructor(private http: HttpClient, private privateSharedURL: ExportUrlService) {
    this.privateSharedURL.publicUrl.take(1).subscribe(data => {
      this.url = data + 'driving';
      this.dataUrl = data + 'drivingData';
    });
  }

  getDrivings(resume_id: number) {
    let headers = new HttpHeaders().set('Content-Type', 'application/json');
    return this.http.get(this.url + '/' +  resume_id, {headers});
  }

  getDrivingsData(resume_id: number) {
    let headers = new HttpHeaders().set('Content-Type', 'application/json');
    return this.http.get(this.dataUrl + '/' +  resume_id, {headers});
  }

  addDriving(driving) {
    let headers = new HttpHeaders().set('Content-Type', 'application/json');
    return this.http.post(this.url, JSON.stringify(driving), {headers});
  }

  updateDriving(driving, drivingId: number) {
    let headers = new HttpHeaders().set('Content-Type', 'application/json');
    return this.http.put(this.url + '/' + drivingId, JSON.stringify(driving), {headers});
  }

}
