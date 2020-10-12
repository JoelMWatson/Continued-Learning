import React from 'react';

import { Button, Table } from 'semantic-ui-react';

import { Link } from '../../../routes';
import Layout from '../../../components/Layout';
import RequestRow from '../../../components/RequestRow';
import Campaign from '../../../ethereum/campaign';

const RequestIndex = ({ address, requests, requestCount, approversCount }) => {
  const { Header, Row, HeaderCell, Body } = Table;

  const renderRows = () => {
    return requests.map((request, index) => {
      return (
        <RequestRow
          key={index}
          id={index}
          request={request}
          address={address}
          approversCount={approversCount}
        />
      );
    });
  };

  return (
    <Layout>
      <h3>Requests</h3>
      <Link route={`/campaigns/${address}/requests/new`}>
        <a>
          <Button
            primary
            content='Add Request'
            floated='right'
            style={{ marginBottom: 10 }}
          />
        </a>
      </Link>
      <Table>
        <Header>
          <Row>
            <HeaderCell>ID</HeaderCell>
            <HeaderCell>Description</HeaderCell>
            <HeaderCell>Amount</HeaderCell>
            <HeaderCell>Recipient</HeaderCell>
            <HeaderCell>Approval Count</HeaderCell>
            <HeaderCell>Approve</HeaderCell>
            <HeaderCell>Finalize</HeaderCell>
          </Row>
        </Header>
        <Body>{renderRows()}</Body>
      </Table>
      Found {requestCount} requests.
    </Layout>
  );
};

export async function getServerSideProps({ query }) {
  const { address } = query;
  const campaign = Campaign(address);
  const requestCount = await campaign.methods.requestCount().call();
  const approversCount = await campaign.methods.approversCount().call();

  // clever way to get array of structs since solidity doesnt allow this
  const requests = await Promise.all(
    Array(parseInt(requestCount))
      .fill()
      .map(async (element, index) => {
        const current = await campaign.methods.requests(index).call();
        const {
          description,
          value,
          recipient,
          complete,
          approvalCount,
        } = current;
        return {
          description,
          value,
          recipient,
          complete,
          approvalCount,
        };
      }),
  );

  console.log(requests);
  // return props
  return {
    props: { address, requests, requestCount, approversCount },
  };
}

export default RequestIndex;
