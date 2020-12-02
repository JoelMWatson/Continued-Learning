import gql from 'graphql-tag'; // GraphQL parcer

export default gql`
  {
    songs {
      id
      title
    }
  }
`;
