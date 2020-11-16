import jwt from 'jsonwebtoken';

const getUserId = (request, requireAuth = true) => {
  // lives here for query/mutation http requests: request.request.headers.authorization
  // lives here for subscriptions web socket: request.connection.context.Authorization
  const header = request.request
    ? request.request.headers.authorization
    : request.connection.context.Authorization;

  if (header) {
    const token = header.replace('Bearer ', '');
    const decoded = jwt.verify(token, process.env.JWT_SECRET);
    return decoded.userId;
  }

  // dont require auth for all queries/subscriptions/mutations
  if (requireAuth) {
    throw new Error('Authentication required');
  }

  return null;
};

export default getUserId;
