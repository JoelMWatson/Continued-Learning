import axios from 'axios';
import { AsyncStorage } from 'react-native';

const instance = axios.create({
  // ngrok only lasts 8 hours then needs to be updated
  baseURL: 'https://3f3e73cf619f.ngrok.io',
});

// interceptors: slick way to pass token
// 1st function runs every time you are about to make a request
// 2nd function runs every time you get an error when making that request
instance.interceptors.request.use(
  async (config) => {
    const token = await AsyncStorage.getItem('token');
    if (token) {
      config.headers.Authorization = `Bearer ${token}`;
    }
    return config;
  },
  (error) => {
    return Promise.reject(error);
  },
);
export default instance;
