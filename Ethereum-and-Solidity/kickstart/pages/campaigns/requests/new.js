import React, { useState } from 'react';

import { Form, Input, Button, Message } from 'semantic-ui-react';

import Layout from '../../../components/Layout';
import Campaign from '../../../ethereum/campaign';
import web3 from '../../../ethereum/web3';
import { Link, Router } from '../../../routes';

const RequestNew = ({ address }) => {
  const [description, setDescription] = useState('');
  const [value, setValue] = useState('');
  const [recipient, setRecipient] = useState('');
  const [error, setError] = useState('');
  const [loading, setloading] = useState(false);

  const onSubmit = async (e) => {
    e.preventDefault();
    setError('');
    setloading(true);
    try {
      const campaign = Campaign(address);

      const accounts = await web3.eth.getAccounts();

      await campaign.methods
        .createRequest(description, web3.utils.toWei(value, 'ether'), recipient)
        .send({
          from: accounts[0],
        });
      Router.pushRoute(`/campaigns/${address}/requests`);
    } catch (e) {
      setError(e.message);
    }
    setloading(false);
  };

  return (
    <Layout>
      <Link route={`/campaigns/${address}/requests`}>
        <a>Back</a>
      </Link>
      <h3>Create a Request!</h3>
      <Form onSubmit={onSubmit} error={!!error}>
        <Form.Field>
          <label>Description</label>
          <Input
            value={description}
            onChange={(e) => setDescription(e.target.value)}
          />
        </Form.Field>
        <Form.Field>
          <label>Value in Ether</label>
          <Input value={value} onChange={(e) => setValue(e.target.value)} />
        </Form.Field>
        <Form.Field>
          <label>Recipient</label>
          <Input
            value={recipient}
            onChange={(e) => setRecipient(e.target.value)}
          />
        </Form.Field>
        <Message error header='Oops' content={error} />
        <Button primary loading={loading} content='Create!' />
      </Form>
    </Layout>
  );
};

export async function getServerSideProps({ query }) {
  const { address } = query;

  // return props
  return {
    props: { address },
  };
}

export default RequestNew;
