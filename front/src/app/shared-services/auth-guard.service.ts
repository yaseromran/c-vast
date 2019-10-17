import { Injectable } from '@angular/core';
import {AuthService} from './auth-service';
import {Router} from '@angular/router';

@Injectable()
export class AuthGuardService {

   constructor(private auth: AuthService, private router: Router) {}

  canActivate() {
    if (this.auth.loggedIn()) {
      return true;
    } else {
      this.router.navigate(['']);
      return false;
    }
  }
}
