const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');
const redis = require('redis');
const { Pool } = require('pg');

const keys = require('./keys');

// ===============Express===============
const app = express();
app.use(cors());
app.use(bodyParser.json());

// ===============PostgreSQL===============
const pgClient = new Pool({
  user: keys.pgUser,
  host: keys.pgHost,
  database: keys.pgDatabase,
  password: keys.pgPassword,
  port: keys.pgPort,
});

pgClient.on('connect', () => {
  pgClient
    .query('CREATE TABLE IF NOT EXISTS values (number INT)')
    .catch((err) => console.log(err));
});

// ===============Redis===============
const redisClient = redis.createClient({
  host: keys.redisHost,
  port: keys.redisPort,
  retry_strategy: () => 1000,
});

// Dupe connection created for subscription as redis subscription connections
// cannot be used for anything else than listening
const redisPublisher = redisClient.duplicate();

// ===============Routes===============
app.get('/', (req, res) => {
  res.send('Hi');
});

app.get('/values/all', async (req, res) => {
  const values = await pgClient.query('SELECT * FROM values');
  res.send(values.rows);
});

app.get('/values/current', async (req, res) => {
  redisClient.hgetall('values', (err, values) => {
    res.send(values);
  });
});

app.post('/values', async (req, res) => {
  const index = req.body.index;

  // set a limit since we made this fib function run really slow
  if (parseInt(index) > 40) {
    return res.status(422).send('Index too high');
  }

  redisClient.hset('values', index, 'Nothing yet.');
  redisPublisher.publish('insert', index);
  pgClient.query('INSERT INTO values (number) VALUES ($1)', [index]);

  res.send({ working: true });
});

app.listen(5000, (err) => {
  if (!err) console.log('Listening on port 5000!');
});
