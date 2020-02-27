const request = require('supertest');

const app = require("../src/app");
const User = require('../src/models/user');
const { DEF_USER_IDS, DEF_USERS, setupDatabase } = require('./fixtures/db');

beforeEach(setupDatabase);

// tests create user
test('should sign up a new user', async () => {
    const response = await request(app).post('/users')
        .send({
            name: 'Joel Test',
            email: 'joel@example.com',
            password: 'MyPass666!'
        })
        .expect(201);

    // assert that database changed correctly
    const user = await User.findById(response.body.user._id);
    expect(user).not.toBeNull();

    // assert about response
    expect(response.body).toMatchObject({
        user: {
            name: 'Joel Test',
            email: 'joel@example.com',
        },
        token: user.tokens[0].token
    });

    // did password hash correctly
    expect(user.password).not.toBe('MyPass666!');
});

// tests login success
test('should log in existing user', async () => {
    const response = await request(app).post('/users/login')
        .send({
            email: DEF_USERS[0].email,
            password: DEF_USERS[0].password
        })
        .expect(200);
    const user = await User.findById(response.body.user._id);
    expect(response.body.token).toBe(user.tokens[1].token);
});

// tests login failure
test('should fail to log in', async () => {
    await request(app).post('/users/login')
        .send({
            email: DEF_USERS[0].email,
            password: 'badCredentials'
        })
        .expect(400);
});

// tests fetch profile success
test('should retrieve profile for user', async () => {
    await request(app).get('/users/me')
        .set('Authorization', `Bearer ${DEF_USERS[0].tokens[0].token}`)
        .send()
        .expect(200);
});

// tests fetch profile fail
test('should not get profile for unauthenticated user', async () => {
    await request(app).get('/users/me')
        .send()
        .expect(401);
});

// tests delete user success
test('should delete account for user', async () => {
    await request(app).delete('/users/me')
        .set('Authorization', `Bearer ${DEF_USERS[0].tokens[0].token}`)
        .send()
        .expect(200);

    const user = await User.findById(DEF_USER_IDS[0]);
    expect(user).toBeNull();
});

// tests delete user failure
test('should not delete account for unauthenticated user', async () => {
    const response = await request(app).delete('/users/me')
        .send()
        .expect(401);
});

// tests avatar image upload success
test('should upload avatar image', async () => {
    await request(app).post('/users/me/avatar')
        .set('Authorization', `Bearer ${DEF_USERS[0].tokens[0].token}`)
        .attach('avatar', 'tests/fixtures/avatar.jpg')
        .expect(200);
    const user = await User.findById(DEF_USER_IDS[0]);
    expect(user.avatar).toEqual(expect.any(Buffer)); //true if it is a buffer
});

// tests user update success
test('should update valid user fields', async () => {
    await request(app).patch('/users/me')
        .set('Authorization', `Bearer ${DEF_USERS[0].tokens[0].token}`)
        .send({ name: 'Frank' })
        .expect(200);
    const user = await User.findById(DEF_USER_IDS[0]);
    expect(user.name).toEqual('Frank');
});

// tests user update failure
test('should not update invalid user fields', async () => {
    await request(app).patch('/users/me')
        .set('Authorization', `Bearer ${DEF_USERS[0].tokens[0].token}`)
        .send({ location: 'seattle' })
        .expect(400)
});

//
// User Test Ideas
//
// Should not signup user with invalid name/email/password
// Should not update user if unauthenticated
// Should not update user with invalid name/email/password
// Should not delete user if unauthenticated
