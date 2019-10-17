import { Injectable } from '@angular/core';
import {HttpClient, HttpHeaders} from '@angular/common/http';
import {ExportUrlService} from '../shared-services/export-url.service';
import 'rxjs/add/observable/throw';
import 'rxjs/add/operator/catch';
import 'rxjs/add/operator/take';

@Injectable()
export class HobbiesInterestsService {

  url = '';
  dataUrl = '';

  constructor(private http: HttpClient, private privateSharedURL: ExportUrlService) {
    this.privateSharedURL.publicUrl.take(1).subscribe(data => {
      this.url = data + 'hobbiesInterest';
      this.dataUrl = data + 'hobbiesData';
    });
  }

  addHobbiesInterest(hobbiesInterest, resumeId) {

    // const body = JSON.stringify({
    //     'resume_id': resumeId,
    //     'description': hobbiesInterest.description,
    //   }
    // );
    let headers = new HttpHeaders().set('Content-Type', 'application/json');
    return this.http.post(this.url, hobbiesInterest, {headers});
  }

  updateHobbiesInterest (hobbiesInterest, hobbiesInterestId: number) {
    // console.log( hobbiesInterestId);
    // const body = JSON.stringify({
    //     'resume_id': hobbiesInterestId , // summary.resume_id,
    //     'description': hobbiesInterest.description,
    //   }
    // );
    let headers = new HttpHeaders().set('Content-Type', 'application/json');

    return this.http.put(this.url + '/' + hobbiesInterestId, hobbiesInterest, {headers});

  }

  getHobbiesInterest(resume_id: number) {
    let headers = new HttpHeaders().set('Content-Type', 'application/json');
    return this.http.get(this.url + '/' + resume_id,{headers});

  }

  getHobbiesInterestData(resume_id: number) {
    let headers = new HttpHeaders().set('Content-Type', 'application/json');
    return this.http.get(this.dataUrl + '/' + resume_id,{headers});

  }

}
