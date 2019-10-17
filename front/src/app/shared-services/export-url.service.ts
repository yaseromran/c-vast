import { Injectable } from '@angular/core';
import {BehaviorSubject} from 'rxjs/BehaviorSubject';

@Injectable()
export class ExportUrlService {
  //   'http://cre-s.com/cvbackend6/public/'
  //   'http://localhost:8000/'
  private url = new BehaviorSubject<any>(  'http://localhost:8000/') ;
  publicUrl = this.url.asObservable();

  constructor() { }

  expandAndCollapseForm(active: any) {
    this.url.next(active);
  }

}
