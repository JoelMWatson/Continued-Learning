import web3 from './web3';
import CampaignFactory from './build/CampaignFactory.json';

const instance = new web3.eth.Contract(
  CampaignFactory.abi,
  '0x692cF8f3049Db9Fc31e9bAfF35f64aA716dA90a2',
);

export default instance;
