import { Injectable } from '@angular/core';
import {ExportUrlService} from '../shared-services/export-url.service';
import {HttpClient, HttpHeaders} from '@angular/common/http';

@Injectable()
export class ProjectsService {

  url = '';
  constructor(private http:HttpClient, private privateSharedURL: ExportUrlService) {
    this.privateSharedURL.publicUrl.take(1).subscribe(data=>{
      this.url = data + 'project';
    });
  }

  addProject(project) {
    let headers = new HttpHeaders().set('Content-Type', 'application/json');
    return this.http.post(this.url, JSON.stringify(project), {headers});
  }

  getProjects(resume_id: number) {
    let headers = new HttpHeaders().set('Content-Type', 'application/json');
    return this.http.get(this.url +'/'+  resume_id, {headers});
  }

  deleteProject(project_id: number) {
    let headers = new HttpHeaders().set('Content-Type', 'application/json');
    return this.http.delete(this.url +'/'+  project_id, {headers});
  }

  updateProject(project,project_id: number) {
    let headers = new HttpHeaders().set('Content-Type', 'application/json');
    return this.http.put(this.url +'/'+ project_id, JSON.stringify(project), {headers});
  }
  orderData(resume_id:number , orderedData){
    let headers = new HttpHeaders().set('Content-Type', 'application/json');
    return this.http.post(this.url  +"s/order/"+resume_id, JSON.stringify(orderedData), {headers});
  }


}
