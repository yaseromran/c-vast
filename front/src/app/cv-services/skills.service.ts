import { Injectable } from '@angular/core';
import {ExportUrlService} from '../shared-services/export-url.service';
import {HttpClient, HttpHeaders} from '@angular/common/http';

@Injectable()
export class SkillsService {

  url = '';
  constructor(private http: HttpClient , private privateSharedURL: ExportUrlService) {
    this.privateSharedURL.publicUrl.take(1).subscribe(data => {
      this.url = data ;
    });
  }

  addSkill(skill) {
    let headers = new HttpHeaders().set('Content-Type', 'application/json');
    return this.http.post(this.url + '/skills', JSON.stringify(skill), {headers});
  }

  getSkills(resume_id: number) {
    let headers = new HttpHeaders().set('Content-Type', 'application/json');
    return this.http.get(this.url +'/resumes/'+  resume_id + '/skills', {headers});
  }

  getSkillsData(resume_id: number) {
    let headers = new HttpHeaders().set('Content-Type', 'application/json');
    return this.http.get(this.url + '/skillsData/' +  resume_id , {headers});
  }

  deleteSkill(skill_id: number) {
    let headers = new HttpHeaders().set('Content-Type', 'application/json');
    return this.http.delete(this.url +'/skills/'+  skill_id, {headers});
  }

  orderData(resume_id:number , orderedData){
    let headers = new HttpHeaders().set('Content-Type', 'application/json');
    console.log(orderedData)
    return this.http.post(this.url  +"/skills/order/"+resume_id, JSON.stringify(orderedData), {headers});
  }

  updateSkill(skill,skill_id: number) {
    let headers = new HttpHeaders().set('Content-Type', 'application/json');
    return this.http.put(this.url +'/skills/'+ skill_id, JSON.stringify(skill), {headers});
  }

  getSkill(skill_id : number){
    let headers = new HttpHeaders()
      .set('Content-Type','application/json');
    headers.set('Accept','application/json');


    return this.http.get(this.url + '/skills' + skill_id , {headers});

  }

}
