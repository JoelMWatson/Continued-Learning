const express = require('express');
const { randomBytes } = require('crypto');
const cors = require('cors');
const axios = require('axios');

const app = express();

const commentsByPostId = {};

app.use(express.json());
app.use(cors());

app.get('/posts/:id/comments', (req, res) => {
  res.send(commentsByPostId[req.params.id] || []);
});

app.post('/events', async (req, res) => {
  const { type, data } = req.body;

  if (type === 'CommentModerated') {
    const { id, postId, content, status } = data;
    const comments = commentsByPostId[postId];
    const comment = comments.find(comment => {
      return comment.id === id;
    });
    comment.status = status;
    
    try {
      await axios.post('http://localhost:4005/events', {
        type: 'CommentUpdated',
        data: {
          id, postId, content, status
        }
      });
    } catch (e) {
      console.log('oof');
    }
  }
  res.send({});
})

app.post('/posts/:id/comments', async (req, res) => {
  const postId = req.params.id;
  const id = randomBytes(4).toString('hex');
  const { content } = req.body;
  if (!commentsByPostId[postId]) commentsByPostId[postId] = []
  commentsByPostId[postId].push({ id, content, status: "pending" });
  try {
    await axios.post('http://localhost:4005/events', {
      type: 'CommentCreated', data: {
        id,
        postId,
        content,
        status: 'pending'
      }
    })
  } catch (e) {
    console.log(e.message)
  }
  res.status(201).send({id, content})
});

app.listen(4001, () => {
  console.log('listening on 4001');
});