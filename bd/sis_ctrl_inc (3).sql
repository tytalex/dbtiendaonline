-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 04-12-2019 a las 20:39:34
-- Versión del servidor: 5.7.26
-- Versión de PHP: 7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sis_ctrl_inc`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumnos`
--

DROP TABLE IF EXISTS `alumnos`;
CREATE TABLE IF NOT EXISTS `alumnos` (
  `id_alu` int(11) NOT NULL AUTO_INCREMENT,
  `nom_alu` varchar(100) NOT NULL,
  `ape_alu` varchar(100) NOT NULL,
  `cor_alu` varchar(150) DEFAULT NULL,
  `tel_alu` char(9) NOT NULL,
  `dni_alu` char(8) NOT NULL,
  `cod_alu` char(6) NOT NULL,
  `id_dis` int(11) NOT NULL,
  PRIMARY KEY (`id_alu`),
  UNIQUE KEY `dni_alu` (`dni_alu`),
  UNIQUE KEY `cod_alu` (`cod_alu`),
  UNIQUE KEY `cor_alu` (`cor_alu`),
  KEY `id_dis` (`id_dis`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `alumnos`
--

INSERT INTO `alumnos` (`id_alu`, `nom_alu`, `ape_alu`, `cor_alu`, `tel_alu`, `dni_alu`, `cod_alu`, `id_dis`) VALUES
(1, 'Brayan Vicente', 'Trujillo Nieto', 'hola@hola.com', '852369741', '72882867', 'AL0001', 1),
(4, 'Jose', 'Linares', 'josearmando@gmail.com', '944268280', '85479632', 'AL0004', 2),
(5, 'Victor', 'Ruiz', 'victor@gmail.com', '789654123', '74125896', 'AL0005', 13),
(6, 'Antuanet', 'Valverde', 'anval@gmail.com', '123456789', '12345678', '123456', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cursos`
--

DROP TABLE IF EXISTS `cursos`;
CREATE TABLE IF NOT EXISTS `cursos` (
  `id_cur` int(11) NOT NULL AUTO_INCREMENT,
  `nom_cur` varchar(50) NOT NULL,
  `id_esp` int(11) NOT NULL,
  PRIMARY KEY (`id_cur`),
  UNIQUE KEY `nom_cur` (`nom_cur`),
  KEY `id_esp` (`id_esp`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cursos`
--

INSERT INTO `cursos` (`id_cur`, `nom_cur`, `id_esp`) VALUES
(2, 'Desarrollo Web', 3),
(3, 'Gestión Infórmatica', 2),
(4, 'Laravel 6.x', 3),
(5, 'HTML y CSS', 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `distritos`
--

DROP TABLE IF EXISTS `distritos`;
CREATE TABLE IF NOT EXISTS `distritos` (
  `id_dis` int(11) NOT NULL AUTO_INCREMENT,
  `nom_dis` varchar(50) NOT NULL,
  PRIMARY KEY (`id_dis`),
  UNIQUE KEY `nom_dis` (`nom_dis`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `distritos`
--

INSERT INTO `distritos` (`id_dis`, `nom_dis`) VALUES
(7, 'Bellavista'),
(8, 'Callao'),
(3, 'Comas'),
(13, 'Independencia'),
(5, 'La Molina'),
(1, 'Lince'),
(2, 'Miraflores'),
(6, 'San Isidro'),
(14, 'San Juan'),
(4, 'San Martin de Porres'),
(9, 'San Miguel'),
(11, 'Surco');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

DROP TABLE IF EXISTS `empleados`;
CREATE TABLE IF NOT EXISTS `empleados` (
  `id_emp` int(11) NOT NULL AUTO_INCREMENT,
  `nom_emp` varchar(100) NOT NULL,
  `ape_emp` varchar(100) NOT NULL,
  `dni_emp` char(8) NOT NULL,
  `cor_emp` varchar(150) DEFAULT NULL,
  `tel_emp` char(9) NOT NULL,
  `dir_emp` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id_emp`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`id_emp`, `nom_emp`, `ape_emp`, `dni_emp`, `cor_emp`, `tel_emp`, `dir_emp`) VALUES
(13, 'Brayan Vicente', 'Trujillo Nieto', '72882867', 'brayanstonexd@gmail.com', '944268280', 'Huacho'),
(14, 'Jose Alex', 'Campos', '89562147', 'josealex@hotmail.com', '852369741', 'Lima');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `especialidades`
--

DROP TABLE IF EXISTS `especialidades`;
CREATE TABLE IF NOT EXISTS `especialidades` (
  `id_esp` int(11) NOT NULL AUTO_INCREMENT,
  `nom_esp` varchar(50) NOT NULL,
  PRIMARY KEY (`id_esp`),
  UNIQUE KEY `nom_esp` (`nom_esp`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `especialidades`
--

INSERT INTO `especialidades` (`id_esp`, `nom_esp`) VALUES
(5, 'Administración de redes'),
(1, 'Administración de sistemas de información'),
(4, 'Área de comunicaciones'),
(2, 'Área de gestión tecnológica'),
(10, 'Diseño Gráfico'),
(3, 'Diseño, construcción y mantenimiento de sitios web'),
(8, 'Especialidad 01'),
(9, 'Especialidad 02');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `incidencias`
--

DROP TABLE IF EXISTS `incidencias`;
CREATE TABLE IF NOT EXISTS `incidencias` (
  `id_inc` int(11) NOT NULL AUTO_INCREMENT,
  `nom_inc` varchar(150) NOT NULL,
  `fec_inc` date NOT NULL,
  `obs_inc` text NOT NULL,
  `id_pro` int(11) NOT NULL,
  `id_cur` int(11) NOT NULL,
  `id_alu` int(11) NOT NULL,
  `id_emp` int(11) NOT NULL,
  `estado` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_inc`),
  KEY `id_pro` (`id_pro`),
  KEY `id_cur` (`id_cur`),
  KEY `id_alu` (`id_alu`),
  KEY `id_emp` (`id_emp`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `incidencias`
--

INSERT INTO `incidencias` (`id_inc`, `nom_inc`, `fec_inc`, `obs_inc`, `id_pro`, `id_cur`, `id_alu`, `id_emp`, `estado`) VALUES
(2, 'Incidencia con el curso de laravel', '2019-11-11', 'No se encontro el modulo de las preguntas del examen', 2, 4, 5, 13, 'En Curso'),
(4, 'hola mundo 02', '2019-11-11', 'incidencia 02', 9, 3, 4, 14, 'En Curso'),
(5, 'asas', '2019-11-12', 'asasas', 7, 5, 1, 13, 'En Curso'),
(6, 'incidencias del curso de base de datos', '2019-11-19', 'el curso virtual no existe en la moodle', 2, 4, 5, 13, 'En Curso'),
(7, 'tardanza', '2019-11-12', 'llegue por dormir nucho!', 9, 2, 6, 13, 'Pendiente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesores`
--

DROP TABLE IF EXISTS `profesores`;
CREATE TABLE IF NOT EXISTS `profesores` (
  `id_pro` int(11) NOT NULL AUTO_INCREMENT,
  `nom_pro` varchar(100) NOT NULL,
  `ape_pro` varchar(100) NOT NULL,
  `cor_pro` varchar(150) DEFAULT NULL,
  `tel_pro` char(9) NOT NULL,
  `dni_pro` char(8) NOT NULL,
  `cod_pro` char(6) NOT NULL,
  `id_dis` int(11) NOT NULL,
  PRIMARY KEY (`id_pro`),
  UNIQUE KEY `dni_pro` (`dni_pro`),
  UNIQUE KEY `cod_pro` (`cod_pro`),
  UNIQUE KEY `cor_pro` (`cor_pro`),
  KEY `id_dis` (`id_dis`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `profesores`
--

INSERT INTO `profesores` (`id_pro`, `nom_pro`, `ape_pro`, `cor_pro`, `tel_pro`, `dni_pro`, `cod_pro`, `id_dis`) VALUES
(1, 'Jorge Alonso', 'Alvarez Apaza', 'jorge@jorge.com', '147852369', '14785236', 'PR0001', 1),
(2, 'Pedro Luis', 'Alberca Lobaton', 'pedro@pedro.com', '965478231', '96325874', 'PR0002', 3),
(3, 'Paulo Luis', 'Londra Gonzales', 'paulo@gmail.com', '874521659', '45789652', 'PR0003', 2),
(7, 'Guillermo', 'Rojas', 'rojas@rojas.com', '944268280', '14785632', 'PR0004', 2),
(9, 'Brayan', 'Trujillo', 'brayanstonexd@gmail.com', '944268280', '72882867', 'PR0006', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id_emp` int(11) NOT NULL,
  `nom_usu` varchar(100) NOT NULL,
  `pass_usu` varchar(100) NOT NULL,
  `acceso` varchar(20) NOT NULL,
  `estado` char(10) NOT NULL,
  KEY `id_emp` (`id_emp`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_emp`, `nom_usu`, `pass_usu`, `acceso`, `estado`) VALUES
(13, 'admin', '123', 'Administrador', 'Activo'),
(14, 'jose', '123', 'Digitador', 'Activo');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `alumnos`
--
ALTER TABLE `alumnos`
  ADD CONSTRAINT `alumnos_ibfk_2` FOREIGN KEY (`id_dis`) REFERENCES `distritos` (`id_dis`);

--
-- Filtros para la tabla `cursos`
--
ALTER TABLE `cursos`
  ADD CONSTRAINT `cursos_ibfk_1` FOREIGN KEY (`id_esp`) REFERENCES `especialidades` (`id_esp`);

--
-- Filtros para la tabla `incidencias`
--
ALTER TABLE `incidencias`
  ADD CONSTRAINT `incidencias_ibfk_1` FOREIGN KEY (`id_pro`) REFERENCES `profesores` (`id_pro`),
  ADD CONSTRAINT `incidencias_ibfk_2` FOREIGN KEY (`id_cur`) REFERENCES `cursos` (`id_cur`),
  ADD CONSTRAINT `incidencias_ibfk_3` FOREIGN KEY (`id_alu`) REFERENCES `alumnos` (`id_alu`),
  ADD CONSTRAINT `incidencias_ibfk_4` FOREIGN KEY (`id_emp`) REFERENCES `empleados` (`id_emp`);

--
-- Filtros para la tabla `profesores`
--
ALTER TABLE `profesores`
  ADD CONSTRAINT `profesores_ibfk_1` FOREIGN KEY (`id_dis`) REFERENCES `distritos` (`id_dis`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`id_emp`) REFERENCES `empleados` (`id_emp`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
