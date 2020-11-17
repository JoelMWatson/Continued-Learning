// This Fixes: ReferenceError: regeneratorRuntime is not defined
require('core-js');
require('regenerator-runtime/runtime');

module.exports = async () => {
  await global.httpServer.close();
};
