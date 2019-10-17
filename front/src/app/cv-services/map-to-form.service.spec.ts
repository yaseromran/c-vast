import { TestBed, inject } from '@angular/core/testing';

import { MapToFormService } from './map-to-form.service';

describe('MapToFormService', () => {
  beforeEach(() => {
    TestBed.configureTestingModule({
      providers: [MapToFormService]
    });
  });

  it('should be created', inject([MapToFormService], (service: MapToFormService) => {
    expect(service).toBeTruthy();
  }));
});
