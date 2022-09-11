import "bootstrap/dist/css/bootstrap.min.css"
import "./App.css"
import { BrowserRouter, Routes, Route, Navigate } from "react-router-dom"
import Auth from "./Auth"
import Home from "./Home"
import React, { useState, useEffect } from "react"


function App() {
  let tokenKey ='gfvdsc'
  const [token, setToken] = useState("")
  useEffect(() =>setToken(tokenKey))
  console.log(token)

//   if (token) {
//     token = JSON.parse(window.localStorage.getItem(tokenKey));
// }
  return (
    <BrowserRouter>
      <Routes>
<Route path="/" element={token.length > 0 ?<Navigate to="/home" />: <Auth  setToken={setToken}/>} />
<Route exact path="/home" element={<Home />}>
 
</Route>
      </Routes>
    </BrowserRouter>
  )
  function CreateTokenExpiry(){
    // #use current time and and setExpired
  }
}

export default App