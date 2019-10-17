import { Injectable } from '@angular/core';
import {ExportUrlService} from '../shared-services/export-url.service';
import {HttpClient, HttpHeaders} from '@angular/common/http';

@Injectable()
export class ConferencesService {


  url = '';
  constructor(private http:HttpClient, private privateSharedURL: ExportUrlService) {
    this.privateSharedURL.publicUrl.take(1).subscribe(data=>{
      this.url = data ;
    });
  }

  addConference(conference) {
    let headers = new HttpHeaders().set('Content-Type', 'application/json');
    return this.http.post(this.url + '/ConferencesWorkshopSeminar', JSON.stringify(conference), {headers});
  }

  getConferences(resume_id: number) {
    let headers = new HttpHeaders().set('Content-Type', 'application/json');
    return this.http.get(this.url +'/resumes/'+  resume_id + '/ConferencesWorkshopSeminars', {headers});
  }

  getConferencesData(resume_id: number) {
    let headers = new HttpHeaders().set('Content-Type', 'application/json');
    return this.http.get(this.url + '/ConferencesData/' +  resume_id , {headers});
  }

  deleteConference(conference_id: number) {
    let headers = new HttpHeaders().set('Content-Type', 'application/json');
    return this.http.delete(this.url +'/ConferencesWorkshopSeminar/'+  conference_id, {headers});
  }

  orderData(resume_id:number , orderedData){
    let headers = new HttpHeaders().set('Content-Type', 'application/json');
    console.log(orderedData)
    return this.http.post(this.url  +"/ConferencesWorkshopSeminar/order/"+resume_id, JSON.stringify(orderedData), {headers});
  }

  updateConference(conference,conference_id: number) {
    let headers = new HttpHeaders().set('Content-Type', 'application/json');
    return this.http.put(this.url +'/ConferencesWorkshopSeminar/'+ conference_id, JSON.stringify(conference), {headers});
  }

  getConference(conference_id : number){
    let headers = new HttpHeaders()
      .set('Content-Type','application/json');
    headers.set('Accept','application/json');


    return this.http.get(this.url + '/ConferencesWorkshopSeminar' + conference_id , {headers});

  }

}
