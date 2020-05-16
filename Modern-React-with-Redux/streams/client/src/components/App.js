import React from 'react';
import { Router, Route } from 'react-router-dom';

import Header from './Header';
import history from '../history';
import StreamCreate from './streams/StreamCreate';
import StreamDelete from './streams/StreamDelete';
import StreamShow from './streams/StreamShow';
import StreamList from './streams/StreamList';
import StreamEdit from './streams/StreamEdit';

const App = () => {
  return (
    <div>
      <Router history={history}>
        <div>
          <Header />
          <Route path='/' exact component={StreamList} />
          <Route path='/streams/new' component={StreamCreate} />
          <Route path='/streams/edit/:id' component={StreamEdit} />
          <Route path='/streams/delete/:id' component={StreamDelete} />
          <Route path='/streams/show' component={StreamShow} />
        </div>
      </Router>
    </div>
  );
};

export default App;
