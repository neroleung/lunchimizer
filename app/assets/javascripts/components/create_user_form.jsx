import {connect} from 'react-redux';
import {bindActionCreators} from 'redux';
import {FormGroup, ControlLabel, FormControl, Button} from 'react-bootstrap';

import * as UserActions from '../actions/user_actions';

class CreateUserForm extends React.Component {
  constructor(props, context) {
    super(props, context);
  }

  __handleKeyPress(event) {
    if (event.key == "Enter") {
      this.props.userActions.createUser();
    }
  }

  render() {
    const {user, userActions, apiResponse} = this.props;

    return (
      <FormGroup validationState={apiResponse.validationState}>
        <ControlLabel>Enter name for new user</ControlLabel>

        <FormControl type="text"
                     value={user.name}
                     placeholder="Enter name"
                     onChange={userActions.setUserName}
                     onKeyPress={this.__handleKeyPress.bind(this)}/>

        <br />

        <Button bsStyle="primary"
                onClick={userActions.createUser}>
          Add
        </Button>

        <br />

        <ControlLabel className="api-response-message">{apiResponse.message}</ControlLabel>
      </FormGroup>
    );
  }
}

function mapStateToProps(state) {
  return {user: state.user, apiResponse: state.apiResponse};
}

function mapDispatchToProps(dispatch) {
  return {userActions: bindActionCreators(UserActions, dispatch)};
}

export default connect(mapStateToProps, mapDispatchToProps)(CreateUserForm);
