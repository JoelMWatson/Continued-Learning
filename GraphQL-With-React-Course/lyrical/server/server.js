const express = require('express');
const models = require('./models');
const expressGraphQL = require('express-graphql');
const bodyParser = require('body-parser');
const schema = require('./schema/schema');

const { start, stop } = require('./db');

const app = express();

app.use(bodyParser.json());

start();

app.use(
  '/graphql',
  expressGraphQL({
    schema,
    graphiql: true,
  }),
);

const webpackMiddleware = require('webpack-dev-middleware');
const webpack = require('webpack');
const webpackConfig = require('../webpack.config.js');
app.use(webpackMiddleware(webpack(webpackConfig)));

module.exports = app;
