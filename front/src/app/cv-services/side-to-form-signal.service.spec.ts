import { TestBed, inject } from '@angular/core/testing';

import { SideToFormSignalService } from './side-to-form-signal.service';

describe('SideToFormSignalService', () => {
  beforeEach(() => {
    TestBed.configureTestingModule({
      providers: [SideToFormSignalService]
    });
  });

  it('should be created', inject([SideToFormSignalService], (service: SideToFormSignalService) => {
    expect(service).toBeTruthy();
  }));
});
