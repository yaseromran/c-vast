import { Injectable } from '@angular/core';
import {HttpClient, HttpErrorResponse, HttpHeaders} from '@angular/common/http';
import {Observable} from 'rxjs/Observable';
import 'rxjs/add/observable/throw';
import 'rxjs/add/operator/catch';
import "rxjs/add/operator/take";
import {ExportUrlService} from '../shared-services/export-url.service';

@Injectable()
export class SummaryService {

   url = '';


  constructor(private http: HttpClient, private privateSharedURL: ExportUrlService) {
    this.privateSharedURL.publicUrl.take(1).subscribe(data=>{
      this.url = data + 'summary';
    });
  }

  addSummary(summary, resumeId){

    const body = JSON.stringify({
        'resume_id': resumeId,
        'description': summary.description,
      }
    );
    let headers =new HttpHeaders().set('Content-Type', 'application/json');
    return this.http.post(this.url, body, {headers});
  }

  updateSummary (summary, summaryId:number){
    console.log( summaryId)
    const body = JSON.stringify({
        'resume_id': summaryId ,// summary.resume_id,
        'description': summary.description,
      }
    );
    let headers = new HttpHeaders().set('Content-Type', 'application/json');

    return this.http.put(this.url+'/'+summaryId, body, {headers});

  }

  getSummary(resume_id: number){
    let headers = new HttpHeaders().set('Content-Type', 'application/json');
    return this.http.get(this.url+'/'+resume_id,{headers});

  }
}
