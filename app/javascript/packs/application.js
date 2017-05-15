import 'whatwg-fetch';
import React from 'react'
import ReactDOM from 'react-dom'
import { Route, Switch } from 'react-router';
import createBrowserHistory from 'history/createBrowserHistory'
import { BrowserRouter } from 'react-router-dom'

import TagRequestContainer from '../react/containers/TagRequestContainer';

const history = createBrowserHistory();

document.addEventListener('DOMContentLoaded', () => {
  let reactElement = document.getElementById('react-app');

  if (reactElement) {
    ReactDOM.render(
      <BrowserRouter history={history}>
        <Switch>
          <Route path='/users/:userId/characters/:characterId/tag_requests/new' component={TagRequestContainer} />
        </Switch>
       </BrowserRouter>,
      reactElement
    )
  }
})
