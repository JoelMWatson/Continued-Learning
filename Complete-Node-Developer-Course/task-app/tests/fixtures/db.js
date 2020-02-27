const mongoose = require('mongoose');
const jwt = require('jsonwebtoken');
const User = require('../../src/models/user');
const Task = require('../../src/models/task');

const DEF_USER_IDS = [
    new mongoose.Types.ObjectId(),
    new mongoose.Types.ObjectId()
];
const DEF_USERS = [
    {
        _id: DEF_USER_IDS[0],
        name: 'Mike',
        email: 'mike@example.com',
        password: '56what!!',
        tokens: [{
            token: jwt.sign({_id: DEF_USER_IDS[0]}, process.env.JWT_SECRET)
        }]
    },{
        _id: DEF_USER_IDS[1],
        name: 'Jess',
        email: 'jess@example.com',
        password: '5shwasty!',
        tokens: [{
            token: jwt.sign({_id: DEF_USER_IDS[1]}, process.env.JWT_SECRET)
        }]
    }
];

const DEF_TASKS = [
    {
        _id: new mongoose.Types.ObjectId(),
        description:'First test for user 1',
        completed: false,
        user: DEF_USERS[0]._id
    },{
        _id: new mongoose.Types.ObjectId(),
        description:'Second test for user 1',
        completed: false,
        user: DEF_USERS[0]._id
    },{
        _id: new mongoose.Types.ObjectId(),
        description:'First test for user 2',
        completed: false,
        user: DEF_USERS[1]._id
    },{
        _id: new mongoose.Types.ObjectId(),
        description:'Second test for user 2',
        completed: false,
        user: DEF_USERS[1]._id
    }
];

const setupDatabase = async () => {
    await User.deleteMany();
    await Task.deleteMany();
    await new User(DEF_USERS[0]).save();
    await new User(DEF_USERS[1]).save();
    await new Task(DEF_TASKS[0]).save();
    await new Task(DEF_TASKS[1]).save();
    await new Task(DEF_TASKS[2]).save();
    await new Task(DEF_TASKS[3]).save();
};

module.exports = {
    DEF_USER_IDS,
    DEF_USERS,
    DEF_TASKS,
    setupDatabase
};