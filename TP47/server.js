const express = require('express');
const mysql = require('mysql2');
const bodyParser = require('body-parser');
const app = express();
const port = 3000;

const connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '',
  database: 'TP47'
});

connection.connect(err => {
  if (err) {
    console.error('Error:', err);
    return;
  }
  console.log('Conectado a la base de datos MySQL.');
});

app.use(bodyParser.json());

app.post('/autores', (req, res) => {
  const { nombre, apellido, fecha_nacimiento, nacionalidad, mejor_obra, ano_publicacion, edad_publicacion } = req.body;
  const query = 'INSERT INTO Autores (nombre, apellido, fecha_nacimiento, nacionalidad, mejor_obra, ano_publicacion, edad_publicacion) VALUES (?, ?, ?, ?, ?, ?, ?)';
  connection.query(query, [nombre, apellido, fecha_nacimiento, nacionalidad, mejor_obra, ano_publicacion, edad_publicacion], (err, results) => {
    if (err) {
      console.error('Error insertando autor:', err);
      res.status(500).send('Error insertando autor.');
      return;
    }
    res.status(201).send('Autor creado.');
  });
});

app.get('/autores', (req, res) => {
  const query = 'SELECT * FROM Autores';
  connection.query(query, (err, results) => {
    if (err) {
      console.error('Error obteniendo autores:', err);
      res.status(500).send('Error obteniendo autores.');
      return;
    }
    res.status(200).json(results);
  });
});

app.get('/autores/:id', (req, res) => {
  const { id } = req.params;
  const query = 'SELECT * FROM Autores WHERE id = ?';
  connection.query(query, [id], (err, results) => {
    if (err) {
      console.error('Error obteniendo autor:', err);
      res.status(500).send('Error obteniendo autor.');
      return;
    }
    if (results.length === 0) {
      res.status(404).send('Autor no encontrado.');
      return;
    }
    res.status(200).json(results[0]);
  });
});

app.put('/autores/:id', (req, res) => {
  const { id } = req.params;
  const { nombre, apellido, fecha_nacimiento, nacionalidad, mejor_obra, ano_publicacion, edad_publicacion } = req.body;
  const query = 'UPDATE Autores SET nombre = ?, apellido = ?, fecha_nacimiento = ?, nacionalidad = ?, mejor_obra = ?, ano_publicacion = ?, edad_publicacion = ? WHERE id = ?';
  connection.query(query, [nombre, apellido, fecha_nacimiento, nacionalidad, mejor_obra, ano_publicacion, edad_publicacion, id], (err, results) => {
    if (err) {
      console.error('Error actualizando autor:', err);
      res.status(500).send('Error actualizando autor.');
      return;
    }
    res.status(200).send('Autor actualizado.');
  });
});

app.delete('/autores/:id', (req, res) => {
  const { id } = req.params;
  const query = 'DELETE FROM Autores WHERE id = ?';
  connection.query(query, [id], (err, results) => {
    if (err) {
      console.error('Error eliminando autor:', err);
      res.status(500).send('Error eliminando autor.');
      return;
    }
    res.status(200).send('Autor eliminado.');
  });
});

app.get('/autores/nacionalidad/argentina', (req, res) => {
  const query = "SELECT * FROM Autores WHERE nacionalidad = 'Argentino'";
  connection.query(query, (err, results) => {
    if (err) {
      console.error('Error obteniendo autores:', err);
      res.status(500).send('Error obteniendo autores.');
      return;
    }
    res.status(200).json(results);
  });
});

app.get('/autores/publicacion/1960-1980', (req, res) => {
  const query = 'SELECT * FROM Autores WHERE ano_publicacion BETWEEN 1960 AND 1980';
  connection.query(query, (err, results) => {
    if (err) {
      console.error('Error obteniendo autores:', err);
      res.status(500).send('Error obteniendo autores.');
      return;
    }
    res.status(200).json(results);
  });
});

app.get('/autores/edad-publicacion/promedio', (req, res) => {
  const query = 'SELECT AVG(edad_publicacion) AS promedio_edad_publicacion FROM Autores';
  connection.query(query, (err, results) => {
    if (err) {
      console.error('Error obteniendo promedio de edad de publicación:', err);
      res.status(500).send('Error obteniendo promedio de edad de publicación.');
      return;
    }
    res.status(200).json(results[0]);
  });
});

app.listen(port, () => {
  console.log(`Servidor corriendo en http://localhost:${port}`);
});