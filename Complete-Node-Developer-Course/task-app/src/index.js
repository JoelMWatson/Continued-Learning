const express = require('express');
const dotenv = require('dotenv').config({ path: '/config/.env' });

require("./database/mongoose"); // runs this
const userRouter = require('./routers/user');
const taskRouter = require('./routers/task');

const app = express();
const port =  process.env.PORT;

// parses incoming json
app.use(express.json());
app.use(userRouter);
app.use(taskRouter);

app.listen(port, () => {
    console.log(`Server is up on port ${port}`)
});