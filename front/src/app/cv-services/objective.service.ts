import { Injectable } from '@angular/core';
import {HttpClient, HttpHeaders} from '@angular/common/http';
import {Observable} from 'rxjs/Observable';
import 'rxjs/add/operator/catch';
import 'rxjs/add/observable/throw';
import 'rxjs/add/operator/take';
import {ExportUrlService} from '../shared-services/export-url.service';

@Injectable()
export class ObjectiveService {
  url = '';

  constructor(private  http: HttpClient , private privateSharedURL: ExportUrlService) {
    this.privateSharedURL.publicUrl.take(1).subscribe(data => {
      this.url = data + 'objective';
    });
  }

  addObjective(objective , resumeId?) {

    const body = JSON.stringify({
        'resume_id': resumeId,
        'description': objective.description,
      }
    );

    let headers = new HttpHeaders().set('Content-Type', 'application/json');
    return this.http.post(this.url, body, {headers});
  }

  updateObjective (objective , objectiveId: number) {
    const body = JSON.stringify({
         'resume_id': objective.resume_id,
        'description': objective.description,
      }
    );

    let headers = new HttpHeaders().set('Content-Type', 'application/json');

    return this.http.put(this.url + '/' + objectiveId, body, {headers});

  }

  getObjective(resume_id: number) {
    let headers = new HttpHeaders().set('Content-Type', 'application/json');
    return this.http.get(this.url + '/' + resume_id, {headers});
  }

}
