import { BrowserRouter as Router, Route, Routes } from 'react-router-dom';
import Home from './pages/Home';
import CreateTask from './pages/CreateTask';
import TaskPage from './pages/TaskPage';

function App() {
  return (
    <Router>
      <Routes>
        <Route path="/" element={<Home />} />
        <Route path="/task/:id" element={<TaskPage />} />
        <Route path="/create" element={<CreateTask />} />
      </Routes>
    </Router>
  );
}

export default App;
