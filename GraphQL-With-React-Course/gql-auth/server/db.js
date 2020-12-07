const mongoose = require('mongoose');

const start = () => {
  mongoose
    .connect(process.env.MONGO_URI, {
      useNewUrlParser: true,
      useUnifiedTopology: true,
      useFindAndModify: false,
      useCreateIndex: true,
    })
    .then(console.log('Connected to DB!'));
};

const stop = () => {
  mongoose.disconnect();
};

module.exports = { start, stop };
