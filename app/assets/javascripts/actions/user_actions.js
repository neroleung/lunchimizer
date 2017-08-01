import {SET_API_RESPONSE} from './shared/api_response_actions'

export const SET_USER_NAME = "SET_USER_NAME";
export function setUserName(event) {
  return {type: SET_USER_NAME, name: event.currentTarget.value};
}

export function createUser() {
  return (dispatch, getState) => {
    const url     = '/api/users',
          data    = {name: getState().user.name},
          promise = Promise.resolve($.ajax({url: url, dataType: 'json', type: 'POST', data: data}));

    promise.then((result) => {
      dispatch({type: SET_API_RESPONSE, message: result.message, validationState: 'success'});
    }).catch((result) => {
      dispatch({type: SET_API_RESPONSE, message: result.responseJSON.message, validationState: 'error'});
    });

    return promise;
  };
}
