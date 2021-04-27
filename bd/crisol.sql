-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-05-2020 a las 13:35:36
-- Versión del servidor: 10.1.37-MariaDB
-- Versión de PHP: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `crisol`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_BuscaLector` (IN `xnom` VARCHAR(20))  NO SQL
SELECT l.id_lec, l.nom_lec, l.ape_lec, l.DNI, d.nom_dis,
	   l.fec_reg, l.est_lec
from lector l inner join Distrito d
on l.id_dis = d.id_dis
where l.ape_lec like concat(xnom,'%')$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_eliminaLector` (IN `xid` INT)  NO SQL
DELETE
From Lector where id_lec = xid$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_filtralector` (IN `xdis` INT)  NO SQL
SELECT l.id_lec,l.nom_lec,l.ape_lec,l.DNI, d.nom_dis, l.fec_reg,
		l.est_lec
from lector l inner join distrito d on l.id_dis=d.id_dis
where l.id_dis = xdis$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_ingresaLector` (IN `nom` VARCHAR(20), IN `ape` VARCHAR(20), IN `dni` CHAR(8), IN `dis` INT, IN `fec` DATE, IN `est` CHAR(1))  NO SQL
INSERT INTO lector (nom_lec, ape_lec, dni, id_dis, fec_reg,  est_lec)
values (nom, ape, dni, dis, fec, est)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_IngresaPromocion` (IN `des` VARCHAR(20), IN `img` VARCHAR(35), IN `idlibro` INT, IN `fecini` DATE, IN `fecfin` DATE, IN `cos` DECIMAL(7,2), IN `est` CHAR(1))  NO SQL
insert INTO promocion (des_prom, img_prom, id_libro, fec_ini, fec_fin, cos_prom, est_prom)
values (des, img, idlibro, fecini, fecfin, cos, est)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_listaLector` ()  NO SQL
SELECT l.id_lec, l.nom_lec, l.ape_lec, l.DNI,l.fec_reg,
	   d.nom_dis, l.est_lec
from Lector l inner join distrito d on l.id_dis=d.id_dis$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_listalector2` (IN `des` INT, IN `can` INT)  NO SQL
SELECT l.id_lec, l.nom_lec, l.ape_lec, l.DNI,l.fec_reg,
	   d.nom_dis, l.est_lec
from Lector l inner join distrito d on l.id_dis=d.id_dis
limit des,can$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_ListaLibros` ()  NO SQL
SELECT l.id_libro, l.tit_libro,e.nom_edi, t.des_tipo, l.manual, l.pre_libro
from libro l inner join tipo t on l.id_tipo=t.id_tipo
inner join editorial e on l.id_edi=e.id_edi
order by 1$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_ListaPromociones` ()  NO SQL
SELECT p.id_prom, p.des_prom, l.tit_libro, p.fec_ini, p.fec_fin, p.cos_prom,p.est_prom
from promocion p inner join libro l
on p.id_libro=l.id_libro$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_modificaLector` (IN `id` INT, IN `nom` VARCHAR(20), IN `ape` VARCHAR(20), IN `dni` CHAR(8), IN `dis` INT, IN `fec` DATE, IN `est` CHAR(1))  NO SQL
UPDATE Lector
	SET nom_lec = nom, ape_lec = ape, dni = dni, id_dis = dis,
        fec_reg = fec, est_lec = est
    where id_lec = id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_ModificaPromocion` (IN `id` INT, IN `des` VARCHAR(35), IN `img` VARCHAR(35), IN `idlib` INT, IN `fecini` DATE, IN `fecfin` DATE, IN `cos` DECIMAL(7,2), IN `est` CHAR(1))  NO SQL
update promocion set des_prom = des,
					img_prom = img,
                   	id_libro= idlib,
					fec_ini = fecini,
                    fec_fin= fecfin,
                    cos_prom = cos,
                    est_prom = est
where id_prom = id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_ValidarLogin` (IN `usu` VARCHAR(12), IN `cla` VARCHAR(12))  NO SQL
SELECT nom_usu, cla_usu
from usuario
where nom_usu=usu and cla_usu = cla$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `distrito`
--

CREATE TABLE `distrito` (
  `id_dis` int(11) NOT NULL,
  `nom_dis` varchar(25) COLLATE utf8_spanish2_ci NOT NULL,
  `cod_pos` char(2) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `distrito`
--

INSERT INTO `distrito` (`id_dis`, `nom_dis`, `cod_pos`) VALUES
(1, 'Villa maría del Triunfo', '35'),
(2, 'La Molina', '32'),
(3, 'Surquillo', '25'),
(4, 'San Juan de Miraflores', '10'),
(5, 'Lince', '22'),
(6, 'Pueblo Libre', '23');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `editorial`
--

CREATE TABLE `editorial` (
  `id_edi` int(11) NOT NULL,
  `nom_edi` varchar(25) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `editorial`
--

INSERT INTO `editorial` (`id_edi`, `nom_edi`) VALUES
(1, 'Alex'),
(2, 'Yosdado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lector`
--

CREATE TABLE `lector` (
  `id_lec` int(11) NOT NULL,
  `nom_lec` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `ape_lec` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `DNI` char(8) COLLATE utf8_spanish2_ci NOT NULL,
  `id_dis` int(11) NOT NULL,
  `fec_reg` date NOT NULL,
  `est_lec` char(1) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `lector`
--

INSERT INTO `lector` (`id_lec`, `nom_lec`, `ape_lec`, `DNI`, `id_dis`, `fec_reg`, `est_lec`) VALUES
(9, 'Carlos', 'Guillen Huarcaya', '78526420', 6, '2019-02-22', 'A'),
(10, 'Susan', 'Ribera Juta', '78521369', 3, '2019-02-08', 'A'),
(11, 'Mario Bros', 'Tito Bambino', '23569425', 5, '2019-02-22', 'A'),
(12, 'Goku', 'Kakaroto', '85296314', 6, '2019-02-08', 'V');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libro`
--

CREATE TABLE `libro` (
  `id_libro` int(11) NOT NULL,
  `tit_libro` varchar(30) COLLATE utf8_spanish2_ci NOT NULL,
  `id_edi` int(11) NOT NULL,
  `id_tipo` int(11) NOT NULL,
  `manual` varchar(35) COLLATE utf8_spanish2_ci NOT NULL,
  `pre_libro` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `libro`
--

INSERT INTO `libro` (`id_libro`, `tit_libro`, `id_edi`, `id_tipo`, `manual`, `pre_libro`) VALUES
(1, 'Rascacielos', 1, 2, 'Rascacielos.pdf', '120'),
(2, 'Kong La Isla de las Calaberas', 2, 3, 'Kong.pdf', '80'),
(3, 'Jango', 1, 4, 'Jango.pdf', '90'),
(4, 'La Liga de la Justicia', 2, 3, 'LaligadelaJusticia.pdf', '75'),
(5, 'Jumanji', 1, 3, 'Jumanji.pdf', '90'),
(6, 'Civil War', 2, 1, 'CivilWar.pdf', '150'),
(7, 'God of War', 1, 1, 'GodofWar.pdf', '80'),
(8, 'Escape Roon', 1, 3, 'EscapeRoon.pdf', '65'),
(9, 'Capitana Marvel', 1, 2, 'CapitanaMarvel.pdf', '85'),
(10, 'Greed II', 2, 2, 'GreedII.pdf', '110');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `promocion`
--

CREATE TABLE `promocion` (
  `id_prom` int(11) NOT NULL,
  `des_prom` varchar(30) COLLATE utf8_spanish2_ci NOT NULL,
  `img_prom` varchar(35) COLLATE utf8_spanish2_ci NOT NULL,
  `id_libro` int(11) NOT NULL,
  `fec_ini` date NOT NULL,
  `fec_fin` date NOT NULL,
  `cos_prom` decimal(7,2) NOT NULL,
  `est_prom` char(1) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `promocion`
--

INSERT INTO `promocion` (`id_prom`, `des_prom`, `img_prom`, `id_libro`, `fec_ini`, `fec_fin`, `cos_prom`, `est_prom`) VALUES
(1, 'Dia de la madre SENATINA', 'Fondo-ok 2017b.jpg', 7, '2019-03-15', '2019-03-30', '60.00', 'A'),
(2, 'Fin de semana tranca', 'Redes17.jpg', 1, '2019-03-13', '2019-03-16', '123.00', 'A'),
(3, 'promoción 1/4 de pol', 'Logo18.jpg', 1, '2019-03-21', '2019-03-30', '90.00', 'A'),
(4, 'Día del analista', 'figura02.jpg', 8, '2019-03-14', '2019-03-21', '150.00', 'A'),
(5, 'Dia del padre', 'Figura.jpg', 9, '2019-03-11', '2019-03-21', '10.00', 'A'),
(6, 'Novedades', 'Fondo2018b.jpg', 1, '2019-03-14', '2019-03-29', '160.00', 'A'),
(7, 'Novedades', 'Fondo2018b.jpg', 1, '2019-03-14', '2019-03-29', '160.00', 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id_rol` int(11) NOT NULL,
  `nom_rol` varchar(25) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id_rol`, `nom_rol`) VALUES
(1, 'Administrador'),
(2, 'Supervisor'),
(3, 'Operador'),
(4, 'Digitador');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `temas`
--

CREATE TABLE `temas` (
  `id_tema` int(11) NOT NULL,
  `des_tema` varchar(40) COLLATE utf8_spanish2_ci NOT NULL,
  `id_libro` int(11) NOT NULL,
  `video` varchar(30) COLLATE utf8_spanish2_ci NOT NULL,
  `est_tema` char(1) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `temas`
--

INSERT INTO `temas` (`id_tema`, `des_tema`, `id_libro`, `video`, `est_tema`) VALUES
(1, 'Capitana Marvel', 1, 'creabase.mp4', 'A'),
(2, 'Kong', 1, 'creatabla.mp4', 'A'),
(3, 'Escape Roon', 2, 'crepro.mp4', 'A'),
(4, 'God of War', 2, 'triggers.mp4', 'A'),
(5, 'Civil War', 1, 'relaSQL.mp4', 'A'),
(6, 'Jumanji', 1, 'dmlSQL.mp4', 'A'),
(7, 'Kong', 1, 'creatabla.mp4', 'A'),
(8, 'Jango', 2, 'triggers.mp4', 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo`
--

CREATE TABLE `tipo` (
  `id_tipo` int(11) NOT NULL,
  `des_tipo` varchar(20) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `tipo`
--

INSERT INTO `tipo` (`id_tipo`, `des_tipo`) VALUES
(1, 'Aventura'),
(2, 'Acción'),
(3, 'Ciencia Ficcion'),
(4, 'Suspenso');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usu` int(11) NOT NULL,
  `nom_usu` varchar(12) COLLATE utf8_spanish2_ci NOT NULL,
  `cla_usu` varchar(12) COLLATE utf8_spanish2_ci NOT NULL,
  `id_rol` int(11) NOT NULL,
  `fec_cre` date NOT NULL,
  `est_usu` char(1) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usu`, `nom_usu`, `cla_usu`, `id_rol`, `fec_cre`, `est_usu`) VALUES
(1, 'admin', '123', 1, '2019-02-20', 'A');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `distrito`
--
ALTER TABLE `distrito`
  ADD PRIMARY KEY (`id_dis`);

--
-- Indices de la tabla `editorial`
--
ALTER TABLE `editorial`
  ADD PRIMARY KEY (`id_edi`);

--
-- Indices de la tabla `lector`
--
ALTER TABLE `lector`
  ADD PRIMARY KEY (`id_lec`),
  ADD KEY `id_dis` (`id_dis`);

--
-- Indices de la tabla `libro`
--
ALTER TABLE `libro`
  ADD PRIMARY KEY (`id_libro`),
  ADD KEY `id_edi` (`id_edi`),
  ADD KEY `id_tipo` (`id_tipo`);

--
-- Indices de la tabla `promocion`
--
ALTER TABLE `promocion`
  ADD PRIMARY KEY (`id_prom`),
  ADD KEY `id_lib` (`id_libro`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id_rol`);

--
-- Indices de la tabla `temas`
--
ALTER TABLE `temas`
  ADD PRIMARY KEY (`id_tema`),
  ADD KEY `id_libro` (`id_libro`);

--
-- Indices de la tabla `tipo`
--
ALTER TABLE `tipo`
  ADD PRIMARY KEY (`id_tipo`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usu`),
  ADD KEY `id_rol` (`id_rol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `distrito`
--
ALTER TABLE `distrito`
  MODIFY `id_dis` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `editorial`
--
ALTER TABLE `editorial`
  MODIFY `id_edi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `lector`
--
ALTER TABLE `lector`
  MODIFY `id_lec` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `libro`
--
ALTER TABLE `libro`
  MODIFY `id_libro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `promocion`
--
ALTER TABLE `promocion`
  MODIFY `id_prom` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id_rol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `temas`
--
ALTER TABLE `temas`
  MODIFY `id_tema` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `tipo`
--
ALTER TABLE `tipo`
  MODIFY `id_tipo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `lector`
--
ALTER TABLE `lector`
  ADD CONSTRAINT `lector_ibfk_1` FOREIGN KEY (`id_dis`) REFERENCES `distrito` (`id_dis`);

--
-- Filtros para la tabla `libro`
--
ALTER TABLE `libro`
  ADD CONSTRAINT `libro_ibfk_1` FOREIGN KEY (`id_edi`) REFERENCES `editorial` (`id_edi`),
  ADD CONSTRAINT `libro_ibfk_2` FOREIGN KEY (`id_tipo`) REFERENCES `tipo` (`id_tipo`);

--
-- Filtros para la tabla `promocion`
--
ALTER TABLE `promocion`
  ADD CONSTRAINT `promocion_ibfk_1` FOREIGN KEY (`id_libro`) REFERENCES `libro` (`id_libro`);

--
-- Filtros para la tabla `temas`
--
ALTER TABLE `temas`
  ADD CONSTRAINT `temas_ibfk_1` FOREIGN KEY (`id_libro`) REFERENCES `libro` (`id_libro`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id_rol`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
