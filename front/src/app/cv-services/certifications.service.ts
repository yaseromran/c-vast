import { Injectable } from '@angular/core';
import {HttpClient, HttpHeaders} from '@angular/common/http';
import {ExportUrlService} from '../shared-services/export-url.service';

@Injectable()
export class CertificationsService {

  url = '';
  constructor(private http: HttpClient, private privateSharedURL: ExportUrlService) {
    this.privateSharedURL.publicUrl.take(1).subscribe(data => {
      this.url = data ;
    });
  }

  addCertification(certification) {
    let headers = new HttpHeaders().set('Content-Type', 'application/json');
    return this.http.post(this.url + '/certifications', JSON.stringify(certification), {headers});
  }

  getCertifications(resume_id: number) {
    let headers = new HttpHeaders().set('Content-Type', 'application/json');
    return this.http.get(this.url + '/resumes/' +  resume_id + '/certifications', {headers});
  }

  getCertificationsData(resume_id: number) {
    let headers = new HttpHeaders().set('Content-Type', 'application/json');
    return this.http.get(this.url + '/certificationData/' +  resume_id , {headers});
  }

  deleteCertification(certification_id: number) {
    let headers = new HttpHeaders().set('Content-Type', 'application/json');
    return this.http.delete(this.url + '/certifications/' +  certification_id, {headers});
  }

  orderData(resume_id:number , orderedData){
    let headers = new HttpHeaders().set('Content-Type', 'application/json');
    console.log(orderedData)
    return this.http.post(this.url  + '/certifications/order/' + resume_id, JSON.stringify(orderedData), {headers});
  }

  updateCertification(certification, certification_id: number) {
    let headers = new HttpHeaders().set('Content-Type', 'application/json');
    return this.http.put(this.url + '/certifications/' + certification_id, JSON.stringify(certification), {headers});
  }

}
