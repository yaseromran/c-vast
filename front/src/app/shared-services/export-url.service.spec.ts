import { TestBed, inject } from '@angular/core/testing';

import { ExportUrlService } from './export-url.service';

describe('ExportUrlService', () => {
  beforeEach(() => {
    TestBed.configureTestingModule({
      providers: [ExportUrlService]
    });
  });

  it('should be created', inject([ExportUrlService], (service: ExportUrlService) => {
    expect(service).toBeTruthy();
  }));
});
