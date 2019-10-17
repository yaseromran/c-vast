import { Injectable } from '@angular/core';
import {ExportUrlService} from '../shared-services/export-url.service';
import {HttpClient, HttpHeaders} from '@angular/common/http';

@Injectable()
export class ReferencesService {

  url = '';
  constructor(private http:HttpClient, private privateSharedURL: ExportUrlService) {
    this.privateSharedURL.publicUrl.take(1).subscribe(data=>{
      this.url = data ;
    });
  }

  addReference(reference) {
    let headers = new HttpHeaders().set('Content-Type', 'application/json');
    return this.http.post(this.url + '/references', JSON.stringify(reference), {headers});
  }

  getReferences(resume_id: number) {
    let headers = new HttpHeaders().set('Content-Type', 'application/json');
    return this.http.get(this.url + '/resumes/' +  resume_id + '/references', {headers});
  }

  getReferencesData(resume_id: number) {
    let headers = new HttpHeaders().set('Content-Type', 'application/json');
    return this.http.get(this.url + '/referencesData/' +  resume_id , {headers});
  }

  setReferencesIsAvailable(isAvailable, resume_id: number) {
    let headers = new HttpHeaders().set('Content-Type', 'application/json');
    return this.http.post(this.url + '/referencesIs_available/' +  resume_id, JSON.stringify(isAvailable) , {headers});
  }

  deleteReference(reference_id: number) {
    let headers = new HttpHeaders().set('Content-Type', 'application/json');
    return this.http.delete(this.url +'/references/'+  reference_id, {headers});
  }

  orderData(resume_id:number , orderedData){
    let headers = new HttpHeaders().set('Content-Type', 'application/json');
    console.log(orderedData)
    return this.http.post(this.url  +"/references/order/"+resume_id, JSON.stringify(orderedData), {headers});
  }

  updateReference(reference,reference_id: number) {
    let headers = new HttpHeaders().set('Content-Type', 'application/json');
    return this.http.put(this.url +'/references/'+ reference_id, JSON.stringify(reference), {headers});
  }

  getReference(reference_id : number){
    let headers = new HttpHeaders()
      .set('Content-Type','application/json');
    headers.set('Accept','application/json');


    return this.http.get(this.url + '/references' + reference_id , {headers});

  }


}
