// Demo "data from db"
const users = [
  {
    id: '54321',
    name: 'Hammy Man',
    email: 'Example@mail.com',
  },
  {
    id: '12345',
    name: 'Joel',
    email: 'Example@mail.com',
    age: 28,
  },
];
const posts = [
  {
    id: '333333',
    title: 'GraphQL Demo',
    body: 'Hammy Man',
    published: true,
    author: '54321',
  },
  {
    id: '111111',
    title: 'GraphQL DOOmn',
    body: 'I like foods',
    published: false,
    author: '54321',
  },
  {
    id: '222222',
    title: 'asdfasdf',
    body: 'Pizza',
    published: true,
    author: '12345',
  },
];

const comments = [
  {
    id: '1',
    text: 'Comment 1',
    author: '12345',
    post: '333333',
  },
  {
    id: '2',
    text: 'Comment 2',
    author: '12345',
    post: '333333',
  },
  {
    id: '3',
    text: 'Comment 3',
    author: '54321',
    post: '111111',
  },
  {
    id: '4',
    text: 'Comment 4',
    author: '54321',
    post: '222222',
  },
];

const db = {
  users,
  posts,
  comments,
};

export default db;
