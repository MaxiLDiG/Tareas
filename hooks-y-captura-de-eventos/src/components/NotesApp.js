import React, { useState, useEffect } from 'react';
import '../styles/NotesApp.css';

const NotesApp = () => {
  const [note, setNote] = useState('');
  const [message, setMessage] = useState('');

  useEffect(() => {
    const timeoutId = setTimeout(() => {
      setMessage('Nota guardada automáticamente');
    }, 2000);

    return () => clearTimeout(timeoutId);
  }, [note]);

  return (
    <div className="notes-app">
      <textarea
        value={note}
        onChange={(e) => setNote(e.target.value)}
        placeholder="Escribí tu nota"
      />
      {message && <p>{message}</p>}
    </div>
  );
};

export default NotesApp;
