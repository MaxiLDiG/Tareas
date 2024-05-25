-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 26, 2024 at 01:03 AM
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
-- Database: `restaurante`
--

-- --------------------------------------------------------

--
-- Table structure for table `ListaDeComidas`
--

CREATE TABLE `listadecomidas` (
  `numero` int(11) NOT NULL,
  `plato` text NOT NULL,
  `precio_porcion` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ListaDeComidas`
--

INSERT INTO `ListaDeComidas` (`numero`, `plato`, `precio_porcion`) VALUES
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
-- Indexes for table `ListaDeComidas`
--
ALTER TABLE `ListaDeComidas`
  ADD PRIMARY KEY (`numero`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ListaDeComidas`
--
ALTER TABLE `ListaDeComidas`
  MODIFY `numero` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
