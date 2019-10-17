import { Injectable } from '@angular/core';
import { BehaviorSubject } from 'rxjs/BehaviorSubject';

import { Place } from '../Models/place';

@Injectable()
export class MapToFormService {

  private mapData = new BehaviorSubject<Place>(null) ;
  personalMapData = this.mapData.asObservable();

  constructor() { }

  mapToForm(active : Place) {
    this.mapData.next(active);
  }

}