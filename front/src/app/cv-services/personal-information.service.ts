import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import {ExportUrlService} from '../shared-services/export-url.service';


@Injectable()
export class PersonalInformationService {

  url = '';
  dataUrl = '';
  constructor(private http: HttpClient , private privateSharedURL: ExportUrlService) {
    this.privateSharedURL.publicUrl.take(1).subscribe(data => {
      this.url = data + 'personalInformation';
      this.dataUrl = data + 'personalInfoData';
    });

  }

  addPersonalInformation(personalInformation) {
    const headers = new HttpHeaders().set('Content-Type', 'application/json');
    return this.http.post(this.url, JSON.stringify(personalInformation), {headers});
  }

  getPersonalInformation(resumeId: number = 11) {
    return this.http.get(this.url + '/' + resumeId);
  }

  getPersonalInformationData(resumeId: number) {
    return this.http.get(this.dataUrl + '/' + resumeId);
  }

  editPersonalInformation(personalInformation, personalInformationId: number = 11) {
    const headers = new HttpHeaders().set('Content-Type', 'application/json');
    return this.http.put(this.url + '/' + personalInformationId, JSON.stringify(personalInformation), {headers});
  }

}
