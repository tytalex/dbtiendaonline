-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 11-07-2020 a las 02:29:34
-- Versión del servidor: 10.3.16-MariaDB
-- Versión de PHP: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `id13524021_kates`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `buy`
--

CREATE TABLE `buy` (
  `id` int(11) NOT NULL,
  `k` varchar(20) DEFAULT NULL,
  `code` varchar(20) DEFAULT NULL,
  `client_id` int(11) DEFAULT NULL,
  `coupon_id` int(11) DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `paymethod_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `buy`
--

INSERT INTO `buy` (`id`, `k`, `code`, `client_id`, `coupon_id`, `status_id`, `created_at`, `paymethod_id`) VALUES
(1, 'ewprj9SFEZ2', 'Pw5YHDgUHSL', 1, NULL, 5, '2020-05-22 20:51:49', 2),
(2, 'NqYcV_769cg', 'Ywses5KRC_j', 1, NULL, 5, '2020-05-22 21:02:00', 2),
(3, 'e1i_LSDBkud', 'TgGvgyoB1tK', 1, NULL, 5, '2020-05-22 21:02:44', 2),
(4, 'GP5f2ABerUQ', 'FBFES9NGVO9', 1, NULL, 5, '2020-05-22 21:23:20', 2),
(5, '5cAetTHtFKD', 'tCAPRAeJ0J8', 2, NULL, 3, '2020-05-23 21:27:30', 2),
(6, 'VzoohO3oB9p', 'KdzrQJbr_Zw', 2, NULL, 5, '2020-05-24 04:04:16', 1),
(7, 'v02f53dH70y', 'mHrJdLO7VhZ', 2, NULL, 5, '2020-05-24 04:08:10', 1),
(8, '25uWbBOHG1l', 'yQ_jk0Czm5v', 2, NULL, 5, '2020-05-24 04:14:18', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `buy_product`
--

CREATE TABLE `buy_product` (
  `id` int(11) NOT NULL,
  `buy_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `q` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `buy_product`
--

INSERT INTO `buy_product` (`id`, `buy_id`, `product_id`, `q`) VALUES
(1, 1, 1, 1),
(2, 2, 1, 1),
(3, 3, 1, 1),
(4, 4, 4, 5),
(5, 5, 5, 1),
(6, 6, 8, 5),
(7, 7, 9, 1),
(8, 8, 9, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `short_name` varchar(200) DEFAULT NULL,
  `in_home` tinyint(1) DEFAULT 0,
  `in_menu` tinyint(1) DEFAULT 0,
  `is_active` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `category`
--

INSERT INTO `category` (`id`, `name`, `short_name`, `in_home`, `in_menu`, `is_active`) VALUES
(1, 'Audifonos', 'Auriculares', 0, 0, 1),
(2, 'Computadoras', 'Lenovo', 0, 0, 1),
(3, 'Cargadores', 'Cargador', 0, 0, 1),
(4, 'Controles para dvd', 'Control dvd', 0, 0, 1),
(5, 'Monitores ', 'Monitor', 0, 0, 1),
(6, 'Celulares', 'Celular', 0, 0, 1),
(9, 'Controles para televisión ', 'Controles TV ', 0, 0, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `client`
--

CREATE TABLE `client` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `password` varchar(60) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `client`
--

INSERT INTO `client` (`id`, `name`, `lastname`, `email`, `phone`, `address`, `password`, `is_active`, `created_at`) VALUES
(1, 'keely', 'Inga', 'keely@hotmail.com', '', '', 'adcd7048512e64b48da55b027577886ee5a36350', 1, '2020-05-22 20:13:52'),
(2, 'Alex', 'Puma', 'alex_diosdado99@hotmail.com', '', '', 'adcd7048512e64b48da55b027577886ee5a36350', 1, '2020-05-23 21:19:30');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `configuration`
--

CREATE TABLE `configuration` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `label` varchar(200) DEFAULT NULL,
  `kind` int(11) DEFAULT NULL,
  `val` text DEFAULT NULL,
  `cfg_id` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `configuration`
--

INSERT INTO `configuration` (`id`, `name`, `label`, `kind`, `val`, `cfg_id`) VALUES
(1, 'general_main_title', 'Titulo Principal', 1, 'Tienda Tyt', 1),
(2, 'general_main_email', 'Email Principal', 1, 'alex_diosdado99@hotmail.com', 1),
(3, 'general_country', 'Pais', 1, 'Perù', 1),
(4, 'general_coin', 'Moneda', 1, 'S/', 1),
(5, 'general_iva_txt', 'Impuesto Texto', 1, 'I.V.A', 1),
(6, 'general_iva', 'Impuesto IVA (%)', 2, '00', 1),
(7, 'general_img_default', 'Imagen Default', 1, 'res/img/default.png', 1),
(8, 'bank_titular', 'Titular de la cuenta', 1, 'Alex Yosdado', 1),
(9, 'bank_name', 'Nombre del Banco', 1, 'BCP', 1),
(10, 'bank_account', 'Numero de Cuenta', 1, '1235456', 1),
(11, 'bank_card', 'Numero de Tarjeta', 1, '125465878995214', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `country`
--

CREATE TABLE `country` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `country`
--

INSERT INTO `country` (`id`, `name`) VALUES
(1, 'Argentina'),
(2, 'Chile'),
(3, 'Colombia'),
(4, 'España'),
(5, 'Mexico');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `coupon`
--

CREATE TABLE `coupon` (
  `id` int(11) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `val` double DEFAULT NULL,
  `kind` int(11) DEFAULT 1,
  `is_multiple` tinyint(1) DEFAULT 0,
  `is_active` tinyint(1) DEFAULT 1,
  `start_at` date DEFAULT NULL,
  `finish_at` date DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paymethod`
--

CREATE TABLE `paymethod` (
  `id` int(11) NOT NULL,
  `short_name` varchar(100) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `paymethod`
--

INSERT INTO `paymethod` (`id`, `short_name`, `name`, `is_active`) VALUES
(1, 'bank', 'Deposito Bancario', 1),
(2, 'deliver', 'Pago Contra entrega', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `short_name` varchar(20) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `code` varchar(200) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `offer_txt` varchar(1000) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `is_featured` tinyint(1) DEFAULT 0,
  `is_public` tinyint(1) DEFAULT 0,
  `in_existence` tinyint(1) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `order_at` datetime DEFAULT NULL,
  `price` float DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `unit_id` int(11) DEFAULT NULL,
  `meta_title` varchar(100) DEFAULT NULL,
  `meta_description` varchar(255) DEFAULT NULL,
  `meta_keywords` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `product`
--

INSERT INTO `product` (`id`, `short_name`, `name`, `code`, `description`, `offer_txt`, `image`, `link`, `is_featured`, `is_public`, `in_existence`, `created_at`, `order_at`, `price`, `category_id`, `unit_id`, `meta_title`, `meta_description`, `meta_keywords`) VALUES
(1, '4p2jZHZDEQs', 'Laptop', '001', 'Es una laptop de alta categoria y gama', NULL, 'laptos-D_NQ_NP_963674-MPE28334078417_102018-F.jpg', '', 1, 1, 1, '2020-05-22 20:11:42', NULL, 280, 1, 1, NULL, NULL, NULL),
(2, 'zod78ni2qU0', 'Lenovo', '002', 'CPU / Chipset:\r\nIntelÂ® CeleronÂ® B800 (doble nÃºcleo, 1.50GHz, 2MB cache)\r\nIntelÂ® Coreâ„¢ i3-2310M (doble nÃºcleo / 4 threads, 2.10GHz, 3MB cache)\r\nIntelÂ® Coreâ„¢ i3-2330M (doble nÃºcleo / 4 threads, 2.20GHz, 3MB cache)\r\nIntelÂ® Coreâ„¢ i5-2410M (doble nÃºcleo / 4 threads, 2.30GHz, 3MB cache)\r\nIntelÂ® Coreâ„¢ i5-2430M (doble nÃºcleo / 4 threads, 2.40GHz, 3MB cache)\r\nSistema operativo:Windows 7 Home Premium 64\r\n', NULL, 'teclados.jfif', '', 1, 1, 1, '2020-05-22 21:14:09', NULL, 2058, 2, 1, NULL, NULL, NULL),
(3, 'jZ0qWwi1jMG', 'Dell', '003', 'CARGADOR - DELL 19.5Voltios - 4.62 Amperios +CABLE PODER ,genÃ©rico, es un dispositivo elÃ©ctrico que se requiere para el funcionamiento de un ordenador (Laptop ) , ya que proporciona la energÃ­a a su ordenado (Laptop )portÃ¡til .', NULL, 'cargadores_dell.jfif', '', 1, 1, 1, '2020-05-22 21:17:01', NULL, 15, 3, 1, NULL, NULL, NULL),
(4, 'ctVieemWQLg', 'Mouses Aplee', '001', 'Mouses de segunda categoria', NULL, 'mouse.png', '', 1, 1, 1, '2020-05-22 21:21:44', NULL, 50, 4, 2, NULL, NULL, NULL),
(5, 'Jj2_6plglTu', 'Laptop123', '002', 'Laptop de alta gama con calidad ultra', NULL, 'laptos-D_NQ_NP_963674-MPE28334078417_102018-F_1.jpg', '', 1, 1, 1, '2020-05-22 21:27:59', NULL, 1234, 2, 4, NULL, NULL, NULL),
(6, 'BYu5KPpTbo3', 'Monitor gamer', 'A120', 'Buen monitor xd', NULL, 'compu.png', '', 1, 1, 1, '2020-05-23 21:38:39', NULL, 1200, 5, 1, NULL, NULL, NULL),
(7, '7LOqy4gkN9_', 'Huawey Y7', '004', 'Pantalla de 6,26 pulgadas: Relación de aspecto 19,5:9. ...\r\nProcesador Snapdragon 450.\r\nRAM: 3 GB de memoria RAM.\r\nMemoria interna: 32 GB de almacenamiento interno. ...\r\nCámaras: ...\r\nDimensiones: 158.92×76.91×8.1 mm.\r\nPeso: 168 gramos.\r\nBatería de 4000 mAh.', NULL, 'y7.jpg', '', 1, 1, 1, '2020-05-24 01:34:22', NULL, 650, 6, 1, NULL, NULL, NULL),
(8, 'DUJGTcYE7Dc', 'Audífonos inalámbricos con noise cancelling CH700N', '005', 'Los audífonos inalámbricos WH-CH700N con Noise Cancelling están diseñados para una reproducción prolongada mientras te desplazas. La tecnología Noise Cancelling con inteligencia artificial (AINC) mediante una pulsación se ajusta al entorno para eliminar los ruidos no deseados mientras viajas.', NULL, 'auriculares.jpg', '', 1, 1, 1, '2020-05-24 01:40:00', NULL, 60, 1, 1, NULL, NULL, NULL),
(9, 'Sn8KOzjDRvZ', 'Samsung', '002', 'Ultimo modelo ', NULL, 'samsung_xp.jpg', '', 1, 1, 1, '2020-05-24 01:57:06', NULL, 800, 6, 1, NULL, NULL, NULL),
(10, 'tOTGnrr-gwx', 'Samsung', '005', 'Control para dvd', NULL, '15918085953083773068458167834224.jpg', '', 1, 1, 1, '2020-06-10 17:01:03', NULL, 10, 4, 1, NULL, NULL, NULL),
(11, 'UKfM17PObyR', 'Sony', '006', 'Control para lcd sony', NULL, '', '', 1, 1, 1, '2020-06-10 17:36:55', NULL, 15, 9, 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `product_view`
--

CREATE TABLE `product_view` (
  `id` int(11) NOT NULL,
  `viewer_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `realip` varchar(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `product_view`
--

INSERT INTO `product_view` (`id`, `viewer_id`, `product_id`, `created_at`, `realip`) VALUES
(1, NULL, 1, '2020-05-22 20:12:04', '::1'),
(2, NULL, 2, '2020-05-22 21:14:45', '::1'),
(3, NULL, 3, '2020-05-22 21:18:48', '::1'),
(4, NULL, 4, '2020-05-22 21:21:57', '::1'),
(5, NULL, 5, '2020-05-22 21:28:19', '::1'),
(6, NULL, 4, '2020-05-23 20:46:30', '190.237.183.166'),
(7, NULL, 1, '2020-05-23 20:46:47', '190.237.183.166'),
(8, NULL, 5, '2020-05-23 21:18:14', '190.237.183.166'),
(9, NULL, 6, '2020-05-24 00:21:22', '190.237.183.166'),
(10, NULL, 5, '2020-05-24 01:17:45', '190.237.114.136'),
(11, NULL, 7, '2020-05-24 01:35:35', '190.237.183.166'),
(12, NULL, 8, '2020-05-24 01:40:53', '190.237.183.166'),
(13, NULL, 9, '2020-05-24 01:57:56', '190.237.183.166'),
(14, NULL, 3, '2020-05-24 02:00:42', '190.237.183.166'),
(15, NULL, 2, '2020-05-24 02:00:49', '190.237.183.166'),
(16, NULL, 8, '2020-05-24 02:43:14', '52.200.38.85'),
(17, NULL, 9, '2020-05-24 03:20:39', '3.81.7.243'),
(18, NULL, 9, '2020-05-25 03:56:21', '190.237.183.166'),
(19, NULL, 8, '2020-05-25 03:58:17', '190.237.183.166'),
(20, NULL, 6, '2020-05-25 03:58:49', '190.237.183.166'),
(21, NULL, 4, '2020-05-25 12:03:02', '190.237.183.166'),
(22, NULL, 7, '2020-06-08 05:53:09', '190.237.183.96'),
(23, NULL, 10, '2020-06-10 17:01:19', '190.237.183.96'),
(24, NULL, 11, '2020-06-10 17:37:09', '190.237.183.96'),
(25, NULL, 11, '2020-06-21 16:26:25', '190.237.183.51'),
(26, NULL, 10, '2020-06-21 16:26:30', '190.237.183.51'),
(27, NULL, 4, '2020-06-21 16:26:46', '190.237.183.51'),
(28, NULL, 10, '2020-06-25 11:07:38', '190.237.183.51');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `slide`
--

CREATE TABLE `slide` (
  `id` int(11) NOT NULL,
  `title` varchar(200) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `is_public` tinyint(1) DEFAULT 0,
  `position` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `status`
--

CREATE TABLE `status` (
  `id` int(11) NOT NULL,
  `name` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `status`
--

INSERT INTO `status` (`id`, `name`) VALUES
(1, 'Pendiente'),
(2, 'Pagado'),
(3, 'Cancelado'),
(4, 'Enviado'),
(5, 'Finalizado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unit`
--

CREATE TABLE `unit` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `unit`
--

INSERT INTO `unit` (`id`, `name`) VALUES
(1, 'Pieza'),
(2, 'Kit'),
(3, 'Juego'),
(4, 'Caja');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(60) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `is_admin` tinyint(1) DEFAULT 0,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`id`, `name`, `lastname`, `username`, `email`, `password`, `is_active`, `is_admin`, `created_at`) VALUES
(1, 'Admin', '', 'admin', '', '90b9aa7e25f80cf4f64e990b78a9fc5ebd6cecad', 1, 1, '2020-05-22 20:05:10'),
(2, 'alex yosdado', 'Pomahuacri', 'alex', 'alex_diosdado99@hotmail.com', '417cb4d334e1361aed0d1c4a0dac63607be9c23e', 1, 1, '2020-05-22 21:07:39');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `buy`
--
ALTER TABLE `buy`
  ADD PRIMARY KEY (`id`),
  ADD KEY `paymethod_id` (`paymethod_id`),
  ADD KEY `coupon_id` (`coupon_id`),
  ADD KEY `client_id` (`client_id`),
  ADD KEY `status_id` (`status_id`);

--
-- Indices de la tabla `buy_product`
--
ALTER TABLE `buy_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `buy_id` (`buy_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indices de la tabla `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `configuration`
--
ALTER TABLE `configuration`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `coupon`
--
ALTER TABLE `coupon`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indices de la tabla `paymethod`
--
ALTER TABLE `paymethod`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `unit_id` (`unit_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indices de la tabla `product_view`
--
ALTER TABLE `product_view`
  ADD PRIMARY KEY (`id`),
  ADD KEY `viewer_id` (`viewer_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indices de la tabla `slide`
--
ALTER TABLE `slide`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `unit`
--
ALTER TABLE `unit`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `buy`
--
ALTER TABLE `buy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `buy_product`
--
ALTER TABLE `buy_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `client`
--
ALTER TABLE `client`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `configuration`
--
ALTER TABLE `configuration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `country`
--
ALTER TABLE `country`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `coupon`
--
ALTER TABLE `coupon`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `paymethod`
--
ALTER TABLE `paymethod`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `product_view`
--
ALTER TABLE `product_view`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT de la tabla `slide`
--
ALTER TABLE `slide`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `status`
--
ALTER TABLE `status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `unit`
--
ALTER TABLE `unit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `buy`
--
ALTER TABLE `buy`
  ADD CONSTRAINT `buy_ibfk_1` FOREIGN KEY (`paymethod_id`) REFERENCES `paymethod` (`id`),
  ADD CONSTRAINT `buy_ibfk_2` FOREIGN KEY (`coupon_id`) REFERENCES `coupon` (`id`),
  ADD CONSTRAINT `buy_ibfk_3` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`),
  ADD CONSTRAINT `buy_ibfk_4` FOREIGN KEY (`status_id`) REFERENCES `status` (`id`);

--
-- Filtros para la tabla `buy_product`
--
ALTER TABLE `buy_product`
  ADD CONSTRAINT `buy_product_ibfk_1` FOREIGN KEY (`buy_id`) REFERENCES `buy` (`id`),
  ADD CONSTRAINT `buy_product_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

--
-- Filtros para la tabla `coupon`
--
ALTER TABLE `coupon`
  ADD CONSTRAINT `coupon_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

--
-- Filtros para la tabla `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`unit_id`) REFERENCES `unit` (`id`),
  ADD CONSTRAINT `product_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);

--
-- Filtros para la tabla `product_view`
--
ALTER TABLE `product_view`
  ADD CONSTRAINT `product_view_ibfk_1` FOREIGN KEY (`viewer_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `product_view_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
