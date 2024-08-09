-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 02, 2024 at 08:42 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `administracion`
--
CREATE DATABASE IF NOT EXISTS `administracion` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `administracion`;

-- --------------------------------------------------------

--
-- Table structure for table `empleados`
--

CREATE TABLE `empleados` (
  `nombre` varchar(30) DEFAULT NULL,
  `documento` int(11) DEFAULT NULL,
  `sexo` varchar(1) DEFAULT NULL,
  `domicilio` int(11) DEFAULT NULL,
  `sueldobasico` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
--
-- Database: `aeropuerto`
--
CREATE DATABASE IF NOT EXISTS `aeropuerto` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `aeropuerto`;
--
-- Database: `aeropuertodb`
--
CREATE DATABASE IF NOT EXISTS `aeropuertodb` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `aeropuertodb`;

-- --------------------------------------------------------

--
-- Table structure for table `aeropuertos`
--

CREATE TABLE `aeropuertos` (
  `id_aeropuerto` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `id_ciudad` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `ciudades`
--

CREATE TABLE `ciudades` (
  `id_ciudad` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `pais` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `compañías`
--

CREATE TABLE `compañías` (
  `id_compania` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `pasajeros`
--

CREATE TABLE `pasajeros` (
  `id_pasajero` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `edad` int(11) DEFAULT NULL,
  `numero_asiento` varchar(10) NOT NULL,
  `id_vuelo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tipos_aviones`
--

CREATE TABLE `tipos_aviones` (
  `id_tipo_avion` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `vuelos`
--

CREATE TABLE `vuelos` (
  `id_vuelo` int(11) NOT NULL,
  `id_compania` int(11) DEFAULT NULL,
  `id_tipo_avion` int(11) DEFAULT NULL,
  `tipo_vuelo` varchar(10) DEFAULT NULL CHECK (`tipo_vuelo` in ('salida','llegada'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `vuelos_llegada`
--

CREATE TABLE `vuelos_llegada` (
  `id_vuelo` int(11) NOT NULL,
  `hora_aterrizaje` datetime DEFAULT NULL,
  `id_aeropuerto_origen` int(11) DEFAULT NULL,
  `puerta_salida` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `vuelos_salida`
--

CREATE TABLE `vuelos_salida` (
  `id_vuelo` int(11) NOT NULL,
  `hora_salida` datetime DEFAULT NULL,
  `id_aeropuerto_destino` int(11) DEFAULT NULL,
  `puerta_embarque` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `aeropuertos`
--
ALTER TABLE `aeropuertos`
  ADD PRIMARY KEY (`id_aeropuerto`),
  ADD KEY `id_ciudad` (`id_ciudad`);

--
-- Indexes for table `ciudades`
--
ALTER TABLE `ciudades`
  ADD PRIMARY KEY (`id_ciudad`);

--
-- Indexes for table `compañías`
--
ALTER TABLE `compañías`
  ADD PRIMARY KEY (`id_compania`);

--
-- Indexes for table `pasajeros`
--
ALTER TABLE `pasajeros`
  ADD PRIMARY KEY (`id_pasajero`),
  ADD KEY `id_vuelo` (`id_vuelo`);

--
-- Indexes for table `tipos_aviones`
--
ALTER TABLE `tipos_aviones`
  ADD PRIMARY KEY (`id_tipo_avion`);

--
-- Indexes for table `vuelos`
--
ALTER TABLE `vuelos`
  ADD PRIMARY KEY (`id_vuelo`),
  ADD KEY `id_compania` (`id_compania`),
  ADD KEY `id_tipo_avion` (`id_tipo_avion`);

--
-- Indexes for table `vuelos_llegada`
--
ALTER TABLE `vuelos_llegada`
  ADD PRIMARY KEY (`id_vuelo`),
  ADD KEY `id_aeropuerto_origen` (`id_aeropuerto_origen`);

--
-- Indexes for table `vuelos_salida`
--
ALTER TABLE `vuelos_salida`
  ADD PRIMARY KEY (`id_vuelo`),
  ADD KEY `id_aeropuerto_destino` (`id_aeropuerto_destino`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `aeropuertos`
--
ALTER TABLE `aeropuertos`
  ADD CONSTRAINT `aeropuertos_ibfk_1` FOREIGN KEY (`id_ciudad`) REFERENCES `ciudades` (`id_ciudad`);

--
-- Constraints for table `pasajeros`
--
ALTER TABLE `pasajeros`
  ADD CONSTRAINT `pasajeros_ibfk_1` FOREIGN KEY (`id_vuelo`) REFERENCES `vuelos` (`id_vuelo`);

--
-- Constraints for table `vuelos`
--
ALTER TABLE `vuelos`
  ADD CONSTRAINT `vuelos_ibfk_1` FOREIGN KEY (`id_compania`) REFERENCES `compañías` (`id_compania`),
  ADD CONSTRAINT `vuelos_ibfk_2` FOREIGN KEY (`id_tipo_avion`) REFERENCES `tipos_aviones` (`id_tipo_avion`);

--
-- Constraints for table `vuelos_llegada`
--
ALTER TABLE `vuelos_llegada`
  ADD CONSTRAINT `vuelos_llegada_ibfk_1` FOREIGN KEY (`id_vuelo`) REFERENCES `vuelos` (`id_vuelo`),
  ADD CONSTRAINT `vuelos_llegada_ibfk_2` FOREIGN KEY (`id_aeropuerto_origen`) REFERENCES `aeropuertos` (`id_aeropuerto`);

--
-- Constraints for table `vuelos_salida`
--
ALTER TABLE `vuelos_salida`
  ADD CONSTRAINT `vuelos_salida_ibfk_1` FOREIGN KEY (`id_vuelo`) REFERENCES `vuelos` (`id_vuelo`),
  ADD CONSTRAINT `vuelos_salida_ibfk_2` FOREIGN KEY (`id_aeropuerto_destino`) REFERENCES `aeropuertos` (`id_aeropuerto`);
--
-- Database: `alquilerautomovilesdb`
--
CREATE DATABASE IF NOT EXISTS `alquilerautomovilesdb` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `alquilerautomovilesdb`;

-- --------------------------------------------------------

--
-- Table structure for table `agencias`
--

CREATE TABLE `agencias` (
  `id_agencia` varchar(50) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `direccion` varchar(200) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `clientes`
--

CREATE TABLE `clientes` (
  `id_cliente` varchar(50) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `apellido` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `coches`
--

CREATE TABLE `coches` (
  `id_coche` varchar(50) NOT NULL,
  `marca` varchar(100) DEFAULT NULL,
  `modelo` varchar(100) DEFAULT NULL,
  `año` int(11) DEFAULT NULL,
  `id_garaje` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `garajes`
--

CREATE TABLE `garajes` (
  `id_garaje` varchar(50) NOT NULL,
  `numero` varchar(20) DEFAULT NULL,
  `direccion` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `reservas`
--

CREATE TABLE `reservas` (
  `id_reserva` varchar(50) NOT NULL,
  `id_cliente` varchar(50) DEFAULT NULL,
  `id_agencia` varchar(50) DEFAULT NULL,
  `fecha_comienzo` date DEFAULT NULL,
  `fecha_terminacion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `reservas_coches`
--

CREATE TABLE `reservas_coches` (
  `id_reserva` varchar(50) NOT NULL,
  `id_coche` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `agencias`
--
ALTER TABLE `agencias`
  ADD PRIMARY KEY (`id_agencia`);

--
-- Indexes for table `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Indexes for table `coches`
--
ALTER TABLE `coches`
  ADD PRIMARY KEY (`id_coche`),
  ADD KEY `id_garaje` (`id_garaje`);

--
-- Indexes for table `garajes`
--
ALTER TABLE `garajes`
  ADD PRIMARY KEY (`id_garaje`);

--
-- Indexes for table `reservas`
--
ALTER TABLE `reservas`
  ADD PRIMARY KEY (`id_reserva`),
  ADD KEY `id_cliente` (`id_cliente`),
  ADD KEY `id_agencia` (`id_agencia`);

--
-- Indexes for table `reservas_coches`
--
ALTER TABLE `reservas_coches`
  ADD PRIMARY KEY (`id_reserva`,`id_coche`),
  ADD KEY `id_coche` (`id_coche`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `coches`
--
ALTER TABLE `coches`
  ADD CONSTRAINT `coches_ibfk_1` FOREIGN KEY (`id_garaje`) REFERENCES `garajes` (`id_garaje`);

--
-- Constraints for table `reservas`
--
ALTER TABLE `reservas`
  ADD CONSTRAINT `reservas_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`),
  ADD CONSTRAINT `reservas_ibfk_2` FOREIGN KEY (`id_agencia`) REFERENCES `agencias` (`id_agencia`);

--
-- Constraints for table `reservas_coches`
--
ALTER TABLE `reservas_coches`
  ADD CONSTRAINT `reservas_coches_ibfk_1` FOREIGN KEY (`id_reserva`) REFERENCES `reservas` (`id_reserva`),
  ADD CONSTRAINT `reservas_coches_ibfk_2` FOREIGN KEY (`id_coche`) REFERENCES `coches` (`id_coche`);
--
-- Database: `club_nautico`
--
CREATE DATABASE IF NOT EXISTS `club_nautico` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `club_nautico`;

-- --------------------------------------------------------

--
-- Table structure for table `barco`
--

CREATE TABLE `barco` (
  `matricula` varchar(20) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `num_amarre` int(11) DEFAULT NULL,
  `cuota_amarre` float DEFAULT NULL,
  `id_socio` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `patron`
--

CREATE TABLE `patron` (
  `id_patron` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `apellido` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `salida`
--

CREATE TABLE `salida` (
  `id_salida` int(11) NOT NULL,
  `fecha_hora` datetime DEFAULT NULL,
  `destino` varchar(100) DEFAULT NULL,
  `matricula_barco` varchar(20) DEFAULT NULL,
  `id_patron` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `socio`
--

CREATE TABLE `socio` (
  `id_socio` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `apellido` varchar(50) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barco`
--
ALTER TABLE `barco`
  ADD PRIMARY KEY (`matricula`),
  ADD KEY `id_socio` (`id_socio`);

--
-- Indexes for table `patron`
--
ALTER TABLE `patron`
  ADD PRIMARY KEY (`id_patron`);

--
-- Indexes for table `salida`
--
ALTER TABLE `salida`
  ADD PRIMARY KEY (`id_salida`),
  ADD KEY `matricula_barco` (`matricula_barco`),
  ADD KEY `id_patron` (`id_patron`);

--
-- Indexes for table `socio`
--
ALTER TABLE `socio`
  ADD PRIMARY KEY (`id_socio`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `barco`
--
ALTER TABLE `barco`
  ADD CONSTRAINT `barco_ibfk_1` FOREIGN KEY (`id_socio`) REFERENCES `socio` (`id_socio`);

--
-- Constraints for table `salida`
--
ALTER TABLE `salida`
  ADD CONSTRAINT `salida_ibfk_1` FOREIGN KEY (`matricula_barco`) REFERENCES `barco` (`matricula`),
  ADD CONSTRAINT `salida_ibfk_2` FOREIGN KEY (`id_patron`) REFERENCES `patron` (`id_patron`);
--
-- Database: `conexion_db`
--
CREATE DATABASE IF NOT EXISTS `conexion_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `conexion_db`;

-- --------------------------------------------------------

--
-- Table structure for table `oficios`
--

CREATE TABLE `oficios` (
  `id_oficio` int(11) NOT NULL,
  `name_oficio` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `oficios`
--

INSERT INTO `oficios` (`id_oficio`, `name_oficio`) VALUES
(1, 'agricultor'),
(2, 'fisico');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `oficios`
--
ALTER TABLE `oficios`
  ADD PRIMARY KEY (`id_oficio`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `oficios`
--
ALTER TABLE `oficios`
  MODIFY `id_oficio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Database: `crud_db`
--
CREATE DATABASE IF NOT EXISTS `crud_db` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci;
USE `crud_db`;

-- --------------------------------------------------------

--
-- Table structure for table `printer`
--

CREATE TABLE `printer` (
  `id` int(11) NOT NULL,
  `code` int(6) NOT NULL,
  `model` int(6) NOT NULL,
  `color` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `type` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `price` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `printer`
--
ALTER TABLE `printer`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `printer`
--
ALTER TABLE `printer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Database: `curso`
--
CREATE DATABASE IF NOT EXISTS `curso` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `curso`;

-- --------------------------------------------------------

--
-- Table structure for table `ciudades`
--

CREATE TABLE `ciudades` (
  `idciudad` int(11) NOT NULL,
  `nombre` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ciudades`
--

INSERT INTO `ciudades` (`idciudad`, `nombre`) VALUES
(1, 'Mar del Plata');

-- --------------------------------------------------------

--
-- Table structure for table `personas`
--

CREATE TABLE `personas` (
  `idpersona` int(11) NOT NULL,
  `nombre` text NOT NULL,
  `apellido` text NOT NULL,
  `fecha_nac` int(11) NOT NULL,
  `dni` int(11) NOT NULL,
  `idciudad` int(11) NOT NULL,
  `sexo` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `personas`
--

INSERT INTO `personas` (`idpersona`, `nombre`, `apellido`, `fecha_nac`, `dni`, `idciudad`, `sexo`) VALUES
(1, 'Valeria', 'Garcia', 1991, 34456987, 4, 'F'),
(2, 'Carolina', 'Gomez', 1970, 22897516, 1, 'F');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ciudades`
--
ALTER TABLE `ciudades`
  ADD PRIMARY KEY (`idciudad`);

--
-- Indexes for table `personas`
--
ALTER TABLE `personas`
  ADD PRIMARY KEY (`idpersona`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ciudades`
--
ALTER TABLE `ciudades`
  MODIFY `idciudad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `personas`
--
ALTER TABLE `personas`
  MODIFY `idpersona` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Database: `farmacia`
--
CREATE DATABASE IF NOT EXISTS `farmacia` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `farmacia`;

-- --------------------------------------------------------

--
-- Table structure for table `cliente`
--

CREATE TABLE `cliente` (
  `id_cliente` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `datos_bancarios` varchar(200) DEFAULT NULL,
  `credito` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `compra`
--

CREATE TABLE `compra` (
  `id_compra` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  `fecha_pago` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `detalle_compra`
--

CREATE TABLE `detalle_compra` (
  `id_detalle` int(11) NOT NULL,
  `id_compra` int(11) DEFAULT NULL,
  `codigo_medicamento` int(11) DEFAULT NULL,
  `unidades` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `familia`
--

CREATE TABLE `familia` (
  `id_familia` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `laboratorio`
--

CREATE TABLE `laboratorio` (
  `codigo_laboratorio` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `direccion` varchar(200) DEFAULT NULL,
  `fax` varchar(20) DEFAULT NULL,
  `contacto` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `medicamento`
--

CREATE TABLE `medicamento` (
  `codigo_medicamento` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `tipo` varchar(50) DEFAULT NULL,
  `unidades_stock` int(11) DEFAULT NULL,
  `unidades_vendidas` int(11) DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `receta_requerida` tinyint(1) DEFAULT NULL,
  `codigo_laboratorio` int(11) DEFAULT NULL,
  `id_familia` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Indexes for table `compra`
--
ALTER TABLE `compra`
  ADD PRIMARY KEY (`id_compra`),
  ADD KEY `id_cliente` (`id_cliente`);

--
-- Indexes for table `detalle_compra`
--
ALTER TABLE `detalle_compra`
  ADD PRIMARY KEY (`id_detalle`),
  ADD KEY `id_compra` (`id_compra`),
  ADD KEY `codigo_medicamento` (`codigo_medicamento`);

--
-- Indexes for table `familia`
--
ALTER TABLE `familia`
  ADD PRIMARY KEY (`id_familia`);

--
-- Indexes for table `laboratorio`
--
ALTER TABLE `laboratorio`
  ADD PRIMARY KEY (`codigo_laboratorio`);

--
-- Indexes for table `medicamento`
--
ALTER TABLE `medicamento`
  ADD PRIMARY KEY (`codigo_medicamento`),
  ADD KEY `codigo_laboratorio` (`codigo_laboratorio`),
  ADD KEY `id_familia` (`id_familia`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `compra`
--
ALTER TABLE `compra`
  ADD CONSTRAINT `compra_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`);

--
-- Constraints for table `detalle_compra`
--
ALTER TABLE `detalle_compra`
  ADD CONSTRAINT `detalle_compra_ibfk_1` FOREIGN KEY (`id_compra`) REFERENCES `compra` (`id_compra`),
  ADD CONSTRAINT `detalle_compra_ibfk_2` FOREIGN KEY (`codigo_medicamento`) REFERENCES `medicamento` (`codigo_medicamento`);

--
-- Constraints for table `medicamento`
--
ALTER TABLE `medicamento`
  ADD CONSTRAINT `medicamento_ibfk_1` FOREIGN KEY (`codigo_laboratorio`) REFERENCES `laboratorio` (`codigo_laboratorio`),
  ADD CONSTRAINT `medicamento_ibfk_2` FOREIGN KEY (`id_familia`) REFERENCES `familia` (`id_familia`);
--
-- Database: `gimnasiosiempreenformadb`
--
CREATE DATABASE IF NOT EXISTS `gimnasiosiempreenformadb` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `gimnasiosiempreenformadb`;

-- --------------------------------------------------------

--
-- Table structure for table `aparatos`
--

CREATE TABLE `aparatos` (
  `id_aparato` int(11) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `estado_conservacion` varchar(50) DEFAULT NULL,
  `id_sala` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `clases`
--

CREATE TABLE `clases` (
  `id_clase` int(11) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `dia_hora` datetime DEFAULT NULL,
  `id_sala` int(11) DEFAULT NULL,
  `id_monitor` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `monitores`
--

CREATE TABLE `monitores` (
  `dni` varchar(20) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `titulacion` tinyint(1) DEFAULT NULL,
  `experiencia_profesional` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `monitores_clases`
--

CREATE TABLE `monitores_clases` (
  `dni_monitor` varchar(20) NOT NULL,
  `id_clase` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `pistas_squash`
--

CREATE TABLE `pistas_squash` (
  `id_pista` int(11) NOT NULL,
  `ubicacion` varchar(100) DEFAULT NULL,
  `estado` varchar(50) DEFAULT NULL,
  `metros_cuadrados` decimal(5,2) DEFAULT NULL,
  `id_sala` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `reservas_pistas`
--

CREATE TABLE `reservas_pistas` (
  `id_reserva` int(11) NOT NULL,
  `id_socio` int(11) DEFAULT NULL,
  `id_pista` int(11) DEFAULT NULL,
  `fecha_hora` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `salas`
--

CREATE TABLE `salas` (
  `id_sala` int(11) NOT NULL,
  `metros_cuadrados` decimal(5,2) DEFAULT NULL,
  `ubicacion` varchar(100) DEFAULT NULL,
  `tipo_sala` varchar(50) DEFAULT NULL CHECK (`tipo_sala` in ('cardio','general','muscular','squash'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `socios`
--

CREATE TABLE `socios` (
  `id_socio` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `profesion` varchar(100) DEFAULT NULL,
  `datos_bancarios` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `socios_clases`
--

CREATE TABLE `socios_clases` (
  `id_socio` int(11) NOT NULL,
  `id_clase` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `aparatos`
--
ALTER TABLE `aparatos`
  ADD PRIMARY KEY (`id_aparato`),
  ADD KEY `id_sala` (`id_sala`);

--
-- Indexes for table `clases`
--
ALTER TABLE `clases`
  ADD PRIMARY KEY (`id_clase`),
  ADD KEY `id_sala` (`id_sala`),
  ADD KEY `id_monitor` (`id_monitor`);

--
-- Indexes for table `monitores`
--
ALTER TABLE `monitores`
  ADD PRIMARY KEY (`dni`);

--
-- Indexes for table `monitores_clases`
--
ALTER TABLE `monitores_clases`
  ADD PRIMARY KEY (`dni_monitor`,`id_clase`),
  ADD KEY `id_clase` (`id_clase`);

--
-- Indexes for table `pistas_squash`
--
ALTER TABLE `pistas_squash`
  ADD PRIMARY KEY (`id_pista`),
  ADD KEY `id_sala` (`id_sala`);

--
-- Indexes for table `reservas_pistas`
--
ALTER TABLE `reservas_pistas`
  ADD PRIMARY KEY (`id_reserva`),
  ADD KEY `id_socio` (`id_socio`),
  ADD KEY `id_pista` (`id_pista`);

--
-- Indexes for table `salas`
--
ALTER TABLE `salas`
  ADD PRIMARY KEY (`id_sala`);

--
-- Indexes for table `socios`
--
ALTER TABLE `socios`
  ADD PRIMARY KEY (`id_socio`);

--
-- Indexes for table `socios_clases`
--
ALTER TABLE `socios_clases`
  ADD PRIMARY KEY (`id_socio`,`id_clase`),
  ADD KEY `id_clase` (`id_clase`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `aparatos`
--
ALTER TABLE `aparatos`
  ADD CONSTRAINT `aparatos_ibfk_1` FOREIGN KEY (`id_sala`) REFERENCES `salas` (`id_sala`);

--
-- Constraints for table `clases`
--
ALTER TABLE `clases`
  ADD CONSTRAINT `clases_ibfk_1` FOREIGN KEY (`id_sala`) REFERENCES `salas` (`id_sala`),
  ADD CONSTRAINT `clases_ibfk_2` FOREIGN KEY (`id_monitor`) REFERENCES `monitores` (`dni`);

--
-- Constraints for table `monitores_clases`
--
ALTER TABLE `monitores_clases`
  ADD CONSTRAINT `monitores_clases_ibfk_1` FOREIGN KEY (`dni_monitor`) REFERENCES `monitores` (`dni`),
  ADD CONSTRAINT `monitores_clases_ibfk_2` FOREIGN KEY (`id_clase`) REFERENCES `clases` (`id_clase`);

--
-- Constraints for table `pistas_squash`
--
ALTER TABLE `pistas_squash`
  ADD CONSTRAINT `pistas_squash_ibfk_1` FOREIGN KEY (`id_sala`) REFERENCES `salas` (`id_sala`);

--
-- Constraints for table `reservas_pistas`
--
ALTER TABLE `reservas_pistas`
  ADD CONSTRAINT `reservas_pistas_ibfk_1` FOREIGN KEY (`id_socio`) REFERENCES `socios` (`id_socio`),
  ADD CONSTRAINT `reservas_pistas_ibfk_2` FOREIGN KEY (`id_pista`) REFERENCES `pistas_squash` (`id_pista`);

--
-- Constraints for table `socios_clases`
--
ALTER TABLE `socios_clases`
  ADD CONSTRAINT `socios_clases_ibfk_1` FOREIGN KEY (`id_socio`) REFERENCES `socios` (`id_socio`),
  ADD CONSTRAINT `socios_clases_ibfk_2` FOREIGN KEY (`id_clase`) REFERENCES `clases` (`id_clase`);
--
-- Database: `login_register_db`
--
CREATE DATABASE IF NOT EXISTS `login_register_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci;
USE `login_register_db`;

-- --------------------------------------------------------

--
-- Table structure for table `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `gmail` varchar(40) COLLATE utf8mb4_spanish_ci NOT NULL,
  `password` varchar(30) COLLATE utf8mb4_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);
--
-- Database: `mydb`
--
CREATE DATABASE IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `mydb`;

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`, `address`) VALUES
(1, 'Company Inc', 'Highway 37'),
(3, 'Michelle', 'Blue Village 1');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Database: `new_schema`
--
CREATE DATABASE IF NOT EXISTS `new_schema` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `new_schema`;
--
-- Database: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Table structure for table `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `query` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Table structure for table `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_length` text COLLATE utf8_bin DEFAULT NULL,
  `col_collation` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) COLLATE utf8_bin DEFAULT '',
  `col_default` text COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Table structure for table `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `column_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `settings_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

--
-- Dumping data for table `pma__designer_settings`
--

INSERT INTO `pma__designer_settings` (`username`, `settings_data`) VALUES
('root', '{\"angular_direct\":\"direct\",\"relation_lines\":\"true\",\"snap_to_grid\":\"off\",\"full_screen\":\"off\"}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `export_type` varchar(10) COLLATE utf8_bin NOT NULL,
  `template_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `template_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Table structure for table `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Table structure for table `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

--
-- Dumping data for table `pma__navigationhiding`
--

INSERT INTO `pma__navigationhiding` (`username`, `item_name`, `item_type`, `db_name`, `table_name`) VALUES
('root', 'lista de comidas', 'table', 'restaurante', '');

-- --------------------------------------------------------

--
-- Table structure for table `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

--
-- Dumping data for table `pma__pdf_pages`
--

INSERT INTO `pma__pdf_pages` (`db_name`, `page_nr`, `page_descr`) VALUES
('gimnasiosiempreenformadb', 1, 'view');

-- --------------------------------------------------------

--
-- Table structure for table `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Dumping data for table `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"farmacia\",\"table\":\"laboratorio\"},{\"db\":\"restaurante\",\"table\":\"ListaDeComidas\"},{\"db\":\"restaurante\",\"table\":\"listadecomidas\"},{\"db\":\"restaurante\",\"table\":\"lista de comidas\"},{\"db\":\"videoteca\",\"table\":\"peliculas\"},{\"db\":\"curso\",\"table\":\"ciudades\"},{\"db\":\"curso\",\"table\":\"personas\"},{\"db\":\"mydb\",\"table\":\"customers\"},{\"db\":\"crud_db\",\"table\":\"printer\"},{\"db\":\"conexion_db\",\"table\":\"oficios\"}]');

-- --------------------------------------------------------

--
-- Table structure for table `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Table structure for table `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

--
-- Dumping data for table `pma__table_coords`
--

INSERT INTO `pma__table_coords` (`db_name`, `table_name`, `pdf_page_number`, `x`, `y`) VALUES
('gimnasiosiempreenformadb', 'aparatos', 1, 485, 577),
('gimnasiosiempreenformadb', 'clases', 1, 483, 234),
('gimnasiosiempreenformadb', 'monitores', 1, 781, 324),
('gimnasiosiempreenformadb', 'monitores_clases', 1, 1090, 275),
('gimnasiosiempreenformadb', 'pistas_squash', 1, 459, 392),
('gimnasiosiempreenformadb', 'reservas_pistas', 1, 841, 495),
('gimnasiosiempreenformadb', 'salas', 1, 124, 302),
('gimnasiosiempreenformadb', 'socios', 1, 900, 20),
('gimnasiosiempreenformadb', 'socios_clases', 1, 368, 19);

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `prefs` text COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

--
-- Dumping data for table `pma__table_uiprefs`
--

INSERT INTO `pma__table_uiprefs` (`username`, `db_name`, `table_name`, `prefs`, `last_update`) VALUES
('root', 'mydb', 'customers', '{\"CREATE_TIME\":\"2023-02-07 17:54:47\",\"col_order\":[0,1,2],\"col_visib\":[1,1,1]}', '2023-02-07 21:20:24');

-- --------------------------------------------------------

--
-- Table structure for table `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text COLLATE utf8_bin NOT NULL,
  `schema_sql` text COLLATE utf8_bin DEFAULT NULL,
  `data_sql` longtext COLLATE utf8_bin DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') COLLATE utf8_bin DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Dumping data for table `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2024-07-02 17:56:03', '{\"Console\\/Mode\":\"collapse\",\"NavigationWidth\":182}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL,
  `tab` varchar(64) COLLATE utf8_bin NOT NULL,
  `allowed` enum('Y','N') COLLATE utf8_bin NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Table structure for table `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indexes for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indexes for table `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indexes for table `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indexes for table `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indexes for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indexes for table `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indexes for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indexes for table `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indexes for table `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indexes for table `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indexes for table `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indexes for table `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indexes for table `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Database: `restaurante`
--
CREATE DATABASE IF NOT EXISTS `restaurante` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `restaurante`;

-- --------------------------------------------------------

--
-- Table structure for table `lista de comidas`
--

CREATE TABLE `lista de comidas` (
  `numero` int(11) NOT NULL,
  `plato` text NOT NULL,
  `precio_porcion` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `listadecomidas`
--

CREATE TABLE `listadecomidas` (
  `numero` int(11) NOT NULL,
  `plato` text NOT NULL,
  `precio_porcion` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `listadecomidas`
--

INSERT INTO `listadecomidas` (`numero`, `plato`, `precio_porcion`) VALUES
(1, 'Milanesa', 6000),
(2, 'Fideos', 4000),
(3, 'Pizza Muzzarella', 7500),
(4, 'Hamburguesa', 8000),
(5, 'Sushi', 12000),
(6, 'Noquis', 4500),
(7, 'Ravioles', 5000),
(8, 'Pollo al espiedo', 13000),
(9, 'Mariscos', 12000),
(10, 'Empanadas', 7000),
(11, 'Rabas', 9000),
(12, 'Asado al horno', 14000);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `lista de comidas`
--
ALTER TABLE `lista de comidas`
  ADD PRIMARY KEY (`numero`);

--
-- Indexes for table `listadecomidas`
--
ALTER TABLE `listadecomidas`
  ADD PRIMARY KEY (`numero`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `lista de comidas`
--
ALTER TABLE `lista de comidas`
  MODIFY `numero` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `listadecomidas`
--
ALTER TABLE `listadecomidas`
  MODIFY `numero` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- Database: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
--
-- Database: `tienda`
--
CREATE DATABASE IF NOT EXISTS `tienda` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `tienda`;

-- --------------------------------------------------------

--
-- Table structure for table `articulos`
--

CREATE TABLE `articulos` (
  `idArticulo` int(11) NOT NULL,
  `nombreArticulo` varchar(30) DEFAULT NULL,
  `precioArticulo` float DEFAULT NULL,
  `idFabricante` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `articulos`
--

INSERT INTO `articulos` (`idArticulo`, `nombreArticulo`, `precioArticulo`, `idFabricante`) VALUES
(1, 'Teclado', 1000, 3),
(2, 'HDD 730 GB', 5000, 5),
(3, 'Mouse', 800, 3),
(4, 'Memoria USB', 1400, 4),
(5, 'Memoria RAM', 2900, 1),
(6, 'Disco duro extraible 800 GB', 6500, 5),
(7, 'Memoria USB', 2790, 1),
(8, 'DVD Rom', 4500, 2),
(9, 'CD Rom', 2000, 2),
(10, 'Tarjeta de red', 1800, 3);

-- --------------------------------------------------------

--
-- Table structure for table `fabricantes`
--

CREATE TABLE `fabricantes` (
  `idFabricante` int(11) NOT NULL,
  `nombreFabricante` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `fabricantes`
--

INSERT INTO `fabricantes` (`idFabricante`, `nombreFabricante`) VALUES
(1, 'Kingston'),
(2, 'Adata'),
(3, 'Logitech'),
(4, 'Lexar'),
(5, 'Seagete');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `articulos`
--
ALTER TABLE `articulos`
  ADD PRIMARY KEY (`idArticulo`);

--
-- Indexes for table `fabricantes`
--
ALTER TABLE `fabricantes`
  ADD PRIMARY KEY (`idFabricante`);
--
-- Database: `tp77`
--
CREATE DATABASE IF NOT EXISTS `tp77` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `tp77`;

-- --------------------------------------------------------

--
-- Table structure for table `tiendas`
--

CREATE TABLE `tiendas` (
  `id` int(11) NOT NULL,
  `nombre_comercial` varchar(20) DEFAULT NULL,
  `tipo` int(11) DEFAULT NULL,
  `direccion` varchar(50) DEFAULT NULL,
  `cp` int(11) DEFAULT NULL,
  `poblacion` int(11) DEFAULT NULL,
  `lat` float DEFAULT NULL,
  `lng` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tiendas`
--

INSERT INTO `tiendas` (`id`, `nombre_comercial`, `tipo`, `direccion`, `cp`, `poblacion`, `lat`, `lng`) VALUES
(7, 'Wallace', 1, 'Calle de Orense, 52', 7600, 1, -38, -57.5553),
(8, 'OCHOA', 1, 'Calle de Fuencarral, 104', 7600, 1, -38.0037, -57.5517),
(9, 'EEM22', 1, 'Castelló, 109', 7600, 1, -38.0054, -57.5546);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tiendas`
--
ALTER TABLE `tiendas`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tiendas`
--
ALTER TABLE `tiendas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- Database: `tp78`
--
CREATE DATABASE IF NOT EXISTS `tp78` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `tp78`;

-- --------------------------------------------------------

--
-- Table structure for table `store`
--

CREATE TABLE `store` (
  `id` int(11) NOT NULL,
  `profile` int(11) DEFAULT NULL,
  `name` varchar(30) DEFAULT NULL,
  `lat` float DEFAULT NULL,
  `lng` float DEFAULT NULL,
  `id_rubro` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `store`
--

INSERT INTO `store` (`id`, `profile`, `name`, `lat`, `lng`, `id_rubro`) VALUES
(2, 1, 'Banco de la Nacion Argentina', -37.9997, -57.5468, 1),
(3, 1, 'Banco Provincia', -37.9993, -57.5465, 1),
(4, 0, 'Astor', -38.0008, -57, 2),
(5, 0, 'Musical Norte', -37.9993, -57.5484, 3),
(8, 1, 'atm', -37.9987, -57.5526, 0),
(285071699, 0, 'Astor', -38.0008, -57, 1),
(288366501, 1, 'Banco de la Nacion Argentina', -37.9997, -57.5468, 1),
(1236707570, 1, 'Banco Provincia', -37.9993, -57.5465, 1),
(1236711896, 0, 'Musical Norte', -37.9993, -57.5484, 3),
(1236940209, 0, 'Atm', -37.9987, -57.5526, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `store`
--
ALTER TABLE `store`
  ADD PRIMARY KEY (`id`);
--
-- Database: `videoteca`
--
CREATE DATABASE IF NOT EXISTS `videoteca` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `videoteca`;

-- --------------------------------------------------------

--
-- Table structure for table `peliculas`
--

CREATE TABLE `peliculas` (
  `idpelicula` int(11) NOT NULL,
  `titulo` varchar(80) NOT NULL,
  `genero` varchar(20) NOT NULL,
  `director` varchar(80) DEFAULT NULL,
  `duracion` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `peliculas`
--

INSERT INTO `peliculas` (`idpelicula`, `titulo`, `genero`, `director`, `duracion`) VALUES
(1, 'Jurassic Park', 'Ciencia Ficción', 'Steven Spielberg', 127),
(2, 'E.T. the Extra-Terrestrial', 'Ciencia Ficción', 'Steven Spielberg', 115),
(3, 'Schindler\'s List', 'Drama', 'Steven Spielberg', 195),
(4, 'Inception', 'Ciencia Ficción', 'Christopher Nolan', 148),
(5, 'The Matrix', 'Ciencia Ficción', 'The Wachowskis', 136),
(6, 'Titanic', 'Romance', 'James Cameron', 195),
(7, 'Avatar', 'Ciencia Ficción', 'James Cameron', 162),
(8, 'Interstellar', 'Ciencia Ficción', 'Christopher Nolan', 169),
(9, 'Indiana Jones and the Last Crusade', 'Aventura', 'Steven Spielberg', 127),
(10, 'The Avengers', 'Acción', 'Joss Whedon', 143),
(11, 'Toy Story', 'Animación', 'John Lasseter', 81),
(12, 'Eternal Sunshine of the Spotless Mind', 'Romance', 'Michel Gondry', 108),
(13, 'Gone with the Wind', 'Drama', 'Victor Fleming', 238),
(14, 'The Lord of the Rings: The Return of the King', 'Fantasía', 'Peter Jackson', 201);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `peliculas`
--
ALTER TABLE `peliculas`
  ADD PRIMARY KEY (`idpelicula`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `peliculas`
--
ALTER TABLE `peliculas`
  MODIFY `idpelicula` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- Database: `vivero`
--
CREATE DATABASE IF NOT EXISTS `vivero` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `vivero`;

-- --------------------------------------------------------

--
-- Table structure for table `cliente_vip`
--

CREATE TABLE `cliente_vip` (
  `dni` varchar(15) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `direccion` varchar(200) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `fecha_incorporacion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `detalle_pedido`
--

CREATE TABLE `detalle_pedido` (
  `id_detalle` int(11) NOT NULL,
  `numero_pedido` int(11) DEFAULT NULL,
  `codigo_producto` varchar(20) DEFAULT NULL,
  `unidades` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `empleado`
--

CREATE TABLE `empleado` (
  `dni` varchar(15) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `empleado_vivero`
--

CREATE TABLE `empleado_vivero` (
  `dni` varchar(15) NOT NULL,
  `codigo_tienda` varchar(10) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `empleado_zona`
--

CREATE TABLE `empleado_zona` (
  `id_asignacion` int(11) NOT NULL,
  `dni` varchar(15) DEFAULT NULL,
  `id_zona` int(11) DEFAULT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `pedido`
--

CREATE TABLE `pedido` (
  `numero_pedido` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `descuento` decimal(5,2) DEFAULT NULL,
  `precio_portes` decimal(10,2) DEFAULT NULL,
  `dni_cliente` varchar(15) DEFAULT NULL,
  `dni_empleado` varchar(15) DEFAULT NULL,
  `codigo_tienda` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `producto`
--

CREATE TABLE `producto` (
  `codigo_producto` varchar(20) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `id_tipo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `stock`
--

CREATE TABLE `stock` (
  `id_stock` int(11) NOT NULL,
  `codigo_producto` varchar(20) DEFAULT NULL,
  `codigo_tienda` varchar(10) DEFAULT NULL,
  `id_zona` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tipo_producto`
--

CREATE TABLE `tipo_producto` (
  `id_tipo` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `vivero`
--

CREATE TABLE `vivero` (
  `codigo_tienda` varchar(10) NOT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `direccion` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `zona`
--

CREATE TABLE `zona` (
  `id_zona` int(11) NOT NULL,
  `codigo_tienda` varchar(10) DEFAULT NULL,
  `nombre` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cliente_vip`
--
ALTER TABLE `cliente_vip`
  ADD PRIMARY KEY (`dni`);

--
-- Indexes for table `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  ADD PRIMARY KEY (`id_detalle`),
  ADD KEY `numero_pedido` (`numero_pedido`),
  ADD KEY `codigo_producto` (`codigo_producto`);

--
-- Indexes for table `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`dni`);

--
-- Indexes for table `empleado_vivero`
--
ALTER TABLE `empleado_vivero`
  ADD PRIMARY KEY (`dni`,`codigo_tienda`,`fecha_inicio`),
  ADD KEY `codigo_tienda` (`codigo_tienda`);

--
-- Indexes for table `empleado_zona`
--
ALTER TABLE `empleado_zona`
  ADD PRIMARY KEY (`id_asignacion`),
  ADD KEY `dni` (`dni`),
  ADD KEY `id_zona` (`id_zona`);

--
-- Indexes for table `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`numero_pedido`),
  ADD KEY `dni_cliente` (`dni_cliente`),
  ADD KEY `dni_empleado` (`dni_empleado`),
  ADD KEY `codigo_tienda` (`codigo_tienda`);

--
-- Indexes for table `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`codigo_producto`),
  ADD KEY `id_tipo` (`id_tipo`);

--
-- Indexes for table `stock`
--
ALTER TABLE `stock`
  ADD PRIMARY KEY (`id_stock`),
  ADD KEY `codigo_producto` (`codigo_producto`),
  ADD KEY `codigo_tienda` (`codigo_tienda`),
  ADD KEY `id_zona` (`id_zona`);

--
-- Indexes for table `tipo_producto`
--
ALTER TABLE `tipo_producto`
  ADD PRIMARY KEY (`id_tipo`);

--
-- Indexes for table `vivero`
--
ALTER TABLE `vivero`
  ADD PRIMARY KEY (`codigo_tienda`);

--
-- Indexes for table `zona`
--
ALTER TABLE `zona`
  ADD PRIMARY KEY (`id_zona`),
  ADD KEY `codigo_tienda` (`codigo_tienda`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  MODIFY `id_detalle` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `empleado_zona`
--
ALTER TABLE `empleado_zona`
  MODIFY `id_asignacion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pedido`
--
ALTER TABLE `pedido`
  MODIFY `numero_pedido` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stock`
--
ALTER TABLE `stock`
  MODIFY `id_stock` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tipo_producto`
--
ALTER TABLE `tipo_producto`
  MODIFY `id_tipo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zona`
--
ALTER TABLE `zona`
  MODIFY `id_zona` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  ADD CONSTRAINT `detalle_pedido_ibfk_1` FOREIGN KEY (`numero_pedido`) REFERENCES `pedido` (`numero_pedido`),
  ADD CONSTRAINT `detalle_pedido_ibfk_2` FOREIGN KEY (`codigo_producto`) REFERENCES `producto` (`codigo_producto`);

--
-- Constraints for table `empleado_vivero`
--
ALTER TABLE `empleado_vivero`
  ADD CONSTRAINT `empleado_vivero_ibfk_1` FOREIGN KEY (`dni`) REFERENCES `empleado` (`dni`),
  ADD CONSTRAINT `empleado_vivero_ibfk_2` FOREIGN KEY (`codigo_tienda`) REFERENCES `vivero` (`codigo_tienda`);

--
-- Constraints for table `empleado_zona`
--
ALTER TABLE `empleado_zona`
  ADD CONSTRAINT `empleado_zona_ibfk_1` FOREIGN KEY (`dni`) REFERENCES `empleado` (`dni`),
  ADD CONSTRAINT `empleado_zona_ibfk_2` FOREIGN KEY (`id_zona`) REFERENCES `zona` (`id_zona`);

--
-- Constraints for table `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`dni_cliente`) REFERENCES `cliente_vip` (`dni`),
  ADD CONSTRAINT `pedido_ibfk_2` FOREIGN KEY (`dni_empleado`) REFERENCES `empleado` (`dni`),
  ADD CONSTRAINT `pedido_ibfk_3` FOREIGN KEY (`codigo_tienda`) REFERENCES `vivero` (`codigo_tienda`);

--
-- Constraints for table `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`id_tipo`) REFERENCES `tipo_producto` (`id_tipo`);

--
-- Constraints for table `stock`
--
ALTER TABLE `stock`
  ADD CONSTRAINT `stock_ibfk_1` FOREIGN KEY (`codigo_producto`) REFERENCES `producto` (`codigo_producto`),
  ADD CONSTRAINT `stock_ibfk_2` FOREIGN KEY (`codigo_tienda`) REFERENCES `vivero` (`codigo_tienda`),
  ADD CONSTRAINT `stock_ibfk_3` FOREIGN KEY (`id_zona`) REFERENCES `zona` (`id_zona`);

--
-- Constraints for table `zona`
--
ALTER TABLE `zona`
  ADD CONSTRAINT `zona_ibfk_1` FOREIGN KEY (`codigo_tienda`) REFERENCES `vivero` (`codigo_tienda`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
