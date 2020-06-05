const request =  require('request');

// Weather API
const forcast = (geo, callback) => {
    const weatherURL = `https://api.darksky.net/forecast/5e9488a125396a8eaf3b43e5a6e6b656/${geo.lat},${geo.lng}`;
    request({ url: weatherURL, json: true }, (error, response) => {
        if (error) {
            callback("Unable to connect to weather service!");
        } else if (response.body.error) {
            callback('Unable to find forcast for location.');
        } else {
            callback(undefined, response.body);
        }
    });
};

module.exports = forcast;