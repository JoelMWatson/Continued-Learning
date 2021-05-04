import express from 'express';
import cookieSession from 'cookie-session';
import { AppRouter } from './AppRouter'
import './controllers/LoginController';
import './controllers/RootController';

const app = express();

// adds req.body
app.use(express.urlencoded({ extended: true}));

// adds req.session
app.use(cookieSession({ keys: ['asdf'] }))

app.use(AppRouter.getInstance());

app.listen(3000, () => {
  console.log('listening');
});