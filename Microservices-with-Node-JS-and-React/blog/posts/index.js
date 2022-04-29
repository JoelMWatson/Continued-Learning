const express = require('express');
const { randomBytes } = require('crypto');
const cors = require('cors');
const axios = require('axios');

const app = express();

app.use(express.json());
app.use(cors());
const posts = {};

// list posts
app.get('/posts', (req, res) => {
  res.send(posts);
});

app.post('/events', (req, res) => {
  console.log('YA:',req.body.type);
  res.send({});
})

// create post
app.post('/posts', (req, res) => {
  const id = randomBytes(4).toString('hex');
  const { title } = req.body;
  posts[id] = { id: id, title: title }
  try {
    axios.post('http://localhost:4005/events', { type: 'PostCreated', data: {...posts[id]}});
  } catch (e) {
    console.log(e.message);
  }

  res.status(201).send(posts[id]);
});

app.listen(4000, () => {
  console.log('Listening on 4000 :)');
});
