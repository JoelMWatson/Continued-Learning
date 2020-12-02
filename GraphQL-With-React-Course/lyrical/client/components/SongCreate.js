import React, { Component } from 'react';
import gql from 'graphql-tag'; // GraphQL parcer
import { graphql } from 'react-apollo'; // Apollo provider (bond apollo store and component)
import { Link, hashHistory } from 'react-router';

import fetchSongs from '../queries/fetchSongs';

// Class based since using react version before 16.8.0 (update later)
class SongCreate extends Component {
  constructor(props) {
    super(props);
    this.state = { title: '' };
  }

  onSubmit(e) {
    e.preventDefault();
    this.props
      .mutate({
        variables: { title: this.state.title },
        // automatically runs queries after mutation succeeds
        refetchQueries: [{ query: fetchSongs }],
      })
      .then(() => hashHistory.push('/'));
  }

  render() {
    const { title } = this.state;
    return (
      <div>
        <Link to='/'>Back</Link>
        <h3>Create New Song</h3>
        <form onSubmit={this.onSubmit.bind(this)}>
          <label>Song Title:</label>
          <input
            value={title}
            onChange={(e) => this.setState({ title: e.target.value })}
          />
        </form>
      </div>
    );
  }
}

const mutation = gql`
  mutation AddSong($title: String) {
    addSong(title: $title) {
      title
    }
  }
`;

export default graphql(mutation)(SongCreate);
