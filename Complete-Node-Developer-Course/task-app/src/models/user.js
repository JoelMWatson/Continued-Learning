const mongoose = require('mongoose');
const validator = require('validator');
const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');

const Task = require("./task");

// Creates Schema
const userSchema = new mongoose.Schema({
    name: {
        type: String,
        required: true,
        trim: true
    },
    email: {
        type: String,
        unique: true,
        required: true,
        trim: true,
        lowercase: true,
        validate(value) {
            if (!validator.isEmail(value)) {
                throw new Error('Email invalid');
            }
        }
    },
    age: {
        type: Number,
        validate(value) {
            if (value < 0) {
                throw new Error('Age must be a positive number');
            }
        }
    },
    password: {
        type: String,
        required: true,
        trim: true,
        minlength: 7,
        validate(value) {
            if (value.toLowerCase().includes('password')) {
                throw new Error('password cannot contain the word "password"');
            }
        }
    },
    tokens: [{
        token: {
            type: String,
            required: true
        }
    }],
    avatar: {
        type: Buffer
    }
}, {
    timestamps: true,
});

// virtual is just for mongoose not actually stored in DB
userSchema.virtual('tasks', {
    ref: 'Task',
    localField: '_id',
    foreignField: 'user'
});

// .toJSON is called everytime the object is stringified (on .send())
userSchema.methods.toJSON = function() {
    const user = this;
    const userObject = user.toObject();

    // remove sensitive/large data
    delete userObject.password;
    delete userObject.tokens;
    delete userObject.avatar;

    return userObject;
};

// methods add functions to the instances themselves
userSchema.methods.generateAuthToken = async function() {
    const user = this;
    const token = jwt.sign({ _id: user._id.toString() }, process.env.JWT_SECRET, { expiresIn: '7 days'});
    user.tokens = user.tokens.concat({ token });
    await user.save();
    return token;
};

// statics add functions to the models
userSchema.statics.findByCredentials = async (email, password) => {
    const user = await User.findOne({ email });

    if (!user) {
        throw new Error('Unable to login');
    }
    const isMatch = await bcrypt.compare(password, user.password);

    if (!isMatch) {
        throw new Error('Unable to login');
    }
    return user;
};

// Add Middleware to Schema

// hash password before save
userSchema.pre('save', async function(next) {
    const user = this;
    if (user.isModified('password')) {
        this.password = await bcrypt.hash(user.password, 8);
    }
    next();
});

// delete tasks when user is deleted
userSchema.pre('remove', async function(next) {
    const user = this;

    await Task.deleteMany({ user: user._id });
    next();
});

const User = mongoose.model('User', userSchema);

module.exports = User;