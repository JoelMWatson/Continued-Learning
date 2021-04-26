/// <reference types="@types/googlemaps" />
import { User } from './User';
import { Company } from './Company';
import { CustomMap } from './CustomMap';

const map = new CustomMap('map');

const user = new User();
const company = new Company();

map.addMarker(user);
map.addMarker(company);

