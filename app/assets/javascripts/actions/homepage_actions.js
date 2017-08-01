import {SET_API_RESPONSE} from './shared/api_response_actions'

export const SET_LUNCH_GROUPS = 'SET_LUNCH_GROUPS';

export function fetchLunchGroups() {
  return (dispatch, getState) => {
    const promise = Promise.resolve($.get('/api/lunch_groups'));

    promise.then((result) => {
      dispatch({type: SET_LUNCH_GROUPS, groups: result.groups});
      dispatch({type: SET_API_RESPONSE, validationState: 'success'});
    }).catch((result) => {
      dispatch({type: SET_API_RESPONSE, message: result.responseJSON.message, validationState: 'error'});
    });

    return promise;
  };
}
