import { Injectable } from '@angular/core';
import {HttpClient, HttpHeaders} from '@angular/common/http';
import {ExportUrlService} from '../shared-services/export-url.service';

@Injectable()
export class PortfoliosService {

  url = '';
  constructor(private http: HttpClient, private privateSharedURL: ExportUrlService) {
    this.privateSharedURL.publicUrl.take(1).subscribe(data => {
      this.url = data ;
    });
  }

  addPortfolio(portfolio) {
    let headers = new HttpHeaders().set('Content-Type', 'application/json');
    return this.http.post(this.url + '/portfolio', JSON.stringify(portfolio), {headers});
  }

  getPortfolios(resume_id: number) {
    let headers = new HttpHeaders().set('Content-Type', 'application/json');
    return this.http.get(this.url +'/resumes/'+  resume_id + '/portfolios', {headers});
  }

  deletePortfolio(portfolio_id: number) {
    let headers = new HttpHeaders().set('Content-Type', 'application/json');
    return this.http.delete(this.url +'/portfolio/'+  portfolio_id, {headers});
  }

  orderData(resume_id:number , orderedData){
    let headers = new HttpHeaders().set('Content-Type', 'application/json');
    console.log(orderedData);
    return this.http.post(this.url  +'/portfolios/order/'+resume_id, JSON.stringify(orderedData), {headers});
  }

  updatePortfolio(portfolio,portfolio_id: number) {
    let headers = new HttpHeaders().set('Content-Type', 'application/json');
    return this.http.put(this.url +'/portfolio/'+ portfolio_id, JSON.stringify(portfolio), {headers});
  }

  getPortfolio(portfolio_id : number){
    let headers = new HttpHeaders()
      .set('Content-Type','application/json');
    headers.set('Accept','application/json');


    return this.http.get(this.url + '/portfolios' + portfolio_id , {headers});

  }
}
