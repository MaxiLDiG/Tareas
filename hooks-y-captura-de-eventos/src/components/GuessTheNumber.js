import React, { useState } from 'react';
import '../styles/GuessTheNumber.css';

const GuessTheNumber = () => {
  const [guess, setGuess] = useState('');
  const [message, setMessage] = useState('');
  const randomNumber = Math.floor(Math.random() * 100) + 1;

  const handleSubmit = (e) => {
    e.preventDefault();
    const num = parseInt(guess);
    if (num < randomNumber) {
      setMessage('Más alto');
    } else if (num > randomNumber) {
      setMessage('Más bajo');
    } else {
      setMessage('¡Correcto!');
    }
  };

  return (
    <div className="guess-number">
      <form onSubmit={handleSubmit}>
        <input
          type="number"
          value={guess}
          onChange={(e) => setGuess(e.target.value)}
          placeholder="Adivina el número"
        />
        <button type="submit">Adivinar</button>
      </form>
      {message && <p>{message}</p>}
    </div>
  );
};

export default GuessTheNumber;
