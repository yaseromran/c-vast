import { Component, OnInit } from '@angular/core';
import {FormControl, FormGroup, Validators} from '@angular/forms';
import {AuthService} from '../shared-services/auth-service';
import {Router} from '@angular/router';
import {HttpClient, HttpHeaders} from '@angular/common/http';

import {
  AuthService as SocialAuthService,
  FacebookLoginProvider,
  GoogleLoginProvider
} from 'angular5-social-login';



@Component({
  selector: 'login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {
  emailPattern = '^[a-z0-9._%+-]+@[a-z0-9.-]+[.]+[a-z]{2,4}$';
  loginForm = new FormGroup({
    email: new FormControl(null, Validators.required),
    password: new FormControl(null, Validators.required),
  });


  constructor(private authService: AuthService,
              private http:HttpClient,
              private router: Router,
              private socialAuthService: SocialAuthService
  ) { }

  ngOnInit() {
  }

  login(){
    const data = {
      'email' : this.loginForm.get('email').value,
      'password' : this.loginForm.get('password').value,
    } ;

    this.authService.login(data).subscribe(data => {
      localStorage.setItem('token',data['access_token']);
      this.router.navigate(['resumes']);

      });
  }

  public facebookLogin() {
    let socialPlatformProvider = FacebookLoginProvider.PROVIDER_ID;
    this.socialAuthService.signIn(socialPlatformProvider).then(
      (userData) => {
        // this will return user data from facebook. What you need is a user token which you will send it to the server
        // this.sendToRestApiMethod(userData.token);
        console.log(userData);
          let headers = new HttpHeaders().set('Content-Type', 'application/json');

          this.http.post('http://127.0.0.1:8000/signfacebook',JSON.stringify( userData), {headers})
              .subscribe(data => {
                  console.log((data));
                  localStorage.setItem('token',data['access_token']);
                  this.router.navigate(['resumes']);

              });
      }
    );
  }
  
  public signinWithGoogle () {
    let socialPlatformProvider = GoogleLoginProvider.PROVIDER_ID;
  
    this.socialAuthService.signIn(socialPlatformProvider)
      .then((userData) => {
        //userData.getAuthResponse().id_token;
        // on success
        // this will return user data from google. What you need is a user token which you will send it to the server
        // this.sendToRestApiMethod(userData.idToken);
        console.log('//////////////////////////////');
        console.log(userData);
        console.log('//////////////////////////////');
        let headers = new HttpHeaders().set('Content-Type', 'application/json');
        this.http.post('http://127.0.0.1:8000/signGoogle',JSON.stringify( userData), {headers})
            .subscribe(data => {
             console.log((data));
              localStorage.setItem('token',data['access_token']);
              this.router.navigate(['resumes']);
             /* this.authService.login( '').subscribe(data => {


              });*/
            });

        //console.log(userData.id_token);
      });
  }
  public signout () {
    this.socialAuthService.signOut();
  }
  // sendToRestApiMethod(token: string) : void {
    // this.http.post('url to facebook login here', { token: token }
    // .subscribe(onSuccess => {
      // // login was successful
      // // save the token that you got from your REST API in your preferred location i.e.
	  // // as a Cookie or LocalStorage as you do with normal login
    // }, onFail => {
      // // login was unsuccessful
      // // show an error message
    // });
  // }

  // sendToRestApiMethod(token: string) : void {
    // this.http.post("url to google login in your rest api",
      // {
        // token: token
      // }).subscribe(
        // onSuccess => {
      // // login was successful
      // // save the token that you got from your REST API in your preferred location
          // // i.e. as a Cookie or LocalStorage as you do with normal login
    // }, onFail => {
      // // login was unsuccessful
      // // show an error message
    // }
    // );
  // }

}
