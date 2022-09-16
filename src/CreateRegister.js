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
        <Form.Control type="text" placeholder="Register name"  onChange={(event)=> setRegistryName(event.target.value)}/>
        <Form.Text className="text-muted">
        Give your register a memorable name
        </Form.Text>
      </Form.Group>

      <Form.Group className="mb-3" controlId="formBasicPassword">
        <Form.Label>Event</Form.Label>
        <Form.Control type="text" placeholder="Register event" onChange={(event)=> setRegistryEvent(event.target.value)}/>
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
    console.log(registryEvent)
    console.log(registryName)
    if (registryEvent !== null && registryName !== null && registryName !== '' && registryEvent !== ''){
        // TODO: Make fetcgh
        fetch("https://present-knowledge.herokuapp.com/registries/create",{
          method: 'POST',
          redirect:'follow',
          body: JSON.stringify({registryName: registryName, registryEvent: registryEvent})} ).then((res)=> res.json()).then((registry)=> console.log(registry))
    }
  }
}

export default Register;