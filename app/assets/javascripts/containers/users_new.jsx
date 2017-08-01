import React from 'react';
import {Provider} from 'react-redux';
import {createStore, applyMiddleware} from 'redux';
import thunk from 'redux-thunk';

import userReducer from '../reducers/user_reducer';
import CreateUserForm from '../components/create_user_form.jsx';

const store = createStore(userReducer, applyMiddleware(thunk));

export default class UsersNew extends React.Component {
  render() {
    return (
      <Provider store={store}>
        <CreateUserForm />
      </Provider>
    );
  }
}
