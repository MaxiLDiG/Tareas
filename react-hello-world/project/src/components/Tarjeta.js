import React from 'react';
import './Tarjeta.css';

const Tarjeta = ({ nombre, apellido, profesion, imagen }) => {
  return (
    <div className="tarjeta">
      <img src={imagen} alt={`${nombre} ${apellido}`} className="tarjeta-imagen" />
      <h2 className="tarjeta-nombre">{nombre} {apellido}</h2>
      <p className="tarjeta-profesion">{profesion}</p>
    </div>
  );
};

export default Tarjeta;