import { Injectable } from '@angular/core';
import {HttpClient, HttpHeaders} from '@angular/common/http';
import {Router} from '@angular/router';
import {ExportUrlService} from './export-url.service';
import 'rxjs/add/operator/take';
import { tokenNotExpired } from 'angular2-jwt';
@Injectable()
export class AuthService {

    private url = '';
    private token = 'token';
  constructor(private http: HttpClient,
              private router: Router,
              private privateSharedURL: ExportUrlService) {

    this.privateSharedURL.publicUrl.take(1).subscribe(data => {
      this.url = data;
    });
  }



   loggedIn() {
     return tokenNotExpired(this.token);
   }

  getToken () {
    return localStorage.getItem(this.token);
  }

  login(data: any) {
    let token = this.getToken();
    let headers = new HttpHeaders().set('Content-Type', 'application/json');
    const body = JSON.stringify(  data );
    return this.http.post(this.url + 'auth/login', body, {headers});
  }

  isLoggedIn() {
    if (localStorage.getItem('token') != null)
      return true;
    else return false;
  }
  logout() {
    localStorage.removeItem('token');
    this.router.navigate(['']);
  }

}
