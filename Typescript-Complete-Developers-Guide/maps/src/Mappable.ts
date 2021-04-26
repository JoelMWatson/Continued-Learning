export interface Mappable {
  location: google.maps.LatLngLiteral;
  content(): string;
}