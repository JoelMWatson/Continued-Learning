const express = require('express');
const axios = require('axios');

const app = express();

app.use(express.json());

app.post('/events', async (req, res) => {
  try {
    const {type, data} = req.body;

    if (type === 'CommentCreated') {
      const status = data.content.includes('orange') ? 'rejected' : 'approved';

      await axios.post('http://localhost:4005/events', {
        type: 'CommentModerated',
        data: {
          id: data.id, 
          postId: data.postId,
          content: data.content,
          status
        }
      });
    }
  } catch (e) {
    console.log(e.message);
  }

  res.send({})
});

app.listen(4003, () => {
  console.log('listening on 4003');
})