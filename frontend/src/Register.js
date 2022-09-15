import Button from 'react-bootstrap/Button';
import Form from 'react-bootstrap/Form';
import NavBar from './NavBar'
import {useState} from "react";

function Register() {
  const [registryName, setRegistryName] = useState("")
  const [registryEvent, setRegistryEvent] = useState("")
  return (
    <>
        <NavBar />
        <div style={{ display: 'block', 
                  width: 700, 
                  padding: 50, margin:10 }}>
        <Form onSubmit={createRegister}>
      <Form.Group className="mb-3" controlId="formBasicEmail" >
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
    </div>
    </>
    
  );
  function createRegister(event){
    event.preventDefault()
    console.log("hellooooo");
  }
}

export default Register;