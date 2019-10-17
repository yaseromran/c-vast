import { Injectable } from '@angular/core';
import {HttpClient, HttpHeaders} from '@angular/common/http';
import {ExportUrlService} from '../shared-services/export-url.service';

@Injectable()
export class TrainingsService {

  url = '';
  constructor(private http: HttpClient, private privateSharedURL: ExportUrlService) {
    this.privateSharedURL.publicUrl.take(1).subscribe(data => {
      this.url = data ;
    });
  }

  addTraining(training) {
    let headers = new HttpHeaders().set('Content-Type', 'application/json');
    return this.http.post(this.url + '/trainings', JSON.stringify(training), {headers});
  }

  getTrainings(resume_id: number) {
    let headers = new HttpHeaders().set('Content-Type', 'application/json');
    return this.http.get(this.url + '/resumes/' +  resume_id + '/trainings', {headers});
  }

  deleteTraining(training_id: number) {
    let headers = new HttpHeaders().set('Content-Type', 'application/json');
    return this.http.delete(this.url + '/trainings/' +  training_id, {headers});
  }

  orderData(resume_id:number , orderedData){
    let headers = new HttpHeaders().set('Content-Type', 'application/json');
    console.log(orderedData)
    return this.http.post(this.url  + '/trainings/order/' + resume_id, JSON.stringify(orderedData), {headers});
  }

  updateTraining(training, training_id: number) {
    let headers = new HttpHeaders().set('Content-Type', 'application/json');
    return this.http.put(this.url + '/trainings/' + training_id, JSON.stringify(training), {headers});
  }

}
