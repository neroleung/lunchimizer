import {combineReducers} from 'redux';
import {SET_USER_NAME} from '../actions/user_actions'
import apiResponseReducer from './shared/api_response_reducer';

const initialState = {name: ''};

function userReducer(state = initialState, action) {
  const newstate = Object.assign({}, state);

  switch (action.type) {
    case SET_USER_NAME:
      newstate.name = action.name;

      return newstate;

    default:
      return state;
  }
}

export default combineReducers({user: userReducer, apiResponse: apiResponseReducer});
