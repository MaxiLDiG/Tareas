<?php
echo '<link href="style.css" rel="stylesheet">';
class CEmpleado
{
    private $nombre;
    private $nHoras;
    private $salaryperHour;
    public function __construct($nombre, $nHoras, $salaryperHour)
    {
        $this->nombre = $nombre;
        $this->nHoras = $nHoras;
        $this->salaryperHour = $salaryperHour;
    }
    public function mostrarDatos()
    {
        echo ('<div class="container">');
        echo ('<div class="respuesta">');
        echo('<div>');
        echo ("<b>Nombre del empleado: </b>" . $this->nombre . "<br>");
        echo('</div>');
        echo('<div>');
        echo ("<b>Sueldo total: </b>" . $this->nHoras * $this->salaryperHour);
        echo('</div>');
        echo ('</div>');
        echo ('</div>');
    }
}

$name = $_REQUEST['name'];
$nHoras = $_REQUEST['nHoras'];
$salary = $_REQUEST['salaryPerHour'];

$empleado = new CEmpleado($name, $nHoras, $salary);
$empleado->mostrarDatos();
