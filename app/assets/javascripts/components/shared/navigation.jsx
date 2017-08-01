import {Navbar, Nav, NavItem} from 'react-bootstrap';

export default class Navigation extends React.Component {
  constructor(props, context) {
    super(props, context);
  }

  render() {
    return (
      <Navbar inverse>
        <Navbar.Header>
          <Navbar.Brand>
            <a href="/">Lunchimizer</a>
          </Navbar.Brand>
        </Navbar.Header>
        <Navbar.Collapse>
          <Nav>
            <NavItem eventKey={1} href="/users/new">Create User</NavItem>
          </Nav>
        </Navbar.Collapse>
      </Navbar>
    );
  }
}
