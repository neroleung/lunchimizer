import {combineReducers} from 'redux';
import {SET_LUNCH_GROUPS} from '../actions/homepage_actions'
import apiResponseReducer from './shared/api_response_reducer';

const initialState = {groups: []};

function homepageReducer(state = initialState, action) {
  const newstate = Object.assign({}, state);

  switch (action.type) {
    case SET_LUNCH_GROUPS:
      newstate.groups = action.groups;

      return newstate;

    default:
      return state;
  }
}

export default combineReducers({homepage: homepageReducer, apiResponse: apiResponseReducer});
