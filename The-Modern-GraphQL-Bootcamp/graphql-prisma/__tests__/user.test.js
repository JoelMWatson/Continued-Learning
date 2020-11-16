import 'core-js';
import 'regenerator-runtime/runtime';
import 'cross-fetch/polyfill';

import prisma from '../src/prisma';
import seedDatabase, { userOne } from './utils/seedDatabase';
import getClient from './utils/getClient';
import { createUser, login, getUsers, getProfile } from './utils/operations';

// Create a global client for file (no authentication)
const client = getClient();

// Seed database
beforeEach(seedDatabase);

it('Should create a new user', async () => {
  const variables = {
    data: {
      name: 'Joel',
      email: 'Joel@email.com',
      password: 'password',
    },
  };

  const { data } = await client.mutate({
    mutation: createUser,
    variables,
  });

  const exists = await prisma.exists.User({
    id: data.createUser.user.id,
  });

  expect(exists).toBeTruthy();
});

it('Should expose public author profiles', async () => {
  const { data } = await client.query({ query: getUsers });

  expect(data.users.length).toBe(2);
  expect(data.users[0].email).toBeNull();
  expect(data.users[0].name).toBe('Jen');
});

it('Should fail to log in with bad credentials', async () => {
  const variables = { email: 'Jim@email.com', password: 'akjhsdfkljhsadf' };

  await expect(client.mutate({ mutation: login, variables })).rejects.toThrow();
});

it('Should fail to create user with bad password', async () => {
  const variables = {
    data: { name: 'Joel', email: 'Joel@email.com', password: 'pass' },
  };

  await expect(
    client.mutate({ mutation: createUser, variables }),
  ).rejects.toThrow();
});

it('Should fetch user profile', async () => {
  const client = getClient(userOne.jwt);

  const { data } = await client.query({ query: getProfile });

  expect(data.me.id).toBe(userOne.user.id);
  expect(data.me.name).toBe(userOne.user.name);
  expect(data.me.email).toBe(userOne.user.email);
});

// More Tests
// Should not signup a user with email that is already in use

// Should login and provide authentication token

// Should reject me query without authentication

// Should hide emails when fetching list of users
