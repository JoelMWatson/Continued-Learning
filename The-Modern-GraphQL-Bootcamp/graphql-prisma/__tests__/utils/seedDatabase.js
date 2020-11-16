import bcrypt from 'bcryptjs';
import jwt from 'jsonwebtoken';
import prisma from '../../src/prisma';

// this is a cool trick for access to objects from db & authentication
const userOne = {
  input: {
    name: 'Jen',
    email: 'Jen@email.com',
    password: bcrypt.hashSync('password'),
  },
  user: undefined,
  jwt: undefined,
};
const userTwo = {
  input: {
    name: 'Andrew',
    email: 'Andrew@email.com',
    password: bcrypt.hashSync('password'),
  },
  user: undefined,
  jwt: undefined,
};
const postOne = {
  input: {
    title: 'Post One',
    body: 'This is the first post I have made.',
    published: true,
  },
  post: undefined,
};
const postTwo = {
  input: {
    title: 'Post Two',
    body: 'This post is still a draft.',
    published: false,
  },
  post: undefined,
};
const commentOne = {
  input: {
    text: 'I think Post One is the best post on here',
  },
  comment: undefined,
};
const commentTwo = {
  input: {
    text: 'I second that',
  },
  comment: undefined,
};

const seedDatabase = async () => {
  // clean database before each test
  await prisma.mutation.deleteManyUsers();
  await prisma.mutation.deleteManyPosts();
  await prisma.mutation.deleteManyComments();

  // seed db with test data
  userOne.user = await prisma.mutation.createUser({
    data: userOne.input,
  });
  userOne.jwt = jwt.sign({ userId: userOne.user.id }, process.env.JWT_SECRET);
  userTwo.user = await prisma.mutation.createUser({
    data: userTwo.input,
  });
  userTwo.jwt = jwt.sign({ userId: userTwo.user.id }, process.env.JWT_SECRET);

  postOne.post = await prisma.mutation.createPost({
    data: {
      ...postOne.input,
      author: {
        connect: {
          id: userOne.user.id,
        },
      },
    },
  });
  postTwo.post = await prisma.mutation.createPost({
    data: {
      ...postTwo.input,
      author: {
        connect: {
          id: userOne.user.id,
        },
      },
    },
  });

  commentOne.comment = await prisma.mutation.createComment({
    data: {
      ...commentOne.input,
      post: {
        connect: {
          id: postOne.post.id,
        },
      },
      author: {
        connect: {
          id: userTwo.user.id,
        },
      },
    },
  });
  commentTwo.comment = await prisma.mutation.createComment({
    data: {
      ...commentTwo.input,
      post: {
        connect: {
          id: postOne.post.id,
        },
      },
      author: {
        connect: {
          id: userOne.user.id,
        },
      },
    },
  });
};

export { userOne, userTwo, postOne, postTwo, commentOne, commentTwo };
export default seedDatabase;
