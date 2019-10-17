export class Place {


    city : string;
    governorate : string;
    country : string;
    streetAddress : string;
    postalCode : string;
    latitude : number;
    longitude: number;
    type: string;
    full: string;

    constructor(city?: string,
                governorate?: string,
                country?: string,
                streetAddress?: string,
                postalCode?: string,
                latitude?: number,
                longitude?: number,
                type?: string,
                full?: string) {
        this.city = city;
        this.governorate = governorate;
        this.country = country;
        this.streetAddress = streetAddress;
        this.postalCode = postalCode;
        this.latitude = latitude;
        this.longitude = longitude;
        this.type = type;
    }
}

