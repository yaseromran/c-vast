import { TestBed, inject } from '@angular/core/testing';

import { WorkExperiencesService } from './work-experiences.service';

describe('WorkExperiencesService', () => {
  beforeEach(() => {
    TestBed.configureTestingModule({
      providers: [WorkExperiencesService]
    });
  });

  it('should be created', inject([WorkExperiencesService], (service: WorkExperiencesService) => {
    expect(service).toBeTruthy();
  }));
});
