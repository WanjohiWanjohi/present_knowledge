import Container from 'react-bootstrap/Container'
function RegisterDetails(props) {
  return (
  <div>
    <div className="p-5 mb-4 bg-light rounded-3 text-center">
      <div className="container-fluid py-5 text-center">
        <h1 className="display-5 fw-bold">Custom jumbotron</h1>
        <p class="col-md-8 fs-4 m-auto mt-5 mb-5">
          Using a series of utilities, you can create this jumbotron, just like
          the one in previous versions of Bootstrap. Check out the examples
          below for how you can remix and restyle it to your liking.
        </p>
        <button class="btn btn-primary btn-lg" type="button">
          Example button
        </button>
      </div>
    </div>

  </div>
  );
}

export default RegisterDetails;