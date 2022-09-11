import "bootstrap/dist/css/bootstrap.min.css"
import "./App.css"
import { BrowserRouter, Routes, Route, Navigate } from "react-router-dom"
import Auth from "./Auth"
import Home from "./Home"
import React, { useState } from "react"


function App() {
  const [token, setToken] = useState(window.localStorage.getItem(tokenKey))
  if (token) {
    token = JSON.parse(window.localStorage.getItem(tokenKey));
}
  return (
    <BrowserRouter>
      <Routes>
<Route path="/" element={token.length > 0 ?<Navigate to="/home" />: <Auth  setToken={setToken}/>} />
<Route exact path="/home" element={token.length > 0 ?<Navigate to="/home" />: <Home/>}>
 
</Route>
      </Routes>
    </BrowserRouter>
  )
  function CreateTokenExpiry(){
    // #use current time and and setExpired
  }
}

export default App