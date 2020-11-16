// Apollo Boost currently doesnt support subscriptions so we switched out this
// Apollo Boost getClient for one using the more packages from the apollo suite
// (see getClient.js)
import ApolloBoost from 'apollo-boost';

// pass in an optional auth token
const getClient = (jwt) => {
  return new ApolloBoost({
    uri: 'http://localhost:4000',
    request(operation) {
      // only run if jwt was given
      if (jwt) {
        operation.setContext({
          headers: {
            Authorization: `Bearer ${jwt}`,
          },
        });
      }
    },
  });
};

export default getClient;
