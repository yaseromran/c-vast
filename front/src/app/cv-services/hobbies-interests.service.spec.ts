import { TestBed, inject } from '@angular/core/testing';

import { HobbiesInterestsService } from './hobbies-interests.service';

describe('HobbiesInterestsService', () => {
  beforeEach(() => {
    TestBed.configureTestingModule({
      providers: [HobbiesInterestsService]
    });
  });

  it('should be created', inject([HobbiesInterestsService], (service: HobbiesInterestsService) => {
    expect(service).toBeTruthy();
  }));
});
