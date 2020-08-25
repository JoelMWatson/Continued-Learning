const express = require('express');
const mongoose = require('mongoose');
const auth = require('../middlewares/auth');
const Track = mongoose.model('Track');

const router = express.Router();

router.use(auth);

router.get('/tracks', async (req, res) => {
  const tracks = await Track.find({ userId: req.user._id });
  res.send(tracks);
});

router.post('/tracks', async (req, res) => {
  const { name, locations } = req.body;
  if (!name || !locations) return res.status(400).send('Rubbish!');
  try {
    const track = await Track.create({ userId: req.user._id, name, locations });
    res.send(track);
  } catch (error) {
    return res.status(400).send('Rubbish!');
  }
});

module.exports = router;
