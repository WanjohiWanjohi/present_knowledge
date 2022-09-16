import React from 'react';

import {
    MDBNavbar,
    MDBNavbarToggler,
    MDBIcon,
    MDBNavbarNav,
    MDBNavbarItem,
    MDBNavbarLink,
    MDBContainer
  } from 'mdb-react-ui-kit';

  export default function NavBar (){
    return (<MDBNavbar expand='lg' light bgColor='white'>
    <MDBContainer fluid>
      <MDBNavbarToggler
        aria-controls='navbarExample01'
        aria-expanded='false'
        aria-label='Toggle navigation'
      >
        <MDBIcon fas icon='bars' />
      </MDBNavbarToggler>
      <div className='collapse navbar-collapse' id='navbarExample01'>
        <MDBNavbarNav right className='mb-2 mb-lg-0'>
          <MDBNavbarItem active>
            <MDBNavbarLink aria-current='page' href='/home'>
              Home
            </MDBNavbarLink>
          </MDBNavbarItem>
          <MDBNavbarItem>
            <MDBNavbarLink href='/register'>Register</MDBNavbarLink>
          </MDBNavbarItem>
         
          <MDBNavbarItem>
            <MDBNavbarLink href='/products'>Products</MDBNavbarLink>
          </MDBNavbarItem>
          <MDBNavbarItem>
            <MDBNavbarLink href='/about'>About</MDBNavbarLink>
          </MDBNavbarItem>
          <MDBNavbarItem>
            <MDBNavbarLink href='/pricing'>Pricing</MDBNavbarLink>
          </MDBNavbarItem>
        </MDBNavbarNav>
      </div>
    </MDBContainer>
  </MDBNavbar>)
}