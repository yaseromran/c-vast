import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { ExportUrlService } from '../shared-services/export-url.service';

@Injectable()
export class LanguageService {

  url = '';
  dataUrl = '';
  constructor(private http: HttpClient, private privateSharedURL: ExportUrlService) {
    this.privateSharedURL.publicUrl.take(1).subscribe(data => {
      this.url = data + 'language';
      this.dataUrl = data + 'languageData';
    });
  }

  addLanguage(language) {
    let headers = new HttpHeaders().set('Content-Type', 'application/json');
    return this.http.post(this.url, JSON.stringify(language), {headers});
  }

  getLanguages(resume_id: number) {
    let headers = new HttpHeaders().set('Content-Type', 'application/json');
    return this.http.get(this.url + '/' +  resume_id, {headers});
  }

  getLanguagesData(resume_id: number) {
    let headers = new HttpHeaders().set('Content-Type', 'application/json');
    return this.http.get(this.dataUrl + '/' +  resume_id, {headers});
  }

  deleteLanguage(language_id: number) {
    let headers = new HttpHeaders().set('Content-Type', 'application/json');
    return this.http.delete(this.url + '/' +  language_id, {headers});
  }

  orderData(resume_id: number , orderedData) {
    let headers = new HttpHeaders().set('Content-Type', 'application/json');
    return this.http.post(this.url  + '/order/' + resume_id, JSON.stringify(orderedData), {headers});
  }

  updateLanguage(language, languageId: number) {
    let headers = new HttpHeaders().set('Content-Type', 'application/json');
    return this.http.put(this.url + '/' + languageId, JSON.stringify(language), {headers});
  }

}
