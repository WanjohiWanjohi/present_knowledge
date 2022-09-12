import "bootstrap/dist/css/bootstrap.min.css"
import "./App.css"
import { BrowserRouter, Routes, Route, Navigate } from "react-router-dom"
import Auth from "./Auth"
import Home from "./Home"
import Register from "./Register"
import AllRegisters from "./AllRegisters"
import React, { useState, useEffect } from "react"
import Pricing from "./Pricing"


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
      <Route exact path="/register" element={<Register />}/>
      <Route exact path="/registers" element={<AllRegisters />}/>

<Route path="/" element={token.length > 0 ?<Navigate to="/home" />: <Auth  setToken={setToken}/>} />
<Route exact path="/home" element={<Home />}></Route>
<Route exact path="/pricing" element={<Pricing />}></Route>

      </Routes>
    </BrowserRouter>
  )
  function CreateTokenExpiry(){
    // #use current time and and setExpired
  }
}

export default App