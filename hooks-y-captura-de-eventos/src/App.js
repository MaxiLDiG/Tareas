import React from 'react';
import './App.css';
import ImageGallery from './components/ImageGallery';
import FormWithValidation from './components/FormWithValidation';
import GuessTheNumber from './components/GuessTheNumber';
import ClickableButtons from './components/ClickableButtons';
import NotesApp from './components/NotesApp';

function App() {
  return (
    <div className="App">
      <div className="full-screen">
        <ImageGallery />
      </div>
      <div className="full-screen ">
        <FormWithValidation />
      </div>
      <div className="full-screen">
        <GuessTheNumber />
      </div>
      <div className="full-screen">
        <ClickableButtons />
      </div>
      <div className="full-screen">
        <NotesApp />
      </div>
    </div>
  );
}

export default App;
