const path = require('path');
const fs = require('fs');

const solc = require('solc');

const inboxPath = path.resolve(__dirname, 'contracts', 'Inbox.sol');
const source = fs.readFileSync(inboxPath, 'utf-8');

var input = {
  language: 'Solidity',
  sources: {
    'Inbox.sol': {
      content: source,
    },
  },
  settings: {
    outputSelection: {
      '*': {
        '*': ['*'],
      },
    },
  },
};

// stupid required callback I dont currently understand
function findImports(path) {
  return;
}

// New syntax (supported from 0.5.12, mandatory from 0.6.0)
var output = JSON.parse(
  solc.compile(JSON.stringify(input), { import: findImports }),
);

// Interface (.abi) & Bytecode (.evm.bytecode.object)
// console.log(output.contracts['Inbox.sol'].Inbox.abi);
// console.log(output.contracts['Inbox.sol'].Inbox.evm.bytecode.object);

// export the inbox contract object
module.exports = output.contracts['Inbox.sol'].Inbox;
