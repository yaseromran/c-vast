import { Component, OnInit, Input, ElementRef, NgZone, ViewChild, OnChanges, SimpleChanges } from '@angular/core';
import { FormControl } from '@angular/forms';
import { GoogleMapsAPIWrapper, MapsAPILoader } from '@agm/core';
import { } from 'googlemaps';
import { Subject } from 'rxjs';
import 'rxjs/add/operator/skip';

import { Marker } from '../Models/marker';
import { Location } from '../Models/location';
import { Place } from '../Models/place';

import { MapToFormService } from '../cv-services/map-to-form.service';
import { MapService } from '../cv-services/map.service';

@Component({
  selector: 'app-map',
  templateUrl: './map.component.html',
  styleUrls: ['./map.component.css']
})
export class MapComponent implements OnInit {

  myMarker : Marker;

  lat : number = 0;
  lng : number = 0;
  zoom: number = 10;
  draggable: boolean = true;
  city : string = "";
  governorate : string = "";
  country : string = "";
  postalCode : string = "";
  streetAddress : string = "";


  @Input("type") type : string;

  @Input("birthOrCurrent") birthOrCurrent : string;

  @Input("search") searchRef : ElementRef;

  @Input("sub") sub : Subject<any>;

  constructor(private mapService: MapService,
              private mapToFormService: MapToFormService,
              private mapsAPILoader: MapsAPILoader,
              private ngZone: NgZone) {

    this.myMarker = new Marker("My Current Location", this.lat, this.lng, true, this.zoom);

    navigator.geolocation.getCurrentPosition(
        (position) => {
        //  console.log("From Constructor : " + position.coords);
          this.lat = position.coords.latitude;
          this.lng = position.coords.longitude;
          this.myMarker = new Marker("My Current Location", this.lat, this.lng, true, this.zoom);
        //  console.log(this.myMarker);
          //this.setMarkerByCoordinates(position.coords.latitude, position.coords.longitude);
        }
    );
  }

  getPlaceIdByCoordinates(lat: number, lng: number) {
    return this.mapService.getLocation(lat, lng).toPromise().then(
        (data: Location) => {
          return data.results[0].place_id
        }
    );
  }

  getPlaceIdByAddress(address: string) {
    return this.mapService.getLocationId(address).toPromise().then(
        (data: Location) => {
          let placeId = data.candidates[0].place_id;
          return placeId;
        },
        (errors) => {
        //  console.log(errors);
        }
    );
  }

  getDetails(placeID) {
    return this.mapService.getLocationDetails(placeID.toString()).toPromise();
  }

  getParameters(placeId) {
    return this.getDetails(placeId).then(
        (data: Location) => {
       //   console.log(data);
          let result = data.result.address_components;
          let parameters : string[] = [];
          //console.log(result);
          for(let i in result) {
            let types = result[i].types;
            for(let j in types) {
              switch (types[j]) {
                case 'country' : parameters['country'] = result[i].long_name;
                  //console.log(this.country);
                  break;
                case 'locality' : parameters['city'] = result[i].long_name;
                  //console.log(this.city);
                  break;
                case 'administrative_area_level_2' : parameters['city'] = result[i].long_name;
                  //console.log(this.city);
                  break;
                case 'administrative_area_level_1' : parameters['governorate'] = result[i].long_name;
                  //console.log(this.governorate);
                  break;
                case 'route' : parameters['streetAddress'] = result[i].long_name;
                  //console.log(this.streetAddress);
                  break;
                case 'postal_code' : parameters['postalCode'] = result[i].long_name;
                  //console.log(this.postalCode);
                  break;
              }
            }
          }
          parameters['latitude'] = data.result.geometry.location.lat;
          parameters['longitude'] = data.result.geometry.location.lng;
          return parameters;
        }
    );
  }

  setAllParameters(placeId) {
    this.city = this.governorate = this.country = this.streetAddress = this.postalCode = "";
    return this.getParameters(placeId).then(
        (parameters) => {
          if(parameters['city']) {
            this.city = parameters['city'];
          }
          if(parameters['governorate']) {
            this.governorate = parameters['governorate'];
          }
          if(parameters['country']) {
            this.country = parameters['country'];
          }
          if(parameters['streetAddress']) {
            this.streetAddress = parameters['streetAddress'];
          }
          if(parameters['postalCode']) {
            this.postalCode = parameters['postalCode'];
          }
          if(parameters['latitude']) {
            this.lat = parameters['latitude'];
          }
          if(parameters['longitude']) {
            this.lng = parameters['longitude'];
          }
        }
    );
  }

  //setMarkerByCoordinates(lat: number, lng: number, eventType?: string) {
  //    console.log(lat + " " + lng);
  //
  //    this.lat = lat;
  //    this.lng = lng;
  //
  //    this.myMarker = new Marker("My current location", this.lat, this.lng, true, this.zoom);
  //    console.log(this.myMarker);
  //
  //    this.getPlaceIdByCoordinates(this.lat, this.lng).then(
  //        (placeId) => {
  //            this.setAllParameters(placeId).then(
  //                () => {
  //                    let place = new Place(this.city, this.governorate, this.country,
  //                        this.streetAddress, this.postalCode, this.lat, this.lng, this.type);
  //                    if(eventType) {
  //                        place.full = eventType;
  //                    }
  //
  //                    this.throwMapData(place);
  //                }
  //            );
  //        }
  //    );
  //}

  setMarkerByCoordinates(lat: number, lng: number, eventType?: string) {
    this.mapService.getLocation(lat, lng).subscribe(
        (data: Location) => {
       //   console.log(data);
          this.country = this.city = this.postalCode = this.streetAddress = this.governorate = "";
          //let parameters : string[] = [];
          for(let component of data.results[0].address_components) {
            //console.log(component);
            let types = component.types;
            for(let type of types) {
              switch (type) {
                case 'country' : this.country = component.long_name;
                  console.log(this.country);
                  break;
                case 'locality' : this.city = component.long_name;
                  console.log(this.city);
                  break;
                case 'administrative_area_level_2' : this.city = component.long_name;
                  console.log(this.city);
                  break;
                case 'administrative_area_level_1' : this.governorate = component.long_name;
                  console.log(this.governorate);
                  break;
                case 'route' : this.streetAddress = component.long_name;
                  console.log(this.streetAddress);
                  break;
                case 'postal_code' : this.postalCode = component.long_name;
                  console.log(this.postalCode);
                  break;
              }
            }
          }
          this.lat = lat;
          this.lng = lng;
          this.myMarker = new Marker("My current location", this.lat, this.lng, true, this.zoom);
          let place = new Place(this.city, this.governorate, this.country,
              this.streetAddress, this.postalCode, lat, lng, this.type);
          if(eventType) {
            place.full = eventType;
          }
          this.throwMapData(place);
        }
    );
  }

  setMarkerByPlaceId(placeId) {
    this.setAllParameters(placeId).then(
        () => {
          this.myMarker = new Marker("My current location", this.lat, this.lng, true, this.zoom);
          console.log(this.myMarker);
          let place = new Place(this.city, this.governorate, this.country,
              this.streetAddress, this.postalCode, this.lat, this.lng, this.type);

          this.throwMapData(place);
        }
    );
  }

  throwMapData(data: Place) {
    this.mapToFormService.mapToForm(data);
  }

  clickMap($event) {
    console.log($event);
  }

  clickMarker(marker : Marker) {
    console.log(marker);
  }

  markerDragEnd($event) {
    console.log("End");
    this.setMarkerByCoordinates($event.coords.lat, $event.coords.lng, "Dragging");
    console.log("latitude = " + this.lat + ", longitude = " + this.lng);
  }

  markerDragStart($event) {
    console.log("Start");
    let place = new Place(null, null, null, null, null, null, null, this.type, null);
    this.throwMapData(place);
  }

  map = null;

  mapReady($event) {
    this.map = $event;
//    console.log($event);
  }

  ngOnInit() {

    this.sub.subscribe(
        (coords) => {
//          console.log("From ngOnInit :" + coords);
          //this.lat = coords.lat;
          //this.lng = coords.lng;
          if(coords.lat && coords.lng) {
            this.setMarkerByCoordinates(Number(coords.lat), Number(coords.lng));
          }else {
            this.setMarkerByCoordinates(this.lat, this.lng);
          }
        }
    );

    // load Places Autocomplete
    this.mapsAPILoader.load().then(() => {
      let specificType = "address";
      if (this.birthOrCurrent == 'birth') {
        specificType = 'geocode';
      }  else if (this.birthOrCurrent == 'current') {
        specificType = 'address';
      }
      let autocomplete = new google.maps.places.Autocomplete(this.searchRef.nativeElement, {
        types: [specificType],
        // componentRestrictions: {country: ['sy']}
      });

      autocomplete.addListener("place_changed", () => {

        this.ngZone.run(() => {

          let place: google.maps.places.PlaceResult = autocomplete.getPlace();

          if (place.geometry === undefined || place.geometry === null) {
            this.getPlaceIdByAddress(this.searchRef.nativeElement.value).then(
                (placeId) => {
                //  console.log(placeId);
                  this.setMarkerByPlaceId(placeId);
                },
                (errors) => {
                  //console.log(errors);
                  this.lat = 0;
                  this.lng = 0;
                  let place1 = new Place("", "", "",
                      "", "", null, null, this.type);
                  this.throwMapData(place1);
                }
            );
          }else{

         //   console.log("Place latitude : " + place.geometry.location.lat() + ", Place longitude : " + place.geometry.location.lng());
            //console.log(this.searchRef.nativeElement.value);
            //console.log(place);
            this.country = this.city = this.postalCode = this.streetAddress = this.governorate = "";
            let parameters : string[] = [];
            for(let component of place.address_components) {
              //console.log(component);
              let types = component.types;
              for(let type of types) {
                switch (type) {
                  case 'country' : this.country = component.long_name;
                    break;
                  case 'locality' : this.city = component.long_name;
                    break;
                  case 'administrative_area_level_2' : this.city = component.long_name;
                    break;
                  case 'administrative_area_level_1' : this.governorate = component.long_name;
                    break;
                  case 'route' : this.streetAddress = component.long_name;
                    break;
                  case 'postal_code' : this.postalCode = component.long_name;
                    break;
                }
              }
            }
            this.lat = place.geometry.location.lat();
            this.lng = place.geometry.location.lng();
            let place1 = new Place(this.city, this.governorate, this.country,
                this.streetAddress, this.postalCode, place.geometry.location.lat(), place.geometry.location.lng(), this.type);
            this.throwMapData(place1);
            //this.setMarkerByCoordinates(place.geometry.location.lat(), place.geometry.location.lng());
          }
        });
      });
    });

  }

}
