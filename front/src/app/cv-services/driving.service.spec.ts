import { TestBed, inject } from '@angular/core/testing';

import { DrivingService } from './driving.service';

describe('DrivingService', () => {
  beforeEach(() => {
    TestBed.configureTestingModule({
      providers: [DrivingService]
    });
  });

  it('should be created', inject([DrivingService], (service: DrivingService) => {
    expect(service).toBeTruthy();
  }));
});
