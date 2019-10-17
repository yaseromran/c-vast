import { TestBed, inject } from '@angular/core/testing';

import { SectionsManagementService } from './sections-management.service';

describe('SectionsManagementService', () => {
  beforeEach(() => {
    TestBed.configureTestingModule({
      providers: [SectionsManagementService]
    });
  });

  it('should be created', inject([SectionsManagementService], (service: SectionsManagementService) => {
    expect(service).toBeTruthy();
  }));
});
