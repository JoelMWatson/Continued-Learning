const express = require('express');
const mongoose = require('mongoose');
const jwt = require('jsonwebtoken');

const User = mongoose.model('User');
const secret = process.env.SECRET;
const router = express.Router();

router.post('/signup', async (req, res) => {
  const { email, password } = req.body;
  try {
    const user = await User.create({ email, password });
    const token = jwt.sign({ userId: user._id }, secret);
    res.send({ user, token });
  } catch (e) {
    return res.status(400).send('Rubbish!');
  }
});

router.post('/signin', async (req, res) => {
  const { email, password } = req.body;
  if (!email || !password) return res.status(400).send('rubbish!');
  const user = await User.findOne({ email });

  if (!user) return res.status(400).send('rubbish!');
  try {
    await user.comparePassword(password);
    const token = jwt.sign({ userId: user._id }, secret);
    res.send({ user, token });
  } catch (error) {
    console.log(error);
    return res.status(400).send('rubbish!');
  }
});

module.exports = router;
