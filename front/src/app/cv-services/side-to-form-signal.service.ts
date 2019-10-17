import { Injectable } from '@angular/core';
import {BehaviorSubject} from 'rxjs/BehaviorSubject';


@Injectable()
export class SideToFormSignalService {

  private expandCss = new BehaviorSubject<any>(null) ;
  expandFormCss = this.expandCss.asObservable();

  constructor() { }

  expandAndCollapseForm(active: any) {
    this.expandCss.next(active);
  }
}
