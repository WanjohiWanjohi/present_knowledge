import Table from 'react-bootstrap/Table';

function ProductList() {
  return (
    <Table striped hover variant="dark" className="mx-4">
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
          <td><Button variant="outline-dark" className='px-2' component={Link}
            to={{
              pathname: "/register/details",
              state: {
                id: 5,
                name: 'test',
              },
            }} style={{ width: "100%" }}>View Registry Details
          </Button></td>
          <td><Button variant="outline-dark" className='px-2' component={Link}
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
  );
}

export default ProductList;