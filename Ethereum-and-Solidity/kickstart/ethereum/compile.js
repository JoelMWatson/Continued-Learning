const path = require('path');
const solc = require('solc');
const fs = require('fs-extra'); // community made fs module with extra helpers

const buildPath = path.resolve(__dirname, 'build');

// clear old build dir
fs.removeSync(buildPath);

const campaignPath = path.resolve(__dirname, 'contracts', 'Campaign.sol');
const source = fs.readFileSync(campaignPath, 'utf8');

var input = {
  language: 'Solidity',
  sources: {
    'Campaign.sol': {
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

var output = JSON.parse(solc.compile(JSON.stringify(input))).contracts[
  'Campaign.sol'
];

// create build folder
fs.ensureDirSync(buildPath);

// compile contracts and save to /build folder
for (let contract in output) {
  fs.outputJsonSync(
    path.resolve(buildPath, contract + '.json'),
    output[contract],
  );
}
