import { Link } from 'react-router-dom';
import tasks from '../data/tasks';
import { Button, Card, Container, Row, Col } from 'react-bootstrap';

function Home() {
  return (
    <Container className="mt-5">
      <h1 className="text-center mb-4">Task List</h1>
      <div className="text-center mb-4">
        <Link to="/create">
          <Button variant="primary">Crear nueva tarea</Button>
        </Link>
      </div>
      <Row>
        {tasks.map(task => (
          <Col key={task.id} md={6} lg={4} className="mb-4">
            <Card>
              <Card.Body>
                <Card.Title>{task.title}</Card.Title>
                <Card.Text>{task.description}</Card.Text>
                <Link to={`/task/${task.id}`}>
                  <Button variant="primary">Ver detalles</Button>
                </Link>
              </Card.Body>
            </Card>
          </Col>
        ))}
      </Row>
    </Container>
  );
}

export default Home;
