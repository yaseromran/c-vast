import { TestBed, inject } from '@angular/core/testing';

import { FullPreviewService } from './full-preview.service';

describe('FullPreviewService', () => {
  beforeEach(() => {
    TestBed.configureTestingModule({
      providers: [FullPreviewService]
    });
  });

  it('should be created', inject([FullPreviewService], (service: FullPreviewService) => {
    expect(service).toBeTruthy();
  }));
});
