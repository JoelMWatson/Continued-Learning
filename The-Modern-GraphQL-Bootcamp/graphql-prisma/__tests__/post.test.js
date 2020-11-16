import 'core-js';
import 'regenerator-runtime/runtime';
import 'cross-fetch/polyfill';

import prisma from '../src/prisma';
import seedDatabase, { userOne, postOne, postTwo } from './utils/seedDatabase';
import getClient from './utils/getClient';
import {
  getPosts,
  myPosts,
  updatePost,
  createPost,
  deletePost,
} from './utils/operations';

// Create a client
const client = getClient();

// Seed database
beforeEach(seedDatabase);

it('Should expose published posts', async () => {
  const { data } = await client.query({ query: getPosts });

  expect(data.posts.length).toBe(1);
  expect(data.posts[0].published).toBeTruthy();
});

it('Should expose all posts for user', async () => {
  const client = getClient(userOne.jwt);

  const { data } = await client.query({ query: myPosts });

  expect(data.myPosts.length).toBe(2);
});

it('Should be able to update own post', async () => {
  const client = getClient(userOne.jwt);
  const variables = {
    id: postOne.post.id,
    data: {
      published: false,
    },
  };

  const { data } = await client.mutate({ mutation: updatePost, variables });
  const exists = await prisma.exists.Post({
    id: postOne.post.id,
    published: false,
  });

  expect(data.updatePost.published).toBeFalsy();
  expect(exists).toBeTruthy();
});

it('Should be able to create a post', async () => {
  const client = getClient(userOne.jwt);
  const variables = {
    data: {
      title: 'Third Post',
      body: 'This is the third post for this character',
      published: true,
    },
  };

  const { data } = await client.mutate({ mutation: createPost, variables });

  expect(data.createPost.title).toBe('Third Post');
});

it('Should be able to delete own post', async () => {
  const client = getClient(userOne.jwt);
  const variables = {
    id: postTwo.post.id,
  };

  await client.mutate({ mutation: deletePost, variables });
  const exists = await prisma.exists.Post({ id: postTwo.post.id });

  expect(exists).toBeFalsy();
});

// More Tests
// Should not be able to update another users post

// Should not be able to delete another users post

// Should require authentication to create a post (could add for update and delete too)

// Should fetch published post by id

// Should fetch own post by id

// Should not fetch draft post from other user
