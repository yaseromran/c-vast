import { Injectable } from '@angular/core';

import { HttpClient } from '@angular/common/http';
import { HttpHeaders } from '@angular/common/http';

//declare var XDomainRequest;

@Injectable()
export class MapService {

  private PROXY_URL = 'https://cors-anywhere.herokuapp.com/';
  private API_KEY = 'AIzaSyC-kUEblRvoCisok3orhhnw3aMqZfPCdFo';
  //private PROXY_URL = '';

  constructor(private http: HttpClient) { }

  getLocation(lat : number, lng : number) {
    //return this.makeCORSRequest(`https://maps.googleapis.com/maps/api/geocode/json?latlng=${lat},${lng}&key=${this.API_KEY}`);
    return this.http.get(this.PROXY_URL + `https://maps.googleapis.com/maps/api/geocode/json?latlng=${lat},${lng}&key=${this.API_KEY}`);
  }

  getLocationId(input : string = 'Hama Street, Irbid, Jordan') {
    const URL = this.PROXY_URL + `https://maps.googleapis.com/maps/api/place/findplacefromtext/json?input=${input}&inputtype=textquery&key=${this.API_KEY}`;
    return this.http.get(URL);
  }

  getLocationDetails(placeId : string = 'ChIJnUfmW4R2HBURYxfF-r0STnI') {
    const URL = this.PROXY_URL + `https://maps.googleapis.com/maps/api/place/details/json?placeid=${placeId}&key=${this.API_KEY}`;
    return this.http.get(URL);
  }

  //getLocationViaXHR(lat : number, lng : number) {
  //  var data;
  //  let xhr = new XMLHttpRequest();
  //  xhr.open('GET', `https://maps.googleapis.com/maps/api/geocode/json?latlng=${lat},${lng}&key=${this.API_KEY}`, true);
  //  xhr.onreadystatechange = function () {
  //    data =  xhr.responseText;
  //  };
  //  console.log(xhr.onreadystatechange);
  //  console.log(xhr.onreadystatechange(data));
  //  xhr.send();
  //  alert(data);
  //  console.log(this.makeCORSRequest(`https://maps.googleapis.com/maps/api/geocode/json?latlng=${lat},${lng}&key=${this.API_KEY}`));
  //}


  //createCORSRequest(method, url) {
  //  let xhr = new XMLHttpRequest();
  //  if ("withCredentials" in xhr) {
  //    xhr.open(method, url, true);
  //    return xhr;
  //  }else if (typeof XDomainRequest != "undefined") {
  //    let xhr = new XDomainRequest();
  //    xhr.open(method, url);
  //    return xhr;
  //  }else {
  //    xhr = null;
  //    return xhr;
  //  }
  //}
  //
  //readBody(xhr) {
  //  let data;
  //  data = xhr.responseText;
  //  return data;
  //}
  //
  //makeCORSRequest(url: string) {
  //  // This is a sample server that supports CORS.
  //
  //  let xhr = this.createCORSRequest('GET', url);
  //  let result;
  //  if (!xhr) {
  //    alert('CORS not supported');
  //    return;
  //  }
  //
  //  // Response handlers.
  //  xhr.onload = function() {
  //    let text = xhr.responseText;
  //    console.log(JSON.parse(xhr.responseText));
  //    alert(xhr.responseText);
  //  };
  //
  //  xhr.onerror = function() {
  //    alert('Woops, there was an error making the request.');
  //  };
  //
  //  xhr.send();
  //  return xhr.responseText;
  //}

}
