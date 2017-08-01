import {connect} from 'react-redux';
import {bindActionCreators} from 'redux';
import {FormGroup, ControlLabel, Button} from 'react-bootstrap';

import * as HomepageActions from '../actions/homepage_actions';

class Homepage extends React.Component {
  static renderGroup = (group, i) => {
    return (
      <div key={`group-${i}`} className="group">
        <div className="group-name">Group {i + 1}</div>
        <ul>
          {group.map((name, j) => <li key={`name-${j}`}>{name}</li>)}
        </ul>
      </div>
    );
  };

  constructor(props, context) {
    super(props, context);
  }

  __renderGroups() {
    const {homepage} = this.props;

    if (!!homepage.groups.length) {
      return (
        <div className="groups">
          {homepage.groups.map((group, i) => Homepage.renderGroup(group, i))}
        </div>
      );
    }
  }

  render() {
    const {homepageActions, apiResponse} = this.props;

    return (
      <div className="homepage-container">
        <FormGroup validationState={apiResponse.validationState}>
          <Button bsStyle="primary"
                  onClick={homepageActions.fetchLunchGroups}>
            Generate lunch groups
          </Button>

          <br />

          <ControlLabel className="api-response-message">{apiResponse.message}</ControlLabel>
        </FormGroup>

        {this.__renderGroups()}
      </div>
    );
  }
}

function mapStateToProps(state) {
  return {homepage: state.homepage, apiResponse: state.apiResponse};
}

function mapDispatchToProps(dispatch) {
  return {homepageActions: bindActionCreators(HomepageActions, dispatch)};
}

export default connect(mapStateToProps, mapDispatchToProps)(Homepage);
