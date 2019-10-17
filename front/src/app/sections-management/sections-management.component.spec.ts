import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { SectionsManagementComponent } from './sections-management.component';

describe('SectionsManagementComponent', () => {
  let component: SectionsManagementComponent;
  let fixture: ComponentFixture<SectionsManagementComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ SectionsManagementComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(SectionsManagementComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
