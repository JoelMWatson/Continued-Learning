const assert = require('assert');
const ganache = require('ganache-cli');
const Web3 = require('web3');

const contract = require('../compile');
const interface = contract.abi;
const bytecode = contract.evm.bytecode.object;

const web3 = new Web3(ganache.provider());

let inbox;
let accounts;
beforeEach(async () => {
  // get list of accounts
  accounts = await web3.eth.getAccounts();

  // use one account to deploy contract
  inbox = await new web3.eth.Contract(interface)
    .deploy({
      data: bytecode,
      arguments: ['Hi There!'],
    })
    .send({ from: accounts[0], gas: '1000000' });
});

describe('Inbox tests', () => {
  it('deploys a contract', () => {
    assert.ok(inbox.options.address);
  });

  it('has a default message', async () => {
    const message = await inbox.methods.message().call();
    assert.strictEqual(message, 'Hi There!');
  });

  it('updates the default message', async () => {
    await inbox.methods.setMessage('Hammy Man').send({ from: accounts[0] });
    const message = await inbox.methods.message().call();
    assert.strictEqual(message, 'Hammy Man');
  });
});
