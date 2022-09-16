import Card from 'react-bootstrap/Card';
// import ListGroup from 'react-bootstrap/ListGroup';

function RegistryItem(props) {
  return (
    <Card style={{ width: '18rem' }}>
      <Card.Img variant="top" src="holder.js/100px180?text=Image cap" />
      <Card.Body>
        <Card.Title>Registry Name</Card.Title>
        <Card.Text>
          Registry Event
        </Card.Text>
      </Card.Body>
      {/* <ListGroup className="list-group-flush">
        <ListGroup.Item>Registry Item</ListGroup.Item>
       
      </ListGroup> */}
      <Card.Body>
        <Card.Link href="#">View Registry Details</Card.Link>
      </Card.Body>
    </Card>
  );
}

export default RegistryItem;