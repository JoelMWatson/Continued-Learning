import Web3 from 'web3';

let web3;

if (typeof window !== 'undefined' && typeof window.web3 !== 'undefined') {
  // BROWSER
  web3 = new Web3(window.ethereum); // provider from metamask
  window.ethereum.enable();
} else {
  // SERVER (or user not running metamask)
  const provider = new Web3.providers.HttpProvider(
    'https://rinkeby.infura.io/v3/50932f6733c14d61b9d7aa2835f8678f',
  );
  web3 = new Web3(provider);
}

export default web3;
