import Button from 'react-bootstrap/Button';
import Form from 'react-bootstrap/Form';

function Register() {
  return (
    <Form>
      <Form.Group className="mb-3" controlId="formBasicEmail">
        <Form.Label>Register Name</Form.Label>
        <Form.Control type="text" placeholder="Register name" />
        <Form.Text className="text-muted">
        Give your register a memorable name
        </Form.Text>
      </Form.Group>

      <Form.Group className="mb-3" controlId="formBasicPassword">
        <Form.Label>Event</Form.Label>
        <Form.Control type="text" placeholder="Register event" />
      </Form.Group>
      
      <Button variant="primary" type="submit">
        Submit
      </Button>
    </Form>
  );
}

export default Register;