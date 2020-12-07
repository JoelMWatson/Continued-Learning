const graphql = require('graphql');

const { GraphQLObjectType, GraphQLString } = graphql;

const UserType = require('./types/user_type');
const AuthService = require('../services/auth');

const mutation = new GraphQLObjectType({
  name: 'Mutation',
  fields: {
    signup: {
      type: UserType,
      args: {
        email: { type: GraphQLString },
        password: { type: GraphQLString },
      },
      // req also known as context
      resolve(parent, { email, password }, req) {
        return AuthService.signup({ email, password, req });
      },
    },
    logout: {
      type: UserType,
      resolve(parent, args, req) {
        // save ref to user before logout
        const { user } = req;
        req.logout();
        return user;
      },
    },
    login: {
      type: UserType,
      args: {
        email: { type: GraphQLString },
        password: { type: GraphQLString },
      },
      resolve(parent, { email, password }, req) {
        return AuthService.login({ email, password, req });
      },
    },
  },
});

module.exports = mutation;
