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

const seedDatabase = async () => {
  // clean database before each test
  await prisma.mutation.deleteManyUsers();

  // seed db with test data
  userOne.user = await prisma.mutation.createUser({
    data: userOne.input,
  });
  userOne.jwt = jwt.sign({ userId: userOne.user.id }, process.env.JWT_SECRET);
  userTwo.user = await prisma.mutation.createUser({
    data: userTwo.input,
  });
  userTwo.jwt = jwt.sign({ userId: userTwo.user.id }, process.env.JWT_SECRET);
};

export { userOne, userTwo };
export default seedDatabase;
