import React, { useState } from 'react';
import './ListaTareas.css';

const ListaTareas = () => {
  const [tareas, setTareas] = useState([]);
  const [nuevaTarea, setNuevaTarea] = useState('');

  const agregarTarea = () => {
    if (nuevaTarea.trim()) {
      setTareas([...tareas, { texto: nuevaTarea, completada: false }]);
      setNuevaTarea('');
    }
  };

  const marcarCompletada = (index) => {
    const nuevasTareas = tareas.map((tarea, i) =>
      i === index ? { ...tarea, completada: !tarea.completada } : tarea
    );
    setTareas(nuevasTareas);
  };

  return (
    <div className="lista-tareas">
      <h3>Lista de Tareas</h3>
      <input
        type="text"
        value={nuevaTarea}
        onChange={(e) => setNuevaTarea(e.target.value)}
        placeholder="Nueva tarea"
      />
      <button onClick={agregarTarea}>Agregar</button>
      <ul>
        {tareas.map((tarea, index) => (
          <li
            key={index}
            className={tarea.completada ? 'completada' : ''}
            onClick={() => marcarCompletada(index)}
          >
            {tarea.texto}
          </li>
        ))}
      </ul>
    </div>
  );
};

export default ListaTareas;
