import React, { useState } from 'react';

import { Button, Form, Input, Message } from 'semantic-ui-react';

import Layout from '../../components/Layout';
import factory from '../../ethereum/factory';
import web3 from '../../ethereum/web3';
import { Router } from '../../routes';

const CampaignNew = () => {
  const [contribution, setContribution] = useState('');
  const [error, setError] = useState('');
  const [loading, setloading] = useState(false);

  const onSubmit = async (e) => {
    e.preventDefault();
    setError('');
    setloading(true);
    try {
      const accounts = await web3.eth.getAccounts();
      await factory.methods.createCampaign(contribution).send({
        from: accounts[0],
      });
      Router.pushRoute('/');
    } catch (e) {
      setError(e.message);
    }
    setloading(false);
  };

  return (
    <Layout>
      <h3>Create a Campaign!</h3>
      <Form onSubmit={onSubmit} error={!!error}>
        <Form.Field>
          <label>Minimum Contribution</label>
          <Input
            label='wei'
            labelPosition='right'
            value={contribution}
            onChange={(e) => setContribution(e.target.value)}
          />
        </Form.Field>
        <Message error header='Oops' content={error} />
        <Button loading={loading} primary>
          Create!
        </Button>
      </Form>
    </Layout>
  );
};

export default CampaignNew;
