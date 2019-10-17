import { Injectable } from '@angular/core';
import {BehaviorSubject} from 'rxjs/BehaviorSubject';


@Injectable()
export class TopToSideSignalService {

  private changeCss = new BehaviorSubject<any>(null) ;
  cssValue = this.changeCss.asObservable();

  constructor() { }

  passCollapseEvent(active: any) {
    this.changeCss.next(active);
  }
}
