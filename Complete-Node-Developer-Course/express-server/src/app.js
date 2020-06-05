// --------- CORE ---------
const path = require('path');

// --------- NPM ---------
const express = require('express');

// --------- MY Files ---------
const geocode = require('./utils/geocode');
const forecast = require('./utils/forecast');

// --------- PATHS ---------
const pub = path.join(__dirname, "../public");
const views = path.join(__dirname, "../views");

// --------- APP ---------
const app = express();
const port = process.env.PORT || 3000;

// Set EJS for templating
app.set('view engine', 'ejs');
app.set('views', views);

// --------- ROUTING ---------
app.use(express.static(pub));
app.get('/', (req, res) => {
    res.render('./templates/index', {
        title: "Weather",
        message: "Weather information here"
    });
});

app.get('/about', (req, res) => {
    res.render('./templates/about', {
        title: "About Me",
        name: 'Joel Watson'
    });
});

app.get('/help', (req, res) => {
    res.render('./templates/help', {
        title: "Help",
        message: 'This is a helpful message!'
    });
});

// default API
app.get('/api', (req, res) => {
    if (!req.query.address) {
        return res.send({
            error: "No address provided"
        });
    };

    geocode(req.query.address, (error, {loc, lat, lng} = {}) => {
        if (error) {
            return res.send({ error });
        }

        forecast(lat, lng, (error, forecastData) => {
            if (error) {
                return res.send({ error });
            }

            res.send({
                forecast: forecastData,
                location: loc,
                address: req.query.address
            });

        });
    });
});

// default 404 if not routed yet
app.get('*', (req, res) => {
    res.render('./templates/404', {
        title: "404",
        message: "Page not found"
    });
});

// Start the app
app.listen(port, () => {
    console.log(`Server started correctly listening on port ${port}`);
});