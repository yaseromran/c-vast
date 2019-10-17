export class University {

    name: string;
    url: string;
    country : string;
    city : string;
    streetAddress : string;
    postalCode : string;
    description: string;
    latitude : number;
    longitude: number;

    constructor(name?: string,
                url?: string,
                country?: string,
                city?: string,
                streetAddress?: string,
                postalCode?: string,
                description?: string,
                latitude?: number,
                longitude?: number) {
        this.name = name;
        this.url = url;
        this.country = country;
        this.city = city;
        this.streetAddress = streetAddress;
        this.postalCode = postalCode;
        this.description = description;
        this.latitude = latitude;
        this.longitude = longitude;
    }
}

