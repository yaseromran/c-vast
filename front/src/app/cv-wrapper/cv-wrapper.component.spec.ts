import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { CvWrapperComponent } from './cv-wrapper.component';

describe('CvWrapperComponent', () => {
  let component: CvWrapperComponent;
  let fixture: ComponentFixture<CvWrapperComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ CvWrapperComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(CvWrapperComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
