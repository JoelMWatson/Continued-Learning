import React, { useState } from 'react';
import { View, Text, StyleSheet } from 'react-native';

import SearchBar from '../components/SearchBar';

const SearchScreen = () => {
  const [term, setTerm] = useState('');
  return (
    <View>
      <SearchBar
        term={term}
        onTermChange={() => setTerm(newTerm)}
        onTermSubmit={() => console.log('it Submitted')}
      />
      <Text>{term}</Text>
    </View>
  );
};

const styles = StyleSheet.create({});

export default SearchScreen;
