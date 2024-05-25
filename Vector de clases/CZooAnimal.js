class CZooAnimal {
  constructor(id, name, cageNumber, idTypeAnimal, weight) {
    this.id = id;
    this.name = name;
    this.cageNumber = cageNumber;
    this.idTypeAnimal = idTypeAnimal;
    this.weight = weight;
  }
}

let zooAnimals = [
  new CZooAnimal(1, 'Leon', 2, 1, 190),
  new CZooAnimal(2, 'Loro', 5, 2, 1.5),
  new CZooAnimal(3, 'Serpiente', 3, 3, 10),
  new CZooAnimal(4, 'Tigre', 4, 1, 220),
  new CZooAnimal(5, 'Leopardo', 5, 1, 70)
];

const countAnimalsInCage5Under3kg = () => {
  return zooAnimals.filter((animal) => animal.cageNumber === 5 && animal.weight < 3)
    .length;
};
const countFelinosInCages2To5 = () => {
  return zooAnimals.filter(
    (animal) =>
      animal.idTypeAnimal === 1 && animal.cageNumber >= 2 && animal.cageNumber <= 5
  ).length;
};

const animalInCage4Under120kg = () => {
  return zooAnimals
    .filter((animal) => animal.cageNumber === 4 && animal.weight < 120)
    .map((animal) => animal.name);
};

const createZooTable = () => {
  let table =
    '<table border="1"><tr><th>Id</th><th>Name</th><th>Cage Number</th><th>Type</th><th>Weight</th></tr>';
  for (let animal of zooAnimals) {
    table += `<tr>
                    <td>${animal.id}</td>
                    <td>${animal.name}</td>
                    <td>${animal.cageNumber}</td>
                    <td>${animal.idTypeAnimal}</td>
                    <td>${animal.weight}</td>
                  </tr>`;
  }
  table += '</table>';
  return table;
};

document.addEventListener('DOMContentLoaded', function () {
  document.write(
    '<h2>Cantidad de animales en la Jaula 5 cuyo peso es menor a 3 kg: ' +
      countAnimalsInCage5Under3kg() +
      '</h2>'
  );
  document.write(
    '<h2>Cantidad de felinos entre las jaulas 2 a 5: ' +
      countFelinosInCages2To5() +
      '</h2>'
  );
  document.write(
    '<h2>Nombre del animal en la Jaula 4 cuyo peso es menor a 120 kg: ' +
      animalInCage4Under120kg().join(', ') +
      '</h2>'
  );
  document.write('<h2>Tabla de Animales del Zoo</h2>');
  document.write(createZooTable());
});
