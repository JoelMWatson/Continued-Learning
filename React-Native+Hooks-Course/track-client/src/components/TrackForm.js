import React, { useContext } from 'react';
import { Input, Button } from 'react-native-elements';

import useSaveTrack from '../hooks/useSaveTrack';
import { Context as LocationContext } from '../context/LocationContext';
import Spacer from './Spacer';

const TrackForm = () => {
  const {
    state: { name, recording, locations },
    startRecording,
    stopRecording,
    changeName,
  } = useContext(LocationContext);

  const [saveTrack] = useSaveTrack();

  return (
    <>
      <Spacer>
        <Input
          value={name}
          placeholder='Enter name'
          onChangeText={changeName}
        />
      </Spacer>
      <Spacer>
        {recording ? (
          <Button title='Stop' onPress={stopRecording} />
        ) : (
          <Button title='Start Recording' onPress={startRecording} />
        )}
      </Spacer>
      <Spacer>
        {!recording && locations.length ? (
          <Button title='Save Recording' onPress={saveTrack} />
        ) : null}
      </Spacer>
    </>
  );
};

export default TrackForm;
