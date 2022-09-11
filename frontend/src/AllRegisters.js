import Table from 'react-bootstrap/Table';
import NavBar from './NavBar';
function AllRegisters() {
  return (
    <>
         <NavBar/>

    <Table striped bordered hover variant="dark">
      <thead>
        <tr>
          <th>#</th>
          <th>Product name</th>
          <th>Product Vendor</th>
          <th>Details</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>1</td>
          <td>Mark</td>
          <td>Otto</td>
          <td>@mdo</td>
        </tr>
       
      </tbody>
    </Table>
    </>
  );
}

export default AllRegisters;