const HDWalletProvider = require('truffle-hdwallet-provider');
const Web3 = require('web3');

const compiledFactory = require('./build/CampaignFactory.json');

const provider = new HDWalletProvider(
  'onion nation panther circle feel high budget north burst armed wrestle page',
  'https://rinkeby.infura.io/v3/50932f6733c14d61b9d7aa2835f8678f',
);

const web3 = new Web3(provider);

// Trick to allow us ot use async await
const deploy = async () => {
  const accounts = await web3.eth.getAccounts();
  console.log('Attemping to deploy from account: ', accounts[0]);

  const result = await new web3.eth.Contract(compiledFactory.abi)
    .deploy({ data: '0x' + compiledFactory.evm.bytecode.object }) // add 0x bytecode
    .send({ from: accounts[0] });

  console.log('Contract deployed to ', result.options.address);
};
deploy();
