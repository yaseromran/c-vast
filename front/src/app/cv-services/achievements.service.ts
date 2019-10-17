import { Injectable } from '@angular/core';
import {ExportUrlService} from '../shared-services/export-url.service';
import {HttpClient, HttpHeaders} from '@angular/common/http';

@Injectable()
export class AchievementsService {

  url = '';
  constructor(private http:HttpClient, private privateSharedURL: ExportUrlService) {
    this.privateSharedURL.publicUrl.take(1).subscribe(data=>{
      this.url = data ;
    });
  }

  addAchievement(achievement) {
    let headers = new HttpHeaders().set('Content-Type', 'application/json');
    return this.http.post(this.url + '/achievements', JSON.stringify(achievement), {headers});
  }

  getAchievements(resume_id: number) {
    let headers = new HttpHeaders().set('Content-Type', 'application/json');
    return this.http.get(this.url +'/resumes/'+  resume_id + '/achievements', {headers});
  }

  deleteAchievement(achievement_id: number) {
    let headers = new HttpHeaders().set('Content-Type', 'application/json');
    return this.http.delete(this.url +'/achievements/'+  achievement_id, {headers});
  }

  orderData(resume_id:number , orderedData){
    let headers = new HttpHeaders().set('Content-Type', 'application/json');
    console.log(orderedData)
    return this.http.post(this.url  +"/achievements/order/"+resume_id, JSON.stringify(orderedData), {headers});
  }

  updateAchievement(achievement,achievement_id: number) {
    let headers = new HttpHeaders().set('Content-Type', 'application/json');
    return this.http.put(this.url +'/achievements/'+ achievement_id, JSON.stringify(achievement), {headers});
  }

  getAchievement(achievement_id : number){
    let headers = new HttpHeaders()
      .set('Content-Type','application/json'); 
      headers.set('Accept','application/json');


      return this.http.get(this.url + '/achievements' + achievement_id , {headers}); 

  }
}
