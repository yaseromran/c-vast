import { Component, OnInit } from '@angular/core';
import {AuthService} from '../shared-services/auth-service';

@Component({
  selector: 'top-navbar',
  templateUrl: './top-navbar.component.html',
  styleUrls: ['./top-navbar.component.css']
})
export class TopNavbarComponent implements OnInit {

  isCollapsed = true;

  constructor(private _authService:AuthService) { }

  authService = this._authService;
  logout(){
    this._authService.logout();
    
  }
  ngOnInit() {
  }

}
