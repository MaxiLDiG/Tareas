class CEmpleado {
    constructor(nombre, anioIngreso, salario, direccion) {
        this.nombre = nombre;
        this.anioIngreso = anioIngreso;
        this.salario = salario;
        this.direccion = direccion;
    }

    showData() {
        alert("Nombre: " + this.nombre);
        alert("Año de ingreso: " + this.anioIngreso);
        alert("Salario: " + this.salario + "USD");
        alert("Dirección: " + this.direccion);
    }
} 

let empleado1 = new CEmpleado("Robert", 1994, 2000, "64C-WallsStreat");
empleado1.showData();
let empleado2 = new CEmpleado("Sam", 2000, 1000, "68D-WallsStreat");
empleado2.showData();
let empleado3 = new CEmpleado("John", 1999, 3000, "26B-WallsStreat");
empleado3.showData();