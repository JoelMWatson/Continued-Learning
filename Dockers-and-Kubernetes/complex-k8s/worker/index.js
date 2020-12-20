const redis = require('redis');

const keys = require('./keys');

const redisClient = redis.createClient({
  host: keys.redisHost,
  port: keys.redisPort,
  retry_strategy: () => 1000,
});
const sub = redisClient.duplicate();

// Using this slow recursive solution to "create the need" for the redis worker
function fib(index) {
  if (index < 2) return 1;
  return fib(index - 1) + fib(index - 2);
}

// Dupe connection created for subscription as redis subscription connections
// cannot be used for anything else than listening
sub.on('message', (channel, message) => {
  redisClient.hset('values', message, fib(parseInt(message)));
});

// subscribe
sub.subscribe('insert');
