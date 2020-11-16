import ApolloBoost, { gql } from 'apollo-boost';

const client = new ApolloBoost({
  uri: 'http://localhost:4000',
});

const getUsers = gql`
  query {
    users {
      name
    }
  }
`;

const getPosts = gql`
  query {
    posts {
      title
      author {
        name
      }
    }
  }
`;

client.query({ query: getPosts }).then((response) => {
  let html = '';

  response.data.posts.forEach((post) => {
    html += `
      <div>
        <h3>${post.title}</h3>
        <h4>By ${post.author.name}</h4>
      </div>
    `;
  });

  document.getElementById('posts').innerHTML = html;
});

client.query({ query: getUsers }).then((response) => {
  let html = '';

  response.data.users.forEach((user) => {
    html += `
      <div>
        <h3>${user.name}</h3>
      </div>
    `;
  });

  document.getElementById('users').innerHTML = html;
});
