import React from 'react';
import { View, Text, StyleSheet } from 'react-native';

const BoxScreen = () => {
  return (
    <View style={styles.viewStyle}>
      <View style={styles.textStyle1} />
      <View style={styles.textStyle2} />
      <View style={styles.textStyle3} />
    </View>
  );
};

const styles = StyleSheet.create({
  viewStyle: {
    borderWidth: 3,
    borderColor: 'black',
    height: 200,
    flexDirection: 'row',
    justifyContent: 'space-between',
  },
  textStyle1: {
    borderWidth: 3,
    borderColor: 'black',
    backgroundColor: 'red',
    height: 100,
    width: 100,
  },
  textStyle2: {
    borderWidth: 3,
    borderColor: 'black',
    backgroundColor: 'green',
    height: 100,
    width: 100,
    alignSelf: 'flex-end',
  },
  textStyle3: {
    borderWidth: 3,
    borderColor: 'black',
    backgroundColor: 'purple',
    height: 100,
    width: 100,
  },
});

export default BoxScreen;
