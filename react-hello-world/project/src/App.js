import React from 'react';
import HolaMundo from './components/HolaMundo';
import Tarjeta from './components/Tarjeta';
import Contador from './components/Contador';
import ListaTareas from './components/ListaTareas';
import Formulario from './components/Formulario';

function App() {
  return (
    <div className="App">
      <HolaMundo />
      <Tarjeta 
        nombre="Ramón" 
        apellido="Díaz" 
        profesion="Desarrollador Web" 
        imagen="/ramon-diaz.webp" 
      />
      <Contador />
      <ListaTareas />
      <Formulario />
    </div>
  );
}

export default App;