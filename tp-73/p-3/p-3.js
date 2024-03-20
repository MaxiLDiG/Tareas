const os = require('os')
console.log('Espacio libre de memoria: ' + os.freemem())
let v = [];
for(let i = 0; i <= 1000000; i++) {
    v.push(i);
}

console.log('Nuevo espacio libre: ' + os.freemem());