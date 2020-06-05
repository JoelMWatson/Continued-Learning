import React from 'react';
import { Text, View, Image, StyleSheet } from 'react-native';

const ImageDetail = (props) => {
  return (
    <View>
      <Image source={props.imageSource} />
      <Text>{props.title}</Text>
      <Text>Image Score:{props.score}</Text>
    </View>
  );
};

const styles = StyleSheet.create({});

export default ImageDetail;
