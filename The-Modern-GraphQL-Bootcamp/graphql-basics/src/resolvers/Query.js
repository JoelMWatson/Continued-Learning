const Query = {
  me(parent, args, ctx, info) {
    return {
      id: '12345',
      name: 'Joel',
      email: 'Example@mail.com',
    };
  },
  users(parent, args, { db }, info) {
    if (!args.query) {
      return db.users;
    }
    return db.users.filter((user) => {
      return user.name.toLowerCase().includes(args.query.toLowerCase());
    });
  },
  posts(parent, args, { db }, info) {
    if (!args.query) {
      return db.posts;
    }
    return db.posts.filter((post) => {
      return (
        post.title.toLowerCase().includes(args.query.toLowerCase()) &&
        post.body.toLowerCase().includes(args.query.toLowerCase())
      );
    });
  },
  comments(parent, args, { db }, info) {
    if (!args.query) {
      return db.comments;
    }
  },
};

export default Query;
