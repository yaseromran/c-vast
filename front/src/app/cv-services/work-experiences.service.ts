import { Injectable } from '@angular/core';
import {HttpClient, HttpHeaders} from '@angular/common/http';
import {ExportUrlService} from '../shared-services/export-url.service';

@Injectable()
export class WorkExperiencesService {

  url = '';
  constructor(private http: HttpClient, private privateSharedURL: ExportUrlService) {
    this.privateSharedURL.publicUrl.take(1).subscribe(data => {
      this.url = data;
    });
  }

  addWorkExperience(workExperience) {
  let headers = new HttpHeaders().set('Content-Type', 'application/json');
  return this.http.post(this.url + '/workExperiences', JSON.stringify(workExperience), {headers});
}

getWorkExperiences(resume_id: number) {
  let headers = new HttpHeaders().set('Content-Type', 'application/json');
  return this.http.get(this.url + '/resumes/' +  resume_id + '/workExperiences', {headers});
}
  getWorkExperiencesData(resume_id: number) {
    let headers = new HttpHeaders().set('Content-Type', 'application/json');
    return this.http.get(this.url + '/workExpData/' +  resume_id , {headers});
  }

deleteWorkExperience(workExperience_id: number) {
  let headers = new HttpHeaders().set('Content-Type', 'application/json');
  return this.http.delete(this.url + '/workExperiences/' +  workExperience_id, {headers});
}

orderData(resume_id: number , orderedData){
  let headers = new HttpHeaders().set('Content-Type', 'application/json');
  console.log(orderedData)
  return this.http.post(this.url  + '/workExperiences/order/' + resume_id, JSON.stringify(orderedData), {headers});
}

updateWorkExperience(workExperience, workExperience_id: number) {
  let headers = new HttpHeaders().set('Content-Type', 'application/json');
  return this.http.put(this.url + '/workExperiences/' + workExperience_id, JSON.stringify(workExperience), {headers});
}

getWorkExperience(workExperience_id: number) {
  let headers = new HttpHeaders()
    .set('Content-Type', 'application/json');
  headers.set('Accept', 'application/json');
  return this.http.get(this.url + '/workExperiences' + workExperience_id , {headers});
}
}
