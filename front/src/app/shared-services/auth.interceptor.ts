import {HttpEvent, HttpHandler, HttpInterceptor, HttpParams, HttpRequest} from '@angular/common/http';
import {Observable} from 'rxjs/Observable';
import {Injectable} from '@angular/core';
import {AuthService} from './auth-service';

@Injectable()
export class AuthInterceptor implements HttpInterceptor {

  constructor(private authService: AuthService) {}
  intercept(req: HttpRequest<any>, next: HttpHandler): Observable<HttpEvent<any>> {

    // let newParams = new HttpParams({fromString: req.params.toString()});
    // newParams = newParams.append('t', this.authService.getToken());
    const copiedRequest = req.clone({

      // params: newParams,
        setHeaders: {
          Authorization: `Bearer ${this.authService.getToken()}`
        }

    });

    return next.handle(copiedRequest);
  }
}
