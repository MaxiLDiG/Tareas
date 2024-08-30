import React, { useState } from 'react';
import './Formulario.css';

const Formulario = () => {
  const [nombre, setNombre] = useState('');
  const [mensaje, setMensaje] = useState('');

  const manejarEnvio = (e) => {
    e.preventDefault();
    setMensaje(`¡Bienvenido, ${nombre}!`);
    setNombre('');
  };

  return (
    <div className="formulario">
      <form onSubmit={manejarEnvio}>
        <input
          type="text"
          value={nombre}
          onChange={(e) => setNombre(e.target.value)}
          placeholder="Ingresa tu nombre"
        />
        <button type="submit">Enviar</button>
      </form>
      {mensaje && <p>{mensaje}</p>}
    </div>
  );
};

export default Formulario;
