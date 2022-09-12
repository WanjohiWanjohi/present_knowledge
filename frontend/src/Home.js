import React from 'react';
import NavBar from './NavBar'

export default function Home() {
  return (
    <header style={{ paddingLeft: 0 }}>
     <NavBar/>
      <div className='p-5 text-center bg-light'>
      <h1 className='mb-3'>Present Knowledge</h1>
        <h4 className='mb-3'>With Present Knowledge, remove the pain of gifting from event planning. Enjoy a wide variety of products to choose from as an event host with a wide price range.</h4>
        <a className='btn btn-primary' href='/registers' role='button'>
          View Registers
        </a>
      </div>
    </header>
  );
}