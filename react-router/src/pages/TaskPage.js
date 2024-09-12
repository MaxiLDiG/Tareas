import { useParams, useNavigate } from 'react-router-dom';
import { useState } from 'react';
import tasks from '../data/tasks';
import { Container, Card, Button } from 'react-bootstrap';

function TaskPage() {
  const { id } = useParams();
  const navigate = useNavigate();
  const task = tasks.find(task => task.id === parseInt(id));

  const [taskStatus, setTaskStatus] = useState(task ? task.status : 'incompleta');

  if (!task) {
    return <p className="text-center">Tarea no encontrada</p>;
  }

  const toggleStatus = () => {
    const newStatus = taskStatus === 'completa' ? 'incompleta' : 'completa';
    setTaskStatus(newStatus);

    task.status = newStatus;
  };

  return (
    <Container className="mt-5">
      <Card>
        <Card.Body>
          <Card.Title className="mb-4">{task.title}</Card.Title>
          <Card.Text><strong>Descripción:</strong> {task.description}</Card.Text>
          <Card.Text><strong>Fecha de creación:</strong> {task.date}</Card.Text>
          <Card.Text>
            <strong>Estado:</strong> {taskStatus === 'completa' ? 'Completa' : 'Incompleta'}
          </Card.Text>

          <div className="d-flex gap-3">
            <Button variant={taskStatus === 'completa' ? 'danger' : 'success'} onClick={toggleStatus}>
              {taskStatus === 'completa' ? 'Marcar como Incompleta' : 'Marcar como Completa'}
            </Button>

            <Button variant="secondary" onClick={() => navigate('/')}>
              Volver a la lista
            </Button>
          </div>

        </Card.Body>
      </Card>
    </Container>
  );
}

export default TaskPage;
