import React, { useState } from 'react';
import './Contador.css';

const Contador = () => {
  const [count, setCount] = useState(0);

  return (
    <div className="contador">
      <h2>{count}</h2>
      <button onClick={() => setCount(count + 1)}>Incrementar</button>
      <button onClick={() => setCount(count - 1)}>Decrementar</button>
    </div>
  );
};

export default Contador;
