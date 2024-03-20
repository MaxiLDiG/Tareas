function traducirIdiomaP(frase) {
  const vocales = ['a', 'e', 'i', 'o', 'u'];
  let traduccion = '';

  for (let i = 0; i < frase.length; i++) {
    let caracter = frase[i];
    if (vocales.includes(caracter.toLowerCase()))
      traduccion += caracter + 'p' + caracter.toLowerCase();
    else traduccion += caracter;
  }

  return traduccion;
}

const frase = 'Hola, cómo estás?';
console.log(traducirIdiomaP(frase));
