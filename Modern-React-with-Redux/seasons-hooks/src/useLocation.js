import { useState, useEffect } from 'react';

export default () => {
  const [lat, setLat] = useState(null);
  const [lng, setLng] = useState(null);
  const [errorMessage, setErrorMessage] = useState('');

  useEffect(() => {
    //get location
    window.navigator.geolocation.getCurrentPosition(
      (position) => (
        setLat(position.coords.latitude), setLng(position.coords.longitude)
      ),
      (error) => setErrorMessage(error.message),
    );
  }, []);

  return [lat, lng, errorMessage];
};
