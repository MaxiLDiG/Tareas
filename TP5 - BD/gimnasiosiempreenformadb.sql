-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 02, 2024 at 07:50 PM
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
-- Database: `gimnasiosiempreenformadb`
--

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
