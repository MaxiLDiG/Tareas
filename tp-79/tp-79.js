class CRectangulo {
    constructor(base, altura) {
        this.base = base;
        this.altura = altura;
    };
    CalcularArea() {
        return this.base * this.altura;
    }
}

let rectangulo1 = new CRectangulo(4,5);
document.write("Área del rectángulo 1: " + rectangulo1.CalcularArea() + "<br>");
let rectangulo2 = new CRectangulo(5,8);
document.write("Área del rectángulo 2: " + rectangulo2.CalcularArea());