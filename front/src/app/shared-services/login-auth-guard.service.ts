import { Injectable } from '@angular/core';
import {Router} from '@angular/router';
import {AuthService} from './auth-service';
import {Location} from '@angular/common';
@Injectable()
export class LoginAuthGuardService {

  constructor(private auth: AuthService, private router: Router, private _location: Location) {}

  canActivate() {
    if (this.auth.loggedIn()) {
      this.router.navigate(['resumes']);
      return false;
    } else {
      return true;
    }
  }

}
