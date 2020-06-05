const path = require('path');
const express = require('express');

const router = new express.Router();

router.get('/', (req, res) => {
    res.render('./pages/index', { title: "Join - Chat App" });
});

router.get('/chat', (req, res) => {
    res.render('./pages/chat', { title: "Chat App" });
});

module.exports = router;