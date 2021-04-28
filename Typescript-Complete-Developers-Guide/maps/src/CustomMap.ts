export interface Mappable {
  location: google.maps.LatLngLiteral;
  content(): string;
}

export class CustomMap {
  private googleMap: google.maps.Map;

  constructor(divId: string) {
    this.googleMap = new google.maps.Map(document.getElementById(divId), {
      zoom: 1,
      center: {
        lat: 0,
        lng: 0
      }
    });
  }

  addMarker(mappable: Mappable): void {
    const marker = new google.maps.Marker({
      map: this.googleMap,
      position: mappable.location
    });

    marker.addListener('click', () => {
      const InfoWindow = new google.maps.InfoWindow({
        content: mappable.content()
      });

      InfoWindow.open(this.googleMap, marker);
    })

  }


}