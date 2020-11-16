import 'core-js';
import 'regenerator-runtime/runtime';
import 'cross-fetch/polyfill';

import prisma from '../src/prisma';
import seedDatabase, {
  userOne,
  postOne,
  commentOne,
  commentTwo,
} from './utils/seedDatabase';
import getClient from './utils/getClient';
import {
  deleteComment,
  subscribeToComments,
  subscribeToPosts,
} from './utils/operations';

// Create a client
const client = getClient();

// Seed database
beforeEach(seedDatabase);

it('Should delete own comment', async () => {
  const client = getClient(userOne.jwt);
  const variables = {
    id: commentTwo.comment.id,
  };

  await client.mutate({ mutation: deleteComment, variables });
  const exists = await prisma.exists.Comment({ id: commentTwo.comment.id });

  expect(exists).toBeFalsy();
});

it('Should not delete other users comment', async () => {
  const client = getClient(userOne.jwt);
  const variables = {
    id: commentOne.comment.id,
  };

  await expect(
    client.mutate({ mutation: deleteComment, variables }),
  ).rejects.toThrow();
});

it('Should subscribe to comments for a post', async (done) => {
  const variables = {
    postId: postOne.post.id,
  };
  client.subscribe({ query: subscribeToComments, variables }).subscribe({
    // runs every time a comment is created, deleted, or changed
    next(response) {
      // assertions will be wrong unless you configure your test with done param
      expect(response.data.comment.mutation).toBe('DELETED');

      // doesn't let the test end until done gets called
      done();
    },
  });

  // change a comment using prisma rather than client so we can isolate what we test here
  await prisma.mutation.deleteComment({ where: { id: commentOne.comment.id } });
});

it('Should subscribe to changes for published posts', async (done) => {
  client.subscribe({ query: subscribeToPosts }).subscribe({
    next(response) {
      expect(response.data.post.mutation).toBe('DELETED');
      done();
    },
  });

  await prisma.mutation.deletePost({ where: { id: postOne.post.id } });
});

// More Tests
// Should fetch post comments

// Should create a new comment

// Should not create comment on draft post

// Should update comment

// Should not update another users comment

// Should not delete another users comment

// Should require authentication to create a comment (could add for update and delete too)
