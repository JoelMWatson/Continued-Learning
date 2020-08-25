const jwt = require('jsonwebtoken');
const mongoose = require('mongoose');
const User = mongoose.model('User');
const secret = process.env.SECRET;

module.exports = (req, res, next) => {
  const { authorization } = req.headers;

  if (!authorization) {
    return res.status(401).send('Rubbish!');
  }

  const token = authorization.replace('Bearer ', '');
  jwt.verify(token, secret, async (err, payload) => {
    if (err) {
      return res.status(401).send('Rubbish!');
    }

    const { userId } = payload;
    const user = await User.findById(userId);
    req.user = user;
    next();
  });
};
