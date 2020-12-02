import React, { Component } from 'react';
import gql from 'graphql-tag'; // GraphQL parcer
import { graphql } from 'react-apollo'; // Apollo provider (bond apollo store and component)
import { Link } from 'react-router';

import LyricCreate from './LyricCreate';
import fetchSongs from '../queries/fetchSongs';

// Class based since using react version before 16.8.0
class SongList extends Component {
  onSongDelete(id) {
    this.props
      // allows you to pass variables to mutaiton (different for queries)
      .mutate({ variables: { id } })
      .then(() => this.props.data.refetch());
  }

  renderSong(songs) {
    return songs.map(({ id, title }) => {
      return (
        <li className='collection-item' key={id}>
          <Link to={`/songs/${id}`}>{title}</Link>
          <i className='material-icons' onClick={() => this.onSongDelete(id)}>
            delete
          </i>
        </li>
      );
    });
  }

  render() {
    // use data.loading to make sure gql has run
    if (this.props.data.loading) return <div>Loading...</div>;

    return (
      <div>
        <ul className='collection'>{this.renderSong(this.props.data.songs)}</ul>
        <Link to='/songs/new' className='btn-floating btn-large red right'>
          <i className='material-icons'>add</i>
        </Link>
      </div>
    );
  }
}

const mutation = gql`
  mutation DeleteSong($id: ID) {
    deleteSong(id: $id) {
      id
    }
  }
`;

export default graphql(mutation)(graphql(fetchSongs)(SongList));
