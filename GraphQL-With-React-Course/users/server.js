const express = require('express');
const { graphqlHTTP } = require('express-graphql');

const schema = require('./schema/schema');

const app = express();

// only use graphql for requests to '/graphql'
app.use(
  '/graphql',
  graphqlHTTP({
    graphiql: true,
    schema,
  }),
);

app.listen(4000, () => {
  console.log('Server listening on port 4000.');
});
