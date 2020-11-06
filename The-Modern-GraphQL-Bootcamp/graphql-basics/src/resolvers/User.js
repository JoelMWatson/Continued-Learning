const User = {
  posts(parent, args, { db }, info) {
    // User - Author: one - many
    return db.posts.filter((post) => {
      return post.author === parent.id; // parent = user
    });
  },
  comments(parent, args, { db }, info) {
    // User - Comments: one - many
    return db.comments.filter((comment) => {
      return comment.author === parent.id; // parent = user
    });
  },
};

export default User;
