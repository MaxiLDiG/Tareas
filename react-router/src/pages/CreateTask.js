import { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { Container, Form, Button } from 'react-bootstrap';

function CreateTask() {
  const [title, setTitle] = useState('');
  const [description, setDescription] = useState('');
  const [status, setStatus] = useState('incompleta');
  const navigate = useNavigate();

  const saveTaskToLocalStorage = (task) => {
    const storedTasks = localStorage.getItem('tasks');
    const tasks = storedTasks ? JSON.parse(storedTasks) : [];
    const updatedTasks = [...tasks, task];
    localStorage.setItem('tasks', JSON.stringify(updatedTasks));
  };

  const handleSubmit = (e) => {
    e.preventDefault();

    const newTask = {
      id: Date.now(),
      title,
      description,
      status,
      date: new Date().toLocaleDateString(),
    };

    saveTaskToLocalStorage(newTask);
    navigate('/');
  };

  return (
    <Container className="mt-5">
      <h1>Crear Nueva Tarea</h1>
      <Form onSubmit={handleSubmit}>
        <Form.Group controlId="formTitle">
          <Form.Label>Título</Form.Label>
          <Form.Control
            type="text"
            placeholder="Ingrese el título de la tarea"
            value={title}
            onChange={(e) => setTitle(e.target.value)}
            required
          />
        </Form.Group>

        <Form.Group controlId="formDescription" className="mt-3">
          <Form.Label>Descripción</Form.Label>
          <Form.Control
            as="textarea"
            rows={3}
            placeholder="Ingrese una descripción"
            value={description}
            onChange={(e) => setDescription(e.target.value)}
            required
          />
        </Form.Group>

        <Form.Group controlId="formStatus" className="mt-3">
          <Form.Label>Estado</Form.Label>
          <Form.Control
            as="select"
            value={status}
            onChange={(e) => setStatus(e.target.value)}
          >
            <option value="incompleta">Incompleta</option>
            <option value="completa">Completa</option>
          </Form.Control>
        </Form.Group>

        <Button variant="primary" type="submit" className="mt-3">
          Guardar Tarea
        </Button>
      </Form>
    </Container>
  );
}

export default CreateTask;
