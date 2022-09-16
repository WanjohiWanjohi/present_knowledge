import Table from 'react-bootstrap/Table';
import Button from 'react-bootstrap/Button';
import { Link } from 'react-router-dom'
import NavBar from './NavBar';
import Offcanvas from 'react-bootstrap/Offcanvas';
import React, { useState ,useEffect} from 'react';
import Form from 'react-bootstrap/Form';

function ProductList() {
  const [allProducts, setAllProducts] = useState([]);
  const [show, setShow] = useState(false);
  const handleClose = () => setShow(false);
  const handleShow = () => setShow(true);
 useEffect(() => {   
    fetch("https://present-knowledge.herokuapp.com/products")
    .then((res) => res.json())
    .then((products) => {    
      console.log(products)
      setAllProducts(products)
    }) }, []);

  return (

    <>
    <NavBar></NavBar>
    <Table striped hover variant="light" className="mx-4 mt-4">
      <thead>
        <tr>
          <th>Product Name</th>
          <th>Product Vendor</th>
          <th>Add to Registry</th>
          <th>View Product Online</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>1</td>
          <td>Mark</td>
          <td><Button variant="outline-dark" className='px-2' onClick={handleShow}>Add to Registry
          </Button></td>
          <td><Button variant="outline-dark" className='px-2' >View Product Online
          </Button></td>
        </tr>

      </tbody>
    </Table>
    <Offcanvas show={show} onHide={handleClose}>
        <Offcanvas.Header closeButton>
          <Offcanvas.Title>Offcanvas</Offcanvas.Title>
        </Offcanvas.Header>
        <Offcanvas.Body>
          {/* TODO: Add in all registries */}
          Select a registry to add the  -Product Name- to 
          <Form.Select aria-label="Default select example" className="my-4">
      <option>Open this select menu</option>
      <option value="1">One</option>
      <option value="2">Two</option>
      <option value="3">Three</option>
    </Form.Select>
          <Button variant="primary" className='px-2'> Add to registry</Button>
        </Offcanvas.Body>
      </Offcanvas>
    </>
  );
}

export default ProductList;