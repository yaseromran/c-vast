import { Injectable } from '@angular/core';
import {ExportUrlService} from '../shared-services/export-url.service';
import {HttpClient, HttpHeaders} from '@angular/common/http';

@Injectable()
export class PublicationsService {

  url = '';
  constructor(private http:HttpClient, private privateSharedURL: ExportUrlService) {
    this.privateSharedURL.publicUrl.take(1).subscribe(data=>{
      this.url = data + 'publication';
    });
  }

  addPublication(publication) {
    let headers = new HttpHeaders().set('Content-Type', 'application/json');
    return this.http.post(this.url , JSON.stringify(publication), {headers});
  }

  getPublications(resume_id: number) {
    let headers = new HttpHeaders().set('Content-Type', 'application/json');
    return this.http.get(this.url +'/'+  resume_id , {headers});
  }

  deletePublication(publication_id: number) {
    let headers = new HttpHeaders().set('Content-Type', 'application/json');
    return this.http.delete(this.url + '/'+ publication_id, {headers});
  }

  updatePublication(publication,publication_id: number) {
    let headers = new HttpHeaders().set('Content-Type', 'application/json');
    return this.http.put(this.url +'/'+ publication_id, JSON.stringify(publication), {headers});
  }
  orderData(resume_id:number , orderedData){
    let headers = new HttpHeaders().set('Content-Type', 'application/json');
    return this.http.post(this.url  + 's/order/' + resume_id, JSON.stringify(orderedData), {headers});
  }

}
