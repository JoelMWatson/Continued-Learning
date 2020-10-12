import React from 'react';

import { Card, Grid, Button } from 'semantic-ui-react';

import web3 from '../../ethereum/web3';
import Layout from '../../components/Layout';
import Campaign from '../../ethereum/campaign';
import ContributeForm from '../../components/ContributeForm';
import { Link } from '../../routes';

const show = ({
  address,
  minimumContribution,
  balance,
  requestCount,
  approversCount,
  manager,
}) => {
  const renderCards = () => {
    const items = [
      {
        header: manager,
        description:
          'The manager created this campaign and can create requests to spend money.',
        meta: 'Manager Address',
        style: { overflowWrap: 'break-word' },
      },
      {
        header: minimumContribution,
        description:
          'You must contribute at least this much wei to become an approver.',
        meta: 'Minimum Contribution (wei)',
      },
      {
        header: requestCount,
        description:
          'A request is used to withdraw money from the campaign. Requests must be approved by approvers.',
        meta: 'Number of Requests',
      },
      {
        header: approversCount,
        description:
          'An approver is someone who has contributed to the campaign. They are able to vote on requests.',
        meta: 'Number of Approvers',
      },
      {
        header: web3.utils.fromWei(balance, 'ether'),
        description:
          'The balance is the amount of money left to spend in this campaign.',
        meta: 'Contract Balance (ether)',
      },
    ];
    return <Card.Group items={items} />;
  };
  return (
    <Layout>
      <h3>Campaign Show</h3>
      <Grid>
        <Grid.Row>
          <Grid.Column width={10}>{renderCards()}</Grid.Column>
          <Grid.Column width={6}>
            <ContributeForm address={address} />
          </Grid.Column>
        </Grid.Row>
        <Grid.Row>
          <Grid.Column>
            <Link route={`/campaigns/${address}/requests`}>
              <a>
                <Button primary content='View Requests' />
              </a>
            </Link>
          </Grid.Column>
        </Grid.Row>
      </Grid>
    </Layout>
  );
};

export async function getServerSideProps({ query }) {
  // get the campaign
  const campaign = Campaign(query.address);

  // get the summary ("untranslated" result object)
  const summary = await campaign.methods.getSummary().call();

  // return props
  return {
    props: {
      address: query.address,
      minimumContribution: summary[0],
      balance: summary[1],
      requestCount: summary[2],
      approversCount: summary[3],
      manager: summary[4],
    },
  };
}

export default show;
