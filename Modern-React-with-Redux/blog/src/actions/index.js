import _ from 'lodash';
import jsonPlaceholder from '../apis/jsonPlaceholder';

export const fetchPostsAndUsers = () => async (dispatch, getState) => {
  await dispatch(fetchPosts());
  const userIds = _.uniq(_.map(getState().posts, 'userId')); // uses lodash .map and .uniq
  userIds.forEach((id) => dispatch(fetchUser(id)));
};

export const fetchPosts = () => {
  return async (dispatch, getState) => {
    const response = await jsonPlaceholder.get('/posts');
    dispatch({ type: 'FETCH_POSTS', payload: response.data });
  };
};

export const fetchUser = (id) => async (dispatch, getState) => {
  const response = await jsonPlaceholder.get('/users/' + id);
  dispatch({ type: 'FETCH_USER', payload: response.data });
};

// export const fetchUser = (id) => (dispatch, getState) =>
//   _fetchUser(id, dispatch);
// // Create a private function that calls Lodash memoize to "store" responses so
// // we dont make multiple calls for the same data. (Cannot refetch data)
// const _fetchUser = _.memoize(async (id, dispatch) => {
//   const response = await jsonPlaceholder.get('/users/' + id);
//   dispatch({ type: 'FETCH_USER', payload: response.data });
// });
