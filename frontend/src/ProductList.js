import Table from 'react-bootstrap/Table';

function RegisterDetails() {
  return (
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
  );
}

export default RegisterDetails;