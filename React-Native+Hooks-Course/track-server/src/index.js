require('dotenv').config();
require('./models/User');
require('./models/Track');
const express = require('express');
const mongoose = require('mongoose');
const authRoutes = require('./routes/authRoutes');
const trackRoutes = require('./routes/trackRoutes');
const auth = require('./middlewares/auth');

const port = process.env.PORT;
const uri = process.env.URI;

mongoose.connect(uri, {
  useNewUrlParser: true,
  useCreateIndex: true,
  useUnifiedTopology: true,
});
mongoose.connection.on('connected', () => {
  console.log('Connected to DB');
});
mongoose.connection.on('error', () => {
  console.log('Error connecting to DB');
});

const app = express();
app.use(express.json());
app.use(authRoutes);
app.use(trackRoutes);
app.get('/', auth, (req, res) => {
  res.send(`Your email: ${req.user.email}`);
});
app.listen(port, () => {
  console.log(`Listening on port ${port}`);
});
