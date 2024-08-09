document.getElementById('start-game').addEventListener('click', startGame);
document.getElementById('play-again').addEventListener('click', resetGame);

let startTime, endTime, timerInterval;
let wordToGuess;
let remainingAttempts = 6;
let score = 0;
let playerName;
let usedLetters = [];

async function startGame() {
    playerName = document.getElementById('name').value;
    if (playerName.trim() === '') return;

    document.getElementById('name-section').style.display = 'none';
    document.getElementById('game-section').style.display = 'block';

    wordToGuess = await fetchRandomWord();
    startTime = new Date();
    usedLetters = [];
    document.getElementById('used-letters').textContent = '';

    startTimer();
    displayWord();
    document.addEventListener('keydown', handleKeydown);
}

async function fetchRandomWord() {
    const response = await fetch('https://random-word-api.herokuapp.com/word?number=1');
    const data = await response.json();
    return data[0].toUpperCase();
}

function displayWord() {
    const display = wordToGuess.split('').map(letter => '_').join(' ');
    document.getElementById('word-display').textContent = display;
}

function handleKeydown(event) {
    const letter = event.key.toUpperCase();
    if (letter >= 'A' && letter <= 'Z' && !usedLetters.includes(letter)) {
        guessLetter(letter);
    }
}

function guessLetter(letter) {
    usedLetters.push(letter);
    document.getElementById('used-letters').textContent = usedLetters.join('');

    if (wordToGuess.includes(letter)) {
        updateWordDisplay(letter);
    } else {
        remainingAttempts--;
        document.getElementById('attempts-left').textContent = remainingAttempts;
    }

    if (remainingAttempts === 0 || document.getElementById('word-display').textContent.indexOf('_') === -1) {
        endGame();
    }
}

function updateWordDisplay(letter) {
    const displayArray = document.getElementById('word-display').textContent.split(' ');
    for (let i = 0; i < wordToGuess.length; i++) {
        if (wordToGuess[i] === letter) {
            displayArray[i] = letter;
        }
    }
    document.getElementById('word-display').textContent = displayArray.join(' ');
}

function startTimer() {
    timerInterval = setInterval(() => {
        const currentTime = Math.round((new Date() - startTime) / 1000);
        document.getElementById('game-timer').textContent = currentTime;
    }, 1000);
}

function stopTimer() {
    clearInterval(timerInterval);
}

function endGame() {
    stopTimer();
    document.removeEventListener('keydown', handleKeydown);

    document.getElementById('game-section').style.display = 'none';
    document.getElementById('game-over-section').style.display = 'block';

    endTime = new Date();
    const timeTaken = Math.round((endTime - startTime) / 1000);
    const finalScore = calculateScore();

    document.getElementById('final-name').textContent = playerName;
    document.getElementById('final-time').textContent = `${timeTaken} segundos`;
    document.getElementById('final-score').textContent = finalScore;
    document.getElementById('final-date').textContent = new Date().toLocaleDateString();
}

function calculateScore() {
    return 100 - (6 - remainingAttempts) * 10;
}

function resetGame() {
  remainingAttempts = 6;
  document.getElementById('attempts-left').textContent = remainingAttempts;
  document.getElementById('game-timer').textContent = '0';
  document.getElementById('name-section').style.display = 'block';
  document.getElementById('game-over-section').style.display = 'none';
  document.getElementById('name').value = '';
}

function endGame() {
  stopTimer();
  document.removeEventListener('keydown', handleKeydown);

  document.getElementById('game-section').style.display = 'none';
  document.getElementById('name-section').style.display = 'none';
  document.getElementById('game-over-section').style.display = 'block';

  endTime = new Date();
  const timeTaken = Math.round((endTime - startTime) / 1000);
  const finalScore = calculateScore();

  saveScore(playerName, finalScore, timeTaken);
}

function saveScore(name, score, time) {
  fetch('/save-score', {
      method: 'POST',
      headers: {
          'Content-Type': 'application/json'
      },
      body: JSON.stringify({ name, score, time })
  }).then(response => {
      if (response.ok) {
          fetchScores();
      } else {
          console.error('Error al guardar los datos');
      }
  });
}

function fetchScores() {
  fetch('/get-scores')
      .then(response => response.json())
      .then(data => {
          displayScores(data);
      });
}

function displayScores(data) {
  const scoresTable = document.getElementById('scores-table');
  scoresTable.innerHTML = '<tr><th>Nombre</th><th>Puntaje</th><th>Tiempo</th><th>Fecha</th></tr>';

  data.forEach(row => {
      const newRow = scoresTable.insertRow();
      newRow.insertCell(0).textContent = row.name;
      newRow.insertCell(1).textContent = row.score;
      newRow.insertCell(2).textContent = `${row.time}s`;
      newRow.insertCell(3).textContent = row.date;
  });

  document.getElementById('play-again').style.display = 'inline-block';
}
