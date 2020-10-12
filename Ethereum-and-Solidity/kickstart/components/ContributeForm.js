import React, { useState } from 'react';

import { Form, Input, Message, Button } from 'semantic-ui-react';

import { Router } from '../routes';
import web3 from '../ethereum/web3';
import Campaign from '../ethereum/campaign';

const ContributeForm = ({ address }) => {
  const [contribution, setContribution] = useState('');
  const [error, setError] = useState('');
  const [loading, setloading] = useState(false);

  const onSubmit = async (e) => {
    e.preventDefault();
    setError('');
    setloading(true);
    try {
      const campaign = Campaign(address);
      const accounts = await web3.eth.getAccounts();

      await campaign.methods.contribute().send({
        from: accounts[0],
        value: web3.utils.toWei(contribution, 'ether'),
      });
      Router.replaceRoute(`/campaigns/${address}`); // refreshes page and gets getServerSideProps to rerun
    } catch (e) {
      setError(e.message);
    }
    setloading(false);
    setContribution('');
  };

  return (
    <Form onSubmit={onSubmit} error={!!error}>
      <Form.Field>
        <label>Amount to Contribute</label>
        <Input
          label='ether'
          labelPosition='right'
          value={contribution}
          onChange={(e) => setContribution(e.target.value)}
        />
      </Form.Field>
      <Message error header='Oops' content={error} />
      <Button primary loading={loading} content='Contribute!' />
    </Form>
  );
};

export default ContributeForm;
