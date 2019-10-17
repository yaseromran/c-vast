import { Injectable } from '@angular/core';
import {ExportUrlService} from '../shared-services/export-url.service';
import {HttpClient, HttpHeaders} from '@angular/common/http';

@Injectable()
export class VolunteersService {

  url = '';
  constructor(private http:HttpClient, private privateSharedURL: ExportUrlService) {
    this.privateSharedURL.publicUrl.take(1).subscribe(data=>{
      this.url = data + 'volunteer';
    });
  }

  addVolunteer(volunteer) {
    let headers = new HttpHeaders().set('Content-Type', 'application/json');
    return this.http.post(this.url, JSON.stringify(volunteer), {headers});
  }

  getVolunteers(resume_id: number) {
    let headers = new HttpHeaders().set('Content-Type', 'application/json');
    return this.http.get(this.url +'/'+  resume_id, {headers});
  }

  deleteVolunteer(volunteer_id: number) {
    let headers = new HttpHeaders().set('Content-Type', 'application/json');
    return this.http.delete(this.url +'/'+ volunteer_id, {headers});
  }

  updateVolunteer(volunteer,volunteer_id: number) {
    let headers = new HttpHeaders().set('Content-Type', 'application/json');
    return this.http.put(this.url +'/'+ volunteer_id, JSON.stringify(volunteer), {headers});
  }
  orderData(resume_id:number , orderedData){
    let headers = new HttpHeaders().set('Content-Type', 'application/json');
    return this.http.post(this.url  +"s/order/"+resume_id, JSON.stringify(orderedData), {headers});
  }


}
