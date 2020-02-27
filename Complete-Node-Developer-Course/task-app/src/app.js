const express = require('express');

require("./database/mongoose"); // runs this
const userRouter = require('./routers/user');
const taskRouter = require('./routers/task');

const app = express();

// parses incoming json
app.use(express.json());
app.use(userRouter);
app.use(taskRouter);

module.exports = app;