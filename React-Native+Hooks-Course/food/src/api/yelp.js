import axios from 'axios';

export default axios.create({
  baseURL: 'https://api.yelp.com/v3/businesses',
  headers: {
    Authorization:
      'Bearer hMYZEopcZhl6EVHkPaXo0EmzwSFvRVuWtMh2F7YYt_br969rzjq82vkKNmrEszeqerIJqfNCHOUT37jVPy1a1jp5KkyCrlkoMUhjVGgrApdi6nP2dnbKs2mVNsfQXnYx',
  },
});
