import { NavigationActions } from 'react-navigation';

// Clever trick to get access to nav from anywhere using as ref (similar to withNavigation)
let navigator;

// Used in <App />
export const setNavigator = (nav) => {
  navigator = nav;
};

// Use react navigation actions (updates the state under the hood)
export const navigate = (routeName, params) => {
  navigator.dispatch(
    NavigationActions.navigate({
      routeName,
      params,
    }),
  );
};
