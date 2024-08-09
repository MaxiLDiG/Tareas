-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 02, 2024 at 08:40 PM
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
-- Database: `aeropuertodb`
--

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
