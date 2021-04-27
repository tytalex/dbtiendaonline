-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 31-10-2018 a las 05:58:28
-- Versión del servidor: 10.1.19-MariaDB
-- Versión de PHP: 7.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `test_portfolio`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `portafolio`
--

CREATE TABLE `portafolio` (
  `id` int(11) NOT NULL,
  `titulo` varchar(100) NOT NULL,
  `descripcion_corta` varchar(255) NOT NULL,
  `descripcion` text NOT NULL,
  `url_image` varchar(255) NOT NULL,
  `url_web` varchar(255) NOT NULL DEFAULT 'https://obedalvarado.pw/',
  `estado` int(1) NOT NULL,
  `orden` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `portafolio`
--

INSERT INTO `portafolio` (`id`, `titulo`, `descripcion_corta`, `descripcion`, `url_image`, `url_web`, `estado`, `orden`) VALUES
(1, 'Sistema Web de Inventario Simple ', 'Este es un ejemplo de descripciÃ³n corta', 'Simple Stock (Inventario Simple) es un sistema web desarrollado con PHP, MySQL y Bootstrap, que cubre una serie de requerimientos bÃ¡sicos para llevar el control del inventario de una empresa o negocio. Esta es  una soluciÃ³n sencilla para que los propietarios de pequeÃ±as empresas gestionen sus existencias de manera sistemÃ¡tica, y de esa manera poder reemplazar el uso de hojas de calculo para gestionar  su inventario.', 'pexels-photo-461077.jpeg', 'http://obedalvarado.pw/blog/sistema-inventario-simple-php/', 1, 1),
(2, 'Sistema de FacturaciÃ³n Simple', 'Sistema de FacturaciÃ³n Simple con PHP y MySQL', 'Simple Invoice (FacturaciÃ³n Simple) es un sistema web desarrollado con PHP y MySQL que cubre una serie de requerimientos bÃ¡sicos para realizar una factura comercial a nuestros clientes que va desde el manejo de usuarios, creaciÃ³n de productos, clientes y facturas dentro del mismo sistema.', 'pexels-photo-374074.jpeg', 'http://obedalvarado.pw/simple-invoice/', 1, 2),
(17, 'CÃ³mo instalar ionCube Loader', 'CÃ³mo instalar ionCube Loader en Windows', 'En este tutorial voy a mostrar como instalar ioncube loader en servidor local  con Windows.', 'pexels-photo-205316.png', 'https://obedalvarado.pw/blog/instalar-ioncube-loader-windows/', 1, 3),
(18, 'Importando datos Excel a una base de datos MySQL', 'ImportaciÃ³n de datos', 'Muchas aplicaciones PHP necesitan procesar archivos Excel, para distintos propÃ³sitos, lo mÃ¡s comÃºn es importar datos desde un archivo e insertarlos en una base de datos.', 'pexels-photo-577585.jpeg', 'https://obedalvarado.pw/blog/importando-datos-excel-a-una-base-de-datos-mysql-con-php/', 1, 4),
(19, 'CRUD de datos de empleados con PHP, MySQL', 'CRUD de datos de empleados', 'La creaciÃ³n de un CRUD es una tarea muy comÃºn en el desarrollo web  (CRUD por sus siglas en ingles Create/Read/Update/Delete). ', 'pexels-photo-877695.jpeg', 'https://obedalvarado.pw/blog/crud-datos-empleados-php-mysql-bootstrap/', 1, 5),
(20, 'SISTEMA PARA FARMACIAS', 'SISTEMA PARA FARMACIAS DESARROLLADO CON PHP ', 'El sistema de Inventario para farmacias es un software de oficina de farmacia, que cuenta con un diseÃ±o moderno de respuesta ideal para cualquier tipo de negocio de farmacia.', 'pexels-photo-1068523.jpeg', 'https://obedalvarado.pw/blog/sistema-web-inventario-medicamentos-php-mysql/', 1, 6),
(21, 'Cotizador WEB', 'Cotizador web de camisetas con PHP', 'En esta ocasiÃ³n quiero compartir un pequeÃ±o script desarrollado en PHP, el cual cumple la funciÃ³n de cotizador web de productos', 'pexels-photo-204611.jpeg', 'https://obedalvarado.pw/blog/cotizador-web-camisetas-php/', 1, 7),
(22, 'Sistema de Inventario', 'Sistema de GestiÃ³n de Inventario con PHP', 'El Sistema de GestiÃ³n de Inventario es un proyecto de cÃ³digo abierto (Open Source), desarrollado con PHP, MySQL, Bootstrap y jQuery.', 'pexels-photo-908284.jpeg', 'https://obedalvarado.pw/blog/sistema-gestion-inventario-php/', 1, 8),
(33, 'Sistemas de ordenes de trabajo', 'Sistemas de ordenes de trabajo desarrollado con PHP', 'El Sistema Web de seguimiento de Ã³rdenes de trabajo avanzado es la aplicaciÃ³n web correcta para ayudarle a los proveedores de servicios a organizar a su equipo en una determinada orden de trabajo con mayor facilidad, indistintamente el rubro al cual se dedique, ya sea desarrollador web, freelance, diseÃ±ador grÃ¡fico, empresa de reparaciones de equipos informÃ¡ticos, reparaciÃ³n de equipos de construcciÃ³n, entre otros.\r\n\r\nEl sistema le ayudarÃ¡ a llevar un control eficiente de los trabajos a realizar.', 'pexels-photo-373076.jpeg', 'https://obedalvarado.pw/sistema-de-ordenes-de-trabajo/', 1, 9);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `portafolio`
--
ALTER TABLE `portafolio`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `portafolio`
--
ALTER TABLE `portafolio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
