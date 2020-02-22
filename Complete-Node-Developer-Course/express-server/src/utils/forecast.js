const request =  require('request');

// Weather API
const forecast = (lat, lng, callback) => {
    const url = `https://api.darksky.net/forecast/5e9488a125396a8eaf3b43e5a6e6b656/${lat},${lng}`;
    request({ url, json: true }, (error, { body }) => {
        if (error) {
            callback("Unable to connect to weather service!");
        } else if (body.error) {
            callback('Unable to find forecast for location.');
        } else {
            callback(undefined, `${body.daily.data[0].summary}. It is currently ${body.currently.temperature} degrees with a ${body.currently.precipProbability}% chance of rain.`);
        }
    });
};

module.exports = forecast;