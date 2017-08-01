import React from 'react';
import {Provider} from 'react-redux';
import {createStore, applyMiddleware} from 'redux';
import thunk from 'redux-thunk';

import homepageReducer from '../reducers/homepage_reducer';
import Homepage from '../components/homepage.jsx';

const store = createStore(homepageReducer, applyMiddleware(thunk));

export default class HomeIndex extends React.Component {
  render() {
    return (
      <Provider store={store}>
        <Homepage />
      </Provider>
    );
  }
}
