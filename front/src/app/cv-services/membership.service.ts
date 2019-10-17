import { Injectable } from '@angular/core';
import {ExportUrlService} from '../shared-services/export-url.service';
import {HttpClient, HttpHeaders} from '@angular/common/http';

@Injectable()
export class MembershipService {

  url = '';
  constructor(private http:HttpClient, private privateSharedURL: ExportUrlService) {
    this.privateSharedURL.publicUrl.take(1).subscribe(data=>{
      this.url = data + 'membership';
    });
  }

  addMembership(membership) {
    let headers = new HttpHeaders().set('Content-Type', 'application/json');
    return this.http.post(this.url, JSON.stringify(membership), {headers});
  }

  getMemberships(resume_id: number) {
    let headers = new HttpHeaders().set('Content-Type', 'application/json');
    return this.http.get(this.url +'/'+  resume_id, {headers});
  }

  deleteMembership(membership_id: number) {
    let headers = new HttpHeaders().set('Content-Type', 'application/json');
    return this.http.delete(this.url +'/'+  membership_id, {headers});
  }

  updateMembership(membership,membership_id: number) {
    let headers = new HttpHeaders().set('Content-Type', 'application/json');
    return this.http.put(this.url +'/'+ membership_id, JSON.stringify(membership), {headers});
  }
  orderData(resume_id:number , orderedData){
    let headers = new HttpHeaders().set('Content-Type', 'application/json');
    return this.http.post(this.url  + 's/order/' +resume_id, JSON.stringify(orderedData), {headers});
  }



}
