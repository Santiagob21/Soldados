-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 03-08-2024 a las 22:56:13
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `base1`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compañia`
--

CREATE TABLE `compañia` (
  `id_compa` int(10) NOT NULL,
  `numero_compa` int(10) DEFAULT NULL,
  `actividades_compa` varchar(10) DEFAULT NULL,
  `id_solda2` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compañia_cuarteles`
--

CREATE TABLE `compañia_cuarteles` (
  `id_compa` int(10) DEFAULT NULL,
  `id_cuartel` int(10) DEFAULT NULL,
  `id_compa4` int(10) DEFAULT NULL,
  `id_cuartel4` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuarteles`
--

CREATE TABLE `cuarteles` (
  `id_cuartel` int(10) NOT NULL,
  `nombre_cuartel` varchar(20) DEFAULT NULL,
  `ubicacion_cuartel` varchar(20) DEFAULT NULL,
  `codigo_cuartel` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuerpoejer`
--

CREATE TABLE `cuerpoejer` (
  `id_cuerpo` int(10) NOT NULL,
  `infanteria_cuerpo` varchar(20) DEFAULT NULL,
  `artilleria_cuerpo` varchar(20) DEFAULT NULL,
  `armeria_cuerpo` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuerpoejer_compañia`
--

CREATE TABLE `cuerpoejer_compañia` (
  `id_cuerpo` int(10) DEFAULT NULL,
  `id_compa` int(10) DEFAULT NULL,
  `id_cuerpo5` int(10) DEFAULT NULL,
  `id_compa5` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicio`
--

CREATE TABLE `servicio` (
  `id_servi` int(10) NOT NULL,
  `guardia_servi` varchar(20) DEFAULT NULL,
  `cuartelero_servi` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `soldado`
--

CREATE TABLE `soldado` (
  `id_solda` int(5) NOT NULL,
  `nombre_solda` varchar(20) DEFAULT NULL,
  `grado_solda` varchar(20) DEFAULT NULL,
  `codigo_solda` varchar(20) DEFAULT NULL,
  `id_cuartel2` int(10) DEFAULT NULL,
  `id_cuerpo3` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `soldado_servicio`
--

CREATE TABLE `soldado_servicio` (
  `id_solda` int(10) DEFAULT NULL,
  `id_servi` int(10) DEFAULT NULL,
  `id_solda3` int(10) DEFAULT NULL,
  `id_servi3` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `compañia`
--
ALTER TABLE `compañia`
  ADD PRIMARY KEY (`id_compa`),
  ADD KEY `fk_id2` (`id_solda2`);

--
-- Indices de la tabla `compañia_cuarteles`
--
ALTER TABLE `compañia_cuarteles`
  ADD KEY `fk_id6` (`id_compa4`),
  ADD KEY `fk_id7` (`id_cuartel4`);

--
-- Indices de la tabla `cuarteles`
--
ALTER TABLE `cuarteles`
  ADD PRIMARY KEY (`id_cuartel`);

--
-- Indices de la tabla `cuerpoejer`
--
ALTER TABLE `cuerpoejer`
  ADD PRIMARY KEY (`id_cuerpo`);

--
-- Indices de la tabla `cuerpoejer_compañia`
--
ALTER TABLE `cuerpoejer_compañia`
  ADD KEY `fk_id8` (`id_cuerpo5`),
  ADD KEY `fk_id9` (`id_compa5`);

--
-- Indices de la tabla `servicio`
--
ALTER TABLE `servicio`
  ADD PRIMARY KEY (`id_servi`);

--
-- Indices de la tabla `soldado`
--
ALTER TABLE `soldado`
  ADD PRIMARY KEY (`id_solda`),
  ADD KEY `fk_id1` (`id_cuartel2`),
  ADD KEY `fk_id3` (`id_cuerpo3`);

--
-- Indices de la tabla `soldado_servicio`
--
ALTER TABLE `soldado_servicio`
  ADD KEY `fk_id4` (`id_solda3`),
  ADD KEY `fk_id5` (`id_servi3`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `compañia`
--
ALTER TABLE `compañia`
  MODIFY `id_compa` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cuarteles`
--
ALTER TABLE `cuarteles`
  MODIFY `id_cuartel` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cuerpoejer`
--
ALTER TABLE `cuerpoejer`
  MODIFY `id_cuerpo` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `servicio`
--
ALTER TABLE `servicio`
  MODIFY `id_servi` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `soldado`
--
ALTER TABLE `soldado`
  MODIFY `id_solda` int(5) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `compañia`
--
ALTER TABLE `compañia`
  ADD CONSTRAINT `fk_id2` FOREIGN KEY (`id_solda2`) REFERENCES `soldado` (`id_solda`);

--
-- Filtros para la tabla `compañia_cuarteles`
--
ALTER TABLE `compañia_cuarteles`
  ADD CONSTRAINT `fk_id6` FOREIGN KEY (`id_compa4`) REFERENCES `compañia` (`id_compa`),
  ADD CONSTRAINT `fk_id7` FOREIGN KEY (`id_cuartel4`) REFERENCES `cuarteles` (`id_cuartel`);

--
-- Filtros para la tabla `cuerpoejer_compañia`
--
ALTER TABLE `cuerpoejer_compañia`
  ADD CONSTRAINT `fk_id8` FOREIGN KEY (`id_cuerpo5`) REFERENCES `cuerpoejer` (`id_cuerpo`),
  ADD CONSTRAINT `fk_id9` FOREIGN KEY (`id_compa5`) REFERENCES `compañia` (`id_compa`);

--
-- Filtros para la tabla `soldado`
--
ALTER TABLE `soldado`
  ADD CONSTRAINT `fk_id1` FOREIGN KEY (`id_cuartel2`) REFERENCES `cuarteles` (`id_cuartel`),
  ADD CONSTRAINT `fk_id3` FOREIGN KEY (`id_cuerpo3`) REFERENCES `cuerpoejer` (`id_cuerpo`);

--
-- Filtros para la tabla `soldado_servicio`
--
ALTER TABLE `soldado_servicio`
  ADD CONSTRAINT `fk_id4` FOREIGN KEY (`id_solda3`) REFERENCES `soldado` (`id_solda`),
  ADD CONSTRAINT `fk_id5` FOREIGN KEY (`id_servi3`) REFERENCES `servicio` (`id_servi`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
