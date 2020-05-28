import React from 'react';
import { View, Text, StyleSheet } from 'react-native';
import ImageDetail from '../components/ImageDetail';

const ImageScreen = () => {
  return (
    <View>
      <ImageDetail
        imageSource={require('../../assets/forest.jpg')}
        title='Forest'
        score='10'
      />
      <ImageDetail
        imageSource={require('../../assets/beach.jpg')}
        title='Beach'
        score='9'
      />
      <ImageDetail
        imageSource={require('../../assets/mountain.jpg')}
        title='Mountain'
        score='8'
      />
    </View>
  );
};

const styles = StyleSheet.create({});

export default ImageScreen;
