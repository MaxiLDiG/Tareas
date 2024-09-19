import React from 'react';
import '../styles/ClickableButtons.css';

const ClickableButtons = () => {
  const handleClick = () => alert('Clic!');
  const handleDoubleClick = () => alert('Doble Clic!');

  return (
    <div className="click-buttons">
      <button onClick={handleClick} onDoubleClick={handleDoubleClick}>
        Clic o Doble Clic
      </button>
    </div>
  );
};

export default ClickableButtons;
