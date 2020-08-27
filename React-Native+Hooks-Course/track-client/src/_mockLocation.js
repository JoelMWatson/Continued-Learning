import * as Location from 'expo-location';

const tenMetersWithDegrees = 0.0001;

// Createa a fake location that changes as it increments
const getLocaiton = (increment) => {
  return {
    timestamp: 1000000,
    coords: {
      speed: 0.0433109886944294,
      heading: 251.4493865966797,
      accuracy: 10.58899974822998,
      altitudeAccuracy: 5,
      altitude: 116.69999694824219,
      longitude: -122.1758079 + increment * tenMetersWithDegrees,
      latitude: 47.4078453 + increment * tenMetersWithDegrees,
    },
  };
};

let counter = 0;
setInterval(() => {
  // emit a location changed
  Location.EventEmitter.emit('Expo.locationChanged', {
    watchId: Location._getCurrentWatchId(),
    location: getLocaiton(counter),
  });
  counter++;
}, 1000);
