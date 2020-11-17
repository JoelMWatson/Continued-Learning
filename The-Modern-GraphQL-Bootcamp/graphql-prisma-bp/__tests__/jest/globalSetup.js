require('@babel/register');
require('@babel/polyfill/noConflict');

const server = require('../../src/server').default; // weird ,default thing because of babel

module.exports = async () => {
  global.httpServer = await server.start({ port: 4000 });
};
