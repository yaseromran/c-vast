import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ReumeComponent } from './reume.component';

describe('ReumeComponent', () => {
  let component: ReumeComponent;
  let fixture: ComponentFixture<ReumeComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ReumeComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ReumeComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
