const Post = {
  author(parent, args, { db }, info) {
    // Post - Author: many - one
    return db.users.find((user) => {
      return user.id === parent.author; // parent = post
    });
  },
  comments(parent, args, { db }, info) {
    // Post - Comments: one - many
    return db.comments.filter((comment) => {
      return comment.post === parent.id; // parent = post
    });
  },
};

export default Post;
