const express = require('express');
const multer = require('multer');
const sharp = require('sharp');

const User = require('../models/user');
const auth = require('../middleware/auth');
const { sendWelcomeEmail, sendCancellationEmail } = require('../emails/account');


// Create router
const router = new express.Router();

// Validates file uploads and saves as binary
const upload = multer({
    limits: {
        fileSize: 1000000 // bytes
    },
    fileFilter(req, file, cb) {
        if (!file.originalname.match(/\.(jpg|jpeg|png)$/)) {
            return cb(new Error('The file must be a word document'));
        }
        cb(undefined, true);
    }
});

// creates new user
router.post('/users', async (req, res) => {
    const user = new User(req.body);
    try {
        await user.save();
        sendWelcomeEmail(user.email, user.name);
        const token = await user.generateAuthToken();
        res.status(201).send({ user, token });
    } catch(error) {
        res.status(400).send(error);
    }
});

// Login
router.post('/users/login', async (req, res) => {
    try {
        const user = await User.findByCredentials(req.body.email, req.body.password);
        const token = await user.generateAuthToken();
        res.send({ user, token });
    } catch(error) {
        res.status(400).send();
    }
});

// log out current token
router.post('/users/logout', auth, async (req, res) => {
    try {
        req.user.tokens = req.user.tokens.filter((token) => {
            return token.token !== req.token;
        });
        await req.user.save();
        res.send();
    } catch(error) {
        res.status(500).send();
    }
});

// log out all tokens
router.post('/users/logoutAll', auth, async (req, res) => {
    try {
        req.user.tokens = [];
        await req.user.save();
        res.send();
    } catch(error) {
        res.status(500).send();
    }
});

// handle profile picture upload
router.post('/users/me/avatar', auth, upload.single('avatar'), async (req, res) => {
    const buffer = await sharp(req.file.buffer).resize({ width: 250, height: 250 }).png().toBuffer();
    req.user.avatar = buffer;
    await req.user.save();
    res.send();
}, (err, req, res, next) => {
    res.status(400).send({ error: err.message});
});

// get current user
router.get('/users/me', auth, async (req, res) => {
    res.send(req.user);
});

// handle fetching user avatar
router.get('/users/:id/avatar', async (req, res) => {
    try {
        const user = await User.findById(req.params.id);
        if (!user || !user.avatar) {
            throw new Error();
        }

        res.set('Content-Type', 'image/png');
        res.send(user.avatar);
    } catch(error) {
        res.status(404).send();
    }
});

// update user
router.patch('/users/me', auth, async (req, res) => {
    const updates = Object.keys(req.body);
    const allowedUpdates = ['name', 'email', 'password', 'age'];
    const isValidUpdate = updates.every((update) => allowedUpdates.includes(update));

    if (!isValidUpdate) {
        return res.status(400).send({ error: "Invalid Update"});
    }
    try {
        updates.forEach((update) => req.user[update] = req.body[update]);
        await req.user.save();
        res.send(req.user);
    } catch(error) {
        res.status(400).send();
    }
});

// delete user
router.delete('/users/me', auth, async (req, res) => {
    try {
        await req.user.remove();
        sendCancellationEmail(req.user.email, req.user.name);
        res.send(req.user);
    } catch(error) {
        res.status(500).send();
    }
});

// handle deleting profile picture upload
router.delete('/users/me/avatar', auth, async (req, res) => {
    req.user.avatar = undefined;
    await req.user.save();
    res.send();
});


module.exports = router;