import React , {useEffect, useState} from 'react';
import NavBar from './NavBar'
import Container from 'react-bootstrap/Container';
import Row from 'react-bootstrap/Row';
import Col from 'react-bootstrap/Col';
import Button from 'react-bootstrap/Button';
import Card from 'react-bootstrap/Card';

export default function Pricing() {
  const [pricingData , setPricingData] = useState([])

  useEffect(()=>{

    fetch('pricing.json',{
      headers : { 
        'Content-Type': 'application/json',
        'Accept': 'application/json'
       }
    }).then(function(response){

        return response.json();

      })

      .then(function(myJson) {

        setPricingData(myJson)
        console.log(pricingData);

      });
    },[])
  return (
    <header style={{ paddingLeft: 0 ,marginBottom:5 }}>
     <NavBar/>
      <div className='p-5 text-center bg-light'>
        <h1 className='mb-3'>Present Knowledge</h1>
        <Container>
      <Row>
        {/* {pricingData.forEach(){

        }} */}
        <Col>
        <Card style={{ width: '18rem' }}>
      <Card.Img variant="top" src="holder.js/100px180" />
      <Card.Body>
        <Card.Title>Card Title</Card.Title>
        <Card.Text>
          Some quick example text to build on the card title and make up the
          bulk of the card's content.
        </Card.Text>
        <Button variant="primary">Go somewhere</Button>
      </Card.Body>
    </Card>
    </Col>
        <Col> 
        <Card style={{ width: '18rem' }}>
      <Card.Img variant="top" src="holder.js/100px180" />
      <Card.Body>
        <Card.Title>Card Title</Card.Title>
        <Card.Text>
          Some quick example text to build on the card title and make up the
          bulk of the card's content.
        </Card.Text>
        <Button variant="primary">Go somewhere</Button>
      </Card.Body>
    </Card>
    </Col>
        <Col>
        <Card style={{ width: '18rem' }}>
      <Card.Img variant="top" src="holder.js/100px180" />
      <Card.Body>
        <Card.Title>Card Title</Card.Title>
        <Card.Text>
          Some quick example text to build on the card title and make up the
          bulk of the card's content.
        </Card.Text>
        <Button variant="primary">Go somewhere</Button>
      </Card.Body>
    </Card>
    </Col>
      </Row>
    </Container>
      </div>
    </header>
  );
}