import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { ExportUrlService } from '../shared-services/export-url.service';

@Injectable()
export class EducationService {

  url = '';
  dataUrl = '';
  constructor(private http: HttpClient, private privateSharedURL: ExportUrlService) {
    this.privateSharedURL.publicUrl.take(1).subscribe(data => {
      this.url = data + 'education';
      this.dataUrl = data + 'educationData';
    });
  }

  updateEducation(education, educationId: number) {
    let headers = new HttpHeaders().set('Content-Type', 'application/json');
    return this.http.put(this.url + '/' + educationId, JSON.stringify(education), {headers});
  }

  addEducation(education) {
    let headers = new HttpHeaders().set('Content-Type', 'application/json');
    return this.http.post(this.url, JSON.stringify(education), {headers});
  }

  getEducations(resume_id: number) {
    let headers = new HttpHeaders().set('Content-Type', 'application/json');
    return this.http.get(this.url + '/' +  resume_id, {headers});
  }
  getEducationsData(resumeId: number) {
    return this.http.get(this.dataUrl + '/' + resumeId);
  }

  deleteEducation(education_id: number) {
    let headers = new HttpHeaders().set('Content-Type', 'application/json');
    return this.http.delete(this.url + '/' +  education_id, {headers});
  }

  getEducation(resume_id: number, educationId: number) {
    let headers = new HttpHeaders().set('Content-Type', 'application/json');
    return this.http.get(this.url + '/' + resume_id + '/' + educationId, {headers});
  }

  orderData(resume_id: number , orderedData) {
    let headers = new HttpHeaders().set('Content-Type', 'application/json');
    return this.http.post(this.url  + '/order/' + resume_id, JSON.stringify(orderedData), {headers});
  }

}
