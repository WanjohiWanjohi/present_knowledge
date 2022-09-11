import React from 'react';
import NavBar from './NavBar'

export default function Home() {
  return (
    <header style={{ paddingLeft: 0 ,marginBottom:5 }}>
     <NavBar/>
      <div className='p-5 text-center bg-light'>
        <h1 className='mb-3'>Heading</h1>
        <h4 className='mb-3'>Subheading</h4>
        <a className='btn btn-primary' href='/registers' role='button'>
          View Registers
        </a>
      </div>
    </header>
  );
}