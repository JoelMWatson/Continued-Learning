const express = require('express');
const axios = require('axios');

const app = express();

app.use(express.json());

const events = [];

app.post('/events', (req, res) => {
  const event = req.body;

  events.push(event);

  axios.post('http://localhost:4000/events', event); // posts service
  axios.post('http://localhost:4001/events', event); // comments service
  axios.post('http://localhost:4002/events', event); // query service
  axios.post('http://localhost:4003/events', event); // moderation service

  res.send({ status: 'OK' });
});

app.get('/events', (req, res) => {
  res.send(events);
});

app.listen(4005, () => {
  console.log('Events listening on 4005');
});
