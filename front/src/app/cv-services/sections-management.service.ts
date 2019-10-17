import {EventEmitter, Injectable} from '@angular/core';
import {HttpClient, HttpHeaders} from '@angular/common/http';
import {ExportUrlService} from '../shared-services/export-url.service';

@Injectable()
export class SectionsManagementService {
  // onGetData: EventEmitter<any> = new EventEmitter();


  url = '';
  constructor(private http: HttpClient , private privateSharedURL: ExportUrlService) {
    this.privateSharedURL.publicUrl.take(1).subscribe(data => {
      this.url = data ;
    });
  }

  getCvSections(resume_id: number) {
    let headers = new HttpHeaders().set('Content-Type', 'application/json');
    return this.http.get(this.url + '/cvSection/' +  resume_id , {headers});
    //   .map(res => {
    //   this.onGetData.emit(res);
    // });
  }

  addCvSection(CvSection) {
    let headers = new HttpHeaders().set('Content-Type', 'application/json');
    return this.http.post(this.url + '/cvSection', JSON.stringify(CvSection), {headers});
    //   .map(res => {
    //   this.onGetData.emit(res);
    // });
  }

  removeCvSection(CvSection) {
    let headers = new HttpHeaders().set('Content-Type', 'application/json');
    return this.http.post(this.url + '/cvSection/remove', JSON.stringify(CvSection), {headers});
    // .map(res => {
    //   this.onGetData.emit(res);
    // });
  }

}
