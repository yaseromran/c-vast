export class Marker {
    name : string;
    lat : number;
    lng : number;
    draggable : boolean;
    zoom : number;

    constructor(name?: string, lat?: number, lng?: number, draggable?: boolean, zoom?: number) {
        this.name = name;
        this.lat = lat;
        this.lng = lng;
        this.draggable = draggable;
        this.zoom = zoom;
    }
}