import Table from 'react-bootstrap/Table';
import NavBar from './NavBar';
import Button from 'react-bootstrap/Button';
import { Link } from 'react-router-dom'
import {useEffect, useState} from 'react';
function AllRegisters(props) {
  const [registers, setAllRegisters] = useState([])

  useEffect(() => {   
    fetch("https://present-knowledge.herokuapp.com/registries")
    .then((res) => res.json())
    .then((reg) => {    
      console.log(reg)
      setAllRegisters(reg)
    }) }, []);
  return (
    <>
         <NavBar/>
    <h1 className='mx-4'> Your Registers</h1>
    <Table striped  variant="light" className="mx-4 mt-4 my-2">
      <thead>
        <tr>
          <th> Name</th>
          <th>Date Created</th>
          <th>Event</th>
          <th>View Details</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>1</td>
          <td>Mark</td>
          <td>Otto</td>
          <td className='px-4'>    
            <Button variant="outline-dark" className='px-2'  component={Link}
  to={{
    pathname: "/register/details",
    state: {
      id: 5,
      name: 'test',
    },
  }} style={{ width: "100%" }}>View Registry Details
            </Button></td>
        </tr>
       
      </tbody>
    </Table>
    </>
  );
}

export default AllRegisters;