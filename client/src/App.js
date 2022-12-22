import "bootstrap/dist/css/bootstrap.min.css";
import Logout from "./Logout";
import React, { useState, useEffect } from "react";
import loginCookie from "./loginCookie";
import Auth from "./Auth";
import Name from "./Name";
import './App.css';

function App() {
  const [isLogged, setIsLogged] = useState();

  useEffect(() => {
    loginCookie({ setIsLogged });
  }, []);

  return (
    <div className="wrapper">
      {!isLogged ? (
        <Auth />
      ) : (
        <div className="page">
          <Name />
          <Logout />
        </div>
      )}
    </div>
  );
}


export default App;
