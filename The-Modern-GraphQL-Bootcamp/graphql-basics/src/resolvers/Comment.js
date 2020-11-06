const Comment = {
  author(parent, args, { db }, info) {
    // Comment - Author: many - one
    return db.users.find((user) => {
      return user.id === parent.author; // parent = comment
    });
  },
  post(parent, args, { db }, info) {
    // Comment - Post: many - one
    return db.posts.find((post) => {
      return post.id === parent.post; // parent = comment
    });
  },
};

export default Comment;
