import {SET_API_RESPONSE} from '../../actions/shared/api_response_actions'

const initialState = {message: '', validationState: null};

export default function apiResponseReducer(state = initialState, action) {
  const newstate = Object.assign({}, state);

  switch (action.type) {
    case SET_API_RESPONSE:
      newstate.message        = action.message;
      newstate.validationState = action.validationState;

      console.log('newstate', newstate)

      return newstate;

    default:
      return state;
  }
}
