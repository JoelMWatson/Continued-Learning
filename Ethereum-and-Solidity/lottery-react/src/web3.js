import Web3 from 'web3';

// Trick to pull the provider from the current web3 instance coming from metamask
const web3 = new Web3(window.ethereum);

// must ask for access to connect to metamask
window.ethereum.enable();

export default web3;
