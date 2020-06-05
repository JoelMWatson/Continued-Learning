import { combineReducers } from 'redux';

const songsReducer = () => {
    return [
        {
            title: 'No Scrubs',
            duration: '4:05'
        },
        {
            title: 'Macarena',
            duration: '2.30'
        },
        {
            title: 'All Star',
            duration: '1.35'
        }
    ];
};

const selectedReducer = (selected = null, action) => {
    if (action.type === 'SONG_SELECTED') {
        return action.payload;
    }
    return selected;
};

export default combineReducers({
    songs: songsReducer,
    selected: selectedReducer
});