const moment = require('moment');

const renderMessage = (message, username, emitter, app) => {
    app.render('./partials/message', {
        createdAt: moment(new Date().getTime()).format('h:mm a'),
        message,
        username
    }, (err, html) => {
        emitter.emit('message', html);
    });
};

const renderLocation = (location, username, emitter, app) => {
    app.render('./partials/location', {
        createAt: moment(new Date().getTime()).format('h:mm a'),
        url: `https://google.com/maps?g=${location.lat},${location.lng}`,
        username
    }, (err, html) => {
        emitter.emit('message', html);
    });
};

const renderUserList = (room, users, emitter, app) => {
    app.render('./partials/sidebar', {
        room,
        users
    }, (err, html) => {
        emitter.emit('room-data', html);
    });
};

module.exports = {
    renderMessage,
    renderLocation,
    renderUserList
};