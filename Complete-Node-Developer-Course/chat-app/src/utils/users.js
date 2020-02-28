const users = [];

// Add User
const addUser = ({id, username, room}) => {
    // clean data
    username = username.trim().toLowerCase();
    room = room.trim().toLowerCase();

    // validate data
    if (!username || !room) {
        return {
            error: 'Username and room are required'
        }
    }

    // check if exists
    const exists = users.find((user) => {
        return user.room === room && user.username === username;
    });

    // validate user
    if (exists) {
        return {
            error: 'Username already in use'
        }
    }

    // store the user
    const user = { id, username, room };
    users.push(user);
    return { user };
};

// Remove User
const removeUser = (id) => {
    const index = users.findIndex((user) => user.id === id);

    if (index !== -1) {
        return users.splice(index, 1)[0];
    }
};

// Get User
const getUser = (id) => {
    return users.find((user) => user.id === id);
};

// Get Users In Room
const getUsersInRoom = (room) => {
    return users.filter((user) => user.room === room);
};

module.exports = {
    addUser,
    removeUser,
    getUser,
    getUsersInRoom
}