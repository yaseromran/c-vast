import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { PersonalInformationPreviewComponent } from './personal-information-preview.component';

describe('PersonalInformationPreviewComponent', () => {
  let component: PersonalInformationPreviewComponent;
  let fixture: ComponentFixture<PersonalInformationPreviewComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ PersonalInformationPreviewComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(PersonalInformationPreviewComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
