const express = require('express');
const axios = require('axios');
const { randomBytes } = require('crypto');
const cors = require('cors');

const app = express();

app.use(express.json());
app.use(cors());

// just using in memory object instead of db for this project
const posts = {};

app.get('/posts', (req, res) => {
  res.send(posts);
});

app.post('/posts', async (req, res) => {
  const id = randomBytes(4).toString('hex');
  const { title } = req.body;
  posts[id] = {
    id,
    title,
  };

  // emit event to events
  await axios.post('http://localhost:4005/events', {
    type: 'PostCreated',
    data: { id, title },
  });

  res.status(201).send(posts[id]);
});

app.post('/events', (req, res) => {
  console.log('Recieved Event', req.body.type);

  res.send({});
});

app.listen(4000, () => {
  console.log('Posts listening on 4000');
});
