import { TestBed, inject } from '@angular/core/testing';

import { TopToSideSignalService } from './top-to-side-signal.service';

describe('TopToSideSignalService', () => {
  beforeEach(() => {
    TestBed.configureTestingModule({
      providers: [TopToSideSignalService]
    });
  });

  it('should be created', inject([TopToSideSignalService], (service: TopToSideSignalService) => {
    expect(service).toBeTruthy();
  }));
});
