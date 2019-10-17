import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { ExportUrlService } from '../shared-services/export-url.service';
import 'rxjs/add/operator/take';

@Injectable()
export class ContactInfoService {

  url = '';
  constructor(private http: HttpClient , private privateSharedURL: ExportUrlService) {
    this.privateSharedURL.publicUrl.take(1).subscribe(data => {
      this.url = data + 'contactInfo';
    });

  }

  updateContactInfo(contact, contactId: number) {
    let headers = new HttpHeaders().set('Content-Type', 'application/json');
    return this.http.put(this.url + '/' + contactId, JSON.stringify(contact), {headers});
  }

  addContactInfo(contactInfo, resumeId) {
    let headers = new HttpHeaders().set('Content-Type', 'application/json');
    return this.http.post(this.url, JSON.stringify(contactInfo) , {headers});
  }

  getContactInfo(resume_id: number){
    let headers = new HttpHeaders().set('Content-Type', 'application/json');
    return this.http.get(this.url + '/' + resume_id, {headers});
  }
  getContactInfoData(resume_id: number) {
    let headers = new HttpHeaders().set('Content-Type', 'application/json');
    return this.http.get(this.url + 'Data/' +  resume_id , {headers});
  }

}
