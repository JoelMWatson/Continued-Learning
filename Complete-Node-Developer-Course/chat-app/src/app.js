const path = require('path');
const http = require('http');
const express = require('express');
const socketio = require('socket.io');
const Filter = require('bad-words');

const {
    renderMessage,
    renderLocation,
    renderUserList
} = require('./utils/renderers');
const {
    addUser,
    removeUser,
    getUser,
    getUsersInRoom
} = require('./utils/users');
const messageRouter = require('./routers/router');

const app = express();
const server = http.createServer(app);
const io = socketio(server);

app.set('view engine', 'ejs');
app.set('views', path.join(__dirname, "../views"));
app.use(express.static(path.join(__dirname, "../public")));

app.use(messageRouter);

io.on('connection', (socket) => {
    socket.on('join', ({username, room}, callback) => {
        const {error, user} = addUser({
            id: socket.id,
            username: username,
            room: room
        });
        const users = getUsersInRoom(user.room);

        if (error) {
            return callback(error);
        }

        socket.join(user.room);

        // welcome user & inform room of new user
        renderMessage(`Welcome, ${user.username}!`, "System", socket, app);
        renderMessage(`${user.username} has joined!`, 'System', socket.to(user.room).broadcast, app);
        renderUserList(user.room, users, io.to(user.room), app);
        callback();
    });

    socket.on('new-message', (message, callback) => {
        const user = getUser(socket.id);
        const filter = new Filter();

        if (filter.isProfane(message)) {
            return callback("Profanity is not allowed!")
        }
        renderMessage(message, user.username, io.to(user.room), app);
        callback();
    });

    socket.on('share-location', (location, callback) => {
        const user = getUser(socket.id);
        renderLocation(location, user.username, io.to(user.room), app);
        callback();
    });

    socket.on('disconnect', () => {
        const user = removeUser(socket.id);
        if (user) {
            renderMessage(`${user.username} has left!`, 'System', io.to(user.room), app);
            io.to(user.room).emit('room-data', {
                room: user.room,
                users: getUsersInRoom(user.room)
            });
        }
    });
});

module.exports = {
    app,
    server,
};