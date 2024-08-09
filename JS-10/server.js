const express = require('express');
const mysql = require('mysql2');
const bodyParser = require('body-parser');
const app = express();
const port = 3000;

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

const db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'score'
});

db.connect((err) => {
    if (err) {
        console.error('Error al conectar con la base de datos:', err);
        return;
    }
    console.log('Conexión a la base de datos MySQL exitosa');
});

db.query(`CREATE TABLE IF NOT EXISTS scores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    score INT,
    time INT,
    date DATE
)`, (err) => {
    if (err) {
        console.error('Error al crear la tabla:', err);
    }
});

app.post('/save-score', (req, res) => {
    const { name, score, time } = req.body;
    const date = new Date().toLocaleDateString();

    db.query(`INSERT INTO scores (name, score, time, date) VALUES (?, ?, ?, ?)`,
        [name, score, time, date], (err) => {
            if (err) {
                return res.status(500).send('Error al guardar los datos');
            }
            res.send('Datos guardados exitosamente');
        });
});

app.get('/get-scores', (req, res) => {
    db.query(`SELECT * FROM scores ORDER BY score DESC`, (err, rows) => {
        if (err) {
            return res.status(500).send('Error al obtener los datos');
        }
        res.json(rows);
    });
});

app.use(express.static('public'));

app.listen(port, () => {
    console.log(`Servidor escuchando en http://localhost:${port}`);
});
