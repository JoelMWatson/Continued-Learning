import React from 'react'
import { connect } from 'react-redux';

const SongDetail = ({song}) => {
    if (!song) {
        return <div>Select A Song.</div>
    }
    return (
        <div>
            <h3>Details For:</h3>
            <p>
                Title: {song.title}
                <br />
                Duration: {song.duration}
            </p>
        </div>
    );
};

const mapStateToProps = (state) => {
    return { song: state.selected };
};

export default connect(mapStateToProps)(SongDetail)