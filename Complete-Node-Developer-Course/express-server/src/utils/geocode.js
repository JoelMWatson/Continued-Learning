const request = require("request");

// Geocoding API
const geocode = (address, callback) => {
    const url = `https://api.mapbox.com/geocoding/v5/mapbox.places/${encodeURIComponent(address)}.json?access_token=pk.eyJ1Ijoiam9lbHdhdHNvbiIsImEiOiJjazZsMzNuamQwNm5tM2RwZjdnbTRkZDliIn0.4r7MKxQpa-Q_26EKiu2ulQ&limit=1`;
    request({ url, json: true }, (error, { body }) => {
        if (error) {
            callback("Unable to connect to location service.");
        } else if (body.features.length === 0) {
            callback("Unable to find location.");
        } else {
            const geocode = {
                loc: body.features[0].place_name,
                lat: body.features[0].center[1],
                lng: body.features[0].center[0],

            };
            callback(undefined, geocode);
        }
    });
};

module.exports = geocode;