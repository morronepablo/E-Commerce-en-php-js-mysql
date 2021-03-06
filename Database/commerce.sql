-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-04-2022 a las 02:15:42
-- Versión del servidor: 10.4.18-MariaDB
-- Versión de PHP: 7.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `commerce`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `caracteristica`
--

CREATE TABLE `caracteristica` (
  `id` int(11) NOT NULL,
  `titulo` varchar(100) NOT NULL,
  `descripcion` varchar(1000) NOT NULL,
  `fecha_creacion` datetime NOT NULL DEFAULT current_timestamp(),
  `fecha_edicion` datetime NOT NULL DEFAULT current_timestamp(),
  `estado` varchar(10) NOT NULL DEFAULT 'A',
  `id_producto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `caracteristica`
--

INSERT INTO `caracteristica` (`id`, `titulo`, `descripcion`, `fecha_creacion`, `fecha_edicion`, `estado`, `id_producto`) VALUES
(1, 'Modelo', 'SM-A217M', '2021-08-20 13:46:44', '2021-08-20 13:46:44', 'A', 1),
(2, 'Color', 'Negro', '2021-08-20 13:46:44', '2021-08-20 13:46:44', 'A', 1),
(3, 'Tamaño', '163.7 x 75.3 x 8.9', '2021-08-20 13:46:44', '2021-08-20 13:46:44', 'A', 1),
(4, 'Peso (gr)', '192', '2021-08-20 13:46:44', '2021-08-20 13:46:44', 'A', 1),
(5, 'Memoria Interna', '128GB', '2021-08-20 13:46:44', '2021-08-20 13:46:44', 'A', 1),
(6, 'Memoria Externa', '512GB', '2021-08-20 13:46:44', '2021-08-20 13:46:44', 'A', 1),
(7, 'Procesador', 'Octa Core 2.0', '2021-08-20 13:46:44', '2021-08-20 13:46:44', 'A', 1),
(8, 'Memoria RAM', '4GB', '2021-08-20 13:46:44', '2021-08-20 13:46:44', 'A', 1),
(9, 'Localización', 'A-GPS , Galileo , Glonass , GPS', '2021-08-20 13:46:44', '2021-08-20 13:46:44', 'A', 1),
(10, 'Sistema Operativo', 'Android 10', '2021-08-20 13:46:44', '2021-08-20 13:46:44', 'A', 1),
(11, 'Modelo', 'A2221', '2021-08-20 14:09:34', '2021-08-20 14:09:34', 'A', 2),
(12, 'Color', 'Negro', '2021-08-20 14:09:34', '2021-08-20 14:09:34', 'A', 2),
(13, 'Tamaño', '150.9 x 75.7 x 8.3 mm', '2021-08-20 14:09:34', '2021-08-20 14:09:34', 'A', 2),
(14, 'Peso (gr)', '194', '2021-08-20 14:09:34', '2021-08-20 14:09:34', 'A', 2),
(15, 'Memoria Interna', '128GB', '2021-08-20 14:09:34', '2021-08-20 14:09:34', 'A', 2),
(16, 'Memoria Externa', '128GB', '2021-08-20 14:09:34', '2021-08-20 14:09:34', 'A', 2),
(17, 'Procesador', 'Apple A13 Bionic hexa-core 2.65Ghz', '2021-08-20 14:09:34', '2021-08-20 14:09:34', 'A', 2),
(18, 'Memoria RAM', '4GB', '2021-08-20 14:09:34', '2021-08-20 14:09:34', 'A', 2),
(19, 'Localización', 'GPS con soporte A-GPS, GLONASS, GALILEO, QZSS', '2021-08-20 14:09:34', '2021-08-20 14:09:34', 'A', 2),
(20, 'Sistema Operativo', 'iOS 13', '2021-08-20 14:09:34', '2021-08-20 14:09:34', 'A', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `fecha_creacion` datetime NOT NULL DEFAULT current_timestamp(),
  `fecha_edicion` datetime NOT NULL DEFAULT current_timestamp(),
  `estado` varchar(10) NOT NULL DEFAULT 'A'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`id`, `nombre`, `fecha_creacion`, `fecha_edicion`, `estado`) VALUES
(1, 'Celulares y Tablet', '2021-08-20 14:12:11', '2021-08-20 14:12:11', 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `destino`
--

CREATE TABLE `destino` (
  `id` int(11) NOT NULL,
  `asunto` varchar(1000) NOT NULL,
  `contenido` varchar(10000) NOT NULL,
  `abierto` int(11) NOT NULL DEFAULT 0,
  `abierto_emisor` int(11) NOT NULL DEFAULT 0,
  `favorito` int(11) NOT NULL DEFAULT 0,
  `favorito_emisor` int(11) NOT NULL DEFAULT 0,
  `estado` varchar(10) NOT NULL DEFAULT 'A',
  `estado_perm` varchar(10) NOT NULL DEFAULT 'A',
  `estado_emisor` varchar(10) NOT NULL DEFAULT 'A',
  `estado_emisor_perm` varchar(10) NOT NULL DEFAULT 'A',
  `fecha_creacion` datetime NOT NULL DEFAULT current_timestamp(),
  `fecha_edicion` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `id_usuario` int(11) NOT NULL,
  `id_mensaje` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `destino`
--

INSERT INTO `destino` (`id`, `asunto`, `contenido`, `abierto`, `abierto_emisor`, `favorito`, `favorito_emisor`, `estado`, `estado_perm`, `estado_emisor`, `estado_emisor_perm`, `fecha_creacion`, `fecha_edicion`, `id_usuario`, `id_mensaje`) VALUES
(1, 'Usuario administrador tiene usted una solicitud marca para revisar', 'Hola usuario administrador Pablo Martin por favor revise mi solicitud marca si es que todo esta correcto apruebela, si no me indica los errores para corregirla', 0, 0, 0, 0, 'A', 'A', 'A', 'A', '2022-03-19 18:58:54', '2022-04-14 16:33:41', 2, 1),
(2, 'Usuario administrador tiene usted una solicitud marca para revisar', 'Hola usuario administrador Juan por favor revise mi solicitud marca si es que todo esta correcto apruebela, si no me indica los errores para corregirla', 0, 0, 0, 0, 'A', 'A', 'A', 'A', '2022-03-19 18:58:54', '2022-03-19 18:58:54', 3, 1),
(3, 'Usuario administrador tiene usted una solicitud marca para revisar', 'Hola usuario administrador juan por favor revise mi solicitud marca si es que todo esta correcto apruebela, si no me indica los errores para corregirla', 0, 0, 0, 0, 'A', 'A', 'A', 'A', '2022-03-19 18:58:54', '2022-03-19 18:58:54', 4, 1),
(4, 'Usuario administrador tiene usted una solicitud marca para revisar', 'Hola usuario administrador Martin por favor revise mi solicitud marca si es que todo esta correcto apruebela, si no me indica los errores para corregirla', 0, 0, 0, 0, 'A', 'A', 'A', 'A', '2022-03-19 18:58:54', '2022-03-19 18:58:54', 5, 1),
(5, 'Usuario administrador tiene usted una solicitud marca para revisar', 'Hola usuario administrador Pedro por favor revise mi solicitud marca si es que todo esta correcto apruebela, si no me indica los errores para corregirla', 0, 0, 0, 0, 'A', 'A', 'A', 'A', '2022-03-19 18:58:54', '2022-03-19 18:58:54', 6, 1),
(6, 'Usuario administrador tiene usted una solicitud marca para revisar', 'Hola usuario administrador Julio por favor revise mi solicitud marca si es que todo esta correcto apruebela, si no me indica los errores para corregirla', 0, 0, 0, 0, 'A', 'A', 'A', 'A', '2022-03-19 18:58:54', '2022-03-19 18:58:54', 7, 1),
(7, 'Usuario administrador tiene usted una solicitud marca para revisar', 'Hola usuario administrador Maximiliano por favor revise mi solicitud marca si es que todo esta correcto apruebela, si no me indica los errores para corregirla', 0, 0, 0, 0, 'A', 'A', 'A', 'A', '2022-03-19 18:58:54', '2022-03-19 18:58:54', 8, 1),
(8, 'Usuario administrador tiene usted una solicitud marca para revisar', 'Hola usuario administrador Victoria por favor revise mi solicitud marca si es que todo esta correcto apruebela, si no me indica los errores para corregirla', 0, 0, 0, 0, 'A', 'A', 'A', 'A', '2022-03-19 18:58:54', '2022-03-19 18:58:54', 9, 1),
(9, 'Usuario administrador tiene usted una solicitud marca para revisar', '\r\n                    <div class=\"card card-widget widget-user\">\r\n                        <div class=\"widget-user-header bg-info\">\r\n                            <h3 class=\"widget-user-username\">G-Star</h3>\r\n                            <h5 class=\"widget-user-desc\">Indumentaria Hombre, Mujeres</h5>\r\n                        </div>\r\n                        <div class=\"widget-user-image\">\r\n                            <img class=\"img-circle elevation-2\" src=\"../../Util/Img/marca/622d0ba25097f-622d0ba250982.png\" alt=\"imagen solicitud\">\r\n                        </div>\r\n                        <div class=\"card-footer\">\r\n                            <div class=\"row\">\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Solicitud marca creado por:</h5>\r\n                                        <span class=\"description-text\">Natalia Elvira Oduber</span>\r\n                                    </div>\r\n                                </div>\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Mensaje:</h5>\r\n                                        <span class=\"description-text\">Hola usuario administrador Pablo Martin Morrone revise mi solicitud marca,  si es que los datos son correctos por favor apruebelo, si no indiqueme los errores para corregirla y enviarsela</span>\r\n                                    </div>\r\n                                </div>\r\n                            </div>\r\n                        </div>\r\n                    </div>\r\n                    ', 0, 0, 1, 0, 'A', 'A', 'A', 'A', '2022-03-23 21:04:36', '2022-04-14 16:33:41', 2, 2),
(10, 'Usuario administrador tiene usted una solicitud marca para revisar', '\r\n                    <div class=\"card card-widget widget-user\">\r\n                        <div class=\"widget-user-header bg-info\">\r\n                            <h3 class=\"widget-user-username\">G-Star</h3>\r\n                            <h5 class=\"widget-user-desc\">Indumentaria Hombre, Mujeres</h5>\r\n                        </div>\r\n                        <div class=\"widget-user-image\">\r\n                            <img class=\"img-circle elevation-2\" src=\"../../Util/Img/marca/622d0ba25097f-622d0ba250982.png\" alt=\"imagen solicitud\">\r\n                        </div>\r\n                        <div class=\"card-footer\">\r\n                            <div class=\"row\">\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Solicitud marca creado por:</h5>\r\n                                        <span class=\"description-text\">Natalia Elvira Oduber</span>\r\n                                    </div>\r\n                                </div>\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Mensaje:</h5>\r\n                                        <span class=\"description-text\">Hola usuario administrador Juan Cosme revise mi solicitud marca,  si es que los datos son correctos por favor apruebelo, si no indiqueme los errores para corregirla y enviarsela</span>\r\n                                    </div>\r\n                                </div>\r\n                            </div>\r\n                        </div>\r\n                    </div>\r\n                    ', 0, 0, 0, 0, 'A', 'A', 'A', 'A', '2022-03-23 21:04:36', '2022-03-23 21:04:36', 3, 2),
(11, 'Usuario administrador tiene usted una solicitud marca para revisar', '\r\n                    <div class=\"card card-widget widget-user\">\r\n                        <div class=\"widget-user-header bg-info\">\r\n                            <h3 class=\"widget-user-username\">G-Star</h3>\r\n                            <h5 class=\"widget-user-desc\">Indumentaria Hombre, Mujeres</h5>\r\n                        </div>\r\n                        <div class=\"widget-user-image\">\r\n                            <img class=\"img-circle elevation-2\" src=\"../../Util/Img/marca/622d0ba25097f-622d0ba250982.png\" alt=\"imagen solicitud\">\r\n                        </div>\r\n                        <div class=\"card-footer\">\r\n                            <div class=\"row\">\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Solicitud marca creado por:</h5>\r\n                                        <span class=\"description-text\">Natalia Elvira Oduber</span>\r\n                                    </div>\r\n                                </div>\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Mensaje:</h5>\r\n                                        <span class=\"description-text\">Hola usuario administrador juan diego revise mi solicitud marca,  si es que los datos son correctos por favor apruebelo, si no indiqueme los errores para corregirla y enviarsela</span>\r\n                                    </div>\r\n                                </div>\r\n                            </div>\r\n                        </div>\r\n                    </div>\r\n                    ', 0, 0, 0, 0, 'A', 'A', 'A', 'A', '2022-03-23 21:04:36', '2022-03-23 21:04:36', 4, 2),
(12, 'Usuario administrador tiene usted una solicitud marca para revisar', '\r\n                    <div class=\"card card-widget widget-user\">\r\n                        <div class=\"widget-user-header bg-info\">\r\n                            <h3 class=\"widget-user-username\">G-Star</h3>\r\n                            <h5 class=\"widget-user-desc\">Indumentaria Hombre, Mujeres</h5>\r\n                        </div>\r\n                        <div class=\"widget-user-image\">\r\n                            <img class=\"img-circle elevation-2\" src=\"../../Util/Img/marca/622d0ba25097f-622d0ba250982.png\" alt=\"imagen solicitud\">\r\n                        </div>\r\n                        <div class=\"card-footer\">\r\n                            <div class=\"row\">\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Solicitud marca creado por:</h5>\r\n                                        <span class=\"description-text\">Natalia Elvira Oduber</span>\r\n                                    </div>\r\n                                </div>\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Mensaje:</h5>\r\n                                        <span class=\"description-text\">Hola usuario administrador Martin Trinidad revise mi solicitud marca,  si es que los datos son correctos por favor apruebelo, si no indiqueme los errores para corregirla y enviarsela</span>\r\n                                    </div>\r\n                                </div>\r\n                            </div>\r\n                        </div>\r\n                    </div>\r\n                    ', 0, 0, 0, 0, 'A', 'A', 'A', 'A', '2022-03-23 21:04:36', '2022-03-23 21:04:36', 5, 2),
(13, 'Usuario administrador tiene usted una solicitud marca para revisar', '\r\n                    <div class=\"card card-widget widget-user\">\r\n                        <div class=\"widget-user-header bg-info\">\r\n                            <h3 class=\"widget-user-username\">G-Star</h3>\r\n                            <h5 class=\"widget-user-desc\">Indumentaria Hombre, Mujeres</h5>\r\n                        </div>\r\n                        <div class=\"widget-user-image\">\r\n                            <img class=\"img-circle elevation-2\" src=\"../../Util/Img/marca/622d0ba25097f-622d0ba250982.png\" alt=\"imagen solicitud\">\r\n                        </div>\r\n                        <div class=\"card-footer\">\r\n                            <div class=\"row\">\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Solicitud marca creado por:</h5>\r\n                                        <span class=\"description-text\">Natalia Elvira Oduber</span>\r\n                                    </div>\r\n                                </div>\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Mensaje:</h5>\r\n                                        <span class=\"description-text\">Hola usuario administrador Pedro Alfonzo revise mi solicitud marca,  si es que los datos son correctos por favor apruebelo, si no indiqueme los errores para corregirla y enviarsela</span>\r\n                                    </div>\r\n                                </div>\r\n                            </div>\r\n                        </div>\r\n                    </div>\r\n                    ', 0, 0, 0, 0, 'A', 'A', 'A', 'A', '2022-03-23 21:04:36', '2022-03-23 21:04:36', 6, 2),
(14, 'Usuario administrador tiene usted una solicitud marca para revisar', '\r\n                    <div class=\"card card-widget widget-user\">\r\n                        <div class=\"widget-user-header bg-info\">\r\n                            <h3 class=\"widget-user-username\">G-Star</h3>\r\n                            <h5 class=\"widget-user-desc\">Indumentaria Hombre, Mujeres</h5>\r\n                        </div>\r\n                        <div class=\"widget-user-image\">\r\n                            <img class=\"img-circle elevation-2\" src=\"../../Util/Img/marca/622d0ba25097f-622d0ba250982.png\" alt=\"imagen solicitud\">\r\n                        </div>\r\n                        <div class=\"card-footer\">\r\n                            <div class=\"row\">\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Solicitud marca creado por:</h5>\r\n                                        <span class=\"description-text\">Natalia Elvira Oduber</span>\r\n                                    </div>\r\n                                </div>\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Mensaje:</h5>\r\n                                        <span class=\"description-text\">Hola usuario administrador Julio Cesar revise mi solicitud marca,  si es que los datos son correctos por favor apruebelo, si no indiqueme los errores para corregirla y enviarsela</span>\r\n                                    </div>\r\n                                </div>\r\n                            </div>\r\n                        </div>\r\n                    </div>\r\n                    ', 0, 0, 0, 0, 'A', 'A', 'A', 'A', '2022-03-23 21:04:36', '2022-03-23 21:04:36', 7, 2),
(15, 'Usuario administrador tiene usted una solicitud marca para revisar', '\r\n                    <div class=\"card card-widget widget-user\">\r\n                        <div class=\"widget-user-header bg-info\">\r\n                            <h3 class=\"widget-user-username\">G-Star</h3>\r\n                            <h5 class=\"widget-user-desc\">Indumentaria Hombre, Mujeres</h5>\r\n                        </div>\r\n                        <div class=\"widget-user-image\">\r\n                            <img class=\"img-circle elevation-2\" src=\"../../Util/Img/marca/622d0ba25097f-622d0ba250982.png\" alt=\"imagen solicitud\">\r\n                        </div>\r\n                        <div class=\"card-footer\">\r\n                            <div class=\"row\">\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Solicitud marca creado por:</h5>\r\n                                        <span class=\"description-text\">Natalia Elvira Oduber</span>\r\n                                    </div>\r\n                                </div>\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Mensaje:</h5>\r\n                                        <span class=\"description-text\">Hola usuario administrador Maximiliano Hoeffler revise mi solicitud marca,  si es que los datos son correctos por favor apruebelo, si no indiqueme los errores para corregirla y enviarsela</span>\r\n                                    </div>\r\n                                </div>\r\n                            </div>\r\n                        </div>\r\n                    </div>\r\n                    ', 0, 0, 0, 0, 'A', 'A', 'A', 'A', '2022-03-23 21:04:36', '2022-03-23 21:04:36', 8, 2),
(16, 'Usuario administrador tiene usted una solicitud marca para revisar', '\r\n                    <div class=\"card card-widget widget-user\">\r\n                        <div class=\"widget-user-header bg-info\">\r\n                            <h3 class=\"widget-user-username\">G-Star</h3>\r\n                            <h5 class=\"widget-user-desc\">Indumentaria Hombre, Mujeres</h5>\r\n                        </div>\r\n                        <div class=\"widget-user-image\">\r\n                            <img class=\"img-circle elevation-2\" src=\"../../Util/Img/marca/622d0ba25097f-622d0ba250982.png\" alt=\"imagen solicitud\">\r\n                        </div>\r\n                        <div class=\"card-footer\">\r\n                            <div class=\"row\">\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Solicitud marca creado por:</h5>\r\n                                        <span class=\"description-text\">Natalia Elvira Oduber</span>\r\n                                    </div>\r\n                                </div>\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Mensaje:</h5>\r\n                                        <span class=\"description-text\">Hola usuario administrador Victoria Gallo revise mi solicitud marca,  si es que los datos son correctos por favor apruebelo, si no indiqueme los errores para corregirla y enviarsela</span>\r\n                                    </div>\r\n                                </div>\r\n                            </div>\r\n                        </div>\r\n                    </div>\r\n                    ', 0, 0, 0, 0, 'A', 'A', 'A', 'A', '2022-03-23 21:04:36', '2022-03-23 21:04:36', 9, 2),
(17, 'Usuario administrador tiene usted una solicitud marca para revisar', '\r\n                    <div class=\"card card-widget widget-user\">\r\n                        <div class=\"widget-user-header bg-info\">\r\n                            <h3 class=\"widget-user-username\">prueba9 </h3>\r\n                            <h5 class=\"widget-user-desc\">fsddfsdfsd</h5>\r\n                        </div>\r\n                        <div class=\"widget-user-image\">\r\n                            <img class=\"img-circle elevation-2\" src=\"../../Util/Img/marca/623f83119fa0b-623f83119fa10.png\" alt=\"imagen solicitud\">\r\n                        </div>\r\n                        <div class=\"card-footer\">\r\n                            <div class=\"row\">\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Solicitud marca creado por:</h5>\r\n                                        <span class=\"description-text\">Natalia Elvira Oduber</span>\r\n                                    </div>\r\n                                </div>\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Mensaje:</h5>\r\n                                        <span class=\"description-text\">Hola usuario administrador Pablo Martin Morrone revise mi solicitud marca,  si es que los datos son correctos por favor apruebelo, si no indiqueme los errores para corregirla y enviarsela</span>\r\n                                    </div>\r\n                                </div>\r\n                            </div>\r\n                        </div>\r\n                    </div>\r\n                    ', 0, 0, 1, 0, 'A', 'A', 'A', 'A', '2022-03-26 18:18:23', '2022-04-14 16:33:41', 2, 3),
(18, 'Usuario administrador tiene usted una solicitud marca para revisar', '\r\n                    <div class=\"card card-widget widget-user\">\r\n                        <div class=\"widget-user-header bg-info\">\r\n                            <h3 class=\"widget-user-username\">prueba9 </h3>\r\n                            <h5 class=\"widget-user-desc\">fsddfsdfsd</h5>\r\n                        </div>\r\n                        <div class=\"widget-user-image\">\r\n                            <img class=\"img-circle elevation-2\" src=\"../../Util/Img/marca/623f83119fa0b-623f83119fa10.png\" alt=\"imagen solicitud\">\r\n                        </div>\r\n                        <div class=\"card-footer\">\r\n                            <div class=\"row\">\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Solicitud marca creado por:</h5>\r\n                                        <span class=\"description-text\">Natalia Elvira Oduber</span>\r\n                                    </div>\r\n                                </div>\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Mensaje:</h5>\r\n                                        <span class=\"description-text\">Hola usuario administrador Juan Cosme revise mi solicitud marca,  si es que los datos son correctos por favor apruebelo, si no indiqueme los errores para corregirla y enviarsela</span>\r\n                                    </div>\r\n                                </div>\r\n                            </div>\r\n                        </div>\r\n                    </div>\r\n                    ', 0, 0, 0, 0, 'A', 'A', 'A', 'A', '2022-03-26 18:18:23', '2022-03-26 18:18:23', 3, 3),
(19, 'Usuario administrador tiene usted una solicitud marca para revisar', '\r\n                    <div class=\"card card-widget widget-user\">\r\n                        <div class=\"widget-user-header bg-info\">\r\n                            <h3 class=\"widget-user-username\">prueba9 </h3>\r\n                            <h5 class=\"widget-user-desc\">fsddfsdfsd</h5>\r\n                        </div>\r\n                        <div class=\"widget-user-image\">\r\n                            <img class=\"img-circle elevation-2\" src=\"../../Util/Img/marca/623f83119fa0b-623f83119fa10.png\" alt=\"imagen solicitud\">\r\n                        </div>\r\n                        <div class=\"card-footer\">\r\n                            <div class=\"row\">\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Solicitud marca creado por:</h5>\r\n                                        <span class=\"description-text\">Natalia Elvira Oduber</span>\r\n                                    </div>\r\n                                </div>\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Mensaje:</h5>\r\n                                        <span class=\"description-text\">Hola usuario administrador juan diego revise mi solicitud marca,  si es que los datos son correctos por favor apruebelo, si no indiqueme los errores para corregirla y enviarsela</span>\r\n                                    </div>\r\n                                </div>\r\n                            </div>\r\n                        </div>\r\n                    </div>\r\n                    ', 0, 0, 0, 0, 'A', 'A', 'A', 'A', '2022-03-26 18:18:23', '2022-03-26 18:18:23', 4, 3),
(20, 'Usuario administrador tiene usted una solicitud marca para revisar', '\r\n                    <div class=\"card card-widget widget-user\">\r\n                        <div class=\"widget-user-header bg-info\">\r\n                            <h3 class=\"widget-user-username\">prueba9 </h3>\r\n                            <h5 class=\"widget-user-desc\">fsddfsdfsd</h5>\r\n                        </div>\r\n                        <div class=\"widget-user-image\">\r\n                            <img class=\"img-circle elevation-2\" src=\"../../Util/Img/marca/623f83119fa0b-623f83119fa10.png\" alt=\"imagen solicitud\">\r\n                        </div>\r\n                        <div class=\"card-footer\">\r\n                            <div class=\"row\">\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Solicitud marca creado por:</h5>\r\n                                        <span class=\"description-text\">Natalia Elvira Oduber</span>\r\n                                    </div>\r\n                                </div>\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Mensaje:</h5>\r\n                                        <span class=\"description-text\">Hola usuario administrador Martin Trinidad revise mi solicitud marca,  si es que los datos son correctos por favor apruebelo, si no indiqueme los errores para corregirla y enviarsela</span>\r\n                                    </div>\r\n                                </div>\r\n                            </div>\r\n                        </div>\r\n                    </div>\r\n                    ', 0, 0, 0, 0, 'A', 'A', 'A', 'A', '2022-03-26 18:18:23', '2022-03-26 18:18:23', 5, 3),
(21, 'Usuario administrador tiene usted una solicitud marca para revisar', '\r\n                    <div class=\"card card-widget widget-user\">\r\n                        <div class=\"widget-user-header bg-info\">\r\n                            <h3 class=\"widget-user-username\">prueba9 </h3>\r\n                            <h5 class=\"widget-user-desc\">fsddfsdfsd</h5>\r\n                        </div>\r\n                        <div class=\"widget-user-image\">\r\n                            <img class=\"img-circle elevation-2\" src=\"../../Util/Img/marca/623f83119fa0b-623f83119fa10.png\" alt=\"imagen solicitud\">\r\n                        </div>\r\n                        <div class=\"card-footer\">\r\n                            <div class=\"row\">\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Solicitud marca creado por:</h5>\r\n                                        <span class=\"description-text\">Natalia Elvira Oduber</span>\r\n                                    </div>\r\n                                </div>\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Mensaje:</h5>\r\n                                        <span class=\"description-text\">Hola usuario administrador Pedro Alfonzo revise mi solicitud marca,  si es que los datos son correctos por favor apruebelo, si no indiqueme los errores para corregirla y enviarsela</span>\r\n                                    </div>\r\n                                </div>\r\n                            </div>\r\n                        </div>\r\n                    </div>\r\n                    ', 0, 0, 0, 0, 'A', 'A', 'A', 'A', '2022-03-26 18:18:23', '2022-03-26 18:18:23', 6, 3),
(22, 'Usuario administrador tiene usted una solicitud marca para revisar', '\r\n                    <div class=\"card card-widget widget-user\">\r\n                        <div class=\"widget-user-header bg-info\">\r\n                            <h3 class=\"widget-user-username\">prueba9 </h3>\r\n                            <h5 class=\"widget-user-desc\">fsddfsdfsd</h5>\r\n                        </div>\r\n                        <div class=\"widget-user-image\">\r\n                            <img class=\"img-circle elevation-2\" src=\"../../Util/Img/marca/623f83119fa0b-623f83119fa10.png\" alt=\"imagen solicitud\">\r\n                        </div>\r\n                        <div class=\"card-footer\">\r\n                            <div class=\"row\">\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Solicitud marca creado por:</h5>\r\n                                        <span class=\"description-text\">Natalia Elvira Oduber</span>\r\n                                    </div>\r\n                                </div>\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Mensaje:</h5>\r\n                                        <span class=\"description-text\">Hola usuario administrador Julio Cesar revise mi solicitud marca,  si es que los datos son correctos por favor apruebelo, si no indiqueme los errores para corregirla y enviarsela</span>\r\n                                    </div>\r\n                                </div>\r\n                            </div>\r\n                        </div>\r\n                    </div>\r\n                    ', 0, 0, 0, 0, 'A', 'A', 'A', 'A', '2022-03-26 18:18:23', '2022-03-26 18:18:23', 7, 3),
(23, 'Usuario administrador tiene usted una solicitud marca para revisar', '\r\n                    <div class=\"card card-widget widget-user\">\r\n                        <div class=\"widget-user-header bg-info\">\r\n                            <h3 class=\"widget-user-username\">prueba9 </h3>\r\n                            <h5 class=\"widget-user-desc\">fsddfsdfsd</h5>\r\n                        </div>\r\n                        <div class=\"widget-user-image\">\r\n                            <img class=\"img-circle elevation-2\" src=\"../../Util/Img/marca/623f83119fa0b-623f83119fa10.png\" alt=\"imagen solicitud\">\r\n                        </div>\r\n                        <div class=\"card-footer\">\r\n                            <div class=\"row\">\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Solicitud marca creado por:</h5>\r\n                                        <span class=\"description-text\">Natalia Elvira Oduber</span>\r\n                                    </div>\r\n                                </div>\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Mensaje:</h5>\r\n                                        <span class=\"description-text\">Hola usuario administrador Maximiliano Hoeffler revise mi solicitud marca,  si es que los datos son correctos por favor apruebelo, si no indiqueme los errores para corregirla y enviarsela</span>\r\n                                    </div>\r\n                                </div>\r\n                            </div>\r\n                        </div>\r\n                    </div>\r\n                    ', 0, 0, 0, 0, 'A', 'A', 'A', 'A', '2022-03-26 18:18:23', '2022-03-26 18:18:23', 8, 3),
(24, 'Usuario administrador tiene usted una solicitud marca para revisar', '\r\n                    <div class=\"card card-widget widget-user\">\r\n                        <div class=\"widget-user-header bg-info\">\r\n                            <h3 class=\"widget-user-username\">prueba9 </h3>\r\n                            <h5 class=\"widget-user-desc\">fsddfsdfsd</h5>\r\n                        </div>\r\n                        <div class=\"widget-user-image\">\r\n                            <img class=\"img-circle elevation-2\" src=\"../../Util/Img/marca/623f83119fa0b-623f83119fa10.png\" alt=\"imagen solicitud\">\r\n                        </div>\r\n                        <div class=\"card-footer\">\r\n                            <div class=\"row\">\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Solicitud marca creado por:</h5>\r\n                                        <span class=\"description-text\">Natalia Elvira Oduber</span>\r\n                                    </div>\r\n                                </div>\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Mensaje:</h5>\r\n                                        <span class=\"description-text\">Hola usuario administrador Victoria Gallo revise mi solicitud marca,  si es que los datos son correctos por favor apruebelo, si no indiqueme los errores para corregirla y enviarsela</span>\r\n                                    </div>\r\n                                </div>\r\n                            </div>\r\n                        </div>\r\n                    </div>\r\n                    ', 0, 0, 0, 0, 'A', 'A', 'A', 'A', '2022-03-26 18:18:23', '2022-03-26 18:18:23', 9, 3),
(25, 'Usuario administrador tiene usted una solicitud marca para revisar', '\r\n                    <div class=\"card card-widget widget-user\">\r\n                        <div class=\"widget-user-header bg-info\">\r\n                            <h3 class=\"widget-user-username\">prueba8</h3>\r\n                            <h5 class=\"widget-user-desc\">1111111111111</h5>\r\n                        </div>\r\n                        <div class=\"widget-user-image\">\r\n                            <img class=\"img-circle elevation-2\" src=\"../../Util/Img/marca/623f8300734c0-623f8300734c3.jpg\" alt=\"imagen solicitud\">\r\n                        </div>\r\n                        <div class=\"card-footer\">\r\n                            <div class=\"row\">\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Solicitud marca creado por:</h5>\r\n                                        <span class=\"description-text\">Natalia Elvira Oduber</span>\r\n                                    </div>\r\n                                </div>\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Mensaje:</h5>\r\n                                        <span class=\"description-text\">Hola usuario administrador Pablo Martin Morrone revise mi solicitud marca,  si es que los datos son correctos por favor apruebelo, si no indiqueme los errores para corregirla y enviarsela</span>\r\n                                    </div>\r\n                                </div>\r\n                            </div>\r\n                        </div>\r\n                    </div>\r\n                    ', 1, 0, 0, 0, 'A', 'A', 'A', 'A', '2022-03-26 18:18:24', '2022-04-21 14:10:14', 2, 4),
(26, 'Usuario administrador tiene usted una solicitud marca para revisar', '\r\n                    <div class=\"card card-widget widget-user\">\r\n                        <div class=\"widget-user-header bg-info\">\r\n                            <h3 class=\"widget-user-username\">prueba8</h3>\r\n                            <h5 class=\"widget-user-desc\">1111111111111</h5>\r\n                        </div>\r\n                        <div class=\"widget-user-image\">\r\n                            <img class=\"img-circle elevation-2\" src=\"../../Util/Img/marca/623f8300734c0-623f8300734c3.jpg\" alt=\"imagen solicitud\">\r\n                        </div>\r\n                        <div class=\"card-footer\">\r\n                            <div class=\"row\">\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Solicitud marca creado por:</h5>\r\n                                        <span class=\"description-text\">Natalia Elvira Oduber</span>\r\n                                    </div>\r\n                                </div>\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Mensaje:</h5>\r\n                                        <span class=\"description-text\">Hola usuario administrador Juan Cosme revise mi solicitud marca,  si es que los datos son correctos por favor apruebelo, si no indiqueme los errores para corregirla y enviarsela</span>\r\n                                    </div>\r\n                                </div>\r\n                            </div>\r\n                        </div>\r\n                    </div>\r\n                    ', 0, 0, 0, 0, 'A', 'A', 'A', 'A', '2022-03-26 18:18:24', '2022-03-26 18:18:24', 3, 4),
(27, 'Usuario administrador tiene usted una solicitud marca para revisar', '\r\n                    <div class=\"card card-widget widget-user\">\r\n                        <div class=\"widget-user-header bg-info\">\r\n                            <h3 class=\"widget-user-username\">prueba8</h3>\r\n                            <h5 class=\"widget-user-desc\">1111111111111</h5>\r\n                        </div>\r\n                        <div class=\"widget-user-image\">\r\n                            <img class=\"img-circle elevation-2\" src=\"../../Util/Img/marca/623f8300734c0-623f8300734c3.jpg\" alt=\"imagen solicitud\">\r\n                        </div>\r\n                        <div class=\"card-footer\">\r\n                            <div class=\"row\">\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Solicitud marca creado por:</h5>\r\n                                        <span class=\"description-text\">Natalia Elvira Oduber</span>\r\n                                    </div>\r\n                                </div>\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Mensaje:</h5>\r\n                                        <span class=\"description-text\">Hola usuario administrador juan diego revise mi solicitud marca,  si es que los datos son correctos por favor apruebelo, si no indiqueme los errores para corregirla y enviarsela</span>\r\n                                    </div>\r\n                                </div>\r\n                            </div>\r\n                        </div>\r\n                    </div>\r\n                    ', 0, 0, 0, 0, 'A', 'A', 'A', 'A', '2022-03-26 18:18:24', '2022-03-26 18:18:24', 4, 4),
(28, 'Usuario administrador tiene usted una solicitud marca para revisar', '\r\n                    <div class=\"card card-widget widget-user\">\r\n                        <div class=\"widget-user-header bg-info\">\r\n                            <h3 class=\"widget-user-username\">prueba8</h3>\r\n                            <h5 class=\"widget-user-desc\">1111111111111</h5>\r\n                        </div>\r\n                        <div class=\"widget-user-image\">\r\n                            <img class=\"img-circle elevation-2\" src=\"../../Util/Img/marca/623f8300734c0-623f8300734c3.jpg\" alt=\"imagen solicitud\">\r\n                        </div>\r\n                        <div class=\"card-footer\">\r\n                            <div class=\"row\">\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Solicitud marca creado por:</h5>\r\n                                        <span class=\"description-text\">Natalia Elvira Oduber</span>\r\n                                    </div>\r\n                                </div>\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Mensaje:</h5>\r\n                                        <span class=\"description-text\">Hola usuario administrador Martin Trinidad revise mi solicitud marca,  si es que los datos son correctos por favor apruebelo, si no indiqueme los errores para corregirla y enviarsela</span>\r\n                                    </div>\r\n                                </div>\r\n                            </div>\r\n                        </div>\r\n                    </div>\r\n                    ', 0, 0, 0, 0, 'A', 'A', 'A', 'A', '2022-03-26 18:18:24', '2022-03-26 18:18:24', 5, 4),
(29, 'Usuario administrador tiene usted una solicitud marca para revisar', '\r\n                    <div class=\"card card-widget widget-user\">\r\n                        <div class=\"widget-user-header bg-info\">\r\n                            <h3 class=\"widget-user-username\">prueba8</h3>\r\n                            <h5 class=\"widget-user-desc\">1111111111111</h5>\r\n                        </div>\r\n                        <div class=\"widget-user-image\">\r\n                            <img class=\"img-circle elevation-2\" src=\"../../Util/Img/marca/623f8300734c0-623f8300734c3.jpg\" alt=\"imagen solicitud\">\r\n                        </div>\r\n                        <div class=\"card-footer\">\r\n                            <div class=\"row\">\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Solicitud marca creado por:</h5>\r\n                                        <span class=\"description-text\">Natalia Elvira Oduber</span>\r\n                                    </div>\r\n                                </div>\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Mensaje:</h5>\r\n                                        <span class=\"description-text\">Hola usuario administrador Pedro Alfonzo revise mi solicitud marca,  si es que los datos son correctos por favor apruebelo, si no indiqueme los errores para corregirla y enviarsela</span>\r\n                                    </div>\r\n                                </div>\r\n                            </div>\r\n                        </div>\r\n                    </div>\r\n                    ', 0, 0, 0, 0, 'A', 'A', 'A', 'A', '2022-03-26 18:18:24', '2022-03-26 18:18:24', 6, 4),
(30, 'Usuario administrador tiene usted una solicitud marca para revisar', '\r\n                    <div class=\"card card-widget widget-user\">\r\n                        <div class=\"widget-user-header bg-info\">\r\n                            <h3 class=\"widget-user-username\">prueba8</h3>\r\n                            <h5 class=\"widget-user-desc\">1111111111111</h5>\r\n                        </div>\r\n                        <div class=\"widget-user-image\">\r\n                            <img class=\"img-circle elevation-2\" src=\"../../Util/Img/marca/623f8300734c0-623f8300734c3.jpg\" alt=\"imagen solicitud\">\r\n                        </div>\r\n                        <div class=\"card-footer\">\r\n                            <div class=\"row\">\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Solicitud marca creado por:</h5>\r\n                                        <span class=\"description-text\">Natalia Elvira Oduber</span>\r\n                                    </div>\r\n                                </div>\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Mensaje:</h5>\r\n                                        <span class=\"description-text\">Hola usuario administrador Julio Cesar revise mi solicitud marca,  si es que los datos son correctos por favor apruebelo, si no indiqueme los errores para corregirla y enviarsela</span>\r\n                                    </div>\r\n                                </div>\r\n                            </div>\r\n                        </div>\r\n                    </div>\r\n                    ', 0, 0, 0, 0, 'A', 'A', 'A', 'A', '2022-03-26 18:18:24', '2022-03-26 18:18:24', 7, 4),
(31, 'Usuario administrador tiene usted una solicitud marca para revisar', '\r\n                    <div class=\"card card-widget widget-user\">\r\n                        <div class=\"widget-user-header bg-info\">\r\n                            <h3 class=\"widget-user-username\">prueba8</h3>\r\n                            <h5 class=\"widget-user-desc\">1111111111111</h5>\r\n                        </div>\r\n                        <div class=\"widget-user-image\">\r\n                            <img class=\"img-circle elevation-2\" src=\"../../Util/Img/marca/623f8300734c0-623f8300734c3.jpg\" alt=\"imagen solicitud\">\r\n                        </div>\r\n                        <div class=\"card-footer\">\r\n                            <div class=\"row\">\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Solicitud marca creado por:</h5>\r\n                                        <span class=\"description-text\">Natalia Elvira Oduber</span>\r\n                                    </div>\r\n                                </div>\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Mensaje:</h5>\r\n                                        <span class=\"description-text\">Hola usuario administrador Maximiliano Hoeffler revise mi solicitud marca,  si es que los datos son correctos por favor apruebelo, si no indiqueme los errores para corregirla y enviarsela</span>\r\n                                    </div>\r\n                                </div>\r\n                            </div>\r\n                        </div>\r\n                    </div>\r\n                    ', 0, 0, 0, 0, 'A', 'A', 'A', 'A', '2022-03-26 18:18:24', '2022-03-26 18:18:24', 8, 4);
INSERT INTO `destino` (`id`, `asunto`, `contenido`, `abierto`, `abierto_emisor`, `favorito`, `favorito_emisor`, `estado`, `estado_perm`, `estado_emisor`, `estado_emisor_perm`, `fecha_creacion`, `fecha_edicion`, `id_usuario`, `id_mensaje`) VALUES
(32, 'Usuario administrador tiene usted una solicitud marca para revisar', '\r\n                    <div class=\"card card-widget widget-user\">\r\n                        <div class=\"widget-user-header bg-info\">\r\n                            <h3 class=\"widget-user-username\">prueba8</h3>\r\n                            <h5 class=\"widget-user-desc\">1111111111111</h5>\r\n                        </div>\r\n                        <div class=\"widget-user-image\">\r\n                            <img class=\"img-circle elevation-2\" src=\"../../Util/Img/marca/623f8300734c0-623f8300734c3.jpg\" alt=\"imagen solicitud\">\r\n                        </div>\r\n                        <div class=\"card-footer\">\r\n                            <div class=\"row\">\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Solicitud marca creado por:</h5>\r\n                                        <span class=\"description-text\">Natalia Elvira Oduber</span>\r\n                                    </div>\r\n                                </div>\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Mensaje:</h5>\r\n                                        <span class=\"description-text\">Hola usuario administrador Victoria Gallo revise mi solicitud marca,  si es que los datos son correctos por favor apruebelo, si no indiqueme los errores para corregirla y enviarsela</span>\r\n                                    </div>\r\n                                </div>\r\n                            </div>\r\n                        </div>\r\n                    </div>\r\n                    ', 0, 0, 0, 0, 'A', 'A', 'A', 'A', '2022-03-26 18:18:24', '2022-03-26 18:18:24', 9, 4),
(33, 'Usuario administrador tiene usted una solicitud marca para revisar', '\r\n                    <div class=\"card card-widget widget-user\">\r\n                        <div class=\"widget-user-header bg-info\">\r\n                            <h3 class=\"widget-user-username\">prueba7</h3>\r\n                            <h5 class=\"widget-user-desc\">sdfsdfsdf</h5>\r\n                        </div>\r\n                        <div class=\"widget-user-image\">\r\n                            <img class=\"img-circle elevation-2\" src=\"../../Util/Img/marca/623f82f23ee49-623f82f23ee50.jpg\" alt=\"imagen solicitud\">\r\n                        </div>\r\n                        <div class=\"card-footer\">\r\n                            <div class=\"row\">\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Solicitud marca creado por:</h5>\r\n                                        <span class=\"description-text\">Natalia Elvira Oduber</span>\r\n                                    </div>\r\n                                </div>\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Mensaje:</h5>\r\n                                        <span class=\"description-text\">Hola usuario administrador Pablo Martin Morrone revise mi solicitud marca,  si es que los datos son correctos por favor apruebelo, si no indiqueme los errores para corregirla y enviarsela</span>\r\n                                    </div>\r\n                                </div>\r\n                            </div>\r\n                        </div>\r\n                    </div>\r\n                    ', 1, 0, 1, 0, 'I', 'A', 'A', 'A', '2022-03-26 18:18:25', '2022-04-17 15:23:23', 2, 5),
(34, 'Usuario administrador tiene usted una solicitud marca para revisar', '\r\n                    <div class=\"card card-widget widget-user\">\r\n                        <div class=\"widget-user-header bg-info\">\r\n                            <h3 class=\"widget-user-username\">prueba7</h3>\r\n                            <h5 class=\"widget-user-desc\">sdfsdfsdf</h5>\r\n                        </div>\r\n                        <div class=\"widget-user-image\">\r\n                            <img class=\"img-circle elevation-2\" src=\"../../Util/Img/marca/623f82f23ee49-623f82f23ee50.jpg\" alt=\"imagen solicitud\">\r\n                        </div>\r\n                        <div class=\"card-footer\">\r\n                            <div class=\"row\">\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Solicitud marca creado por:</h5>\r\n                                        <span class=\"description-text\">Natalia Elvira Oduber</span>\r\n                                    </div>\r\n                                </div>\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Mensaje:</h5>\r\n                                        <span class=\"description-text\">Hola usuario administrador Juan Cosme revise mi solicitud marca,  si es que los datos son correctos por favor apruebelo, si no indiqueme los errores para corregirla y enviarsela</span>\r\n                                    </div>\r\n                                </div>\r\n                            </div>\r\n                        </div>\r\n                    </div>\r\n                    ', 0, 0, 0, 0, 'A', 'A', 'A', 'A', '2022-03-26 18:18:25', '2022-03-26 18:18:25', 3, 5),
(35, 'Usuario administrador tiene usted una solicitud marca para revisar', '\r\n                    <div class=\"card card-widget widget-user\">\r\n                        <div class=\"widget-user-header bg-info\">\r\n                            <h3 class=\"widget-user-username\">prueba7</h3>\r\n                            <h5 class=\"widget-user-desc\">sdfsdfsdf</h5>\r\n                        </div>\r\n                        <div class=\"widget-user-image\">\r\n                            <img class=\"img-circle elevation-2\" src=\"../../Util/Img/marca/623f82f23ee49-623f82f23ee50.jpg\" alt=\"imagen solicitud\">\r\n                        </div>\r\n                        <div class=\"card-footer\">\r\n                            <div class=\"row\">\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Solicitud marca creado por:</h5>\r\n                                        <span class=\"description-text\">Natalia Elvira Oduber</span>\r\n                                    </div>\r\n                                </div>\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Mensaje:</h5>\r\n                                        <span class=\"description-text\">Hola usuario administrador juan diego revise mi solicitud marca,  si es que los datos son correctos por favor apruebelo, si no indiqueme los errores para corregirla y enviarsela</span>\r\n                                    </div>\r\n                                </div>\r\n                            </div>\r\n                        </div>\r\n                    </div>\r\n                    ', 0, 0, 0, 0, 'A', 'A', 'A', 'A', '2022-03-26 18:18:25', '2022-03-26 18:18:25', 4, 5),
(36, 'Usuario administrador tiene usted una solicitud marca para revisar', '\r\n                    <div class=\"card card-widget widget-user\">\r\n                        <div class=\"widget-user-header bg-info\">\r\n                            <h3 class=\"widget-user-username\">prueba7</h3>\r\n                            <h5 class=\"widget-user-desc\">sdfsdfsdf</h5>\r\n                        </div>\r\n                        <div class=\"widget-user-image\">\r\n                            <img class=\"img-circle elevation-2\" src=\"../../Util/Img/marca/623f82f23ee49-623f82f23ee50.jpg\" alt=\"imagen solicitud\">\r\n                        </div>\r\n                        <div class=\"card-footer\">\r\n                            <div class=\"row\">\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Solicitud marca creado por:</h5>\r\n                                        <span class=\"description-text\">Natalia Elvira Oduber</span>\r\n                                    </div>\r\n                                </div>\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Mensaje:</h5>\r\n                                        <span class=\"description-text\">Hola usuario administrador Martin Trinidad revise mi solicitud marca,  si es que los datos son correctos por favor apruebelo, si no indiqueme los errores para corregirla y enviarsela</span>\r\n                                    </div>\r\n                                </div>\r\n                            </div>\r\n                        </div>\r\n                    </div>\r\n                    ', 0, 0, 0, 0, 'A', 'A', 'A', 'A', '2022-03-26 18:18:25', '2022-03-26 18:18:25', 5, 5),
(37, 'Usuario administrador tiene usted una solicitud marca para revisar', '\r\n                    <div class=\"card card-widget widget-user\">\r\n                        <div class=\"widget-user-header bg-info\">\r\n                            <h3 class=\"widget-user-username\">prueba7</h3>\r\n                            <h5 class=\"widget-user-desc\">sdfsdfsdf</h5>\r\n                        </div>\r\n                        <div class=\"widget-user-image\">\r\n                            <img class=\"img-circle elevation-2\" src=\"../../Util/Img/marca/623f82f23ee49-623f82f23ee50.jpg\" alt=\"imagen solicitud\">\r\n                        </div>\r\n                        <div class=\"card-footer\">\r\n                            <div class=\"row\">\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Solicitud marca creado por:</h5>\r\n                                        <span class=\"description-text\">Natalia Elvira Oduber</span>\r\n                                    </div>\r\n                                </div>\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Mensaje:</h5>\r\n                                        <span class=\"description-text\">Hola usuario administrador Pedro Alfonzo revise mi solicitud marca,  si es que los datos son correctos por favor apruebelo, si no indiqueme los errores para corregirla y enviarsela</span>\r\n                                    </div>\r\n                                </div>\r\n                            </div>\r\n                        </div>\r\n                    </div>\r\n                    ', 0, 0, 0, 0, 'A', 'A', 'A', 'A', '2022-03-26 18:18:25', '2022-03-26 18:18:25', 6, 5),
(38, 'Usuario administrador tiene usted una solicitud marca para revisar', '\r\n                    <div class=\"card card-widget widget-user\">\r\n                        <div class=\"widget-user-header bg-info\">\r\n                            <h3 class=\"widget-user-username\">prueba7</h3>\r\n                            <h5 class=\"widget-user-desc\">sdfsdfsdf</h5>\r\n                        </div>\r\n                        <div class=\"widget-user-image\">\r\n                            <img class=\"img-circle elevation-2\" src=\"../../Util/Img/marca/623f82f23ee49-623f82f23ee50.jpg\" alt=\"imagen solicitud\">\r\n                        </div>\r\n                        <div class=\"card-footer\">\r\n                            <div class=\"row\">\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Solicitud marca creado por:</h5>\r\n                                        <span class=\"description-text\">Natalia Elvira Oduber</span>\r\n                                    </div>\r\n                                </div>\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Mensaje:</h5>\r\n                                        <span class=\"description-text\">Hola usuario administrador Julio Cesar revise mi solicitud marca,  si es que los datos son correctos por favor apruebelo, si no indiqueme los errores para corregirla y enviarsela</span>\r\n                                    </div>\r\n                                </div>\r\n                            </div>\r\n                        </div>\r\n                    </div>\r\n                    ', 0, 0, 0, 0, 'A', 'A', 'A', 'A', '2022-03-26 18:18:25', '2022-03-26 18:18:25', 7, 5),
(39, 'Usuario administrador tiene usted una solicitud marca para revisar', '\r\n                    <div class=\"card card-widget widget-user\">\r\n                        <div class=\"widget-user-header bg-info\">\r\n                            <h3 class=\"widget-user-username\">prueba7</h3>\r\n                            <h5 class=\"widget-user-desc\">sdfsdfsdf</h5>\r\n                        </div>\r\n                        <div class=\"widget-user-image\">\r\n                            <img class=\"img-circle elevation-2\" src=\"../../Util/Img/marca/623f82f23ee49-623f82f23ee50.jpg\" alt=\"imagen solicitud\">\r\n                        </div>\r\n                        <div class=\"card-footer\">\r\n                            <div class=\"row\">\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Solicitud marca creado por:</h5>\r\n                                        <span class=\"description-text\">Natalia Elvira Oduber</span>\r\n                                    </div>\r\n                                </div>\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Mensaje:</h5>\r\n                                        <span class=\"description-text\">Hola usuario administrador Maximiliano Hoeffler revise mi solicitud marca,  si es que los datos son correctos por favor apruebelo, si no indiqueme los errores para corregirla y enviarsela</span>\r\n                                    </div>\r\n                                </div>\r\n                            </div>\r\n                        </div>\r\n                    </div>\r\n                    ', 0, 0, 0, 0, 'A', 'A', 'A', 'A', '2022-03-26 18:18:25', '2022-03-26 18:18:25', 8, 5),
(40, 'Usuario administrador tiene usted una solicitud marca para revisar', '\r\n                    <div class=\"card card-widget widget-user\">\r\n                        <div class=\"widget-user-header bg-info\">\r\n                            <h3 class=\"widget-user-username\">prueba7</h3>\r\n                            <h5 class=\"widget-user-desc\">sdfsdfsdf</h5>\r\n                        </div>\r\n                        <div class=\"widget-user-image\">\r\n                            <img class=\"img-circle elevation-2\" src=\"../../Util/Img/marca/623f82f23ee49-623f82f23ee50.jpg\" alt=\"imagen solicitud\">\r\n                        </div>\r\n                        <div class=\"card-footer\">\r\n                            <div class=\"row\">\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Solicitud marca creado por:</h5>\r\n                                        <span class=\"description-text\">Natalia Elvira Oduber</span>\r\n                                    </div>\r\n                                </div>\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Mensaje:</h5>\r\n                                        <span class=\"description-text\">Hola usuario administrador Victoria Gallo revise mi solicitud marca,  si es que los datos son correctos por favor apruebelo, si no indiqueme los errores para corregirla y enviarsela</span>\r\n                                    </div>\r\n                                </div>\r\n                            </div>\r\n                        </div>\r\n                    </div>\r\n                    ', 0, 0, 0, 0, 'A', 'A', 'A', 'A', '2022-03-26 18:18:25', '2022-03-26 18:18:25', 9, 5),
(42, 'Usuario administrador tiene usted una solicitud marca para revisar', '\r\n                    <div class=\"card card-widget widget-user\">\r\n                        <div class=\"widget-user-header bg-info\">\r\n                            <h3 class=\"widget-user-username\">prueba6</h3>\r\n                            <h5 class=\"widget-user-desc\">Calzado Deportivo</h5>\r\n                        </div>\r\n                        <div class=\"widget-user-image\">\r\n                            <img class=\"img-circle elevation-2\" src=\"../../Util/Img/marca/623f82d286e32-623f82d286e38.png\" alt=\"imagen solicitud\">\r\n                        </div>\r\n                        <div class=\"card-footer\">\r\n                            <div class=\"row\">\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Solicitud marca creado por:</h5>\r\n                                        <span class=\"description-text\">Natalia Elvira Oduber</span>\r\n                                    </div>\r\n                                </div>\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Mensaje:</h5>\r\n                                        <span class=\"description-text\">Hola usuario administrador Juan Cosme revise mi solicitud marca,  si es que los datos son correctos por favor apruebelo, si no indiqueme los errores para corregirla y enviarsela</span>\r\n                                    </div>\r\n                                </div>\r\n                            </div>\r\n                        </div>\r\n                    </div>\r\n                    ', 0, 0, 0, 0, 'A', 'A', 'A', 'A', '2022-03-26 18:18:26', '2022-03-26 18:18:26', 3, 6),
(43, 'Usuario administrador tiene usted una solicitud marca para revisar', '\r\n                    <div class=\"card card-widget widget-user\">\r\n                        <div class=\"widget-user-header bg-info\">\r\n                            <h3 class=\"widget-user-username\">prueba6</h3>\r\n                            <h5 class=\"widget-user-desc\">Calzado Deportivo</h5>\r\n                        </div>\r\n                        <div class=\"widget-user-image\">\r\n                            <img class=\"img-circle elevation-2\" src=\"../../Util/Img/marca/623f82d286e32-623f82d286e38.png\" alt=\"imagen solicitud\">\r\n                        </div>\r\n                        <div class=\"card-footer\">\r\n                            <div class=\"row\">\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Solicitud marca creado por:</h5>\r\n                                        <span class=\"description-text\">Natalia Elvira Oduber</span>\r\n                                    </div>\r\n                                </div>\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Mensaje:</h5>\r\n                                        <span class=\"description-text\">Hola usuario administrador juan diego revise mi solicitud marca,  si es que los datos son correctos por favor apruebelo, si no indiqueme los errores para corregirla y enviarsela</span>\r\n                                    </div>\r\n                                </div>\r\n                            </div>\r\n                        </div>\r\n                    </div>\r\n                    ', 0, 0, 0, 0, 'A', 'A', 'A', 'A', '2022-03-26 18:18:26', '2022-03-26 18:18:26', 4, 6),
(44, 'Usuario administrador tiene usted una solicitud marca para revisar', '\r\n                    <div class=\"card card-widget widget-user\">\r\n                        <div class=\"widget-user-header bg-info\">\r\n                            <h3 class=\"widget-user-username\">prueba6</h3>\r\n                            <h5 class=\"widget-user-desc\">Calzado Deportivo</h5>\r\n                        </div>\r\n                        <div class=\"widget-user-image\">\r\n                            <img class=\"img-circle elevation-2\" src=\"../../Util/Img/marca/623f82d286e32-623f82d286e38.png\" alt=\"imagen solicitud\">\r\n                        </div>\r\n                        <div class=\"card-footer\">\r\n                            <div class=\"row\">\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Solicitud marca creado por:</h5>\r\n                                        <span class=\"description-text\">Natalia Elvira Oduber</span>\r\n                                    </div>\r\n                                </div>\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Mensaje:</h5>\r\n                                        <span class=\"description-text\">Hola usuario administrador Martin Trinidad revise mi solicitud marca,  si es que los datos son correctos por favor apruebelo, si no indiqueme los errores para corregirla y enviarsela</span>\r\n                                    </div>\r\n                                </div>\r\n                            </div>\r\n                        </div>\r\n                    </div>\r\n                    ', 0, 0, 0, 0, 'A', 'A', 'A', 'A', '2022-03-26 18:18:26', '2022-03-26 18:18:26', 5, 6),
(45, 'Usuario administrador tiene usted una solicitud marca para revisar', '\r\n                    <div class=\"card card-widget widget-user\">\r\n                        <div class=\"widget-user-header bg-info\">\r\n                            <h3 class=\"widget-user-username\">prueba6</h3>\r\n                            <h5 class=\"widget-user-desc\">Calzado Deportivo</h5>\r\n                        </div>\r\n                        <div class=\"widget-user-image\">\r\n                            <img class=\"img-circle elevation-2\" src=\"../../Util/Img/marca/623f82d286e32-623f82d286e38.png\" alt=\"imagen solicitud\">\r\n                        </div>\r\n                        <div class=\"card-footer\">\r\n                            <div class=\"row\">\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Solicitud marca creado por:</h5>\r\n                                        <span class=\"description-text\">Natalia Elvira Oduber</span>\r\n                                    </div>\r\n                                </div>\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Mensaje:</h5>\r\n                                        <span class=\"description-text\">Hola usuario administrador Pedro Alfonzo revise mi solicitud marca,  si es que los datos son correctos por favor apruebelo, si no indiqueme los errores para corregirla y enviarsela</span>\r\n                                    </div>\r\n                                </div>\r\n                            </div>\r\n                        </div>\r\n                    </div>\r\n                    ', 0, 0, 0, 0, 'A', 'A', 'A', 'A', '2022-03-26 18:18:26', '2022-03-26 18:18:26', 6, 6),
(46, 'Usuario administrador tiene usted una solicitud marca para revisar', '\r\n                    <div class=\"card card-widget widget-user\">\r\n                        <div class=\"widget-user-header bg-info\">\r\n                            <h3 class=\"widget-user-username\">prueba6</h3>\r\n                            <h5 class=\"widget-user-desc\">Calzado Deportivo</h5>\r\n                        </div>\r\n                        <div class=\"widget-user-image\">\r\n                            <img class=\"img-circle elevation-2\" src=\"../../Util/Img/marca/623f82d286e32-623f82d286e38.png\" alt=\"imagen solicitud\">\r\n                        </div>\r\n                        <div class=\"card-footer\">\r\n                            <div class=\"row\">\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Solicitud marca creado por:</h5>\r\n                                        <span class=\"description-text\">Natalia Elvira Oduber</span>\r\n                                    </div>\r\n                                </div>\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Mensaje:</h5>\r\n                                        <span class=\"description-text\">Hola usuario administrador Julio Cesar revise mi solicitud marca,  si es que los datos son correctos por favor apruebelo, si no indiqueme los errores para corregirla y enviarsela</span>\r\n                                    </div>\r\n                                </div>\r\n                            </div>\r\n                        </div>\r\n                    </div>\r\n                    ', 0, 0, 0, 0, 'A', 'A', 'A', 'A', '2022-03-26 18:18:26', '2022-03-26 18:18:26', 7, 6),
(47, 'Usuario administrador tiene usted una solicitud marca para revisar', '\r\n                    <div class=\"card card-widget widget-user\">\r\n                        <div class=\"widget-user-header bg-info\">\r\n                            <h3 class=\"widget-user-username\">prueba6</h3>\r\n                            <h5 class=\"widget-user-desc\">Calzado Deportivo</h5>\r\n                        </div>\r\n                        <div class=\"widget-user-image\">\r\n                            <img class=\"img-circle elevation-2\" src=\"../../Util/Img/marca/623f82d286e32-623f82d286e38.png\" alt=\"imagen solicitud\">\r\n                        </div>\r\n                        <div class=\"card-footer\">\r\n                            <div class=\"row\">\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Solicitud marca creado por:</h5>\r\n                                        <span class=\"description-text\">Natalia Elvira Oduber</span>\r\n                                    </div>\r\n                                </div>\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Mensaje:</h5>\r\n                                        <span class=\"description-text\">Hola usuario administrador Maximiliano Hoeffler revise mi solicitud marca,  si es que los datos son correctos por favor apruebelo, si no indiqueme los errores para corregirla y enviarsela</span>\r\n                                    </div>\r\n                                </div>\r\n                            </div>\r\n                        </div>\r\n                    </div>\r\n                    ', 0, 0, 0, 0, 'A', 'A', 'A', 'A', '2022-03-26 18:18:26', '2022-03-26 18:18:26', 8, 6),
(48, 'Usuario administrador tiene usted una solicitud marca para revisar', '\r\n                    <div class=\"card card-widget widget-user\">\r\n                        <div class=\"widget-user-header bg-info\">\r\n                            <h3 class=\"widget-user-username\">prueba6</h3>\r\n                            <h5 class=\"widget-user-desc\">Calzado Deportivo</h5>\r\n                        </div>\r\n                        <div class=\"widget-user-image\">\r\n                            <img class=\"img-circle elevation-2\" src=\"../../Util/Img/marca/623f82d286e32-623f82d286e38.png\" alt=\"imagen solicitud\">\r\n                        </div>\r\n                        <div class=\"card-footer\">\r\n                            <div class=\"row\">\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Solicitud marca creado por:</h5>\r\n                                        <span class=\"description-text\">Natalia Elvira Oduber</span>\r\n                                    </div>\r\n                                </div>\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Mensaje:</h5>\r\n                                        <span class=\"description-text\">Hola usuario administrador Victoria Gallo revise mi solicitud marca,  si es que los datos son correctos por favor apruebelo, si no indiqueme los errores para corregirla y enviarsela</span>\r\n                                    </div>\r\n                                </div>\r\n                            </div>\r\n                        </div>\r\n                    </div>\r\n                    ', 0, 0, 0, 0, 'A', 'A', 'A', 'A', '2022-03-26 18:18:26', '2022-03-26 18:18:26', 9, 6),
(50, 'Usuario administrador tiene usted una solicitud marca para revisar', '\r\n                    <div class=\"card card-widget widget-user\">\r\n                        <div class=\"widget-user-header bg-info\">\r\n                            <h3 class=\"widget-user-username\">prueba5</h3>\r\n                            <h5 class=\"widget-user-desc\">fsddfsdfsd</h5>\r\n                        </div>\r\n                        <div class=\"widget-user-image\">\r\n                            <img class=\"img-circle elevation-2\" src=\"../../Util/Img/marca/623f82ba82603-623f82ba82607.png\" alt=\"imagen solicitud\">\r\n                        </div>\r\n                        <div class=\"card-footer\">\r\n                            <div class=\"row\">\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Solicitud marca creado por:</h5>\r\n                                        <span class=\"description-text\">Natalia Elvira Oduber</span>\r\n                                    </div>\r\n                                </div>\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Mensaje:</h5>\r\n                                        <span class=\"description-text\">Hola usuario administrador Juan Cosme revise mi solicitud marca,  si es que los datos son correctos por favor apruebelo, si no indiqueme los errores para corregirla y enviarsela</span>\r\n                                    </div>\r\n                                </div>\r\n                            </div>\r\n                        </div>\r\n                    </div>\r\n                    ', 0, 0, 0, 0, 'A', 'A', 'A', 'A', '2022-03-26 18:18:27', '2022-03-26 18:18:27', 3, 7),
(51, 'Usuario administrador tiene usted una solicitud marca para revisar', '\r\n                    <div class=\"card card-widget widget-user\">\r\n                        <div class=\"widget-user-header bg-info\">\r\n                            <h3 class=\"widget-user-username\">prueba5</h3>\r\n                            <h5 class=\"widget-user-desc\">fsddfsdfsd</h5>\r\n                        </div>\r\n                        <div class=\"widget-user-image\">\r\n                            <img class=\"img-circle elevation-2\" src=\"../../Util/Img/marca/623f82ba82603-623f82ba82607.png\" alt=\"imagen solicitud\">\r\n                        </div>\r\n                        <div class=\"card-footer\">\r\n                            <div class=\"row\">\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Solicitud marca creado por:</h5>\r\n                                        <span class=\"description-text\">Natalia Elvira Oduber</span>\r\n                                    </div>\r\n                                </div>\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Mensaje:</h5>\r\n                                        <span class=\"description-text\">Hola usuario administrador juan diego revise mi solicitud marca,  si es que los datos son correctos por favor apruebelo, si no indiqueme los errores para corregirla y enviarsela</span>\r\n                                    </div>\r\n                                </div>\r\n                            </div>\r\n                        </div>\r\n                    </div>\r\n                    ', 0, 0, 0, 0, 'A', 'A', 'A', 'A', '2022-03-26 18:18:27', '2022-03-26 18:18:27', 4, 7),
(52, 'Usuario administrador tiene usted una solicitud marca para revisar', '\r\n                    <div class=\"card card-widget widget-user\">\r\n                        <div class=\"widget-user-header bg-info\">\r\n                            <h3 class=\"widget-user-username\">prueba5</h3>\r\n                            <h5 class=\"widget-user-desc\">fsddfsdfsd</h5>\r\n                        </div>\r\n                        <div class=\"widget-user-image\">\r\n                            <img class=\"img-circle elevation-2\" src=\"../../Util/Img/marca/623f82ba82603-623f82ba82607.png\" alt=\"imagen solicitud\">\r\n                        </div>\r\n                        <div class=\"card-footer\">\r\n                            <div class=\"row\">\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Solicitud marca creado por:</h5>\r\n                                        <span class=\"description-text\">Natalia Elvira Oduber</span>\r\n                                    </div>\r\n                                </div>\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Mensaje:</h5>\r\n                                        <span class=\"description-text\">Hola usuario administrador Martin Trinidad revise mi solicitud marca,  si es que los datos son correctos por favor apruebelo, si no indiqueme los errores para corregirla y enviarsela</span>\r\n                                    </div>\r\n                                </div>\r\n                            </div>\r\n                        </div>\r\n                    </div>\r\n                    ', 0, 0, 0, 0, 'A', 'A', 'A', 'A', '2022-03-26 18:18:27', '2022-03-26 18:18:27', 5, 7),
(53, 'Usuario administrador tiene usted una solicitud marca para revisar', '\r\n                    <div class=\"card card-widget widget-user\">\r\n                        <div class=\"widget-user-header bg-info\">\r\n                            <h3 class=\"widget-user-username\">prueba5</h3>\r\n                            <h5 class=\"widget-user-desc\">fsddfsdfsd</h5>\r\n                        </div>\r\n                        <div class=\"widget-user-image\">\r\n                            <img class=\"img-circle elevation-2\" src=\"../../Util/Img/marca/623f82ba82603-623f82ba82607.png\" alt=\"imagen solicitud\">\r\n                        </div>\r\n                        <div class=\"card-footer\">\r\n                            <div class=\"row\">\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Solicitud marca creado por:</h5>\r\n                                        <span class=\"description-text\">Natalia Elvira Oduber</span>\r\n                                    </div>\r\n                                </div>\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Mensaje:</h5>\r\n                                        <span class=\"description-text\">Hola usuario administrador Pedro Alfonzo revise mi solicitud marca,  si es que los datos son correctos por favor apruebelo, si no indiqueme los errores para corregirla y enviarsela</span>\r\n                                    </div>\r\n                                </div>\r\n                            </div>\r\n                        </div>\r\n                    </div>\r\n                    ', 0, 0, 0, 0, 'A', 'A', 'A', 'A', '2022-03-26 18:18:27', '2022-03-26 18:18:27', 6, 7),
(54, 'Usuario administrador tiene usted una solicitud marca para revisar', '\r\n                    <div class=\"card card-widget widget-user\">\r\n                        <div class=\"widget-user-header bg-info\">\r\n                            <h3 class=\"widget-user-username\">prueba5</h3>\r\n                            <h5 class=\"widget-user-desc\">fsddfsdfsd</h5>\r\n                        </div>\r\n                        <div class=\"widget-user-image\">\r\n                            <img class=\"img-circle elevation-2\" src=\"../../Util/Img/marca/623f82ba82603-623f82ba82607.png\" alt=\"imagen solicitud\">\r\n                        </div>\r\n                        <div class=\"card-footer\">\r\n                            <div class=\"row\">\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Solicitud marca creado por:</h5>\r\n                                        <span class=\"description-text\">Natalia Elvira Oduber</span>\r\n                                    </div>\r\n                                </div>\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Mensaje:</h5>\r\n                                        <span class=\"description-text\">Hola usuario administrador Julio Cesar revise mi solicitud marca,  si es que los datos son correctos por favor apruebelo, si no indiqueme los errores para corregirla y enviarsela</span>\r\n                                    </div>\r\n                                </div>\r\n                            </div>\r\n                        </div>\r\n                    </div>\r\n                    ', 0, 0, 0, 0, 'A', 'A', 'A', 'A', '2022-03-26 18:18:27', '2022-03-26 18:18:27', 7, 7),
(55, 'Usuario administrador tiene usted una solicitud marca para revisar', '\r\n                    <div class=\"card card-widget widget-user\">\r\n                        <div class=\"widget-user-header bg-info\">\r\n                            <h3 class=\"widget-user-username\">prueba5</h3>\r\n                            <h5 class=\"widget-user-desc\">fsddfsdfsd</h5>\r\n                        </div>\r\n                        <div class=\"widget-user-image\">\r\n                            <img class=\"img-circle elevation-2\" src=\"../../Util/Img/marca/623f82ba82603-623f82ba82607.png\" alt=\"imagen solicitud\">\r\n                        </div>\r\n                        <div class=\"card-footer\">\r\n                            <div class=\"row\">\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Solicitud marca creado por:</h5>\r\n                                        <span class=\"description-text\">Natalia Elvira Oduber</span>\r\n                                    </div>\r\n                                </div>\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Mensaje:</h5>\r\n                                        <span class=\"description-text\">Hola usuario administrador Maximiliano Hoeffler revise mi solicitud marca,  si es que los datos son correctos por favor apruebelo, si no indiqueme los errores para corregirla y enviarsela</span>\r\n                                    </div>\r\n                                </div>\r\n                            </div>\r\n                        </div>\r\n                    </div>\r\n                    ', 0, 0, 0, 0, 'A', 'A', 'A', 'A', '2022-03-26 18:18:27', '2022-03-26 18:18:27', 8, 7),
(56, 'Usuario administrador tiene usted una solicitud marca para revisar', '\r\n                    <div class=\"card card-widget widget-user\">\r\n                        <div class=\"widget-user-header bg-info\">\r\n                            <h3 class=\"widget-user-username\">prueba5</h3>\r\n                            <h5 class=\"widget-user-desc\">fsddfsdfsd</h5>\r\n                        </div>\r\n                        <div class=\"widget-user-image\">\r\n                            <img class=\"img-circle elevation-2\" src=\"../../Util/Img/marca/623f82ba82603-623f82ba82607.png\" alt=\"imagen solicitud\">\r\n                        </div>\r\n                        <div class=\"card-footer\">\r\n                            <div class=\"row\">\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Solicitud marca creado por:</h5>\r\n                                        <span class=\"description-text\">Natalia Elvira Oduber</span>\r\n                                    </div>\r\n                                </div>\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Mensaje:</h5>\r\n                                        <span class=\"description-text\">Hola usuario administrador Victoria Gallo revise mi solicitud marca,  si es que los datos son correctos por favor apruebelo, si no indiqueme los errores para corregirla y enviarsela</span>\r\n                                    </div>\r\n                                </div>\r\n                            </div>\r\n                        </div>\r\n                    </div>\r\n                    ', 0, 0, 0, 0, 'A', 'A', 'A', 'A', '2022-03-26 18:18:27', '2022-03-26 18:18:27', 9, 7),
(58, 'Usuario administrador tiene usted una solicitud marca para revisar', '\r\n                    <div class=\"card card-widget widget-user\">\r\n                        <div class=\"widget-user-header bg-info\">\r\n                            <h3 class=\"widget-user-username\">prueba4</h3>\r\n                            <h5 class=\"widget-user-desc\">aaaaa</h5>\r\n                        </div>\r\n                        <div class=\"widget-user-image\">\r\n                            <img class=\"img-circle elevation-2\" src=\"../../Util/Img/marca/623f82a627882-623f82a627887.png\" alt=\"imagen solicitud\">\r\n                        </div>\r\n                        <div class=\"card-footer\">\r\n                            <div class=\"row\">\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Solicitud marca creado por:</h5>\r\n                                        <span class=\"description-text\">Natalia Elvira Oduber</span>\r\n                                    </div>\r\n                                </div>\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Mensaje:</h5>\r\n                                        <span class=\"description-text\">Hola usuario administrador Juan Cosme revise mi solicitud marca,  si es que los datos son correctos por favor apruebelo, si no indiqueme los errores para corregirla y enviarsela</span>\r\n                                    </div>\r\n                                </div>\r\n                            </div>\r\n                        </div>\r\n                    </div>\r\n                    ', 0, 0, 0, 0, 'A', 'A', 'A', 'A', '2022-03-26 18:18:29', '2022-03-26 18:18:29', 3, 8);
INSERT INTO `destino` (`id`, `asunto`, `contenido`, `abierto`, `abierto_emisor`, `favorito`, `favorito_emisor`, `estado`, `estado_perm`, `estado_emisor`, `estado_emisor_perm`, `fecha_creacion`, `fecha_edicion`, `id_usuario`, `id_mensaje`) VALUES
(59, 'Usuario administrador tiene usted una solicitud marca para revisar', '\r\n                    <div class=\"card card-widget widget-user\">\r\n                        <div class=\"widget-user-header bg-info\">\r\n                            <h3 class=\"widget-user-username\">prueba4</h3>\r\n                            <h5 class=\"widget-user-desc\">aaaaa</h5>\r\n                        </div>\r\n                        <div class=\"widget-user-image\">\r\n                            <img class=\"img-circle elevation-2\" src=\"../../Util/Img/marca/623f82a627882-623f82a627887.png\" alt=\"imagen solicitud\">\r\n                        </div>\r\n                        <div class=\"card-footer\">\r\n                            <div class=\"row\">\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Solicitud marca creado por:</h5>\r\n                                        <span class=\"description-text\">Natalia Elvira Oduber</span>\r\n                                    </div>\r\n                                </div>\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Mensaje:</h5>\r\n                                        <span class=\"description-text\">Hola usuario administrador juan diego revise mi solicitud marca,  si es que los datos son correctos por favor apruebelo, si no indiqueme los errores para corregirla y enviarsela</span>\r\n                                    </div>\r\n                                </div>\r\n                            </div>\r\n                        </div>\r\n                    </div>\r\n                    ', 0, 0, 0, 0, 'A', 'A', 'A', 'A', '2022-03-26 18:18:29', '2022-03-26 18:18:29', 4, 8),
(60, 'Usuario administrador tiene usted una solicitud marca para revisar', '\r\n                    <div class=\"card card-widget widget-user\">\r\n                        <div class=\"widget-user-header bg-info\">\r\n                            <h3 class=\"widget-user-username\">prueba4</h3>\r\n                            <h5 class=\"widget-user-desc\">aaaaa</h5>\r\n                        </div>\r\n                        <div class=\"widget-user-image\">\r\n                            <img class=\"img-circle elevation-2\" src=\"../../Util/Img/marca/623f82a627882-623f82a627887.png\" alt=\"imagen solicitud\">\r\n                        </div>\r\n                        <div class=\"card-footer\">\r\n                            <div class=\"row\">\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Solicitud marca creado por:</h5>\r\n                                        <span class=\"description-text\">Natalia Elvira Oduber</span>\r\n                                    </div>\r\n                                </div>\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Mensaje:</h5>\r\n                                        <span class=\"description-text\">Hola usuario administrador Martin Trinidad revise mi solicitud marca,  si es que los datos son correctos por favor apruebelo, si no indiqueme los errores para corregirla y enviarsela</span>\r\n                                    </div>\r\n                                </div>\r\n                            </div>\r\n                        </div>\r\n                    </div>\r\n                    ', 0, 0, 0, 0, 'A', 'A', 'A', 'A', '2022-03-26 18:18:29', '2022-03-26 18:18:29', 5, 8),
(61, 'Usuario administrador tiene usted una solicitud marca para revisar', '\r\n                    <div class=\"card card-widget widget-user\">\r\n                        <div class=\"widget-user-header bg-info\">\r\n                            <h3 class=\"widget-user-username\">prueba4</h3>\r\n                            <h5 class=\"widget-user-desc\">aaaaa</h5>\r\n                        </div>\r\n                        <div class=\"widget-user-image\">\r\n                            <img class=\"img-circle elevation-2\" src=\"../../Util/Img/marca/623f82a627882-623f82a627887.png\" alt=\"imagen solicitud\">\r\n                        </div>\r\n                        <div class=\"card-footer\">\r\n                            <div class=\"row\">\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Solicitud marca creado por:</h5>\r\n                                        <span class=\"description-text\">Natalia Elvira Oduber</span>\r\n                                    </div>\r\n                                </div>\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Mensaje:</h5>\r\n                                        <span class=\"description-text\">Hola usuario administrador Pedro Alfonzo revise mi solicitud marca,  si es que los datos son correctos por favor apruebelo, si no indiqueme los errores para corregirla y enviarsela</span>\r\n                                    </div>\r\n                                </div>\r\n                            </div>\r\n                        </div>\r\n                    </div>\r\n                    ', 0, 0, 0, 0, 'A', 'A', 'A', 'A', '2022-03-26 18:18:29', '2022-03-26 18:18:29', 6, 8),
(62, 'Usuario administrador tiene usted una solicitud marca para revisar', '\r\n                    <div class=\"card card-widget widget-user\">\r\n                        <div class=\"widget-user-header bg-info\">\r\n                            <h3 class=\"widget-user-username\">prueba4</h3>\r\n                            <h5 class=\"widget-user-desc\">aaaaa</h5>\r\n                        </div>\r\n                        <div class=\"widget-user-image\">\r\n                            <img class=\"img-circle elevation-2\" src=\"../../Util/Img/marca/623f82a627882-623f82a627887.png\" alt=\"imagen solicitud\">\r\n                        </div>\r\n                        <div class=\"card-footer\">\r\n                            <div class=\"row\">\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Solicitud marca creado por:</h5>\r\n                                        <span class=\"description-text\">Natalia Elvira Oduber</span>\r\n                                    </div>\r\n                                </div>\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Mensaje:</h5>\r\n                                        <span class=\"description-text\">Hola usuario administrador Julio Cesar revise mi solicitud marca,  si es que los datos son correctos por favor apruebelo, si no indiqueme los errores para corregirla y enviarsela</span>\r\n                                    </div>\r\n                                </div>\r\n                            </div>\r\n                        </div>\r\n                    </div>\r\n                    ', 0, 0, 0, 0, 'A', 'A', 'A', 'A', '2022-03-26 18:18:29', '2022-03-26 18:18:29', 7, 8),
(63, 'Usuario administrador tiene usted una solicitud marca para revisar', '\r\n                    <div class=\"card card-widget widget-user\">\r\n                        <div class=\"widget-user-header bg-info\">\r\n                            <h3 class=\"widget-user-username\">prueba4</h3>\r\n                            <h5 class=\"widget-user-desc\">aaaaa</h5>\r\n                        </div>\r\n                        <div class=\"widget-user-image\">\r\n                            <img class=\"img-circle elevation-2\" src=\"../../Util/Img/marca/623f82a627882-623f82a627887.png\" alt=\"imagen solicitud\">\r\n                        </div>\r\n                        <div class=\"card-footer\">\r\n                            <div class=\"row\">\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Solicitud marca creado por:</h5>\r\n                                        <span class=\"description-text\">Natalia Elvira Oduber</span>\r\n                                    </div>\r\n                                </div>\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Mensaje:</h5>\r\n                                        <span class=\"description-text\">Hola usuario administrador Maximiliano Hoeffler revise mi solicitud marca,  si es que los datos son correctos por favor apruebelo, si no indiqueme los errores para corregirla y enviarsela</span>\r\n                                    </div>\r\n                                </div>\r\n                            </div>\r\n                        </div>\r\n                    </div>\r\n                    ', 0, 0, 0, 0, 'A', 'A', 'A', 'A', '2022-03-26 18:18:29', '2022-03-26 18:18:29', 8, 8),
(64, 'Usuario administrador tiene usted una solicitud marca para revisar', '\r\n                    <div class=\"card card-widget widget-user\">\r\n                        <div class=\"widget-user-header bg-info\">\r\n                            <h3 class=\"widget-user-username\">prueba4</h3>\r\n                            <h5 class=\"widget-user-desc\">aaaaa</h5>\r\n                        </div>\r\n                        <div class=\"widget-user-image\">\r\n                            <img class=\"img-circle elevation-2\" src=\"../../Util/Img/marca/623f82a627882-623f82a627887.png\" alt=\"imagen solicitud\">\r\n                        </div>\r\n                        <div class=\"card-footer\">\r\n                            <div class=\"row\">\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Solicitud marca creado por:</h5>\r\n                                        <span class=\"description-text\">Natalia Elvira Oduber</span>\r\n                                    </div>\r\n                                </div>\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Mensaje:</h5>\r\n                                        <span class=\"description-text\">Hola usuario administrador Victoria Gallo revise mi solicitud marca,  si es que los datos son correctos por favor apruebelo, si no indiqueme los errores para corregirla y enviarsela</span>\r\n                                    </div>\r\n                                </div>\r\n                            </div>\r\n                        </div>\r\n                    </div>\r\n                    ', 0, 0, 0, 0, 'A', 'A', 'A', 'A', '2022-03-26 18:18:29', '2022-03-26 18:18:29', 9, 8),
(65, 'Usuario administrador tiene usted una solicitud marca para revisar', '\r\n                    <div class=\"card card-widget widget-user\">\r\n                        <div class=\"widget-user-header bg-info\">\r\n                            <h3 class=\"widget-user-username\">prueba3</h3>\r\n                            <h5 class=\"widget-user-desc\">qqqqq</h5>\r\n                        </div>\r\n                        <div class=\"widget-user-image\">\r\n                            <img class=\"img-circle elevation-2\" src=\"../../Util/Img/marca/623f8290c0838-623f8290c0839.png\" alt=\"imagen solicitud\">\r\n                        </div>\r\n                        <div class=\"card-footer\">\r\n                            <div class=\"row\">\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Solicitud marca creado por:</h5>\r\n                                        <span class=\"description-text\">Natalia Elvira Oduber</span>\r\n                                    </div>\r\n                                </div>\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Mensaje:</h5>\r\n                                        <span class=\"description-text\">Hola usuario administrador Pablo Martin Morrone revise mi solicitud marca,  si es que los datos son correctos por favor apruebelo, si no indiqueme los errores para corregirla y enviarsela</span>\r\n                                    </div>\r\n                                </div>\r\n                            </div>\r\n                        </div>\r\n                    </div>\r\n                    ', 0, 0, 1, 0, 'I', 'A', 'A', 'A', '2022-03-26 18:18:29', '2022-04-17 15:23:23', 2, 9),
(66, 'Usuario administrador tiene usted una solicitud marca para revisar', '\r\n                    <div class=\"card card-widget widget-user\">\r\n                        <div class=\"widget-user-header bg-info\">\r\n                            <h3 class=\"widget-user-username\">prueba3</h3>\r\n                            <h5 class=\"widget-user-desc\">qqqqq</h5>\r\n                        </div>\r\n                        <div class=\"widget-user-image\">\r\n                            <img class=\"img-circle elevation-2\" src=\"../../Util/Img/marca/623f8290c0838-623f8290c0839.png\" alt=\"imagen solicitud\">\r\n                        </div>\r\n                        <div class=\"card-footer\">\r\n                            <div class=\"row\">\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Solicitud marca creado por:</h5>\r\n                                        <span class=\"description-text\">Natalia Elvira Oduber</span>\r\n                                    </div>\r\n                                </div>\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Mensaje:</h5>\r\n                                        <span class=\"description-text\">Hola usuario administrador Juan Cosme revise mi solicitud marca,  si es que los datos son correctos por favor apruebelo, si no indiqueme los errores para corregirla y enviarsela</span>\r\n                                    </div>\r\n                                </div>\r\n                            </div>\r\n                        </div>\r\n                    </div>\r\n                    ', 0, 0, 0, 0, 'A', 'A', 'A', 'A', '2022-03-26 18:18:29', '2022-03-26 18:18:29', 3, 9),
(67, 'Usuario administrador tiene usted una solicitud marca para revisar', '\r\n                    <div class=\"card card-widget widget-user\">\r\n                        <div class=\"widget-user-header bg-info\">\r\n                            <h3 class=\"widget-user-username\">prueba3</h3>\r\n                            <h5 class=\"widget-user-desc\">qqqqq</h5>\r\n                        </div>\r\n                        <div class=\"widget-user-image\">\r\n                            <img class=\"img-circle elevation-2\" src=\"../../Util/Img/marca/623f8290c0838-623f8290c0839.png\" alt=\"imagen solicitud\">\r\n                        </div>\r\n                        <div class=\"card-footer\">\r\n                            <div class=\"row\">\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Solicitud marca creado por:</h5>\r\n                                        <span class=\"description-text\">Natalia Elvira Oduber</span>\r\n                                    </div>\r\n                                </div>\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Mensaje:</h5>\r\n                                        <span class=\"description-text\">Hola usuario administrador juan diego revise mi solicitud marca,  si es que los datos son correctos por favor apruebelo, si no indiqueme los errores para corregirla y enviarsela</span>\r\n                                    </div>\r\n                                </div>\r\n                            </div>\r\n                        </div>\r\n                    </div>\r\n                    ', 0, 0, 0, 0, 'A', 'A', 'A', 'A', '2022-03-26 18:18:29', '2022-03-26 18:18:29', 4, 9),
(68, 'Usuario administrador tiene usted una solicitud marca para revisar', '\r\n                    <div class=\"card card-widget widget-user\">\r\n                        <div class=\"widget-user-header bg-info\">\r\n                            <h3 class=\"widget-user-username\">prueba3</h3>\r\n                            <h5 class=\"widget-user-desc\">qqqqq</h5>\r\n                        </div>\r\n                        <div class=\"widget-user-image\">\r\n                            <img class=\"img-circle elevation-2\" src=\"../../Util/Img/marca/623f8290c0838-623f8290c0839.png\" alt=\"imagen solicitud\">\r\n                        </div>\r\n                        <div class=\"card-footer\">\r\n                            <div class=\"row\">\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Solicitud marca creado por:</h5>\r\n                                        <span class=\"description-text\">Natalia Elvira Oduber</span>\r\n                                    </div>\r\n                                </div>\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Mensaje:</h5>\r\n                                        <span class=\"description-text\">Hola usuario administrador Martin Trinidad revise mi solicitud marca,  si es que los datos son correctos por favor apruebelo, si no indiqueme los errores para corregirla y enviarsela</span>\r\n                                    </div>\r\n                                </div>\r\n                            </div>\r\n                        </div>\r\n                    </div>\r\n                    ', 0, 0, 0, 0, 'A', 'A', 'A', 'A', '2022-03-26 18:18:29', '2022-03-26 18:18:29', 5, 9),
(69, 'Usuario administrador tiene usted una solicitud marca para revisar', '\r\n                    <div class=\"card card-widget widget-user\">\r\n                        <div class=\"widget-user-header bg-info\">\r\n                            <h3 class=\"widget-user-username\">prueba3</h3>\r\n                            <h5 class=\"widget-user-desc\">qqqqq</h5>\r\n                        </div>\r\n                        <div class=\"widget-user-image\">\r\n                            <img class=\"img-circle elevation-2\" src=\"../../Util/Img/marca/623f8290c0838-623f8290c0839.png\" alt=\"imagen solicitud\">\r\n                        </div>\r\n                        <div class=\"card-footer\">\r\n                            <div class=\"row\">\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Solicitud marca creado por:</h5>\r\n                                        <span class=\"description-text\">Natalia Elvira Oduber</span>\r\n                                    </div>\r\n                                </div>\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Mensaje:</h5>\r\n                                        <span class=\"description-text\">Hola usuario administrador Pedro Alfonzo revise mi solicitud marca,  si es que los datos son correctos por favor apruebelo, si no indiqueme los errores para corregirla y enviarsela</span>\r\n                                    </div>\r\n                                </div>\r\n                            </div>\r\n                        </div>\r\n                    </div>\r\n                    ', 0, 0, 0, 0, 'A', 'A', 'A', 'A', '2022-03-26 18:18:29', '2022-03-26 18:18:29', 6, 9),
(70, 'Usuario administrador tiene usted una solicitud marca para revisar', '\r\n                    <div class=\"card card-widget widget-user\">\r\n                        <div class=\"widget-user-header bg-info\">\r\n                            <h3 class=\"widget-user-username\">prueba3</h3>\r\n                            <h5 class=\"widget-user-desc\">qqqqq</h5>\r\n                        </div>\r\n                        <div class=\"widget-user-image\">\r\n                            <img class=\"img-circle elevation-2\" src=\"../../Util/Img/marca/623f8290c0838-623f8290c0839.png\" alt=\"imagen solicitud\">\r\n                        </div>\r\n                        <div class=\"card-footer\">\r\n                            <div class=\"row\">\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Solicitud marca creado por:</h5>\r\n                                        <span class=\"description-text\">Natalia Elvira Oduber</span>\r\n                                    </div>\r\n                                </div>\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Mensaje:</h5>\r\n                                        <span class=\"description-text\">Hola usuario administrador Julio Cesar revise mi solicitud marca,  si es que los datos son correctos por favor apruebelo, si no indiqueme los errores para corregirla y enviarsela</span>\r\n                                    </div>\r\n                                </div>\r\n                            </div>\r\n                        </div>\r\n                    </div>\r\n                    ', 0, 0, 0, 0, 'A', 'A', 'A', 'A', '2022-03-26 18:18:29', '2022-03-26 18:18:29', 7, 9),
(71, 'Usuario administrador tiene usted una solicitud marca para revisar', '\r\n                    <div class=\"card card-widget widget-user\">\r\n                        <div class=\"widget-user-header bg-info\">\r\n                            <h3 class=\"widget-user-username\">prueba3</h3>\r\n                            <h5 class=\"widget-user-desc\">qqqqq</h5>\r\n                        </div>\r\n                        <div class=\"widget-user-image\">\r\n                            <img class=\"img-circle elevation-2\" src=\"../../Util/Img/marca/623f8290c0838-623f8290c0839.png\" alt=\"imagen solicitud\">\r\n                        </div>\r\n                        <div class=\"card-footer\">\r\n                            <div class=\"row\">\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Solicitud marca creado por:</h5>\r\n                                        <span class=\"description-text\">Natalia Elvira Oduber</span>\r\n                                    </div>\r\n                                </div>\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Mensaje:</h5>\r\n                                        <span class=\"description-text\">Hola usuario administrador Maximiliano Hoeffler revise mi solicitud marca,  si es que los datos son correctos por favor apruebelo, si no indiqueme los errores para corregirla y enviarsela</span>\r\n                                    </div>\r\n                                </div>\r\n                            </div>\r\n                        </div>\r\n                    </div>\r\n                    ', 0, 0, 0, 0, 'A', 'A', 'A', 'A', '2022-03-26 18:18:29', '2022-03-26 18:18:29', 8, 9),
(72, 'Usuario administrador tiene usted una solicitud marca para revisar', '\r\n                    <div class=\"card card-widget widget-user\">\r\n                        <div class=\"widget-user-header bg-info\">\r\n                            <h3 class=\"widget-user-username\">prueba3</h3>\r\n                            <h5 class=\"widget-user-desc\">qqqqq</h5>\r\n                        </div>\r\n                        <div class=\"widget-user-image\">\r\n                            <img class=\"img-circle elevation-2\" src=\"../../Util/Img/marca/623f8290c0838-623f8290c0839.png\" alt=\"imagen solicitud\">\r\n                        </div>\r\n                        <div class=\"card-footer\">\r\n                            <div class=\"row\">\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Solicitud marca creado por:</h5>\r\n                                        <span class=\"description-text\">Natalia Elvira Oduber</span>\r\n                                    </div>\r\n                                </div>\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Mensaje:</h5>\r\n                                        <span class=\"description-text\">Hola usuario administrador Victoria Gallo revise mi solicitud marca,  si es que los datos son correctos por favor apruebelo, si no indiqueme los errores para corregirla y enviarsela</span>\r\n                                    </div>\r\n                                </div>\r\n                            </div>\r\n                        </div>\r\n                    </div>\r\n                    ', 0, 0, 0, 0, 'A', 'A', 'A', 'A', '2022-03-26 18:18:29', '2022-03-26 18:18:29', 9, 9),
(74, 'Usuario administrador tiene usted una solicitud marca para revisar', '\r\n                    <div class=\"card card-widget widget-user\">\r\n                        <div class=\"widget-user-header bg-info\">\r\n                            <h3 class=\"widget-user-username\">prueba2</h3>\r\n                            <h5 class=\"widget-user-desc\">111111</h5>\r\n                        </div>\r\n                        <div class=\"widget-user-image\">\r\n                            <img class=\"img-circle elevation-2\" src=\"../../Util/Img/marca/623f827be54bc-623f827be54c2.png\" alt=\"imagen solicitud\">\r\n                        </div>\r\n                        <div class=\"card-footer\">\r\n                            <div class=\"row\">\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Solicitud marca creado por:</h5>\r\n                                        <span class=\"description-text\">Natalia Elvira Oduber</span>\r\n                                    </div>\r\n                                </div>\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Mensaje:</h5>\r\n                                        <span class=\"description-text\">Hola usuario administrador Juan Cosme revise mi solicitud marca,  si es que los datos son correctos por favor apruebelo, si no indiqueme los errores para corregirla y enviarsela</span>\r\n                                    </div>\r\n                                </div>\r\n                            </div>\r\n                        </div>\r\n                    </div>\r\n                    ', 0, 0, 0, 0, 'A', 'A', 'A', 'A', '2022-03-26 18:18:30', '2022-03-26 18:18:30', 3, 10),
(75, 'Usuario administrador tiene usted una solicitud marca para revisar', '\r\n                    <div class=\"card card-widget widget-user\">\r\n                        <div class=\"widget-user-header bg-info\">\r\n                            <h3 class=\"widget-user-username\">prueba2</h3>\r\n                            <h5 class=\"widget-user-desc\">111111</h5>\r\n                        </div>\r\n                        <div class=\"widget-user-image\">\r\n                            <img class=\"img-circle elevation-2\" src=\"../../Util/Img/marca/623f827be54bc-623f827be54c2.png\" alt=\"imagen solicitud\">\r\n                        </div>\r\n                        <div class=\"card-footer\">\r\n                            <div class=\"row\">\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Solicitud marca creado por:</h5>\r\n                                        <span class=\"description-text\">Natalia Elvira Oduber</span>\r\n                                    </div>\r\n                                </div>\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Mensaje:</h5>\r\n                                        <span class=\"description-text\">Hola usuario administrador juan diego revise mi solicitud marca,  si es que los datos son correctos por favor apruebelo, si no indiqueme los errores para corregirla y enviarsela</span>\r\n                                    </div>\r\n                                </div>\r\n                            </div>\r\n                        </div>\r\n                    </div>\r\n                    ', 0, 0, 0, 0, 'A', 'A', 'A', 'A', '2022-03-26 18:18:30', '2022-03-26 18:18:30', 4, 10),
(76, 'Usuario administrador tiene usted una solicitud marca para revisar', '\r\n                    <div class=\"card card-widget widget-user\">\r\n                        <div class=\"widget-user-header bg-info\">\r\n                            <h3 class=\"widget-user-username\">prueba2</h3>\r\n                            <h5 class=\"widget-user-desc\">111111</h5>\r\n                        </div>\r\n                        <div class=\"widget-user-image\">\r\n                            <img class=\"img-circle elevation-2\" src=\"../../Util/Img/marca/623f827be54bc-623f827be54c2.png\" alt=\"imagen solicitud\">\r\n                        </div>\r\n                        <div class=\"card-footer\">\r\n                            <div class=\"row\">\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Solicitud marca creado por:</h5>\r\n                                        <span class=\"description-text\">Natalia Elvira Oduber</span>\r\n                                    </div>\r\n                                </div>\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Mensaje:</h5>\r\n                                        <span class=\"description-text\">Hola usuario administrador Martin Trinidad revise mi solicitud marca,  si es que los datos son correctos por favor apruebelo, si no indiqueme los errores para corregirla y enviarsela</span>\r\n                                    </div>\r\n                                </div>\r\n                            </div>\r\n                        </div>\r\n                    </div>\r\n                    ', 0, 0, 0, 0, 'A', 'A', 'A', 'A', '2022-03-26 18:18:30', '2022-03-26 18:18:30', 5, 10),
(77, 'Usuario administrador tiene usted una solicitud marca para revisar', '\r\n                    <div class=\"card card-widget widget-user\">\r\n                        <div class=\"widget-user-header bg-info\">\r\n                            <h3 class=\"widget-user-username\">prueba2</h3>\r\n                            <h5 class=\"widget-user-desc\">111111</h5>\r\n                        </div>\r\n                        <div class=\"widget-user-image\">\r\n                            <img class=\"img-circle elevation-2\" src=\"../../Util/Img/marca/623f827be54bc-623f827be54c2.png\" alt=\"imagen solicitud\">\r\n                        </div>\r\n                        <div class=\"card-footer\">\r\n                            <div class=\"row\">\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Solicitud marca creado por:</h5>\r\n                                        <span class=\"description-text\">Natalia Elvira Oduber</span>\r\n                                    </div>\r\n                                </div>\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Mensaje:</h5>\r\n                                        <span class=\"description-text\">Hola usuario administrador Pedro Alfonzo revise mi solicitud marca,  si es que los datos son correctos por favor apruebelo, si no indiqueme los errores para corregirla y enviarsela</span>\r\n                                    </div>\r\n                                </div>\r\n                            </div>\r\n                        </div>\r\n                    </div>\r\n                    ', 0, 0, 0, 0, 'A', 'A', 'A', 'A', '2022-03-26 18:18:30', '2022-03-26 18:18:30', 6, 10),
(78, 'Usuario administrador tiene usted una solicitud marca para revisar', '\r\n                    <div class=\"card card-widget widget-user\">\r\n                        <div class=\"widget-user-header bg-info\">\r\n                            <h3 class=\"widget-user-username\">prueba2</h3>\r\n                            <h5 class=\"widget-user-desc\">111111</h5>\r\n                        </div>\r\n                        <div class=\"widget-user-image\">\r\n                            <img class=\"img-circle elevation-2\" src=\"../../Util/Img/marca/623f827be54bc-623f827be54c2.png\" alt=\"imagen solicitud\">\r\n                        </div>\r\n                        <div class=\"card-footer\">\r\n                            <div class=\"row\">\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Solicitud marca creado por:</h5>\r\n                                        <span class=\"description-text\">Natalia Elvira Oduber</span>\r\n                                    </div>\r\n                                </div>\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Mensaje:</h5>\r\n                                        <span class=\"description-text\">Hola usuario administrador Julio Cesar revise mi solicitud marca,  si es que los datos son correctos por favor apruebelo, si no indiqueme los errores para corregirla y enviarsela</span>\r\n                                    </div>\r\n                                </div>\r\n                            </div>\r\n                        </div>\r\n                    </div>\r\n                    ', 0, 0, 0, 0, 'A', 'A', 'A', 'A', '2022-03-26 18:18:30', '2022-03-26 18:18:30', 7, 10),
(79, 'Usuario administrador tiene usted una solicitud marca para revisar', '\r\n                    <div class=\"card card-widget widget-user\">\r\n                        <div class=\"widget-user-header bg-info\">\r\n                            <h3 class=\"widget-user-username\">prueba2</h3>\r\n                            <h5 class=\"widget-user-desc\">111111</h5>\r\n                        </div>\r\n                        <div class=\"widget-user-image\">\r\n                            <img class=\"img-circle elevation-2\" src=\"../../Util/Img/marca/623f827be54bc-623f827be54c2.png\" alt=\"imagen solicitud\">\r\n                        </div>\r\n                        <div class=\"card-footer\">\r\n                            <div class=\"row\">\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Solicitud marca creado por:</h5>\r\n                                        <span class=\"description-text\">Natalia Elvira Oduber</span>\r\n                                    </div>\r\n                                </div>\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Mensaje:</h5>\r\n                                        <span class=\"description-text\">Hola usuario administrador Maximiliano Hoeffler revise mi solicitud marca,  si es que los datos son correctos por favor apruebelo, si no indiqueme los errores para corregirla y enviarsela</span>\r\n                                    </div>\r\n                                </div>\r\n                            </div>\r\n                        </div>\r\n                    </div>\r\n                    ', 0, 0, 0, 0, 'A', 'A', 'A', 'A', '2022-03-26 18:18:30', '2022-03-26 18:18:30', 8, 10),
(80, 'Usuario administrador tiene usted una solicitud marca para revisar', '\r\n                    <div class=\"card card-widget widget-user\">\r\n                        <div class=\"widget-user-header bg-info\">\r\n                            <h3 class=\"widget-user-username\">prueba2</h3>\r\n                            <h5 class=\"widget-user-desc\">111111</h5>\r\n                        </div>\r\n                        <div class=\"widget-user-image\">\r\n                            <img class=\"img-circle elevation-2\" src=\"../../Util/Img/marca/623f827be54bc-623f827be54c2.png\" alt=\"imagen solicitud\">\r\n                        </div>\r\n                        <div class=\"card-footer\">\r\n                            <div class=\"row\">\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Solicitud marca creado por:</h5>\r\n                                        <span class=\"description-text\">Natalia Elvira Oduber</span>\r\n                                    </div>\r\n                                </div>\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Mensaje:</h5>\r\n                                        <span class=\"description-text\">Hola usuario administrador Victoria Gallo revise mi solicitud marca,  si es que los datos son correctos por favor apruebelo, si no indiqueme los errores para corregirla y enviarsela</span>\r\n                                    </div>\r\n                                </div>\r\n                            </div>\r\n                        </div>\r\n                    </div>\r\n                    ', 0, 0, 0, 0, 'A', 'A', 'A', 'A', '2022-03-26 18:18:30', '2022-03-26 18:18:30', 9, 10),
(82, 'Usuario administrador tiene usted una solicitud marca para revisar', '\r\n                    <div class=\"card card-widget widget-user\">\r\n                        <div class=\"widget-user-header bg-info\">\r\n                            <h3 class=\"widget-user-username\">prueba10</h3>\r\n                            <h5 class=\"widget-user-desc\">dfgd</h5>\r\n                        </div>\r\n                        <div class=\"widget-user-image\">\r\n                            <img class=\"img-circle elevation-2\" src=\"../../Util/Img/marca/623f8366851e2-623f8366851e8.png\" alt=\"imagen solicitud\">\r\n                        </div>\r\n                        <div class=\"card-footer\">\r\n                            <div class=\"row\">\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Solicitud marca creado por:</h5>\r\n                                        <span class=\"description-text\">Natalia Elvira Oduber</span>\r\n                                    </div>\r\n                                </div>\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Mensaje:</h5>\r\n                                        <span class=\"description-text\">Hola usuario administrador Juan Cosme revise mi solicitud marca,  si es que los datos son correctos por favor apruebelo, si no indiqueme los errores para corregirla y enviarsela</span>\r\n                                    </div>\r\n                                </div>\r\n                            </div>\r\n                        </div>\r\n                    </div>\r\n                    ', 0, 0, 0, 0, 'A', 'A', 'A', 'A', '2022-03-26 18:20:15', '2022-03-26 18:20:15', 3, 11),
(83, 'Usuario administrador tiene usted una solicitud marca para revisar', '\r\n                    <div class=\"card card-widget widget-user\">\r\n                        <div class=\"widget-user-header bg-info\">\r\n                            <h3 class=\"widget-user-username\">prueba10</h3>\r\n                            <h5 class=\"widget-user-desc\">dfgd</h5>\r\n                        </div>\r\n                        <div class=\"widget-user-image\">\r\n                            <img class=\"img-circle elevation-2\" src=\"../../Util/Img/marca/623f8366851e2-623f8366851e8.png\" alt=\"imagen solicitud\">\r\n                        </div>\r\n                        <div class=\"card-footer\">\r\n                            <div class=\"row\">\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Solicitud marca creado por:</h5>\r\n                                        <span class=\"description-text\">Natalia Elvira Oduber</span>\r\n                                    </div>\r\n                                </div>\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Mensaje:</h5>\r\n                                        <span class=\"description-text\">Hola usuario administrador juan diego revise mi solicitud marca,  si es que los datos son correctos por favor apruebelo, si no indiqueme los errores para corregirla y enviarsela</span>\r\n                                    </div>\r\n                                </div>\r\n                            </div>\r\n                        </div>\r\n                    </div>\r\n                    ', 0, 0, 0, 0, 'A', 'A', 'A', 'A', '2022-03-26 18:20:15', '2022-03-26 18:20:15', 4, 11),
(84, 'Usuario administrador tiene usted una solicitud marca para revisar', '\r\n                    <div class=\"card card-widget widget-user\">\r\n                        <div class=\"widget-user-header bg-info\">\r\n                            <h3 class=\"widget-user-username\">prueba10</h3>\r\n                            <h5 class=\"widget-user-desc\">dfgd</h5>\r\n                        </div>\r\n                        <div class=\"widget-user-image\">\r\n                            <img class=\"img-circle elevation-2\" src=\"../../Util/Img/marca/623f8366851e2-623f8366851e8.png\" alt=\"imagen solicitud\">\r\n                        </div>\r\n                        <div class=\"card-footer\">\r\n                            <div class=\"row\">\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Solicitud marca creado por:</h5>\r\n                                        <span class=\"description-text\">Natalia Elvira Oduber</span>\r\n                                    </div>\r\n                                </div>\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Mensaje:</h5>\r\n                                        <span class=\"description-text\">Hola usuario administrador Martin Trinidad revise mi solicitud marca,  si es que los datos son correctos por favor apruebelo, si no indiqueme los errores para corregirla y enviarsela</span>\r\n                                    </div>\r\n                                </div>\r\n                            </div>\r\n                        </div>\r\n                    </div>\r\n                    ', 0, 0, 0, 0, 'A', 'A', 'A', 'A', '2022-03-26 18:20:15', '2022-03-26 18:20:15', 5, 11);
INSERT INTO `destino` (`id`, `asunto`, `contenido`, `abierto`, `abierto_emisor`, `favorito`, `favorito_emisor`, `estado`, `estado_perm`, `estado_emisor`, `estado_emisor_perm`, `fecha_creacion`, `fecha_edicion`, `id_usuario`, `id_mensaje`) VALUES
(85, 'Usuario administrador tiene usted una solicitud marca para revisar', '\r\n                    <div class=\"card card-widget widget-user\">\r\n                        <div class=\"widget-user-header bg-info\">\r\n                            <h3 class=\"widget-user-username\">prueba10</h3>\r\n                            <h5 class=\"widget-user-desc\">dfgd</h5>\r\n                        </div>\r\n                        <div class=\"widget-user-image\">\r\n                            <img class=\"img-circle elevation-2\" src=\"../../Util/Img/marca/623f8366851e2-623f8366851e8.png\" alt=\"imagen solicitud\">\r\n                        </div>\r\n                        <div class=\"card-footer\">\r\n                            <div class=\"row\">\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Solicitud marca creado por:</h5>\r\n                                        <span class=\"description-text\">Natalia Elvira Oduber</span>\r\n                                    </div>\r\n                                </div>\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Mensaje:</h5>\r\n                                        <span class=\"description-text\">Hola usuario administrador Pedro Alfonzo revise mi solicitud marca,  si es que los datos son correctos por favor apruebelo, si no indiqueme los errores para corregirla y enviarsela</span>\r\n                                    </div>\r\n                                </div>\r\n                            </div>\r\n                        </div>\r\n                    </div>\r\n                    ', 0, 0, 0, 0, 'A', 'A', 'A', 'A', '2022-03-26 18:20:15', '2022-03-26 18:20:15', 6, 11),
(86, 'Usuario administrador tiene usted una solicitud marca para revisar', '\r\n                    <div class=\"card card-widget widget-user\">\r\n                        <div class=\"widget-user-header bg-info\">\r\n                            <h3 class=\"widget-user-username\">prueba10</h3>\r\n                            <h5 class=\"widget-user-desc\">dfgd</h5>\r\n                        </div>\r\n                        <div class=\"widget-user-image\">\r\n                            <img class=\"img-circle elevation-2\" src=\"../../Util/Img/marca/623f8366851e2-623f8366851e8.png\" alt=\"imagen solicitud\">\r\n                        </div>\r\n                        <div class=\"card-footer\">\r\n                            <div class=\"row\">\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Solicitud marca creado por:</h5>\r\n                                        <span class=\"description-text\">Natalia Elvira Oduber</span>\r\n                                    </div>\r\n                                </div>\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Mensaje:</h5>\r\n                                        <span class=\"description-text\">Hola usuario administrador Julio Cesar revise mi solicitud marca,  si es que los datos son correctos por favor apruebelo, si no indiqueme los errores para corregirla y enviarsela</span>\r\n                                    </div>\r\n                                </div>\r\n                            </div>\r\n                        </div>\r\n                    </div>\r\n                    ', 0, 0, 0, 0, 'A', 'A', 'A', 'A', '2022-03-26 18:20:15', '2022-03-26 18:20:15', 7, 11),
(87, 'Usuario administrador tiene usted una solicitud marca para revisar', '\r\n                    <div class=\"card card-widget widget-user\">\r\n                        <div class=\"widget-user-header bg-info\">\r\n                            <h3 class=\"widget-user-username\">prueba10</h3>\r\n                            <h5 class=\"widget-user-desc\">dfgd</h5>\r\n                        </div>\r\n                        <div class=\"widget-user-image\">\r\n                            <img class=\"img-circle elevation-2\" src=\"../../Util/Img/marca/623f8366851e2-623f8366851e8.png\" alt=\"imagen solicitud\">\r\n                        </div>\r\n                        <div class=\"card-footer\">\r\n                            <div class=\"row\">\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Solicitud marca creado por:</h5>\r\n                                        <span class=\"description-text\">Natalia Elvira Oduber</span>\r\n                                    </div>\r\n                                </div>\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Mensaje:</h5>\r\n                                        <span class=\"description-text\">Hola usuario administrador Maximiliano Hoeffler revise mi solicitud marca,  si es que los datos son correctos por favor apruebelo, si no indiqueme los errores para corregirla y enviarsela</span>\r\n                                    </div>\r\n                                </div>\r\n                            </div>\r\n                        </div>\r\n                    </div>\r\n                    ', 0, 0, 0, 0, 'A', 'A', 'A', 'A', '2022-03-26 18:20:15', '2022-03-26 18:20:15', 8, 11),
(88, 'Usuario administrador tiene usted una solicitud marca para revisar', '\r\n                    <div class=\"card card-widget widget-user\">\r\n                        <div class=\"widget-user-header bg-info\">\r\n                            <h3 class=\"widget-user-username\">prueba10</h3>\r\n                            <h5 class=\"widget-user-desc\">dfgd</h5>\r\n                        </div>\r\n                        <div class=\"widget-user-image\">\r\n                            <img class=\"img-circle elevation-2\" src=\"../../Util/Img/marca/623f8366851e2-623f8366851e8.png\" alt=\"imagen solicitud\">\r\n                        </div>\r\n                        <div class=\"card-footer\">\r\n                            <div class=\"row\">\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Solicitud marca creado por:</h5>\r\n                                        <span class=\"description-text\">Natalia Elvira Oduber</span>\r\n                                    </div>\r\n                                </div>\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Mensaje:</h5>\r\n                                        <span class=\"description-text\">Hola usuario administrador Victoria Gallo revise mi solicitud marca,  si es que los datos son correctos por favor apruebelo, si no indiqueme los errores para corregirla y enviarsela</span>\r\n                                    </div>\r\n                                </div>\r\n                            </div>\r\n                        </div>\r\n                    </div>\r\n                    ', 0, 0, 0, 0, 'A', 'A', 'A', 'A', '2022-03-26 18:20:15', '2022-03-26 18:20:15', 9, 11),
(89, 'Usuario administrador tiene usted una solicitud marca para revisar', '\r\n                    <div class=\"card card-widget widget-user\">\r\n                        <div class=\"widget-user-header bg-info\">\r\n                            <h3 class=\"widget-user-username\">Pirulo</h3>\r\n                            <h5 class=\"widget-user-desc\">Ropa Infantil</h5>\r\n                        </div>\r\n                        <div class=\"widget-user-image\">\r\n                            <img class=\"img-circle elevation-2\" src=\"../../Util/Img/marca/625f549a9049a-625f549a9049b.jpg\" alt=\"imagen solicitud\">\r\n                        </div>\r\n                        <div class=\"card-footer\">\r\n                            <div class=\"row\">\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Solicitud marca creado por:</h5>\r\n                                        <span class=\"description-text\">Natalia Elvira Oduber</span>\r\n                                    </div>\r\n                                </div>\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Mensaje:</h5>\r\n                                        <span class=\"description-text\">Hola usuario administrador Pablo Martin Morrone revise mi solicitud marca,  si es que los datos son correctos por favor apruebelo, si no indiqueme los errores para corregirla y enviarsela</span>\r\n                                    </div>\r\n                                </div>\r\n                            </div>\r\n                        </div>\r\n                    </div>\r\n                    ', 0, 0, 0, 0, 'A', 'A', 'A', 'A', '2022-04-19 21:33:01', '2022-04-19 21:33:01', 2, 12),
(90, 'Usuario administrador tiene usted una solicitud marca para revisar', '\r\n                    <div class=\"card card-widget widget-user\">\r\n                        <div class=\"widget-user-header bg-info\">\r\n                            <h3 class=\"widget-user-username\">Pirulo</h3>\r\n                            <h5 class=\"widget-user-desc\">Ropa Infantil</h5>\r\n                        </div>\r\n                        <div class=\"widget-user-image\">\r\n                            <img class=\"img-circle elevation-2\" src=\"../../Util/Img/marca/625f549a9049a-625f549a9049b.jpg\" alt=\"imagen solicitud\">\r\n                        </div>\r\n                        <div class=\"card-footer\">\r\n                            <div class=\"row\">\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Solicitud marca creado por:</h5>\r\n                                        <span class=\"description-text\">Natalia Elvira Oduber</span>\r\n                                    </div>\r\n                                </div>\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Mensaje:</h5>\r\n                                        <span class=\"description-text\">Hola usuario administrador Juan Cosme revise mi solicitud marca,  si es que los datos son correctos por favor apruebelo, si no indiqueme los errores para corregirla y enviarsela</span>\r\n                                    </div>\r\n                                </div>\r\n                            </div>\r\n                        </div>\r\n                    </div>\r\n                    ', 0, 0, 0, 0, 'A', 'A', 'A', 'A', '2022-04-19 21:33:01', '2022-04-19 21:33:01', 3, 12),
(91, 'Usuario administrador tiene usted una solicitud marca para revisar', '\r\n                    <div class=\"card card-widget widget-user\">\r\n                        <div class=\"widget-user-header bg-info\">\r\n                            <h3 class=\"widget-user-username\">Pirulo</h3>\r\n                            <h5 class=\"widget-user-desc\">Ropa Infantil</h5>\r\n                        </div>\r\n                        <div class=\"widget-user-image\">\r\n                            <img class=\"img-circle elevation-2\" src=\"../../Util/Img/marca/625f549a9049a-625f549a9049b.jpg\" alt=\"imagen solicitud\">\r\n                        </div>\r\n                        <div class=\"card-footer\">\r\n                            <div class=\"row\">\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Solicitud marca creado por:</h5>\r\n                                        <span class=\"description-text\">Natalia Elvira Oduber</span>\r\n                                    </div>\r\n                                </div>\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Mensaje:</h5>\r\n                                        <span class=\"description-text\">Hola usuario administrador juan diego revise mi solicitud marca,  si es que los datos son correctos por favor apruebelo, si no indiqueme los errores para corregirla y enviarsela</span>\r\n                                    </div>\r\n                                </div>\r\n                            </div>\r\n                        </div>\r\n                    </div>\r\n                    ', 0, 0, 0, 0, 'A', 'A', 'A', 'A', '2022-04-19 21:33:01', '2022-04-19 21:33:01', 4, 12),
(92, 'Usuario administrador tiene usted una solicitud marca para revisar', '\r\n                    <div class=\"card card-widget widget-user\">\r\n                        <div class=\"widget-user-header bg-info\">\r\n                            <h3 class=\"widget-user-username\">Pirulo</h3>\r\n                            <h5 class=\"widget-user-desc\">Ropa Infantil</h5>\r\n                        </div>\r\n                        <div class=\"widget-user-image\">\r\n                            <img class=\"img-circle elevation-2\" src=\"../../Util/Img/marca/625f549a9049a-625f549a9049b.jpg\" alt=\"imagen solicitud\">\r\n                        </div>\r\n                        <div class=\"card-footer\">\r\n                            <div class=\"row\">\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Solicitud marca creado por:</h5>\r\n                                        <span class=\"description-text\">Natalia Elvira Oduber</span>\r\n                                    </div>\r\n                                </div>\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Mensaje:</h5>\r\n                                        <span class=\"description-text\">Hola usuario administrador Martin Trinidad revise mi solicitud marca,  si es que los datos son correctos por favor apruebelo, si no indiqueme los errores para corregirla y enviarsela</span>\r\n                                    </div>\r\n                                </div>\r\n                            </div>\r\n                        </div>\r\n                    </div>\r\n                    ', 0, 0, 0, 0, 'A', 'A', 'A', 'A', '2022-04-19 21:33:01', '2022-04-19 21:33:01', 5, 12),
(93, 'Usuario administrador tiene usted una solicitud marca para revisar', '\r\n                    <div class=\"card card-widget widget-user\">\r\n                        <div class=\"widget-user-header bg-info\">\r\n                            <h3 class=\"widget-user-username\">Pirulo</h3>\r\n                            <h5 class=\"widget-user-desc\">Ropa Infantil</h5>\r\n                        </div>\r\n                        <div class=\"widget-user-image\">\r\n                            <img class=\"img-circle elevation-2\" src=\"../../Util/Img/marca/625f549a9049a-625f549a9049b.jpg\" alt=\"imagen solicitud\">\r\n                        </div>\r\n                        <div class=\"card-footer\">\r\n                            <div class=\"row\">\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Solicitud marca creado por:</h5>\r\n                                        <span class=\"description-text\">Natalia Elvira Oduber</span>\r\n                                    </div>\r\n                                </div>\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Mensaje:</h5>\r\n                                        <span class=\"description-text\">Hola usuario administrador Pedro Alfonzo revise mi solicitud marca,  si es que los datos son correctos por favor apruebelo, si no indiqueme los errores para corregirla y enviarsela</span>\r\n                                    </div>\r\n                                </div>\r\n                            </div>\r\n                        </div>\r\n                    </div>\r\n                    ', 0, 0, 0, 0, 'A', 'A', 'A', 'A', '2022-04-19 21:33:01', '2022-04-19 21:33:01', 6, 12),
(94, 'Usuario administrador tiene usted una solicitud marca para revisar', '\r\n                    <div class=\"card card-widget widget-user\">\r\n                        <div class=\"widget-user-header bg-info\">\r\n                            <h3 class=\"widget-user-username\">Pirulo</h3>\r\n                            <h5 class=\"widget-user-desc\">Ropa Infantil</h5>\r\n                        </div>\r\n                        <div class=\"widget-user-image\">\r\n                            <img class=\"img-circle elevation-2\" src=\"../../Util/Img/marca/625f549a9049a-625f549a9049b.jpg\" alt=\"imagen solicitud\">\r\n                        </div>\r\n                        <div class=\"card-footer\">\r\n                            <div class=\"row\">\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Solicitud marca creado por:</h5>\r\n                                        <span class=\"description-text\">Natalia Elvira Oduber</span>\r\n                                    </div>\r\n                                </div>\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Mensaje:</h5>\r\n                                        <span class=\"description-text\">Hola usuario administrador Julio Cesar revise mi solicitud marca,  si es que los datos son correctos por favor apruebelo, si no indiqueme los errores para corregirla y enviarsela</span>\r\n                                    </div>\r\n                                </div>\r\n                            </div>\r\n                        </div>\r\n                    </div>\r\n                    ', 0, 0, 0, 0, 'A', 'A', 'A', 'A', '2022-04-19 21:33:01', '2022-04-19 21:33:01', 7, 12),
(95, 'Usuario administrador tiene usted una solicitud marca para revisar', '\r\n                    <div class=\"card card-widget widget-user\">\r\n                        <div class=\"widget-user-header bg-info\">\r\n                            <h3 class=\"widget-user-username\">Pirulo</h3>\r\n                            <h5 class=\"widget-user-desc\">Ropa Infantil</h5>\r\n                        </div>\r\n                        <div class=\"widget-user-image\">\r\n                            <img class=\"img-circle elevation-2\" src=\"../../Util/Img/marca/625f549a9049a-625f549a9049b.jpg\" alt=\"imagen solicitud\">\r\n                        </div>\r\n                        <div class=\"card-footer\">\r\n                            <div class=\"row\">\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Solicitud marca creado por:</h5>\r\n                                        <span class=\"description-text\">Natalia Elvira Oduber</span>\r\n                                    </div>\r\n                                </div>\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Mensaje:</h5>\r\n                                        <span class=\"description-text\">Hola usuario administrador Maximiliano Hoeffler revise mi solicitud marca,  si es que los datos son correctos por favor apruebelo, si no indiqueme los errores para corregirla y enviarsela</span>\r\n                                    </div>\r\n                                </div>\r\n                            </div>\r\n                        </div>\r\n                    </div>\r\n                    ', 0, 0, 0, 0, 'A', 'A', 'A', 'A', '2022-04-19 21:33:01', '2022-04-19 21:33:01', 8, 12),
(96, 'Usuario administrador tiene usted una solicitud marca para revisar', '\r\n                    <div class=\"card card-widget widget-user\">\r\n                        <div class=\"widget-user-header bg-info\">\r\n                            <h3 class=\"widget-user-username\">Pirulo</h3>\r\n                            <h5 class=\"widget-user-desc\">Ropa Infantil</h5>\r\n                        </div>\r\n                        <div class=\"widget-user-image\">\r\n                            <img class=\"img-circle elevation-2\" src=\"../../Util/Img/marca/625f549a9049a-625f549a9049b.jpg\" alt=\"imagen solicitud\">\r\n                        </div>\r\n                        <div class=\"card-footer\">\r\n                            <div class=\"row\">\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Solicitud marca creado por:</h5>\r\n                                        <span class=\"description-text\">Natalia Elvira Oduber</span>\r\n                                    </div>\r\n                                </div>\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Mensaje:</h5>\r\n                                        <span class=\"description-text\">Hola usuario administrador Victoria Gallo revise mi solicitud marca,  si es que los datos son correctos por favor apruebelo, si no indiqueme los errores para corregirla y enviarsela</span>\r\n                                    </div>\r\n                                </div>\r\n                            </div>\r\n                        </div>\r\n                    </div>\r\n                    ', 0, 0, 0, 0, 'A', 'A', 'A', 'A', '2022-04-19 21:33:01', '2022-04-19 21:33:01', 9, 12),
(97, 'Usuario administrador tiene usted una solicitud marca para revisar', '\r\n                    <div class=\"card card-widget widget-user\">\r\n                        <div class=\"widget-user-header bg-info\">\r\n                            <h3 class=\"widget-user-username\">Pepito</h3>\r\n                            <h5 class=\"widget-user-desc\">Calzado Deportivo</h5>\r\n                        </div>\r\n                        <div class=\"widget-user-image\">\r\n                            <img class=\"img-circle elevation-2\" src=\"../../Util/Img/marca/62618ed965581-62618ed965582.jpg\" alt=\"imagen solicitud\">\r\n                        </div>\r\n                        <div class=\"card-footer\">\r\n                            <div class=\"row\">\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Solicitud marca creado por:</h5>\r\n                                        <span class=\"description-text\">Natalia Elvira Oduber</span>\r\n                                    </div>\r\n                                </div>\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Mensaje:</h5>\r\n                                        <span class=\"description-text\">Hola usuario administrador Pablo Martin Morrone revise mi solicitud marca,  si es que los datos son correctos por favor apruebelo, si no indiqueme los errores para corregirla y enviarsela</span>\r\n                                    </div>\r\n                                </div>\r\n                            </div>\r\n                        </div>\r\n                    </div>\r\n                    ', 1, 0, 0, 0, 'A', 'A', 'A', 'A', '2022-04-21 14:05:59', '2022-04-21 14:10:05', 2, 13),
(98, 'Usuario administrador tiene usted una solicitud marca para revisar', '\r\n                    <div class=\"card card-widget widget-user\">\r\n                        <div class=\"widget-user-header bg-info\">\r\n                            <h3 class=\"widget-user-username\">Pepito</h3>\r\n                            <h5 class=\"widget-user-desc\">Calzado Deportivo</h5>\r\n                        </div>\r\n                        <div class=\"widget-user-image\">\r\n                            <img class=\"img-circle elevation-2\" src=\"../../Util/Img/marca/62618ed965581-62618ed965582.jpg\" alt=\"imagen solicitud\">\r\n                        </div>\r\n                        <div class=\"card-footer\">\r\n                            <div class=\"row\">\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Solicitud marca creado por:</h5>\r\n                                        <span class=\"description-text\">Natalia Elvira Oduber</span>\r\n                                    </div>\r\n                                </div>\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Mensaje:</h5>\r\n                                        <span class=\"description-text\">Hola usuario administrador Juan Cosme revise mi solicitud marca,  si es que los datos son correctos por favor apruebelo, si no indiqueme los errores para corregirla y enviarsela</span>\r\n                                    </div>\r\n                                </div>\r\n                            </div>\r\n                        </div>\r\n                    </div>\r\n                    ', 0, 0, 0, 0, 'A', 'A', 'A', 'A', '2022-04-21 14:05:59', '2022-04-21 14:05:59', 3, 13),
(99, 'Usuario administrador tiene usted una solicitud marca para revisar', '\r\n                    <div class=\"card card-widget widget-user\">\r\n                        <div class=\"widget-user-header bg-info\">\r\n                            <h3 class=\"widget-user-username\">Pepito</h3>\r\n                            <h5 class=\"widget-user-desc\">Calzado Deportivo</h5>\r\n                        </div>\r\n                        <div class=\"widget-user-image\">\r\n                            <img class=\"img-circle elevation-2\" src=\"../../Util/Img/marca/62618ed965581-62618ed965582.jpg\" alt=\"imagen solicitud\">\r\n                        </div>\r\n                        <div class=\"card-footer\">\r\n                            <div class=\"row\">\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Solicitud marca creado por:</h5>\r\n                                        <span class=\"description-text\">Natalia Elvira Oduber</span>\r\n                                    </div>\r\n                                </div>\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Mensaje:</h5>\r\n                                        <span class=\"description-text\">Hola usuario administrador juan diego revise mi solicitud marca,  si es que los datos son correctos por favor apruebelo, si no indiqueme los errores para corregirla y enviarsela</span>\r\n                                    </div>\r\n                                </div>\r\n                            </div>\r\n                        </div>\r\n                    </div>\r\n                    ', 0, 0, 0, 0, 'A', 'A', 'A', 'A', '2022-04-21 14:05:59', '2022-04-21 14:05:59', 4, 13),
(100, 'Usuario administrador tiene usted una solicitud marca para revisar', '\r\n                    <div class=\"card card-widget widget-user\">\r\n                        <div class=\"widget-user-header bg-info\">\r\n                            <h3 class=\"widget-user-username\">Pepito</h3>\r\n                            <h5 class=\"widget-user-desc\">Calzado Deportivo</h5>\r\n                        </div>\r\n                        <div class=\"widget-user-image\">\r\n                            <img class=\"img-circle elevation-2\" src=\"../../Util/Img/marca/62618ed965581-62618ed965582.jpg\" alt=\"imagen solicitud\">\r\n                        </div>\r\n                        <div class=\"card-footer\">\r\n                            <div class=\"row\">\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Solicitud marca creado por:</h5>\r\n                                        <span class=\"description-text\">Natalia Elvira Oduber</span>\r\n                                    </div>\r\n                                </div>\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Mensaje:</h5>\r\n                                        <span class=\"description-text\">Hola usuario administrador Martin Trinidad revise mi solicitud marca,  si es que los datos son correctos por favor apruebelo, si no indiqueme los errores para corregirla y enviarsela</span>\r\n                                    </div>\r\n                                </div>\r\n                            </div>\r\n                        </div>\r\n                    </div>\r\n                    ', 0, 0, 0, 0, 'A', 'A', 'A', 'A', '2022-04-21 14:05:59', '2022-04-21 14:05:59', 5, 13),
(101, 'Usuario administrador tiene usted una solicitud marca para revisar', '\r\n                    <div class=\"card card-widget widget-user\">\r\n                        <div class=\"widget-user-header bg-info\">\r\n                            <h3 class=\"widget-user-username\">Pepito</h3>\r\n                            <h5 class=\"widget-user-desc\">Calzado Deportivo</h5>\r\n                        </div>\r\n                        <div class=\"widget-user-image\">\r\n                            <img class=\"img-circle elevation-2\" src=\"../../Util/Img/marca/62618ed965581-62618ed965582.jpg\" alt=\"imagen solicitud\">\r\n                        </div>\r\n                        <div class=\"card-footer\">\r\n                            <div class=\"row\">\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Solicitud marca creado por:</h5>\r\n                                        <span class=\"description-text\">Natalia Elvira Oduber</span>\r\n                                    </div>\r\n                                </div>\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Mensaje:</h5>\r\n                                        <span class=\"description-text\">Hola usuario administrador Pedro Alfonzo revise mi solicitud marca,  si es que los datos son correctos por favor apruebelo, si no indiqueme los errores para corregirla y enviarsela</span>\r\n                                    </div>\r\n                                </div>\r\n                            </div>\r\n                        </div>\r\n                    </div>\r\n                    ', 0, 0, 0, 0, 'A', 'A', 'A', 'A', '2022-04-21 14:05:59', '2022-04-21 14:05:59', 6, 13),
(102, 'Usuario administrador tiene usted una solicitud marca para revisar', '\r\n                    <div class=\"card card-widget widget-user\">\r\n                        <div class=\"widget-user-header bg-info\">\r\n                            <h3 class=\"widget-user-username\">Pepito</h3>\r\n                            <h5 class=\"widget-user-desc\">Calzado Deportivo</h5>\r\n                        </div>\r\n                        <div class=\"widget-user-image\">\r\n                            <img class=\"img-circle elevation-2\" src=\"../../Util/Img/marca/62618ed965581-62618ed965582.jpg\" alt=\"imagen solicitud\">\r\n                        </div>\r\n                        <div class=\"card-footer\">\r\n                            <div class=\"row\">\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Solicitud marca creado por:</h5>\r\n                                        <span class=\"description-text\">Natalia Elvira Oduber</span>\r\n                                    </div>\r\n                                </div>\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Mensaje:</h5>\r\n                                        <span class=\"description-text\">Hola usuario administrador Julio Cesar revise mi solicitud marca,  si es que los datos son correctos por favor apruebelo, si no indiqueme los errores para corregirla y enviarsela</span>\r\n                                    </div>\r\n                                </div>\r\n                            </div>\r\n                        </div>\r\n                    </div>\r\n                    ', 0, 0, 0, 0, 'A', 'A', 'A', 'A', '2022-04-21 14:05:59', '2022-04-21 14:05:59', 7, 13),
(103, 'Usuario administrador tiene usted una solicitud marca para revisar', '\r\n                    <div class=\"card card-widget widget-user\">\r\n                        <div class=\"widget-user-header bg-info\">\r\n                            <h3 class=\"widget-user-username\">Pepito</h3>\r\n                            <h5 class=\"widget-user-desc\">Calzado Deportivo</h5>\r\n                        </div>\r\n                        <div class=\"widget-user-image\">\r\n                            <img class=\"img-circle elevation-2\" src=\"../../Util/Img/marca/62618ed965581-62618ed965582.jpg\" alt=\"imagen solicitud\">\r\n                        </div>\r\n                        <div class=\"card-footer\">\r\n                            <div class=\"row\">\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Solicitud marca creado por:</h5>\r\n                                        <span class=\"description-text\">Natalia Elvira Oduber</span>\r\n                                    </div>\r\n                                </div>\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Mensaje:</h5>\r\n                                        <span class=\"description-text\">Hola usuario administrador Maximiliano Hoeffler revise mi solicitud marca,  si es que los datos son correctos por favor apruebelo, si no indiqueme los errores para corregirla y enviarsela</span>\r\n                                    </div>\r\n                                </div>\r\n                            </div>\r\n                        </div>\r\n                    </div>\r\n                    ', 0, 0, 0, 0, 'A', 'A', 'A', 'A', '2022-04-21 14:05:59', '2022-04-21 14:05:59', 8, 13),
(104, 'Usuario administrador tiene usted una solicitud marca para revisar', '\r\n                    <div class=\"card card-widget widget-user\">\r\n                        <div class=\"widget-user-header bg-info\">\r\n                            <h3 class=\"widget-user-username\">Pepito</h3>\r\n                            <h5 class=\"widget-user-desc\">Calzado Deportivo</h5>\r\n                        </div>\r\n                        <div class=\"widget-user-image\">\r\n                            <img class=\"img-circle elevation-2\" src=\"../../Util/Img/marca/62618ed965581-62618ed965582.jpg\" alt=\"imagen solicitud\">\r\n                        </div>\r\n                        <div class=\"card-footer\">\r\n                            <div class=\"row\">\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Solicitud marca creado por:</h5>\r\n                                        <span class=\"description-text\">Natalia Elvira Oduber</span>\r\n                                    </div>\r\n                                </div>\r\n                                <div class=\"col-sm-6 border-right\">\r\n                                    <div class=\"description-block\">\r\n                                        <h5 class=\"description-header\">Mensaje:</h5>\r\n                                        <span class=\"description-text\">Hola usuario administrador Victoria Gallo revise mi solicitud marca,  si es que los datos son correctos por favor apruebelo, si no indiqueme los errores para corregirla y enviarsela</span>\r\n                                    </div>\r\n                                </div>\r\n                            </div>\r\n                        </div>\r\n                    </div>\r\n                    ', 0, 0, 0, 0, 'A', 'A', 'A', 'A', '2022-04-21 14:05:59', '2022-04-21 14:05:59', 9, 13),
(105, 'Prueba 1', 'Cualquier cosa', 0, 0, 0, 0, 'A', 'A', 'A', 'A', '2022-04-23 14:00:17', '2022-04-23 14:00:17', 1, 14),
(106, 'Prueba 2', 'Hola que tal !!!!!', 0, 0, 0, 0, 'A', 'A', 'A', 'A', '2022-04-23 14:05:37', '2022-04-23 14:05:37', 1, 15),
(107, 'Prueba 3', 'dsfasfsafsafsda', 1, 0, 0, 0, 'A', 'A', 'A', 'A', '2022-04-27 20:10:25', '2022-04-27 20:31:46', 2, 16);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `favorito`
--

CREATE TABLE `favorito` (
  `id` int(11) NOT NULL,
  `url` varchar(500) NOT NULL,
  `fecha_creacion` datetime NOT NULL DEFAULT current_timestamp(),
  `estado` varchar(10) NOT NULL DEFAULT 'A',
  `id_usuario` int(11) NOT NULL,
  `id_producto_tienda` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `favorito`
--

INSERT INTO `favorito` (`id`, `url`, `fecha_creacion`, `estado`, `id_usuario`, `id_producto_tienda`) VALUES
(1, 'Views/descripcion.php?name=Samsung Galaxy A21S&&id=oyWLV2zvZfKAz4e2G9uEFw==', '2021-10-20 11:46:36', 'A', 1, 1),
(2, 'Views/descripcion.php?name=iPhone 11&&id=ikWiIdsoykIoPZ0059v4Vg==', '2021-10-20 12:04:15', 'A', 1, 2),
(3, 'Views/descripcion.php?name=Samsung Galaxy A21S&&id=oyWLV2zvZfKAz4e2G9uEFw==', '2022-04-19 21:29:00', 'A', 2, 1),
(4, 'Views/descripcion.php?name=iPhone 11&&id=ikWiIdsoykIoPZ0059v4Vg==', '2022-04-21 14:02:21', 'A', 2, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial`
--

CREATE TABLE `historial` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(500) NOT NULL,
  `fecha` datetime NOT NULL DEFAULT current_timestamp(),
  `id_tipo_historial` int(11) NOT NULL,
  `id_modulo` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `historial`
--

INSERT INTO `historial` (`id`, `descripcion`, `fecha`, `id_tipo_historial`, `id_modulo`, `id_usuario`) VALUES
(1, 'Cambiaste tu avatar de usuario', '2021-08-18 16:02:32', 1, 1, 1),
(2, 'Compraste un celular iphone 11', '2021-08-19 16:02:32', 2, 2, 1),
(3, 'se eliminó una dirección', '2021-08-18 16:07:41', 3, 1, 1),
(4, 'Se creó una dirección', '2021-08-19 16:07:41', 2, 1, 1),
(5, 'Cambiaste de nombre', '2021-08-16 16:07:41', 1, 1, 1),
(6, 'Cambiaste de número celular', '2021-08-16 16:07:41', 1, 1, 1),
(7, 'cambiaste de avatar', '2021-08-13 16:11:46', 1, 1, 1),
(8, 'Compraste una licuadora', '2021-08-14 16:07:41', 2, 2, 1),
(9, 'Ha creado una nueva dirección: Garcia Lorca 789 - La Reja - Bs. As.', '2021-08-19 18:19:29', 2, 1, 1),
(10, 'Ha eliminado la direccion: Garcia Lorca 789 - La Reja - Bs. As., Localidad: La Reja, Provincia: Buenos Aires-GBA', '2021-08-20 01:37:01', 3, 1, 1),
(11, 'Ha editado sus datos personales, ha echo los siguientes cambios: su avatar fué cambiado. ', '2021-08-20 10:31:03', 1, 1, 1),
(12, 'Ha editado sus datos personales, ha echo los siguientes cambios: su avatar fué cambiado. ', '2021-08-20 10:31:32', 1, 1, 1),
(13, 'Ha editado sus datos personales, ha echo los siguientes cambios: su nombre cambio de Natalia a Natalia Elvira, su apellido cambio de Oduber a Oduber Andara. ', '2021-08-20 10:32:20', 1, 1, 1),
(14, 'Ha editado sus datos personales, ha echo los siguientes cambios: su teléfono cambio de 1138661609 a 1138669097, ', '2021-08-20 10:36:47', 1, 1, 1),
(15, 'Ha editado sus datos personales, ha echo los siguientes cambios: su teléfono cambio de 1138669097 a 1138661609, ', '2021-08-20 10:37:16', 1, 1, 1),
(16, 'Ha cambiado su contraseña.', '2021-08-20 10:42:27', 1, 1, 1),
(17, 'Ha cambiado su contraseña.', '2021-08-20 10:42:46', 1, 1, 1),
(18, 'Ha editado sus datos personales, ha echo los siguientes cambios: su nombre cambio de Natalia Elvira a Natalia, su apellido cambio de Oduber Andara a Oduber, ', '2021-08-20 11:12:55', 1, 1, 1),
(19, 'Ha editado sus datos personales, ha echo los siguientes cambios: su avatar fué cambiado. ', '2021-08-20 12:12:21', 1, 1, 1),
(20, 'Ha editado sus datos personales, ha echo los siguientes cambios: su D.N.I. cambio de 94654750 a 73737373, ', '2021-08-21 16:58:00', 1, 1, 1),
(21, 'Ha editado sus datos personales, ha echo los siguientes cambios: su D.N.I. cambio de 73737373 a 94654750, ', '2021-08-22 13:27:43', 1, 1, 1),
(22, 'Ha creado una nueva dirección: El Arreo 250', '2021-08-22 13:29:00', 2, 1, 1),
(23, 'Ha cambiado su contraseña.', '2021-09-18 11:55:38', 1, 1, 1),
(24, 'Ha cambiado su contraseña.', '2021-09-18 11:56:35', 1, 1, 1),
(25, 'Ha cambiado su contraseña.', '2021-09-18 12:05:38', 1, 1, 1),
(26, 'Ha cambiado su contraseña.', '2021-09-18 12:06:07', 1, 1, 1),
(27, 'Ha editado sus datos personales, ha echo los siguientes cambios: su avatar fué cambiado. ', '2021-09-18 12:15:49', 1, 1, 1),
(28, 'Ha editado sus datos personales, ha echo los siguientes cambios: su avatar fué cambiado. ', '2021-09-18 12:20:04', 1, 1, 1),
(29, 'Ha editado sus datos personales, ha echo los siguientes cambios: su avatar fué cambiado. ', '2021-09-18 12:20:39', 1, 1, 1),
(30, 'Ha editado sus datos personales, ha echo los siguientes cambios: su avatar fué cambiado. ', '2021-09-18 12:20:59', 1, 1, 1),
(31, 'Ha creado una nueva dirección: Pergamino 424', '2021-09-18 22:53:01', 2, 1, 5),
(32, 'Ha editado sus datos personales, ha echo los siguientes cambios: su avatar fué cambiado. ', '2021-09-18 22:54:45', 1, 1, 2),
(33, 'Ha realizado una pregunta: Queda en stock de color blanco ?. | en el producto: Samsung Galaxy A21S', '2021-10-09 11:59:25', 2, 3, 2),
(34, 'Ha respondido una pregunta: Si hay stock podes ofertar. | en el producto: Samsung Galaxy A21S', '2021-10-09 12:10:16', 2, 3, 1),
(35, 'Ha realizado una pregunta: Quisiera saber cuanto tiempo tiene de garantía ?. | en el producto: Samsung Galaxy A21S', '2021-10-13 14:17:12', 2, 3, 2),
(36, 'Eliminaste una notificación.', '2021-10-13 15:28:32', 3, 4, 1),
(37, 'Eliminaste una notificación.', '2021-10-13 15:42:42', 3, 4, 1),
(38, 'Ha respondido una pregunta: Este producto tiene 3 años de garantía. . | en el producto: Samsung Galaxy A21S', '2021-10-13 15:52:38', 2, 3, 1),
(39, 'Ha realizado una pregunta: Hay algún descuento en este producto ?. | en el producto: iPhone 11', '2021-10-23 12:54:34', 2, 3, 2),
(40, 'Ha realizado una pregunta: Podrían llevarlo a la casa de mi hermano ?. | en el producto: Samsung Galaxy A21S', '2021-10-27 12:37:56', 2, 3, 5),
(41, 'Ha respondido una pregunta: Si, te lo llevamos a la casa de tu hermano. | en el producto: Samsung Galaxy A21S', '2021-10-27 12:39:52', 2, 3, 1),
(42, 'Ha respondido una pregunta: Te puedo hacer el 5% de descuento adicional si ofertas hoy. | en el producto: iPhone 11', '2021-10-27 15:55:51', 2, 3, 1),
(43, 'Se agregó a favoritos el producto: Samsung Galaxy A21S', '2021-11-06 11:04:13', 2, 5, 1),
(44, 'Se agregó a favoritos el producto: iPhone 11', '2021-11-06 11:04:19', 2, 5, 1),
(45, 'Se removió de favoritos el producto: iPhone 11', '2021-11-06 11:05:30', 3, 5, 1),
(46, 'Se removió de favoritos el producto: iPhone 11', '2021-11-06 11:09:08', 3, 5, 1),
(47, 'Se agregó a favoritos el producto: Samsung Galaxy A21S', '2021-11-10 11:18:42', 2, 5, 1),
(48, 'Se agregó a favoritos el producto: iPhone 11', '2021-11-10 11:19:00', 2, 5, 1),
(49, 'Ha realizado una pregunta: podría reservarme uno para el Viernes ?. | en el producto: Samsung Galaxy A21S', '2021-11-10 12:43:11', 2, 3, 2),
(50, 'Ha editado sus datos personales, ha echo los siguientes cambios: su nombre cambio de Natalia a Natalia Elvira, ', '2021-11-13 12:40:46', 1, 1, 1),
(51, 'Ha creado una nueva dirección: El Arreo 220', '2021-11-13 12:50:29', 2, 1, 2),
(52, 'Ha realizado una pregunta: Hay Stock disponible ?. | en el producto: iPhone 11', '2021-11-13 12:52:06', 2, 3, 2),
(53, 'Ha respondido una pregunta: Si tenemos stock disponible, podes ofertar. | en el producto: iPhone 11', '2021-11-13 12:54:33', 2, 3, 1),
(54, 'Se removió de favoritos el producto: Samsung Galaxy A21S', '2021-11-24 20:52:14', 3, 5, 1),
(55, 'Se agregó a favoritos el producto: Samsung Galaxy A21S', '2021-11-24 20:52:17', 2, 5, 1),
(56, 'Se removió de favoritos el producto: Samsung Galaxy A21S', '2021-11-24 20:55:40', 3, 5, 1),
(57, 'Se agregó a favoritos el producto: Samsung Galaxy A21S', '2021-11-24 20:55:43', 2, 5, 1),
(58, 'Ha respondido una pregunta: Perfecto reservado para el viernes. | en el producto: Samsung Galaxy A21S', '2021-12-06 13:21:15', 2, 3, 1),
(59, 'Ha realizado una pregunta: Necesitaría saber si se puede cambiar por color Blanco ?. | en el producto: Samsung Galaxy A21S', '2021-12-06 13:23:00', 2, 3, 2),
(60, 'Ha creado una nueva dirección: Garcia Lorca 789', '2021-12-22 13:26:21', 2, 1, 1),
(61, 'Ha creado una nueva dirección: Juan V. Justo y Av, Corrientes', '2021-12-22 14:07:15', 2, 1, 1),
(62, 'Ha creado una nueva dirección: Arrecifes 455', '2021-12-22 14:08:50', 2, 1, 2),
(63, 'Ha eliminado la direccion: Arrecifes 455, Localidad: Castelar, Provincia: Buenos Aires-GBA', '2021-12-22 14:31:27', 3, 1, 2),
(64, 'Ha eliminado la direccion: Juan V. Justo y Av, Corrientes, Localidad: Almagro, Provincia: Capital Federal', '2021-12-22 14:48:10', 3, 1, 1),
(65, 'Ha editado sus datos personales, ha echo los siguientes cambios: su nombre cambio de Natalia Elvira a Natalia Elvir, ', '2022-01-06 12:25:47', 1, 1, 1),
(66, 'Ha editado sus datos personales, ha echo los siguientes cambios: su nombre cambio de Natalia Elvir a Natalia Elvira, ', '2022-01-06 12:26:06', 1, 1, 1),
(67, 'Ha editado sus datos personales, ha echo los siguientes cambios: su nombre cambio de Natalia Elvira a Natalia Elvir, ', '2022-01-06 12:27:33', 1, 1, 1),
(68, 'Ha editado sus datos personales, ha echo los siguientes cambios: su nombre cambio de Natalia Elvir a Natalia Elvira, ', '2022-01-06 12:27:39', 1, 1, 1),
(69, 'Ha editado sus datos personales, ha echo los siguientes cambios: su avatar fué cambiado. ', '2022-01-06 12:36:22', 1, 1, 1),
(70, 'Ha editado sus datos personales, ha echo los siguientes cambios: su avatar fué cambiado. ', '2022-01-06 12:36:40', 1, 1, 1),
(71, 'Ha cambiado su contraseña.', '2022-01-08 12:50:36', 1, 1, 1),
(72, 'Ha cambiado su contraseña.', '2022-01-08 12:51:34', 1, 1, 1),
(73, 'Ha creado la marca, Adidas', '2022-01-22 20:32:57', 2, 6, 1),
(74, 'Ha creado la marca, Topper', '2022-01-22 20:47:37', 2, 6, 1),
(75, 'Ha editado una marca, ha echo los siguientes cambios: Una marca cambió su nombre de Topper a Toppers, ', '2022-01-29 13:56:25', 1, 6, 1),
(76, 'Ha editado una marca, ha echo los siguientes cambios: Una marca cambió su nombre de Topper a Topperes, ', '2022-01-29 14:01:47', 1, 6, 1),
(77, 'Ha editado una marca, ha echo los siguientes cambios: Su imagen fué cambiada.', '2022-01-29 14:03:14', 1, 6, 1),
(78, 'Ha editado una marca, ha echo los siguientes cambios: Una marca cambió su nombre de Topperes a Topper, Su imagen fué cambiada.', '2022-01-29 14:03:55', 1, 6, 1),
(79, 'Ha eliminado una marca, Topper', '2022-02-02 22:21:35', 3, 6, 1),
(80, 'Ha creado la marca, Puma', '2022-02-05 12:07:04', 2, 6, 1),
(81, 'Ha editado una marca, ha echo los siguientes cambios: cambió su descripción de d a Ropa Deportiva, ', '2022-02-05 12:39:59', 1, 6, 1),
(82, 'Ha editado una marca, ha echo los siguientes cambios: cambió su descripción de c a Ropa Deportiva, ', '2022-02-05 12:40:30', 1, 6, 1),
(83, 'Ha editado una marca, ha echo los siguientes cambios: cambió su descripción de a a Tecnología, ', '2022-02-05 12:41:35', 1, 6, 1),
(84, 'Ha editado una marca, ha echo los siguientes cambios: Su imagen fué cambiada.', '2022-02-05 12:43:42', 1, 6, 1),
(85, 'Ha editado una marca, ha echo los siguientes cambios: cambió su descripción de b a Tecnología, Su imagen fué cambiada.', '2022-02-05 12:45:43', 1, 6, 1),
(86, 'Ha creado una solicitud marca, Flecha', '2022-02-12 16:59:13', 2, 6, 1),
(87, 'Ha creado una solicitud marca, Motorola', '2022-02-19 14:40:21', 2, 6, 1),
(88, 'Ha editado una solicitud marca, ha echo los siguientes cambios: cambió su nombre de Motorola a Motorolas, ', '2022-02-19 14:42:42', 1, 6, 1),
(89, 'Ha editado una solicitud marca, ha echo los siguientes cambios: cambió su nombre de Motorolas a Motorola, ', '2022-02-19 14:42:55', 1, 6, 1),
(90, 'Ha eliminado una solicitud marca, Motorola', '2022-02-24 10:45:22', 3, 6, 1),
(91, 'Ha aprobado una solicitud marca, Motorola', '2022-02-27 18:56:56', 1, 6, 2),
(92, 'Ha aprobado una solicitud marca, Flecha', '2022-02-27 18:58:22', 1, 6, 2),
(93, 'Ha creado la marca, Motorola', '2022-03-04 22:09:24', 2, 6, 2),
(94, 'Ha rechazado una solicitud marca, Motorola', '2022-03-04 22:12:10', 1, 6, 2),
(95, 'Ha aprobado una solicitud marca, Flecha', '2022-03-04 22:12:46', 1, 6, 2),
(96, 'Ha editado una solicitud marca, ha echo los siguientes cambios: cambió su nombre de Motorola a Xiaomi, Su imagen fué cambiada.', '2022-03-04 22:50:26', 1, 6, 1),
(97, 'Ha aprobado una solicitud marca, Xiaomi', '2022-03-04 22:51:49', 1, 6, 2),
(98, 'Ha creado una solicitud marca, Stone', '2022-03-10 12:38:16', 2, 6, 1),
(99, 'Ha rechazado una solicitud marca, Stone', '2022-03-10 14:06:14', 1, 6, 2),
(100, 'Ha editado una solicitud marca, ha echo los siguientes cambios: cambió su descripción de Calzado Deportivo a Calzados Deportivo, ', '2022-03-10 14:10:18', 1, 6, 1),
(101, 'Ha rechazado una solicitud marca, Stone', '2022-03-10 14:12:00', 1, 6, 2),
(102, 'Ha editado una solicitud marca, ha echo los siguientes cambios: cambió su descripción de Calzados Deportivo a Calzado Deportivo, ', '2022-03-10 14:12:44', 1, 6, 1),
(103, 'Ha aprobado una solicitud marca, Stone', '2022-03-10 14:13:26', 1, 6, 2),
(104, 'Ha editado una marca, ha echo los siguientes cambios: cambió su nombre de Stone a Stoness, ', '2022-03-12 12:52:47', 1, 6, 2),
(105, 'Ha creado la marca, H&M', '2022-03-12 17:37:53', 2, 6, 2),
(106, 'Ha editado una marca, ha echo los siguientes cambios: Su imagen fué cambiada.', '2022-03-12 17:46:24', 1, 6, 2),
(107, 'Ha editado una marca, ha echo los siguientes cambios: Su imagen fué cambiada.', '2022-03-12 17:46:42', 1, 6, 2),
(108, 'Ha creado una solicitud marca, G-Start', '2022-03-12 18:07:05', 2, 6, 1),
(109, 'Ha editado una solicitud marca, ha echo los siguientes cambios: Su imagen fué cambiada.', '2022-03-12 18:07:29', 1, 6, 1),
(110, 'Ha editado una solicitud marca, ha echo los siguientes cambios: Su imagen fué cambiada.', '2022-03-12 18:07:46', 1, 6, 1),
(111, 'Ha editado una marca, ha echo los siguientes cambios: cambió su nombre de H&M a H&Ms, ', '2022-03-12 18:16:19', 1, 6, 2),
(112, 'Ha editado una marca, ha echo los siguientes cambios: cambió su nombre de H&Ms a H&M, ', '2022-03-12 18:17:00', 1, 6, 2),
(113, 'Ha editado una solicitud marca, ha echo los siguientes cambios: cambió su nombre de G-Start a G-Star, ', '2022-03-12 18:21:33', 1, 6, 1),
(114, 'Ha creado una solicitud marca, Lacoste', '2022-03-16 21:22:16', 2, 6, 1),
(115, 'Ha aprobado una solicitud marca, Lacoste', '2022-03-16 21:23:41', 1, 6, 2),
(116, 'Se removió de favoritos el producto: Samsung Galaxy A21S', '2022-03-16 21:27:35', 3, 5, 1),
(117, 'Se agregó a favoritos el producto: Samsung Galaxy A21S', '2022-03-16 21:27:40', 2, 5, 1),
(118, 'Ha enviado una solicitud marca, G-Star', '2022-03-19 18:58:54', 1, 6, 1),
(119, 'Ha rechazado una solicitud marca, G-Star', '2022-03-23 20:29:38', 1, 6, 2),
(120, 'Ha editado una solicitud marca, ha echo los siguientes cambios: cambió su descripción de Indumentaria Hombre, Mujer a Indumentaria Hombre, Mujeres, ', '2022-03-23 20:30:33', 1, 6, 1),
(121, 'Ha enviado una solicitud marca, G-Star', '2022-03-23 21:04:36', 1, 6, 1),
(122, 'Ha creado una solicitud marca, prueba1', '2022-03-26 18:15:13', 2, 6, 1),
(123, 'Ha creado una solicitud marca, prueba2', '2022-03-26 18:15:39', 2, 6, 1),
(124, 'Ha creado una solicitud marca, prueba3', '2022-03-26 18:16:00', 2, 6, 1),
(125, 'Ha creado una solicitud marca, prueba4', '2022-03-26 18:16:22', 2, 6, 1),
(126, 'Ha creado una solicitud marca, prueba5', '2022-03-26 18:16:42', 2, 6, 1),
(127, 'Ha creado una solicitud marca, prueba6', '2022-03-26 18:17:06', 2, 6, 1),
(128, 'Ha creado una solicitud marca, prueba7', '2022-03-26 18:17:38', 2, 6, 1),
(129, 'Ha creado una solicitud marca, prueba8', '2022-03-26 18:17:52', 2, 6, 1),
(130, 'Ha creado una solicitud marca, prueba9 ', '2022-03-26 18:18:09', 2, 6, 1),
(131, 'Ha enviado una solicitud marca, prueba9 ', '2022-03-26 18:18:23', 1, 6, 1),
(132, 'Ha enviado una solicitud marca, prueba8', '2022-03-26 18:18:24', 1, 6, 1),
(133, 'Ha enviado una solicitud marca, prueba7', '2022-03-26 18:18:25', 1, 6, 1),
(134, 'Ha enviado una solicitud marca, prueba6', '2022-03-26 18:18:26', 1, 6, 1),
(135, 'Ha enviado una solicitud marca, prueba5', '2022-03-26 18:18:27', 1, 6, 1),
(136, 'Ha enviado una solicitud marca, prueba4', '2022-03-26 18:18:29', 1, 6, 1),
(137, 'Ha enviado una solicitud marca, prueba3', '2022-03-26 18:18:29', 1, 6, 1),
(138, 'Ha enviado una solicitud marca, prueba2', '2022-03-26 18:18:30', 1, 6, 1),
(139, 'Ha creado una solicitud marca, prueba10', '2022-03-26 18:19:34', 2, 6, 1),
(140, 'Ha enviado una solicitud marca, prueba10', '2022-03-26 18:20:15', 1, 6, 1),
(141, 'Ha eliminado un mensaje', '2022-03-30 22:06:17', 3, 7, 2),
(142, 'Ha eliminado un mensaje', '2022-04-14 15:41:03', 3, 7, 2),
(143, 'Ha eliminado un mensaje', '2022-04-14 15:53:35', 3, 7, 2),
(144, 'Ha eliminado un mensaje', '2022-04-14 16:26:16', 3, 7, 2),
(145, 'Ha eliminado un mensaje', '2022-04-14 16:26:16', 3, 7, 2),
(146, 'Ha eliminado un mensaje', '2022-04-14 16:26:52', 3, 7, 2),
(147, 'Ha eliminado un mensaje', '2022-04-14 16:26:52', 3, 7, 2),
(148, 'Ha eliminado un mensaje', '2022-04-14 16:26:52', 3, 7, 2),
(149, 'Ha eliminado un mensaje', '2022-04-14 16:26:52', 3, 7, 2),
(150, 'Ha eliminado un mensaje', '2022-04-14 16:30:25', 3, 7, 2),
(151, 'Ha eliminado un mensaje', '2022-04-14 16:31:13', 3, 7, 2),
(152, 'Ha eliminado un mensaje', '2022-04-17 14:49:17', 3, 7, 2),
(153, 'Ha eliminado un mensaje', '2022-04-17 14:49:22', 3, 7, 2),
(154, 'Ha eliminado un mensaje', '2022-04-17 14:49:43', 3, 7, 2),
(155, 'Ha eliminado un mensaje definitivamente', '2022-04-17 15:21:48', 3, 7, 2),
(156, 'Ha eliminado un mensaje definitivamente', '2022-04-17 15:21:48', 3, 7, 2),
(157, 'Ha eliminado un mensaje definitivamente', '2022-04-17 15:23:13', 3, 7, 2),
(158, 'Ha eliminado un mensaje', '2022-04-17 15:23:23', 3, 7, 2),
(159, 'Ha eliminado un mensaje', '2022-04-17 15:23:23', 3, 7, 2),
(160, 'Ha eliminado un mensaje', '2022-04-17 15:23:23', 3, 7, 2),
(161, 'Ha eliminado un mensaje', '2022-04-17 15:23:23', 3, 7, 2),
(162, 'Ha eliminado un mensaje definitivamente', '2022-04-17 16:11:16', 3, 7, 2),
(163, 'Ha eliminado un mensaje definitivamente', '2022-04-17 16:11:26', 3, 7, 2),
(164, 'Se agregó a favoritos el producto: Samsung Galaxy A21S', '2022-04-19 21:29:00', 2, 5, 2),
(165, 'Ha creado una nueva dirección: El Arreo 225', '2022-04-19 21:30:41', 2, 1, 2),
(166, 'Ha creado una solicitud marca, Pirulo', '2022-04-19 21:32:26', 2, 6, 1),
(167, 'Ha enviado una solicitud marca, Pirulo', '2022-04-19 21:33:01', 1, 6, 1),
(168, 'Se agregó a favoritos el producto: iPhone 11', '2022-04-21 14:02:21', 2, 5, 2),
(169, 'Ha creado una solicitud marca, Pepito', '2022-04-21 14:05:29', 2, 6, 1),
(170, 'Ha enviado una solicitud marca, Pepito', '2022-04-21 14:05:59', 1, 6, 1),
(171, 'Ha enviado un mensaje para: Natalia Elvira Oduber', '2022-04-23 14:00:17', 2, 7, 2),
(172, 'Ha enviado un mensaje para: Natalia Elvira Oduber', '2022-04-23 14:05:37', 2, 7, 2),
(173, 'Ha enviado un mensaje para: Pablo Martin Morrone', '2022-04-27 20:10:25', 2, 7, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `imagen`
--

CREATE TABLE `imagen` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `fecha_creacion` datetime NOT NULL DEFAULT current_timestamp(),
  `fecha_edicion` datetime NOT NULL DEFAULT current_timestamp(),
  `estado` varchar(10) NOT NULL DEFAULT 'A',
  `id_producto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `imagen`
--

INSERT INTO `imagen` (`id`, `nombre`, `fecha_creacion`, `fecha_edicion`, `estado`, `id_producto`) VALUES
(1, 'a21s-1.png', '2021-08-21 00:44:28', '2021-08-21 00:44:28', 'A', 1),
(2, 'a21s-2.png', '2021-08-21 00:44:28', '2021-08-21 00:44:28', 'A', 1),
(3, 'a21s-3.png', '2021-08-21 00:44:28', '2021-08-21 00:44:28', 'A', 1),
(4, 'a21s-4.png', '2021-08-21 00:44:28', '2021-08-21 00:44:28', 'A', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `localidades`
--

CREATE TABLE `localidades` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `id_provincia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `localidades`
--

INSERT INTO `localidades` (`id`, `nombre`, `id_provincia`) VALUES
(1, '25 de Mayo', 1),
(2, '3 de febrero', 1),
(3, 'A. Alsina', 1),
(4, 'A. Gonzáles Cháves', 1),
(5, 'Aguas Verdes', 1),
(6, 'Alberti', 1),
(7, 'Arrecifes', 1),
(8, 'Ayacucho', 1),
(9, 'Azul', 1),
(10, 'Bahía Blanca', 1),
(11, 'Balcarce', 1),
(12, 'Baradero', 1),
(13, 'Benito Juárez', 1),
(14, 'Berisso', 1),
(15, 'Bolívar', 1),
(16, 'Bragado', 1),
(17, 'Brandsen', 1),
(18, 'Campana', 1),
(19, 'Cañuelas', 1),
(20, 'Capilla del Señor', 1),
(21, 'Capitán Sarmiento', 1),
(22, 'Carapachay', 1),
(23, 'Carhue', 1),
(24, 'Cariló', 1),
(25, 'Carlos Casares', 1),
(26, 'Carlos Tejedor', 1),
(27, 'Carmen de Areco', 1),
(28, 'Carmen de Patagones', 1),
(29, 'Castelli', 1),
(30, 'Chacabuco', 1),
(31, 'Chascomús', 1),
(32, 'Chivilcoy', 1),
(33, 'Colón', 1),
(34, 'Coronel Dorrego', 1),
(35, 'Coronel Pringles', 1),
(36, 'Coronel Rosales', 1),
(37, 'Coronel Suarez', 1),
(38, 'Costa Azul', 1),
(39, 'Costa Chica', 1),
(40, 'Costa del Este', 1),
(41, 'Costa Esmeralda', 1),
(42, 'Daireaux', 1),
(43, 'Darregueira', 1),
(44, 'Del Viso', 1),
(45, 'Dolores', 1),
(46, 'Don Torcuato', 1),
(47, 'Ensenada', 1),
(48, 'Escobar', 1),
(49, 'Exaltación de la Cruz', 1),
(50, 'Florentino Ameghino', 1),
(51, 'Garín', 1),
(52, 'Gral. Alvarado', 1),
(53, 'Gral. Alvear', 1),
(54, 'Gral. Arenales', 1),
(55, 'Gral. Belgrano', 1),
(56, 'Gral. Guido', 1),
(57, 'Gral. Lamadrid', 1),
(58, 'Gral. Las Heras', 1),
(59, 'Gral. Lavalle', 1),
(60, 'Gral. Madariaga', 1),
(61, 'Gral. Pacheco', 1),
(62, 'Gral. Paz', 1),
(63, 'Gral. Pinto', 1),
(64, 'Gral. Pueyrredón', 1),
(65, 'Gral. Rodríguez', 1),
(66, 'Gral. Viamonte', 1),
(67, 'Gral. Villegas', 1),
(68, 'Guaminí', 1),
(69, 'Guernica', 1),
(70, 'Hipólito Yrigoyen', 1),
(71, 'Ing. Maschwitz', 1),
(72, 'Junín', 1),
(73, 'La Plata', 1),
(74, 'Laprida', 1),
(75, 'Las Flores', 1),
(76, 'Las Toninas', 1),
(77, 'Leandro N. Alem', 1),
(78, 'Lincoln', 1),
(79, 'Loberia', 1),
(80, 'Lobos', 1),
(81, 'Los Cardales', 1),
(82, 'Los Toldos', 1),
(83, 'Lucila del Mar', 1),
(84, 'Luján', 1),
(85, 'Magdalena', 1),
(86, 'Maipú', 1),
(87, 'Mar Chiquita', 1),
(88, 'Mar de Ajó', 1),
(89, 'Mar de las Pampas', 1),
(90, 'Mar del Plata', 1),
(91, 'Mar del Tuyú', 1),
(92, 'Marcos Paz', 1),
(93, 'Mercedes', 1),
(94, 'Miramar', 1),
(95, 'Monte', 1),
(96, 'Monte Hermoso', 1),
(97, 'Munro', 1),
(98, 'Navarro', 1),
(99, 'Necochea', 1),
(100, 'Olavarría', 1),
(101, 'Partido de la Costa', 1),
(102, 'Pehuajó', 1),
(103, 'Pellegrini', 1),
(104, 'Pergamino', 1),
(105, 'Pigüé', 1),
(106, 'Pila', 1),
(107, 'Pilar', 1),
(108, 'Pinamar', 1),
(109, 'Pinar del Sol', 1),
(110, 'Polvorines', 1),
(111, 'Pte. Perón', 1),
(112, 'Puán', 1),
(113, 'Punta Indio', 1),
(114, 'Ramallo', 1),
(115, 'Rauch', 1),
(116, 'Rivadavia', 1),
(117, 'Rojas', 1),
(118, 'Roque Pérez', 1),
(119, 'Saavedra', 1),
(120, 'Saladillo', 1),
(121, 'Salliqueló', 1),
(122, 'Salto', 1),
(123, 'San Andrés de Giles', 1),
(124, 'San Antonio de Areco', 1),
(125, 'San Antonio de Padua', 1),
(126, 'San Bernardo', 1),
(127, 'San Cayetano', 1),
(128, 'San Clemente del Tuyú', 1),
(129, 'San Nicolás', 1),
(130, 'San Pedro', 1),
(131, 'San Vicente', 1),
(132, 'Santa Teresita', 1),
(133, 'Suipacha', 1),
(134, 'Tandil', 1),
(135, 'Tapalqué', 1),
(136, 'Tordillo', 1),
(137, 'Tornquist', 1),
(138, 'Trenque Lauquen', 1),
(139, 'Tres Lomas', 1),
(140, 'Villa Gesell', 1),
(141, 'Villarino', 1),
(142, 'Zárate', 1),
(143, '11 de Septiembre', 2),
(144, '20 de Junio', 2),
(145, '25 de Mayo', 2),
(146, 'Acassuso', 2),
(147, 'Adrogué', 2),
(148, 'Aldo Bonzi', 2),
(149, 'Área Reserva Cinturón Ecológico', 2),
(150, 'Avellaneda', 2),
(151, 'Banfield', 2),
(152, 'Barrio Parque', 2),
(153, 'Barrio Santa Teresita', 2),
(154, 'Beccar', 2),
(155, 'Bella Vista', 2),
(156, 'Berazategui', 2),
(157, 'Bernal Este', 2),
(158, 'Bernal Oeste', 2),
(159, 'Billinghurst', 2),
(160, 'Boulogne', 2),
(161, 'Burzaco', 2),
(162, 'Carapachay', 2),
(163, 'Caseros', 2),
(164, 'Castelar', 2),
(165, 'Churruca', 2),
(166, 'Ciudad Evita', 2),
(167, 'Ciudad Madero', 2),
(168, 'Ciudadela', 2),
(169, 'Claypole', 2),
(170, 'Crucecita', 2),
(171, 'Dock Sud', 2),
(172, 'Don Bosco', 2),
(173, 'Don Orione', 2),
(174, 'El Jagüel', 2),
(175, 'El Libertador', 2),
(176, 'El Palomar', 2),
(177, 'El Tala', 2),
(178, 'El Trébol', 2),
(179, 'Ezeiza', 2),
(180, 'Ezpeleta', 2),
(181, 'Florencio Varela', 2),
(182, 'Florida', 2),
(183, 'Francisco Álvarez', 2),
(184, 'Gerli', 2),
(185, 'Glew', 2),
(186, 'González Catán', 2),
(187, 'Gral. Lamadrid', 2),
(188, 'Grand Bourg', 2),
(189, 'Gregorio de Laferrere', 2),
(190, 'Guillermo Enrique Hudson', 2),
(191, 'Haedo', 2),
(192, 'Hurlingham', 2),
(193, 'Ing. Sourdeaux', 2),
(194, 'Isidro Casanova', 2),
(195, 'Ituzaingó', 2),
(196, 'José C. Paz', 2),
(197, 'José Ingenieros', 2),
(198, 'José Marmol', 2),
(199, 'La Lucila', 2),
(200, 'La Reja', 2),
(201, 'La Tablada', 2),
(202, 'Lanús', 2),
(203, 'Llavallol', 2),
(204, 'Loma Hermosa', 2),
(205, 'Lomas de Zamora', 2),
(206, 'Lomas del Millón', 2),
(207, 'Lomas del Mirador', 2),
(208, 'Longchamps', 2),
(209, 'Los Polvorines', 2),
(210, 'Luis Guillón', 2),
(211, 'Malvinas Argentinas', 2),
(212, 'Martín Coronado', 2),
(213, 'Martínez', 2),
(214, 'Merlo', 2),
(215, 'Ministro Rivadavia', 2),
(216, 'Monte Chingolo', 2),
(217, 'Monte Grande', 2),
(218, 'Moreno', 2),
(219, 'Morón', 2),
(220, 'Muñiz', 2),
(221, 'Olivos', 2),
(222, 'Pablo Nogués', 2),
(223, 'Pablo Podestá', 2),
(224, 'Paso del Rey', 2),
(225, 'Pereyra', 2),
(226, 'Piñeiro', 2),
(227, 'Plátanos', 2),
(228, 'Pontevedra', 2),
(229, 'Quilmes', 2),
(230, 'Rafael Calzada', 2),
(231, 'Rafael Castillo', 2),
(232, 'Ramos Mejía', 2),
(233, 'Ranelagh', 2),
(234, 'Remedios de Escalada', 2),
(235, 'Sáenz Peña', 2),
(236, 'San Antonio de Padua', 2),
(237, 'San Fernando', 2),
(238, 'San Francisco Solano', 2),
(239, 'San Isidro', 2),
(240, 'San José', 2),
(241, 'San Justo', 2),
(242, 'San Martín', 2),
(243, 'San Miguel', 2),
(244, 'Santos Lugares', 2),
(245, 'Sarandí', 2),
(246, 'Sourigues', 2),
(247, 'Tapiales', 2),
(248, 'Temperley', 2),
(249, 'Tigre', 2),
(250, 'Tortuguitas', 2),
(251, 'Tristán Suárez', 2),
(252, 'Trujui', 2),
(253, 'Turdera', 2),
(254, 'Valentín Alsina', 2),
(255, 'Vicente López', 2),
(256, 'Villa Adelina', 2),
(257, 'Villa Ballester', 2),
(258, 'Villa Bosch', 2),
(259, 'Villa Caraza', 2),
(260, 'Villa Celina', 2),
(261, 'Villa Centenario', 2),
(262, 'Villa de Mayo', 2),
(263, 'Villa Diamante', 2),
(264, 'Villa Domínico', 2),
(265, 'Villa España', 2),
(266, 'Villa Fiorito', 2),
(267, 'Villa Guillermina', 2),
(268, 'Villa Insuperable', 2),
(269, 'Villa José León Suárez', 2),
(270, 'Villa La Florida', 2),
(271, 'Villa Luzuriaga', 2),
(272, 'Villa Martelli', 2),
(273, 'Villa Obrera', 2),
(274, 'Villa Progreso', 2),
(275, 'Villa Raffo', 2),
(276, 'Villa Sarmiento', 2),
(277, 'Villa Tesei', 2),
(278, 'Villa Udaondo', 2),
(279, 'Virrey del Pino', 2),
(280, 'Wilde', 2),
(281, 'William Morris', 2),
(282, 'Agronomía', 3),
(283, 'Almagro', 3),
(284, 'Balvanera', 3),
(285, 'Barracas', 3),
(286, 'Belgrano', 3),
(287, 'Boca', 3),
(288, 'Boedo', 3),
(289, 'Caballito', 3),
(290, 'Chacarita', 3),
(291, 'Coghlan', 3),
(292, 'Colegiales', 3),
(293, 'Constitución', 3),
(294, 'Flores', 3),
(295, 'Floresta', 3),
(296, 'La Paternal', 3),
(297, 'Liniers', 3),
(298, 'Mataderos', 3),
(299, 'Monserrat', 3),
(300, 'Monte Castro', 3),
(301, 'Nueva Pompeya', 3),
(302, 'Núñez', 3),
(303, 'Palermo', 3),
(304, 'Parque Avellaneda', 3),
(305, 'Parque Chacabuco', 3),
(306, 'Parque Chas', 3),
(307, 'Parque Patricios', 3),
(308, 'Puerto Madero', 3),
(309, 'Recoleta', 3),
(310, 'Retiro', 3),
(311, 'Saavedra', 3),
(312, 'San Cristóbal', 3),
(313, 'San Nicolás', 3),
(314, 'San Telmo', 3),
(315, 'Vélez Sársfield', 3),
(316, 'Versalles', 3),
(317, 'Villa Crespo', 3),
(318, 'Villa del Parque', 3),
(319, 'Villa Devoto', 3),
(320, 'Villa Gral. Mitre', 3),
(321, 'Villa Lugano', 3),
(322, 'Villa Luro', 3),
(323, 'Villa Ortúzar', 3),
(324, 'Villa Pueyrredón', 3),
(325, 'Villa Real', 3),
(326, 'Villa Riachuelo', 3),
(327, 'Villa Santa Rita', 3),
(328, 'Villa Soldati', 3),
(329, 'Villa Urquiza', 3),
(330, 'Aconquija', 4),
(331, 'Ancasti', 4),
(332, 'Andalgalá', 4),
(333, 'Antofagasta', 4),
(334, 'Belén', 4),
(335, 'Capayán', 4),
(336, 'Capital', 4),
(337, '4', 4),
(338, 'Corral Quemado', 4),
(339, 'El Alto', 4),
(340, 'El Rodeo', 4),
(341, 'F.Mamerto Esquiú', 4),
(342, 'Fiambalá', 4),
(343, 'Hualfín', 4),
(344, 'Huillapima', 4),
(345, 'Icaño', 4),
(346, 'La Puerta', 4),
(347, 'Las Juntas', 4),
(348, 'Londres', 4),
(349, 'Los Altos', 4),
(350, 'Los Varela', 4),
(351, 'Mutquín', 4),
(352, 'Paclín', 4),
(353, 'Poman', 4),
(354, 'Pozo de La Piedra', 4),
(355, 'Puerta de Corral', 4),
(356, 'Puerta San José', 4),
(357, 'Recreo', 4),
(358, 'S.F.V de 4', 4),
(359, 'San Fernando', 4),
(360, 'San Fernando del Valle', 4),
(361, 'San José', 4),
(362, 'Santa María', 4),
(363, 'Santa Rosa', 4),
(364, 'Saujil', 4),
(365, 'Tapso', 4),
(366, 'Tinogasta', 4),
(367, 'Valle Viejo', 4),
(368, 'Villa Vil', 4),
(369, 'Aviá Teraí', 5),
(370, 'Barranqueras', 5),
(371, 'Basail', 5),
(372, 'Campo Largo', 5),
(373, 'Capital', 5),
(374, 'Capitán Solari', 5),
(375, 'Charadai', 5),
(376, 'Charata', 5),
(377, 'Chorotis', 5),
(378, 'Ciervo Petiso', 5),
(379, 'Cnel. Du Graty', 5),
(380, 'Col. Benítez', 5),
(381, 'Col. Elisa', 5),
(382, 'Col. Popular', 5),
(383, 'Colonias Unidas', 5),
(384, 'Concepción', 5),
(385, 'Corzuela', 5),
(386, 'Cote Lai', 5),
(387, 'El Sauzalito', 5),
(388, 'Enrique Urien', 5),
(389, 'Fontana', 5),
(390, 'Fte. Esperanza', 5),
(391, 'Gancedo', 5),
(392, 'Gral. Capdevila', 5),
(393, 'Gral. Pinero', 5),
(394, 'Gral. San Martín', 5),
(395, 'Gral. Vedia', 5),
(396, 'Hermoso Campo', 5),
(397, 'I. del Cerrito', 5),
(398, 'J.J. Castelli', 5),
(399, 'La Clotilde', 5),
(400, 'La Eduvigis', 5),
(401, 'La Escondida', 5),
(402, 'La Leonesa', 5),
(403, 'La Tigra', 5),
(404, 'La Verde', 5),
(405, 'Laguna Blanca', 5),
(406, 'Laguna Limpia', 5),
(407, 'Lapachito', 5),
(408, 'Las Breñas', 5),
(409, 'Las Garcitas', 5),
(410, 'Las Palmas', 5),
(411, 'Los Frentones', 5),
(412, 'Machagai', 5),
(413, 'Makallé', 5),
(414, 'Margarita Belén', 5),
(415, 'Miraflores', 5),
(416, 'Misión N. Pompeya', 5),
(417, 'Napenay', 5),
(418, 'Pampa Almirón', 5),
(419, 'Pampa del Indio', 5),
(420, 'Pampa del Infierno', 5),
(421, 'Pdcia. de La Plaza', 5),
(422, 'Pdcia. Roca', 5),
(423, 'Pdcia. Roque Sáenz Peña', 5),
(424, 'Pto. Bermejo', 5),
(425, 'Pto. Eva Perón', 5),
(426, 'Puero Tirol', 5),
(427, 'Puerto Vilelas', 5),
(428, 'Quitilipi', 5),
(429, 'Resistencia', 5),
(430, 'Sáenz Peña', 5),
(431, 'Samuhú', 5),
(432, 'San Bernardo', 5),
(433, 'Santa Sylvina', 5),
(434, 'Taco Pozo', 5),
(435, 'Tres Isletas', 5),
(436, 'Villa Ángela', 5),
(437, 'Villa Berthet', 5),
(438, 'Villa R. Bermejito', 5),
(439, 'Aldea Apeleg', 6),
(440, 'Aldea Beleiro', 6),
(441, 'Aldea Epulef', 6),
(442, 'Alto Río Sengerr', 6),
(443, 'Buen Pasto', 6),
(444, 'Camarones', 6),
(445, 'Carrenleufú', 6),
(446, 'Cholila', 6),
(447, 'Co. Centinela', 6),
(448, 'Colan Conhué', 6),
(449, 'Comodoro Rivadavia', 6),
(450, 'Corcovado', 6),
(451, 'Cushamen', 6),
(452, 'Dique F. Ameghino', 6),
(453, 'Dolavón', 6),
(454, 'Dr. R. Rojas', 6),
(455, 'El Hoyo', 6),
(456, 'El Maitén', 6),
(457, 'Epuyén', 6),
(458, 'Esquel', 6),
(459, 'Facundo', 6),
(460, 'Gaimán', 6),
(461, 'Gan Gan', 6),
(462, 'Gastre', 6),
(463, 'Gdor. Costa', 6),
(464, 'Gualjaina', 6),
(465, 'J. de San Martín', 6),
(466, 'Lago Blanco', 6),
(467, 'Lago Puelo', 6),
(468, 'Lagunita Salada', 6),
(469, 'Las Plumas', 6),
(470, 'Los Altares', 6),
(471, 'Paso de los Indios', 6),
(472, 'Paso del Sapo', 6),
(473, 'Pto. Madryn', 6),
(474, 'Pto. Pirámides', 6),
(475, 'Rada Tilly', 6),
(476, 'Rawson', 6),
(477, 'Río Mayo', 6),
(478, 'Río Pico', 6),
(479, 'Sarmiento', 6),
(480, 'Tecka', 6),
(481, 'Telsen', 6),
(482, 'Trelew', 6),
(483, 'Trevelin', 6),
(484, 'Veintiocho de Julio', 6),
(485, 'Achiras', 7),
(486, 'Adelia Maria', 7),
(487, 'Agua de Oro', 7),
(488, 'Alcira Gigena', 7),
(489, 'Aldea Santa Maria', 7),
(490, 'Alejandro Roca', 7),
(491, 'Alejo Ledesma', 7),
(492, 'Alicia', 7),
(493, 'Almafuerte', 7),
(494, 'Alpa Corral', 7),
(495, 'Alta Gracia', 7),
(496, 'Alto Alegre', 7),
(497, 'Alto de Los Quebrachos', 7),
(498, 'Altos de Chipion', 7),
(499, 'Amboy', 7),
(500, 'Ambul', 7),
(501, 'Ana Zumaran', 7),
(502, 'Anisacate', 7),
(503, 'Arguello', 7),
(504, 'Arias', 7),
(505, 'Arroyito', 7),
(506, 'Arroyo Algodon', 7),
(507, 'Arroyo Cabral', 7),
(508, 'Arroyo Los Patos', 7),
(509, 'Assunta', 7),
(510, 'Atahona', 7),
(511, 'Ausonia', 7),
(512, 'Avellaneda', 7),
(513, 'Ballesteros', 7),
(514, 'Ballesteros Sud', 7),
(515, 'Balnearia', 7),
(516, 'Bañado de Soto', 7),
(517, 'Bell Ville', 7),
(518, 'Bengolea', 7),
(519, 'Benjamin Gould', 7),
(520, 'Berrotaran', 7),
(521, 'Bialet Masse', 7),
(522, 'Bouwer', 7),
(523, 'Brinkmann', 7),
(524, 'Buchardo', 7),
(525, 'Bulnes', 7),
(526, 'Cabalango', 7),
(527, 'Calamuchita', 7),
(528, 'Calchin', 7),
(529, 'Calchin Oeste', 7),
(530, 'Calmayo', 7),
(531, 'Camilo Aldao', 7),
(532, 'Caminiaga', 7),
(533, 'Cañada de Luque', 7),
(534, 'Cañada de Machado', 7),
(535, 'Cañada de Rio Pinto', 7),
(536, 'Cañada del Sauce', 7),
(537, 'Canals', 7),
(538, 'Candelaria Sud', 7),
(539, 'Capilla de Remedios', 7),
(540, 'Capilla de Siton', 7),
(541, 'Capilla del Carmen', 7),
(542, 'Capilla del Monte', 7),
(543, 'Capital', 7),
(544, 'Capitan Gral B. O´Higgins', 7),
(545, 'Carnerillo', 7),
(546, 'Carrilobo', 7),
(547, 'Casa Grande', 7),
(548, 'Cavanagh', 7),
(549, 'Cerro Colorado', 7),
(550, 'Chaján', 7),
(551, 'Chalacea', 7),
(552, 'Chañar Viejo', 7),
(553, 'Chancaní', 7),
(554, 'Charbonier', 7),
(555, 'Charras', 7),
(556, 'Chazón', 7),
(557, 'Chilibroste', 7),
(558, 'Chucul', 7),
(559, 'Chuña', 7),
(560, 'Chuña Huasi', 7),
(561, 'Churqui Cañada', 7),
(562, 'Cienaga Del Coro', 7),
(563, 'Cintra', 7),
(564, 'Col. Almada', 7),
(565, 'Col. Anita', 7),
(566, 'Col. Barge', 7),
(567, 'Col. Bismark', 7),
(568, 'Col. Bremen', 7),
(569, 'Col. Caroya', 7),
(570, 'Col. Italiana', 7),
(571, 'Col. Iturraspe', 7),
(572, 'Col. Las Cuatro Esquinas', 7),
(573, 'Col. Las Pichanas', 7),
(574, 'Col. Marina', 7),
(575, 'Col. Prosperidad', 7),
(576, 'Col. San Bartolome', 7),
(577, 'Col. San Pedro', 7),
(578, 'Col. Tirolesa', 7),
(579, 'Col. Vicente Aguero', 7),
(580, 'Col. Videla', 7),
(581, 'Col. Vignaud', 7),
(582, 'Col. Waltelina', 7),
(583, 'Colazo', 7),
(584, 'Comechingones', 7),
(585, 'Conlara', 7),
(586, 'Copacabana', 7),
(587, '7', 7),
(588, 'Coronel Baigorria', 7),
(589, 'Coronel Moldes', 7),
(590, 'Corral de Bustos', 7),
(591, 'Corralito', 7),
(592, 'Cosquín', 7),
(593, 'Costa Sacate', 7),
(594, 'Cruz Alta', 7),
(595, 'Cruz de Caña', 7),
(596, 'Cruz del Eje', 7),
(597, 'Cuesta Blanca', 7),
(598, 'Dean Funes', 7),
(599, 'Del Campillo', 7),
(600, 'Despeñaderos', 7),
(601, 'Devoto', 7),
(602, 'Diego de Rojas', 7),
(603, 'Dique Chico', 7),
(604, 'El Arañado', 7),
(605, 'El Brete', 7),
(606, 'El Chacho', 7),
(607, 'El Crispín', 7),
(608, 'El Fortín', 7),
(609, 'El Manzano', 7),
(610, 'El Rastreador', 7),
(611, 'El Rodeo', 7),
(612, 'El Tío', 7),
(613, 'Elena', 7),
(614, 'Embalse', 7),
(615, 'Esquina', 7),
(616, 'Estación Gral. Paz', 7),
(617, 'Estación Juárez Celman', 7),
(618, 'Estancia de Guadalupe', 7),
(619, 'Estancia Vieja', 7),
(620, 'Etruria', 7),
(621, 'Eufrasio Loza', 7),
(622, 'Falda del Carmen', 7),
(623, 'Freyre', 7),
(624, 'Gral. Baldissera', 7),
(625, 'Gral. Cabrera', 7),
(626, 'Gral. Deheza', 7),
(627, 'Gral. Fotheringham', 7),
(628, 'Gral. Levalle', 7),
(629, 'Gral. Roca', 7),
(630, 'Guanaco Muerto', 7),
(631, 'Guasapampa', 7),
(632, 'Guatimozin', 7),
(633, 'Gutenberg', 7),
(634, 'Hernando', 7),
(635, 'Huanchillas', 7),
(636, 'Huerta Grande', 7),
(637, 'Huinca Renanco', 7),
(638, 'Idiazabal', 7),
(639, 'Impira', 7),
(640, 'Inriville', 7),
(641, 'Isla Verde', 7),
(642, 'Italó', 7),
(643, 'James Craik', 7),
(644, 'Jesús María', 7),
(645, 'Jovita', 7),
(646, 'Justiniano Posse', 7),
(647, 'Km 658', 7),
(648, 'L. V. Mansilla', 7),
(649, 'La Batea', 7),
(650, 'La Calera', 7),
(651, 'La Carlota', 7),
(652, 'La Carolina', 7),
(653, 'La Cautiva', 7),
(654, 'La Cesira', 7),
(655, 'La Cruz', 7),
(656, 'La Cumbre', 7),
(657, 'La Cumbrecita', 7),
(658, 'La Falda', 7),
(659, 'La Francia', 7),
(660, 'La Granja', 7),
(661, 'La Higuera', 7),
(662, 'La Laguna', 7),
(663, 'La Paisanita', 7),
(664, 'La Palestina', 7),
(665, '12', 7),
(666, 'La Paquita', 7),
(667, 'La Para', 7),
(668, 'La Paz', 7),
(669, 'La Playa', 7),
(670, 'La Playosa', 7),
(671, 'La Población', 7),
(672, 'La Posta', 7),
(673, 'La Puerta', 7),
(674, 'La Quinta', 7),
(675, 'La Rancherita', 7),
(676, 'La Rinconada', 7),
(677, 'La Serranita', 7),
(678, 'La Tordilla', 7),
(679, 'Laborde', 7),
(680, 'Laboulaye', 7),
(681, 'Laguna Larga', 7),
(682, 'Las Acequias', 7),
(683, 'Las Albahacas', 7),
(684, 'Las Arrias', 7),
(685, 'Las Bajadas', 7),
(686, 'Las Caleras', 7),
(687, 'Las Calles', 7),
(688, 'Las Cañadas', 7),
(689, 'Las Gramillas', 7),
(690, 'Las Higueras', 7),
(691, 'Las Isletillas', 7),
(692, 'Las Junturas', 7),
(693, 'Las Palmas', 7),
(694, 'Las Peñas', 7),
(695, 'Las Peñas Sud', 7),
(696, 'Las Perdices', 7),
(697, 'Las Playas', 7),
(698, 'Las Rabonas', 7),
(699, 'Las Saladas', 7),
(700, 'Las Tapias', 7),
(701, 'Las Varas', 7),
(702, 'Las Varillas', 7),
(703, 'Las Vertientes', 7),
(704, 'Leguizamón', 7),
(705, 'Leones', 7),
(706, 'Los Cedros', 7),
(707, 'Los Cerrillos', 7),
(708, 'Los Chañaritos (C.E)', 7),
(709, 'Los Chanaritos (R.S)', 7),
(710, 'Los Cisnes', 7),
(711, 'Los Cocos', 7),
(712, 'Los Cóndores', 7),
(713, 'Los Hornillos', 7),
(714, 'Los Hoyos', 7),
(715, 'Los Mistoles', 7),
(716, 'Los Molinos', 7),
(717, 'Los Pozos', 7),
(718, 'Los Reartes', 7),
(719, 'Los Surgentes', 7),
(720, 'Los Talares', 7),
(721, 'Los Zorros', 7),
(722, 'Lozada', 7),
(723, 'Luca', 7),
(724, 'Luque', 7),
(725, 'Luyaba', 7),
(726, 'Malagueño', 7),
(727, 'Malena', 7),
(728, 'Malvinas Argentinas', 7),
(729, 'Manfredi', 7),
(730, 'Maquinista Gallini', 7),
(731, 'Marcos Juárez', 7),
(732, 'Marull', 7),
(733, 'Matorrales', 7),
(734, 'Mattaldi', 7),
(735, 'Mayu Sumaj', 7),
(736, 'Media Naranja', 7),
(737, 'Melo', 7),
(738, 'Mendiolaza', 7),
(739, 'Mi Granja', 7),
(740, 'Mina Clavero', 7),
(741, 'Miramar', 7),
(742, 'Morrison', 7),
(743, 'Morteros', 7),
(744, 'Mte. Buey', 7),
(745, 'Mte. Cristo', 7),
(746, 'Mte. De Los Gauchos', 7),
(747, 'Mte. Leña', 7),
(748, 'Mte. Maíz', 7),
(749, 'Mte. Ralo', 7),
(750, 'Nicolás Bruzone', 7),
(751, 'Noetinger', 7),
(752, 'Nono', 7),
(753, 'Nueva 7', 7),
(754, 'Obispo Trejo', 7),
(755, 'Olaeta', 7),
(756, 'Oliva', 7),
(757, 'Olivares San Nicolás', 7),
(758, 'Onagolty', 7),
(759, 'Oncativo', 7),
(760, 'Ordoñez', 7),
(761, 'Pacheco De Melo', 7),
(762, 'Pampayasta N.', 7),
(763, 'Pampayasta S.', 7),
(764, 'Panaholma', 7),
(765, 'Pascanas', 7),
(766, 'Pasco', 7),
(767, 'Paso del Durazno', 7),
(768, 'Paso Viejo', 7),
(769, 'Pilar', 7),
(770, 'Pincén', 7),
(771, 'Piquillín', 7),
(772, 'Plaza de Mercedes', 7),
(773, 'Plaza Luxardo', 7),
(774, 'Porteña', 7),
(775, 'Potrero de Garay', 7),
(776, 'Pozo del Molle', 7),
(777, 'Pozo Nuevo', 7),
(778, 'Pueblo Italiano', 7),
(779, 'Puesto de Castro', 7),
(780, 'Punta del Agua', 7),
(781, 'Quebracho Herrado', 7),
(782, 'Quilino', 7),
(783, 'Rafael García', 7),
(784, 'Ranqueles', 7),
(785, 'Rayo Cortado', 7),
(786, 'Reducción', 7),
(787, 'Rincón', 7),
(788, 'Río Bamba', 7),
(789, 'Río Ceballos', 7),
(790, 'Río Cuarto', 7),
(791, 'Río de Los Sauces', 7),
(792, 'Río Primero', 7),
(793, 'Río Segundo', 7),
(794, 'Río Tercero', 7),
(795, 'Rosales', 7),
(796, 'Rosario del Saladillo', 7),
(797, 'Sacanta', 7),
(798, 'Sagrada Familia', 7),
(799, 'Saira', 7),
(800, 'Saladillo', 7),
(801, 'Saldán', 7),
(802, 'Salsacate', 7),
(803, 'Salsipuedes', 7),
(804, 'Sampacho', 7),
(805, 'San Agustín', 7),
(806, 'San Antonio de Arredondo', 7),
(807, 'San Antonio de Litín', 7),
(808, 'San Basilio', 7),
(809, 'San Carlos Minas', 7),
(810, 'San Clemente', 7),
(811, 'San Esteban', 7),
(812, 'San Francisco', 7),
(813, 'San Ignacio', 7),
(814, 'San Javier', 7),
(815, 'San Jerónimo', 7),
(816, 'San Joaquín', 7),
(817, 'San José de La Dormida', 7),
(818, 'San José de Las Salinas', 7),
(819, 'San Lorenzo', 7),
(820, 'San Marcos Sierras', 7),
(821, 'San Marcos Sud', 7),
(822, 'San Pedro', 7),
(823, 'San Pedro N.', 7),
(824, 'San Roque', 7),
(825, 'San Vicente', 7),
(826, 'Santa Catalina', 7),
(827, 'Santa Elena', 7),
(828, 'Santa Eufemia', 7),
(829, 'Santa Maria', 7),
(830, 'Sarmiento', 7),
(831, 'Saturnino M.Laspiur', 7),
(832, 'Sauce Arriba', 7),
(833, 'Sebastián Elcano', 7),
(834, 'Seeber', 7),
(835, 'Segunda Usina', 7),
(836, 'Serrano', 7),
(837, 'Serrezuela', 7),
(838, 'Sgo. Temple', 7),
(839, 'Silvio Pellico', 7),
(840, 'Simbolar', 7),
(841, 'Sinsacate', 7),
(842, 'Sta. Rosa de Calamuchita', 7),
(843, 'Sta. Rosa de Río Primero', 7),
(844, 'Suco', 7),
(845, 'Tala Cañada', 7),
(846, 'Tala Huasi', 7),
(847, 'Talaini', 7),
(848, 'Tancacha', 7),
(849, 'Tanti', 7),
(850, 'Ticino', 7),
(851, 'Tinoco', 7),
(852, 'Tío Pujio', 7),
(853, 'Toledo', 7),
(854, 'Toro Pujio', 7),
(855, 'Tosno', 7),
(856, 'Tosquita', 7),
(857, 'Tránsito', 7),
(858, 'Tuclame', 7),
(859, 'Tutti', 7),
(860, 'Ucacha', 7),
(861, 'Unquillo', 7),
(862, 'Valle de Anisacate', 7),
(863, 'Valle Hermoso', 7),
(864, 'Vélez Sarfield', 7),
(865, 'Viamonte', 7),
(866, 'Vicuña Mackenna', 7),
(867, 'Villa Allende', 7),
(868, 'Villa Amancay', 7),
(869, 'Villa Ascasubi', 7),
(870, 'Villa Candelaria N.', 7),
(871, 'Villa Carlos Paz', 7),
(872, 'Villa Cerro Azul', 7),
(873, 'Villa Ciudad de América', 7),
(874, 'Villa Ciudad Pque Los Reartes', 7),
(875, 'Villa Concepción del Tío', 7),
(876, 'Villa Cura Brochero', 7),
(877, 'Villa de Las Rosas', 7),
(878, 'Villa de María', 7),
(879, 'Villa de Pocho', 7),
(880, 'Villa de Soto', 7),
(881, 'Villa del Dique', 7),
(882, 'Villa del Prado', 7),
(883, 'Villa del Rosario', 7),
(884, 'Villa del Totoral', 7),
(885, 'Villa Dolores', 7),
(886, 'Villa El Chancay', 7),
(887, 'Villa Elisa', 7),
(888, 'Villa Flor Serrana', 7),
(889, 'Villa Fontana', 7),
(890, 'Villa Giardino', 7),
(891, 'Villa Gral. Belgrano', 7),
(892, 'Villa Gutierrez', 7),
(893, 'Villa Huidobro', 7),
(894, 'Villa La Bolsa', 7),
(895, 'Villa Los Aromos', 7),
(896, 'Villa Los Patos', 7),
(897, 'Villa María', 7),
(898, 'Villa Nueva', 7),
(899, 'Villa Pque. Santa Ana', 7),
(900, 'Villa Pque. Siquiman', 7),
(901, 'Villa Quillinzo', 7),
(902, 'Villa Rossi', 7),
(903, 'Villa Rumipal', 7),
(904, 'Villa San Esteban', 7),
(905, 'Villa San Isidro', 7),
(906, 'Villa 21', 7),
(907, 'Villa Sarmiento (G.R)', 7),
(908, 'Villa Sarmiento (S.A)', 7),
(909, 'Villa Tulumba', 7),
(910, 'Villa Valeria', 7),
(911, 'Villa Yacanto', 7),
(912, 'Washington', 7),
(913, 'Wenceslao Escalante', 7),
(914, 'Ycho Cruz Sierras', 7),
(915, 'Alvear', 8),
(916, 'Bella Vista', 8),
(917, 'Berón de Astrada', 8),
(918, 'Bonpland', 8),
(919, 'Caá Cati', 8),
(920, 'Capital', 8),
(921, 'Chavarría', 8),
(922, 'Col. C. Pellegrini', 8),
(923, 'Col. Libertad', 8),
(924, 'Col. Liebig', 8),
(925, 'Col. Sta Rosa', 8),
(926, 'Concepción', 8),
(927, 'Cruz de Los Milagros', 8),
(928, 'Curuzú-Cuatiá', 8),
(929, 'Empedrado', 8),
(930, 'Esquina', 8),
(931, 'Estación Torrent', 8),
(932, 'Felipe Yofré', 8),
(933, 'Garruchos', 8),
(934, 'Gdor. Agrónomo', 8),
(935, 'Gdor. Martínez', 8),
(936, 'Goya', 8),
(937, 'Guaviravi', 8),
(938, 'Herlitzka', 8),
(939, 'Ita-Ibate', 8),
(940, 'Itatí', 8),
(941, 'Ituzaingó', 8),
(942, 'José Rafael Gómez', 8),
(943, 'Juan Pujol', 8),
(944, 'La Cruz', 8),
(945, 'Lavalle', 8),
(946, 'Lomas de Vallejos', 8),
(947, 'Loreto', 8),
(948, 'Mariano I. Loza', 8),
(949, 'Mburucuyá', 8),
(950, 'Mercedes', 8),
(951, 'Mocoretá', 8),
(952, 'Mte. Caseros', 8),
(953, 'Nueve de Julio', 8),
(954, 'Palmar Grande', 8),
(955, 'Parada Pucheta', 8),
(956, 'Paso de La Patria', 8),
(957, 'Paso de Los Libres', 8),
(958, 'Pedro R. Fernandez', 8),
(959, 'Perugorría', 8),
(960, 'Pueblo Libertador', 8),
(961, 'Ramada Paso', 8),
(962, 'Riachuelo', 8),
(963, 'Saladas', 8),
(964, 'San Antonio', 8),
(965, 'San Carlos', 8),
(966, 'San Cosme', 8),
(967, 'San Lorenzo', 8),
(968, '20 del Palmar', 8),
(969, 'San Miguel', 8),
(970, 'San Roque', 8),
(971, 'Santa Ana', 8),
(972, 'Santa Lucía', 8),
(973, 'Santo Tomé', 8),
(974, 'Sauce', 8),
(975, 'Tabay', 8),
(976, 'Tapebicuá', 8),
(977, 'Tatacua', 8),
(978, 'Virasoro', 8),
(979, 'Yapeyú', 8),
(980, 'Yataití Calle', 8),
(981, 'Alarcón', 9),
(982, 'Alcaraz', 9),
(983, 'Alcaraz N.', 9),
(984, 'Alcaraz S.', 9),
(985, 'Aldea Asunción', 9),
(986, 'Aldea Brasilera', 9),
(987, 'Aldea Elgenfeld', 9),
(988, 'Aldea Grapschental', 9),
(989, 'Aldea Ma. Luisa', 9),
(990, 'Aldea Protestante', 9),
(991, 'Aldea Salto', 9),
(992, 'Aldea San Antonio (G)', 9),
(993, 'Aldea San Antonio (P)', 9),
(994, 'Aldea 19', 9),
(995, 'Aldea San Miguel', 9),
(996, 'Aldea San Rafael', 9),
(997, 'Aldea Spatzenkutter', 9),
(998, 'Aldea Sta. María', 9),
(999, 'Aldea Sta. Rosa', 9),
(1000, 'Aldea Valle María', 9),
(1001, 'Altamirano Sur', 9),
(1002, 'Antelo', 9),
(1003, 'Antonio Tomás', 9),
(1004, 'Aranguren', 9),
(1005, 'Arroyo Barú', 9),
(1006, 'Arroyo Burgos', 9),
(1007, 'Arroyo Clé', 9),
(1008, 'Arroyo Corralito', 9),
(1009, 'Arroyo del Medio', 9),
(1010, 'Arroyo Maturrango', 9),
(1011, 'Arroyo Palo Seco', 9),
(1012, 'Banderas', 9),
(1013, 'Basavilbaso', 9),
(1014, 'Betbeder', 9),
(1015, 'Bovril', 9),
(1016, 'Caseros', 9),
(1017, 'Ceibas', 9),
(1018, 'Cerrito', 9),
(1019, 'Chajarí', 9),
(1020, 'Chilcas', 9),
(1021, 'Clodomiro Ledesma', 9),
(1022, 'Col. Alemana', 9),
(1023, 'Col. Avellaneda', 9),
(1024, 'Col. Avigdor', 9),
(1025, 'Col. Ayuí', 9),
(1026, 'Col. Baylina', 9),
(1027, 'Col. Carrasco', 9),
(1028, 'Col. Celina', 9),
(1029, 'Col. Cerrito', 9),
(1030, 'Col. Crespo', 9),
(1031, 'Col. Elia', 9),
(1032, 'Col. Ensayo', 9),
(1033, 'Col. Gral. Roca', 9),
(1034, 'Col. La Argentina', 9),
(1035, 'Col. Merou', 9),
(1036, 'Col. Oficial Nª3', 9),
(1037, 'Col. Oficial Nº13', 9),
(1038, 'Col. Oficial Nº14', 9),
(1039, 'Col. Oficial Nº5', 9),
(1040, 'Col. Reffino', 9),
(1041, 'Col. Tunas', 9),
(1042, 'Col. Viraró', 9),
(1043, 'Colón', 9),
(1044, 'Concepción del Uruguay', 9),
(1045, 'Concordia', 9),
(1046, 'Conscripto Bernardi', 9),
(1047, 'Costa Grande', 9),
(1048, 'Costa San Antonio', 9),
(1049, 'Costa Uruguay N.', 9),
(1050, 'Costa Uruguay S.', 9),
(1051, 'Crespo', 9),
(1052, 'Crucecitas 3ª', 9),
(1053, 'Crucecitas 7ª', 9),
(1054, 'Crucecitas 8ª', 9),
(1055, 'Cuchilla Redonda', 9),
(1056, 'Curtiembre', 9),
(1057, 'Diamante', 9),
(1058, 'Distrito 6º', 9),
(1059, 'Distrito Chañar', 9),
(1060, 'Distrito Chiqueros', 9),
(1061, 'Distrito Cuarto', 9),
(1062, 'Distrito Diego López', 9),
(1063, 'Distrito Pajonal', 9),
(1064, 'Distrito Sauce', 9),
(1065, 'Distrito Tala', 9),
(1066, 'Distrito Talitas', 9),
(1067, 'Don Cristóbal 1ª Sección', 9),
(1068, 'Don Cristóbal 2ª Sección', 9),
(1069, 'Durazno', 9),
(1070, 'El Cimarrón', 9),
(1071, 'El Gramillal', 9),
(1072, 'El Palenque', 9),
(1073, 'El Pingo', 9),
(1074, 'El Quebracho', 9),
(1075, 'El Redomón', 9),
(1076, 'El Solar', 9),
(1077, 'Enrique Carbo', 9),
(1078, '9', 9),
(1079, 'Espinillo N.', 9),
(1080, 'Estación Campos', 9),
(1081, 'Estación Escriña', 9),
(1082, 'Estación Lazo', 9),
(1083, 'Estación Raíces', 9),
(1084, 'Estación Yerúa', 9),
(1085, 'Estancia Grande', 9),
(1086, 'Estancia Líbaros', 9),
(1087, 'Estancia Racedo', 9),
(1088, 'Estancia Solá', 9),
(1089, 'Estancia Yuquerí', 9),
(1090, 'Estaquitas', 9),
(1091, 'Faustino M. Parera', 9),
(1092, 'Febre', 9),
(1093, 'Federación', 9),
(1094, 'Federal', 9),
(1095, 'Gdor. Echagüe', 9),
(1096, 'Gdor. Mansilla', 9),
(1097, 'Gilbert', 9),
(1098, 'González Calderón', 9),
(1099, 'Gral. Almada', 9),
(1100, 'Gral. Alvear', 9),
(1101, 'Gral. Campos', 9),
(1102, 'Gral. Galarza', 9),
(1103, 'Gral. Ramírez', 9),
(1104, 'Gualeguay', 9),
(1105, 'Gualeguaychú', 9),
(1106, 'Gualeguaycito', 9),
(1107, 'Guardamonte', 9),
(1108, 'Hambis', 9),
(1109, 'Hasenkamp', 9),
(1110, 'Hernandarias', 9),
(1111, 'Hernández', 9),
(1112, 'Herrera', 9),
(1113, 'Hinojal', 9),
(1114, 'Hocker', 9),
(1115, 'Ing. Sajaroff', 9),
(1116, 'Irazusta', 9),
(1117, 'Isletas', 9),
(1118, 'J.J De Urquiza', 9),
(1119, 'Jubileo', 9),
(1120, 'La Clarita', 9),
(1121, 'La Criolla', 9),
(1122, 'La Esmeralda', 9),
(1123, 'La Florida', 9),
(1124, 'La Fraternidad', 9),
(1125, 'La Hierra', 9),
(1126, 'La Ollita', 9),
(1127, 'La Paz', 9),
(1128, 'La Picada', 9),
(1129, 'La Providencia', 9),
(1130, 'La Verbena', 9),
(1131, 'Laguna Benítez', 9),
(1132, 'Larroque', 9),
(1133, 'Las Cuevas', 9),
(1134, 'Las Garzas', 9),
(1135, 'Las Guachas', 9),
(1136, 'Las Mercedes', 9),
(1137, 'Las Moscas', 9),
(1138, 'Las Mulitas', 9),
(1139, 'Las Toscas', 9),
(1140, 'Laurencena', 9),
(1141, 'Libertador San Martín', 9),
(1142, 'Loma Limpia', 9),
(1143, 'Los Ceibos', 9),
(1144, 'Los Charruas', 9),
(1145, 'Los Conquistadores', 9),
(1146, 'Lucas González', 9),
(1147, 'Lucas N.', 9),
(1148, 'Lucas S. 1ª', 9),
(1149, 'Lucas S. 2ª', 9),
(1150, 'Maciá', 9),
(1151, 'María Grande', 9),
(1152, 'María Grande 2ª', 9),
(1153, 'Médanos', 9),
(1154, 'Mojones N.', 9),
(1155, 'Mojones S.', 9),
(1156, 'Molino Doll', 9),
(1157, 'Monte Redondo', 9),
(1158, 'Montoya', 9),
(1159, 'Mulas Grandes', 9),
(1160, 'Ñancay', 9),
(1161, 'Nogoyá', 9),
(1162, 'Nueva Escocia', 9),
(1163, 'Nueva Vizcaya', 9),
(1164, 'Ombú', 9),
(1165, 'Oro Verde', 9),
(1166, 'Paraná', 9),
(1167, 'Pasaje Guayaquil', 9),
(1168, 'Pasaje Las Tunas', 9),
(1169, 'Paso de La Arena', 9),
(1170, 'Paso de La Laguna', 9),
(1171, 'Paso de Las Piedras', 9),
(1172, 'Paso Duarte', 9),
(1173, 'Pastor Britos', 9),
(1174, 'Pedernal', 9),
(1175, 'Perdices', 9),
(1176, 'Picada Berón', 9),
(1177, 'Piedras Blancas', 9),
(1178, 'Primer Distrito Cuchilla', 9),
(1179, 'Primero de Mayo', 9),
(1180, 'Pronunciamiento', 9),
(1181, 'Pto. Algarrobo', 9),
(1182, 'Pto. Ibicuy', 9),
(1183, 'Pueblo Brugo', 9),
(1184, 'Pueblo Cazes', 9),
(1185, 'Pueblo Gral. Belgrano', 9),
(1186, 'Pueblo Liebig', 9),
(1187, 'Puerto Yeruá', 9),
(1188, 'Punta del Monte', 9),
(1189, 'Quebracho', 9),
(1190, 'Quinto Distrito', 9),
(1191, 'Raices Oeste', 9),
(1192, 'Rincón de Nogoyá', 9),
(1193, 'Rincón del Cinto', 9),
(1194, 'Rincón del Doll', 9),
(1195, 'Rincón del Gato', 9),
(1196, 'Rocamora', 9),
(1197, 'Rosario del Tala', 9),
(1198, 'San Benito', 9),
(1199, 'San Cipriano', 9),
(1200, 'San Ernesto', 9),
(1201, 'San Gustavo', 9),
(1202, 'San Jaime', 9),
(1203, 'San José', 9),
(1204, 'San José de Feliciano', 9),
(1205, 'San Justo', 9),
(1206, 'San Marcial', 9),
(1207, 'San Pedro', 9),
(1208, 'San Ramírez', 9),
(1209, 'San Ramón', 9),
(1210, 'San Roque', 9),
(1211, 'San Salvador', 9),
(1212, 'San Víctor', 9),
(1213, 'Santa Ana', 9),
(1214, 'Santa Anita', 9),
(1215, 'Santa Elena', 9),
(1216, 'Santa Lucía', 9),
(1217, 'Santa Luisa', 9),
(1218, 'Sauce de Luna', 9),
(1219, 'Sauce Montrull', 9),
(1220, 'Sauce Pinto', 9),
(1221, 'Sauce Sur', 9),
(1222, 'Seguí', 9),
(1223, 'Sir Leonard', 9),
(1224, 'Sosa', 9),
(1225, 'Tabossi', 9),
(1226, 'Tezanos Pinto', 9),
(1227, 'Ubajay', 9),
(1228, 'Urdinarrain', 9),
(1229, 'Veinte de Septiembre', 9),
(1230, 'Viale', 9),
(1231, 'Victoria', 9),
(1232, 'Villa Clara', 9),
(1233, 'Villa del Rosario', 9),
(1234, 'Villa Domínguez', 9),
(1235, 'Villa Elisa', 9),
(1236, 'Villa Fontana', 9),
(1237, 'Villa Gdor. Etchevehere', 9),
(1238, 'Villa Mantero', 9),
(1239, 'Villa Paranacito', 9),
(1240, 'Villa Urquiza', 9),
(1241, 'Villaguay', 9),
(1242, 'Walter Moss', 9),
(1243, 'Yacaré', 9),
(1244, 'Yeso Oeste', 9),
(1245, 'Buena Vista', 10),
(1246, 'Clorinda', 10),
(1247, 'Col. Pastoril', 10),
(1248, 'Cte. Fontana', 10),
(1249, 'El Colorado', 10),
(1250, 'El Espinillo', 10),
(1251, 'Estanislao Del Campo', 10),
(1252, '10', 10),
(1253, 'Fortín Lugones', 10),
(1254, 'Gral. Lucio V. Mansilla', 10),
(1255, 'Gral. Manuel Belgrano', 10),
(1256, 'Gral. Mosconi', 10),
(1257, 'Gran Guardia', 10),
(1258, 'Herradura', 10),
(1259, 'Ibarreta', 10),
(1260, 'Ing. Juárez', 10),
(1261, 'Laguna Blanca', 10),
(1262, 'Laguna Naick Neck', 10),
(1263, 'Laguna Yema', 10),
(1264, 'Las Lomitas', 10),
(1265, 'Los Chiriguanos', 10),
(1266, 'Mayor V. Villafañe', 10),
(1267, 'Misión San Fco.', 10),
(1268, 'Palo Santo', 10),
(1269, 'Pirané', 10),
(1270, 'Pozo del Maza', 10),
(1271, 'Riacho He-He', 10),
(1272, 'San Hilario', 10),
(1273, 'San Martín II', 10),
(1274, 'Siete Palmas', 10),
(1275, 'Subteniente Perín', 10),
(1276, 'Tres Lagunas', 10),
(1277, 'Villa Dos Trece', 10),
(1278, 'Villa Escolar', 10),
(1279, 'Villa Gral. Güemes', 10),
(1280, 'Abdon Castro Tolay', 11),
(1281, 'Abra Pampa', 11),
(1282, 'Abralaite', 11),
(1283, 'Aguas Calientes', 11),
(1284, 'Arrayanal', 11),
(1285, 'Barrios', 11),
(1286, 'Caimancito', 11),
(1287, 'Calilegua', 11),
(1288, 'Cangrejillos', 11),
(1289, 'Caspala', 11),
(1290, 'Catuá', 11),
(1291, 'Cieneguillas', 11),
(1292, 'Coranzulli', 11),
(1293, 'Cusi-Cusi', 11),
(1294, 'El Aguilar', 11),
(1295, 'El Carmen', 11),
(1296, 'El Cóndor', 11),
(1297, 'El Fuerte', 11),
(1298, 'El Piquete', 11),
(1299, 'El Talar', 11),
(1300, 'Fraile Pintado', 11),
(1301, 'Hipólito Yrigoyen', 11),
(1302, 'Huacalera', 11),
(1303, 'Humahuaca', 11),
(1304, 'La Esperanza', 11),
(1305, 'La Mendieta', 11),
(1306, 'La Quiaca', 11),
(1307, 'Ledesma', 11),
(1308, 'Libertador Gral. San Martin', 11),
(1309, 'Maimara', 11),
(1310, 'Mina Pirquitas', 11),
(1311, 'Monterrico', 11),
(1312, 'Palma Sola', 11),
(1313, 'Palpalá', 11),
(1314, 'Pampa Blanca', 11),
(1315, 'Pampichuela', 11),
(1316, 'Perico', 11),
(1317, 'Puesto del Marqués', 11),
(1318, 'Puesto Viejo', 11),
(1319, 'Pumahuasi', 11),
(1320, 'Purmamarca', 11),
(1321, 'Rinconada', 11),
(1322, 'Rodeitos', 11),
(1323, 'Rosario de Río Grande', 11),
(1324, 'San Antonio', 11),
(1325, 'San Francisco', 11),
(1326, 'San Pedro', 11),
(1327, 'San Rafael', 11),
(1328, 'San Salvador', 11),
(1329, 'Santa Ana', 11),
(1330, 'Santa Catalina', 11),
(1331, 'Santa Clara', 11),
(1332, 'Susques', 11),
(1333, 'Tilcara', 11),
(1334, 'Tres Cruces', 11),
(1335, 'Tumbaya', 11),
(1336, 'Valle Grande', 11),
(1337, 'Vinalito', 11),
(1338, 'Volcán', 11),
(1339, 'Yala', 11),
(1340, 'Yaví', 11),
(1341, 'Yuto', 11),
(1342, 'Abramo', 12),
(1343, 'Adolfo Van Praet', 12),
(1344, 'Agustoni', 12),
(1345, 'Algarrobo del Aguila', 12),
(1346, 'Alpachiri', 12),
(1347, 'Alta Italia', 12),
(1348, 'Anguil', 12),
(1349, 'Arata', 12),
(1350, 'Ataliva Roca', 12),
(1351, 'Bernardo Larroude', 12),
(1352, 'Bernasconi', 12),
(1353, 'Caleufú', 12),
(1354, 'Carro Quemado', 12),
(1355, 'Catriló', 12),
(1356, 'Ceballos', 12),
(1357, 'Chacharramendi', 12),
(1358, 'Col. Barón', 12),
(1359, 'Col. Santa María', 12),
(1360, 'Conhelo', 12),
(1361, 'Coronel Hilario Lagos', 12),
(1362, 'Cuchillo-Có', 12),
(1363, 'Doblas', 12),
(1364, 'Dorila', 12),
(1365, 'Eduardo Castex', 12),
(1366, 'Embajador Martini', 12),
(1367, 'Falucho', 12),
(1368, 'Gral. Acha', 12),
(1369, 'Gral. Manuel Campos', 12),
(1370, 'Gral. Pico', 12),
(1371, 'Guatraché', 12),
(1372, 'Ing. Luiggi', 12),
(1373, 'Intendente Alvear', 12),
(1374, 'Jacinto Arauz', 12),
(1375, 'La Adela', 12),
(1376, 'La Humada', 12),
(1377, 'La Maruja', 12),
(1378, '12', 12),
(1379, 'La Reforma', 12),
(1380, 'Limay Mahuida', 12),
(1381, 'Lonquimay', 12),
(1382, 'Loventuel', 12),
(1383, 'Luan Toro', 12),
(1384, 'Macachín', 12),
(1385, 'Maisonnave', 12),
(1386, 'Mauricio Mayer', 12),
(1387, 'Metileo', 12),
(1388, 'Miguel Cané', 12),
(1389, 'Miguel Riglos', 12),
(1390, 'Monte Nievas', 12),
(1391, 'Parera', 12),
(1392, 'Perú', 12),
(1393, 'Pichi-Huinca', 12),
(1394, 'Puelches', 12),
(1395, 'Puelén', 12),
(1396, 'Quehue', 12),
(1397, 'Quemú Quemú', 12),
(1398, 'Quetrequén', 12),
(1399, 'Rancul', 12),
(1400, 'Realicó', 12),
(1401, 'Relmo', 12),
(1402, 'Rolón', 12),
(1403, 'Rucanelo', 12),
(1404, 'Sarah', 12),
(1405, 'Speluzzi', 12),
(1406, 'Sta. Isabel', 12),
(1407, 'Sta. Rosa', 12),
(1408, 'Sta. Teresa', 12),
(1409, 'Telén', 12),
(1410, 'Toay', 12),
(1411, 'Tomas M. de Anchorena', 12),
(1412, 'Trenel', 12),
(1413, 'Unanue', 12),
(1414, 'Uriburu', 12),
(1415, 'Veinticinco de Mayo', 12),
(1416, 'Vertiz', 12),
(1417, 'Victorica', 12),
(1418, 'Villa Mirasol', 12),
(1419, 'Winifreda', 12),
(1420, 'Arauco', 13),
(1421, 'Capital', 13),
(1422, 'Castro Barros', 13),
(1423, 'Chamical', 13),
(1424, 'Chilecito', 13),
(1425, 'Coronel F. Varela', 13),
(1426, 'Famatina', 13),
(1427, 'Gral. A.V.Peñaloza', 13),
(1428, 'Gral. Belgrano', 13),
(1429, 'Gral. J.F. Quiroga', 13),
(1430, 'Gral. Lamadrid', 13),
(1431, 'Gral. Ocampo', 13),
(1432, 'Gral. San Martín', 13),
(1433, 'Independencia', 13),
(1434, 'Rosario Penaloza', 13),
(1435, 'San Blas de Los Sauces', 13),
(1436, 'Sanagasta', 13),
(1437, 'Vinchina', 13),
(1438, 'Capital', 14),
(1439, 'Chacras de Coria', 14),
(1440, 'Dorrego', 14),
(1441, 'Gllen', 14),
(1442, 'Godoy Cruz', 14),
(1443, 'Gral. Alvear', 14),
(1444, 'Guaymallén', 14),
(1445, 'Junín', 14),
(1446, 'La Paz', 14),
(1447, 'Las Heras', 14),
(1448, 'Lavalle', 14),
(1449, 'Luján', 14),
(1450, 'Luján De Cuyo', 14),
(1451, 'Maipú', 14),
(1452, 'Malargüe', 14),
(1453, 'Rivadavia', 14),
(1454, 'San Carlos', 14),
(1455, 'San Martín', 14),
(1456, 'San Rafael', 14),
(1457, 'Sta. Rosa', 14),
(1458, 'Tunuyán', 14),
(1459, 'Tupungato', 14),
(1460, 'Villa Nueva', 14),
(1461, 'Alba Posse', 15),
(1462, 'Almafuerte', 15),
(1463, 'Apóstoles', 15),
(1464, 'Aristóbulo Del Valle', 15),
(1465, 'Arroyo Del Medio', 15),
(1466, 'Azara', 15),
(1467, 'Bdo. De Irigoyen', 15),
(1468, 'Bonpland', 15),
(1469, 'Caá Yari', 15),
(1470, 'Campo Grande', 15),
(1471, 'Campo Ramón', 15),
(1472, 'Campo Viera', 15),
(1473, 'Candelaria', 15),
(1474, 'Capioví', 15),
(1475, 'Caraguatay', 15),
(1476, 'Cdte. Guacurarí', 15),
(1477, 'Cerro Azul', 15),
(1478, 'Cerro Corá', 15),
(1479, 'Col. Alberdi', 15),
(1480, 'Col. Aurora', 15),
(1481, 'Col. Delicia', 15),
(1482, 'Col. Polana', 15),
(1483, 'Col. Victoria', 15),
(1484, 'Col. Wanda', 15),
(1485, 'Concepción De La Sierra', 15),
(1486, 'Corpus', 15),
(1487, 'Dos Arroyos', 15),
(1488, 'Dos de Mayo', 15),
(1489, 'El Alcázar', 15),
(1490, 'El Dorado', 15),
(1491, 'El Soberbio', 15),
(1492, 'Esperanza', 15),
(1493, 'F. Ameghino', 15),
(1494, 'Fachinal', 15),
(1495, 'Garuhapé', 15),
(1496, 'Garupá', 15),
(1497, 'Gdor. López', 15),
(1498, 'Gdor. Roca', 15),
(1499, 'Gral. Alvear', 15),
(1500, 'Gral. Urquiza', 15),
(1501, 'Guaraní', 15),
(1502, 'H. Yrigoyen', 15),
(1503, 'Iguazú', 15),
(1504, 'Itacaruaré', 15),
(1505, 'Jardín América', 15),
(1506, 'Leandro N. Alem', 15),
(1507, 'Libertad', 15),
(1508, 'Loreto', 15),
(1509, 'Los Helechos', 15),
(1510, 'Mártires', 15),
(1511, '15', 15),
(1512, 'Mojón Grande', 15),
(1513, 'Montecarlo', 15),
(1514, 'Nueve de Julio', 15),
(1515, 'Oberá', 15),
(1516, 'Olegario V. Andrade', 15),
(1517, 'Panambí', 15),
(1518, 'Posadas', 15),
(1519, 'Profundidad', 15),
(1520, 'Pto. Iguazú', 15),
(1521, 'Pto. Leoni', 15),
(1522, 'Pto. Piray', 15),
(1523, 'Pto. Rico', 15),
(1524, 'Ruiz de Montoya', 15),
(1525, 'San Antonio', 15),
(1526, 'San Ignacio', 15),
(1527, 'San Javier', 15),
(1528, 'San José', 15),
(1529, 'San Martín', 15),
(1530, 'San Pedro', 15),
(1531, 'San Vicente', 15),
(1532, 'Santiago De Liniers', 15),
(1533, 'Santo Pipo', 15),
(1534, 'Sta. Ana', 15),
(1535, 'Sta. María', 15),
(1536, 'Tres Capones', 15),
(1537, 'Veinticinco de Mayo', 15),
(1538, 'Wanda', 15),
(1539, 'Aguada San Roque', 16),
(1540, 'Aluminé', 16),
(1541, 'Andacollo', 16),
(1542, 'Añelo', 16),
(1543, 'Bajada del Agrio', 16),
(1544, 'Barrancas', 16),
(1545, 'Buta Ranquil', 16),
(1546, 'Capital', 16),
(1547, 'Caviahué', 16),
(1548, 'Centenario', 16),
(1549, 'Chorriaca', 16),
(1550, 'Chos Malal', 16),
(1551, 'Cipolletti', 16),
(1552, 'Covunco Abajo', 16),
(1553, 'Coyuco Cochico', 16),
(1554, 'Cutral Có', 16),
(1555, 'El Cholar', 16),
(1556, 'El Huecú', 16),
(1557, 'El Sauce', 16),
(1558, 'Guañacos', 16),
(1559, 'Huinganco', 16),
(1560, 'Las Coloradas', 16),
(1561, 'Las Lajas', 16),
(1562, 'Las Ovejas', 16),
(1563, 'Loncopué', 16),
(1564, 'Los Catutos', 16),
(1565, 'Los Chihuidos', 16),
(1566, 'Los Miches', 16),
(1567, 'Manzano Amargo', 16),
(1568, '16', 16),
(1569, 'Octavio Pico', 16),
(1570, 'Paso Aguerre', 16),
(1571, 'Picún Leufú', 16),
(1572, 'Piedra del Aguila', 16),
(1573, 'Pilo Lil', 16),
(1574, 'Plaza Huincul', 16),
(1575, 'Plottier', 16),
(1576, 'Quili Malal', 16),
(1577, 'Ramón Castro', 16),
(1578, 'Rincón de Los Sauces', 16),
(1579, 'San Martín de Los Andes', 16),
(1580, 'San Patricio del Chañar', 16),
(1581, 'Santo Tomás', 16),
(1582, 'Sauzal Bonito', 16),
(1583, 'Senillosa', 16),
(1584, 'Taquimilán', 16),
(1585, 'Tricao Malal', 16),
(1586, 'Varvarco', 16),
(1587, 'Villa Curí Leuvu', 16),
(1588, 'Villa del Nahueve', 16),
(1589, 'Villa del Puente Picún Leuvú', 16),
(1590, 'Villa El Chocón', 16),
(1591, 'Villa La Angostura', 16),
(1592, 'Villa Pehuenia', 16),
(1593, 'Villa Traful', 16),
(1594, 'Vista Alegre', 16),
(1595, 'Zapala', 16),
(1596, 'Aguada Cecilio', 17),
(1597, 'Aguada de Guerra', 17),
(1598, 'Allén', 17),
(1599, 'Arroyo de La Ventana', 17),
(1600, 'Arroyo Los Berros', 17),
(1601, 'Bariloche', 17),
(1602, 'Calte. Cordero', 17),
(1603, 'Campo Grande', 17),
(1604, 'Catriel', 17),
(1605, 'Cerro Policía', 17),
(1606, 'Cervantes', 17),
(1607, 'Chelforo', 17),
(1608, 'Chimpay', 17),
(1609, 'Chinchinales', 17),
(1610, 'Chipauquil', 17),
(1611, 'Choele Choel', 17),
(1612, 'Cinco Saltos', 17),
(1613, 'Cipolletti', 17),
(1614, 'Clemente Onelli', 17),
(1615, 'Colán Conhue', 17),
(1616, 'Comallo', 17),
(1617, 'Comicó', 17),
(1618, 'Cona Niyeu', 17),
(1619, 'Coronel Belisle', 17),
(1620, 'Cubanea', 17),
(1621, 'Darwin', 17),
(1622, 'Dina Huapi', 17),
(1623, 'El Bolsón', 17),
(1624, 'El Caín', 17),
(1625, 'El Manso', 17),
(1626, 'Gral. Conesa', 17),
(1627, 'Gral. Enrique Godoy', 17),
(1628, 'Gral. Fernandez Oro', 17),
(1629, 'Gral. Roca', 17),
(1630, 'Guardia Mitre', 17),
(1631, 'Ing. Huergo', 17),
(1632, 'Ing. Jacobacci', 17),
(1633, 'Laguna Blanca', 17),
(1634, 'Lamarque', 17),
(1635, 'Las Grutas', 17),
(1636, 'Los Menucos', 17),
(1637, 'Luis Beltrán', 17),
(1638, 'Mainqué', 17),
(1639, 'Mamuel Choique', 17),
(1640, 'Maquinchao', 17),
(1641, 'Mencué', 17),
(1642, 'Mtro. Ramos Mexia', 17),
(1643, 'Nahuel Niyeu', 17),
(1644, 'Naupa Huen', 17),
(1645, 'Ñorquinco', 17),
(1646, 'Ojos de Agua', 17),
(1647, 'Paso de Agua', 17),
(1648, 'Paso Flores', 17),
(1649, 'Peñas Blancas', 17),
(1650, 'Pichi Mahuida', 17),
(1651, 'Pilcaniyeu', 17),
(1652, 'Pomona', 17),
(1653, 'Prahuaniyeu', 17),
(1654, 'Rincón Treneta', 17),
(1655, 'Río Chico', 17),
(1656, 'Río Colorado', 17),
(1657, 'Roca', 17),
(1658, 'San Antonio Oeste', 17),
(1659, 'San Javier', 17),
(1660, 'Sierra Colorada', 17),
(1661, 'Sierra Grande', 17),
(1662, 'Sierra Pailemán', 17),
(1663, 'Valcheta', 17),
(1664, 'Valle Azul', 17),
(1665, 'Viedma', 17),
(1666, 'Villa Llanquín', 17),
(1667, 'Villa Mascardi', 17),
(1668, 'Villa Regina', 17),
(1669, 'Yaminué', 17),
(1670, 'A. Saravia', 18),
(1671, 'Aguaray', 18),
(1672, 'Angastaco', 18),
(1673, 'Animaná', 18),
(1674, 'Cachi', 18),
(1675, 'Cafayate', 18),
(1676, 'Campo Quijano', 18),
(1677, 'Campo Santo', 18),
(1678, 'Capital', 18),
(1679, 'Cerrillos', 18),
(1680, 'Chicoana', 18),
(1681, 'Col. Sta. Rosa', 18),
(1682, 'Coronel Moldes', 18),
(1683, 'El Bordo', 18),
(1684, 'El Carril', 18),
(1685, 'El Galpón', 18),
(1686, 'El Jardín', 18),
(1687, 'El Potrero', 18),
(1688, 'El Quebrachal', 18),
(1689, 'El Tala', 18),
(1690, 'Embarcación', 18),
(1691, 'Gral. Ballivian', 18),
(1692, 'Gral. Güemes', 18),
(1693, 'Gral. Mosconi', 18),
(1694, 'Gral. Pizarro', 18),
(1695, 'Guachipas', 18),
(1696, 'Hipólito Yrigoyen', 18),
(1697, 'Iruyá', 18),
(1698, 'Isla De Cañas', 18),
(1699, 'J. V. Gonzalez', 18),
(1700, 'La Caldera', 18),
(1701, 'La Candelaria', 18),
(1702, 'La Merced', 18),
(1703, 'La Poma', 18),
(1704, 'La Viña', 18),
(1705, 'Las Lajitas', 18),
(1706, 'Los Toldos', 18),
(1707, 'Metán', 18),
(1708, 'Molinos', 18),
(1709, 'Nazareno', 18),
(1710, 'Orán', 18),
(1711, 'Payogasta', 18),
(1712, 'Pichanal', 18),
(1713, 'Prof. S. Mazza', 18),
(1714, 'Río Piedras', 18),
(1715, 'Rivadavia Banda Norte', 18),
(1716, 'Rivadavia Banda Sur', 18),
(1717, 'Rosario de La Frontera', 18),
(1718, 'Rosario de Lerma', 18),
(1719, 'Saclantás', 18),
(1720, '18', 18),
(1721, 'San Antonio', 18),
(1722, 'San Carlos', 18),
(1723, 'San José De Metán', 18),
(1724, 'San Ramón', 18),
(1725, 'Santa Victoria E.', 18),
(1726, 'Santa Victoria O.', 18),
(1727, 'Tartagal', 18),
(1728, 'Tolar Grande', 18),
(1729, 'Urundel', 18),
(1730, 'Vaqueros', 18),
(1731, 'Villa San Lorenzo', 18),
(1732, 'Albardón', 19),
(1733, 'Angaco', 19),
(1734, 'Calingasta', 19),
(1735, 'Capital', 19),
(1736, 'Caucete', 19),
(1737, 'Chimbas', 19),
(1738, 'Iglesia', 19),
(1739, 'Jachal', 19),
(1740, 'Nueve de Julio', 19),
(1741, 'Pocito', 19),
(1742, 'Rawson', 19),
(1743, 'Rivadavia', 19),
(1744, '19', 19),
(1745, 'San Martín', 19),
(1746, 'Santa Lucía', 19),
(1747, 'Sarmiento', 19),
(1748, 'Ullum', 19),
(1749, 'Valle Fértil', 19),
(1750, 'Veinticinco de Mayo', 19),
(1751, 'Zonda', 19),
(1752, 'Alto Pelado', 20),
(1753, 'Alto Pencoso', 20),
(1754, 'Anchorena', 20),
(1755, 'Arizona', 20),
(1756, 'Bagual', 20),
(1757, 'Balde', 20),
(1758, 'Batavia', 20),
(1759, 'Beazley', 20),
(1760, 'Buena Esperanza', 20),
(1761, 'Candelaria', 20),
(1762, 'Capital', 20),
(1763, 'Carolina', 20),
(1764, 'Carpintería', 20),
(1765, 'Concarán', 20),
(1766, 'Cortaderas', 20),
(1767, 'El Morro', 20),
(1768, 'El Trapiche', 20),
(1769, 'El Volcán', 20),
(1770, 'Fortín El Patria', 20),
(1771, 'Fortuna', 20),
(1772, 'Fraga', 20),
(1773, 'Juan Jorba', 20),
(1774, 'Juan Llerena', 20),
(1775, 'Juana Koslay', 20),
(1776, 'Justo Daract', 20),
(1777, 'La Calera', 20),
(1778, 'La Florida', 20),
(1779, 'La Punilla', 20),
(1780, 'La Toma', 20),
(1781, 'Lafinur', 20),
(1782, 'Las Aguadas', 20),
(1783, 'Las Chacras', 20),
(1784, 'Las Lagunas', 20),
(1785, 'Las Vertientes', 20),
(1786, 'Lavaisse', 20),
(1787, 'Leandro N. Alem', 20),
(1788, 'Los Molles', 20),
(1789, 'Luján', 20),
(1790, 'Mercedes', 20),
(1791, 'Merlo', 20),
(1792, 'Naschel', 20),
(1793, 'Navia', 20),
(1794, 'Nogolí', 20),
(1795, 'Nueva Galia', 20),
(1796, 'Papagayos', 20),
(1797, 'Paso Grande', 20),
(1798, 'Potrero de Los Funes', 20),
(1799, 'Quines', 20),
(1800, 'Renca', 20),
(1801, 'Saladillo', 20),
(1802, 'San Francisco', 20),
(1803, 'San Gerónimo', 20),
(1804, 'San Martín', 20),
(1805, 'San Pablo', 20),
(1806, 'Santa Rosa de Conlara', 20),
(1807, 'Talita', 20),
(1808, 'Tilisarao', 20),
(1809, 'Unión', 20),
(1810, 'Villa de La Quebrada', 20),
(1811, 'Villa de Praga', 20),
(1812, 'Villa del Carmen', 20),
(1813, 'Villa Gral. Roca', 20),
(1814, 'Villa Larca', 20),
(1815, 'Villa Mercedes', 20),
(1816, 'Zanjitas', 20),
(1817, 'Calafate', 21),
(1818, 'Caleta Olivia', 21),
(1819, 'Cañadón Seco', 21),
(1820, 'Comandante Piedrabuena', 21),
(1821, 'El Calafate', 21),
(1822, 'El Chaltén', 21),
(1823, 'Gdor. Gregores', 21),
(1824, 'Hipólito Yrigoyen', 21),
(1825, 'Jaramillo', 21),
(1826, 'Koluel Kaike', 21),
(1827, 'Las Heras', 21),
(1828, 'Los Antiguos', 21),
(1829, 'Perito Moreno', 21),
(1830, 'Pico Truncado', 21),
(1831, 'Pto. Deseado', 21),
(1832, 'Pto. San Julián', 21),
(1833, 'Pto. 21', 21),
(1834, 'Río Cuarto', 21),
(1835, 'Río Gallegos', 21),
(1836, 'Río Turbio', 21),
(1837, 'Tres Lagos', 21),
(1838, 'Veintiocho De Noviembre', 21),
(1839, 'Aarón Castellanos', 22),
(1840, 'Acebal', 22),
(1841, 'Aguará Grande', 22),
(1842, 'Albarellos', 22),
(1843, 'Alcorta', 22),
(1844, 'Aldao', 22),
(1845, 'Alejandra', 22),
(1846, 'Álvarez', 22),
(1847, 'Ambrosetti', 22),
(1848, 'Amenábar', 22),
(1849, 'Angélica', 22),
(1850, 'Angeloni', 22),
(1851, 'Arequito', 22),
(1852, 'Arminda', 22),
(1853, 'Armstrong', 22),
(1854, 'Arocena', 22),
(1855, 'Arroyo Aguiar', 22),
(1856, 'Arroyo Ceibal', 22),
(1857, 'Arroyo Leyes', 22),
(1858, 'Arroyo Seco', 22),
(1859, 'Arrufó', 22),
(1860, 'Arteaga', 22),
(1861, 'Ataliva', 22),
(1862, 'Aurelia', 22),
(1863, 'Avellaneda', 22),
(1864, 'Barrancas', 22),
(1865, 'Bauer Y Sigel', 22),
(1866, 'Bella Italia', 22),
(1867, 'Berabevú', 22),
(1868, 'Berna', 22),
(1869, 'Bernardo de Irigoyen', 22),
(1870, 'Bigand', 22),
(1871, 'Bombal', 22),
(1872, 'Bouquet', 22),
(1873, 'Bustinza', 22),
(1874, 'Cabal', 22),
(1875, 'Cacique Ariacaiquin', 22),
(1876, 'Cafferata', 22),
(1877, 'Calchaquí', 22),
(1878, 'Campo Andino', 22),
(1879, 'Campo Piaggio', 22),
(1880, 'Cañada de Gómez', 22),
(1881, 'Cañada del Ucle', 22),
(1882, 'Cañada Rica', 22),
(1883, 'Cañada Rosquín', 22),
(1884, 'Candioti', 22),
(1885, 'Capital', 22),
(1886, 'Capitán Bermúdez', 22),
(1887, 'Capivara', 22),
(1888, 'Carcarañá', 22),
(1889, 'Carlos Pellegrini', 22),
(1890, 'Carmen', 22),
(1891, 'Carmen Del Sauce', 22),
(1892, 'Carreras', 22),
(1893, 'Carrizales', 22),
(1894, 'Casalegno', 22),
(1895, 'Casas', 22),
(1896, 'Casilda', 22),
(1897, 'Castelar', 22),
(1898, 'Castellanos', 22),
(1899, 'Cayastá', 22),
(1900, 'Cayastacito', 22),
(1901, 'Centeno', 22),
(1902, 'Cepeda', 22),
(1903, 'Ceres', 22),
(1904, 'Chabás', 22),
(1905, 'Chañar Ladeado', 22),
(1906, 'Chapuy', 22),
(1907, 'Chovet', 22),
(1908, 'Christophersen', 22),
(1909, 'Classon', 22),
(1910, 'Cnel. Arnold', 22),
(1911, 'Cnel. Bogado', 22),
(1912, 'Cnel. Dominguez', 22),
(1913, 'Cnel. Fraga', 22),
(1914, 'Col. Aldao', 22),
(1915, 'Col. Ana', 22),
(1916, 'Col. Belgrano', 22),
(1917, 'Col. Bicha', 22),
(1918, 'Col. Bigand', 22),
(1919, 'Col. Bossi', 22),
(1920, 'Col. Cavour', 22),
(1921, 'Col. Cello', 22),
(1922, 'Col. Dolores', 22),
(1923, 'Col. Dos Rosas', 22),
(1924, 'Col. Durán', 22),
(1925, 'Col. Iturraspe', 22),
(1926, 'Col. Margarita', 22),
(1927, 'Col. Mascias', 22),
(1928, 'Col. Raquel', 22),
(1929, 'Col. Rosa', 22),
(1930, 'Col. San José', 22),
(1931, 'Constanza', 22),
(1932, 'Coronda', 22),
(1933, 'Correa', 22),
(1934, 'Crispi', 22),
(1935, 'Cululú', 22),
(1936, 'Curupayti', 22),
(1937, 'Desvio Arijón', 22),
(1938, 'Diaz', 22),
(1939, 'Diego de Alvear', 22),
(1940, 'Egusquiza', 22),
(1941, 'El Arazá', 22),
(1942, 'El Rabón', 22),
(1943, 'El Sombrerito', 22),
(1944, 'El Trébol', 22),
(1945, 'Elisa', 22),
(1946, 'Elortondo', 22),
(1947, 'Emilia', 22),
(1948, 'Empalme San Carlos', 22),
(1949, 'Empalme Villa Constitucion', 22),
(1950, 'Esmeralda', 22),
(1951, 'Esperanza', 22),
(1952, 'Estación Alvear', 22),
(1953, 'Estacion Clucellas', 22),
(1954, 'Esteban Rams', 22),
(1955, 'Esther', 22),
(1956, 'Esustolia', 22),
(1957, 'Eusebia', 22),
(1958, 'Felicia', 22),
(1959, 'Fidela', 22),
(1960, 'Fighiera', 22),
(1961, 'Firmat', 22),
(1962, 'Florencia', 22),
(1963, 'Fortín Olmos', 22),
(1964, 'Franck', 22),
(1965, 'Fray Luis Beltrán', 22),
(1966, 'Frontera', 22),
(1967, 'Fuentes', 22),
(1968, 'Funes', 22),
(1969, 'Gaboto', 22),
(1970, 'Galisteo', 22),
(1971, 'Gálvez', 22),
(1972, 'Garabalto', 22),
(1973, 'Garibaldi', 22),
(1974, 'Gato Colorado', 22),
(1975, 'Gdor. Crespo', 22),
(1976, 'Gessler', 22),
(1977, 'Godoy', 22),
(1978, 'Golondrina', 22),
(1979, 'Gral. Gelly', 22),
(1980, 'Gral. Lagos', 22),
(1981, 'Granadero Baigorria', 22),
(1982, 'Gregoria Perez De Denis', 22),
(1983, 'Grutly', 22),
(1984, 'Guadalupe N.', 22),
(1985, 'Gödeken', 22),
(1986, 'Helvecia', 22),
(1987, 'Hersilia', 22),
(1988, 'Hipatía', 22),
(1989, 'Huanqueros', 22),
(1990, 'Hugentobler', 22),
(1991, 'Hughes', 22),
(1992, 'Humberto 1º', 22),
(1993, 'Humboldt', 22),
(1994, 'Ibarlucea', 22),
(1995, 'Ing. Chanourdie', 22),
(1996, 'Intiyaco', 22),
(1997, 'Ituzaingó', 22),
(1998, 'Jacinto L. Aráuz', 22),
(1999, 'Josefina', 22),
(2000, 'Juan B. Molina', 22),
(2001, 'Juan de Garay', 22),
(2002, 'Juncal', 22),
(2003, 'La Brava', 22),
(2004, 'La Cabral', 22),
(2005, 'La Camila', 22),
(2006, 'La Chispa', 22),
(2007, 'La Clara', 22),
(2008, 'La Criolla', 22),
(2009, 'La Gallareta', 22),
(2010, 'La Lucila', 22),
(2011, 'La Pelada', 22),
(2012, 'La Penca', 22),
(2013, 'La Rubia', 22),
(2014, 'La Sarita', 22),
(2015, 'La Vanguardia', 22),
(2016, 'Labordeboy', 22),
(2017, 'Laguna Paiva', 22),
(2018, 'Landeta', 22),
(2019, 'Lanteri', 22),
(2020, 'Larrechea', 22),
(2021, 'Las Avispas', 22),
(2022, 'Las Bandurrias', 22),
(2023, 'Las Garzas', 22),
(2024, 'Las Palmeras', 22),
(2025, 'Las Parejas', 22),
(2026, 'Las Petacas', 22),
(2027, 'Las Rosas', 22),
(2028, 'Las Toscas', 22),
(2029, 'Las Tunas', 22),
(2030, 'Lazzarino', 22),
(2031, 'Lehmann', 22),
(2032, 'Llambi Campbell', 22),
(2033, 'Logroño', 22),
(2034, 'Loma Alta', 22),
(2035, 'López', 22),
(2036, 'Los Amores', 22),
(2037, 'Los Cardos', 22),
(2038, 'Los Laureles', 22),
(2039, 'Los Molinos', 22),
(2040, 'Los Quirquinchos', 22),
(2041, 'Lucio V. Lopez', 22),
(2042, 'Luis Palacios', 22),
(2043, 'Ma. Juana', 22),
(2044, 'Ma. Luisa', 22),
(2045, 'Ma. Susana', 22),
(2046, 'Ma. Teresa', 22),
(2047, 'Maciel', 22),
(2048, 'Maggiolo', 22),
(2049, 'Malabrigo', 22),
(2050, 'Marcelino Escalada', 22),
(2051, 'Margarita', 22),
(2052, 'Matilde', 22),
(2053, 'Mauá', 22),
(2054, 'Máximo Paz', 22),
(2055, 'Melincué', 22),
(2056, 'Miguel Torres', 22),
(2057, 'Moisés Ville', 22),
(2058, 'Monigotes', 22),
(2059, 'Monje', 22),
(2060, 'Monte Obscuridad', 22),
(2061, 'Monte Vera', 22),
(2062, 'Montefiore', 22),
(2063, 'Montes de Oca', 22),
(2064, 'Murphy', 22),
(2065, 'Ñanducita', 22),
(2066, 'Naré', 22),
(2067, 'Nelson', 22),
(2068, 'Nicanor E. Molinas', 22),
(2069, 'Nuevo Torino', 22),
(2070, 'Oliveros', 22),
(2071, 'Palacios', 22),
(2072, 'Pavón', 22),
(2073, 'Pavón Arriba', 22),
(2074, 'Pedro Gómez Cello', 22),
(2075, 'Pérez', 22),
(2076, 'Peyrano', 22),
(2077, 'Piamonte', 22),
(2078, 'Pilar', 22),
(2079, 'Piñero', 22),
(2080, 'Plaza Clucellas', 22),
(2081, 'Portugalete', 22),
(2082, 'Pozo Borrado', 22),
(2083, 'Progreso', 22),
(2084, 'Providencia', 22),
(2085, 'Pte. Roca', 22),
(2086, 'Pueblo Andino', 22),
(2087, 'Pueblo Esther', 22),
(2088, 'Pueblo Gral. San Martín', 22),
(2089, 'Pueblo Irigoyen', 22),
(2090, 'Pueblo Marini', 22),
(2091, 'Pueblo Muñoz', 22),
(2092, 'Pueblo Uranga', 22),
(2093, 'Pujato', 22);
INSERT INTO `localidades` (`id`, `nombre`, `id_provincia`) VALUES
(2094, 'Pujato N.', 22),
(2095, 'Rafaela', 22),
(2096, 'Ramayón', 22),
(2097, 'Ramona', 22),
(2098, 'Reconquista', 22),
(2099, 'Recreo', 22),
(2100, 'Ricardone', 22),
(2101, 'Rivadavia', 22),
(2102, 'Roldán', 22),
(2103, 'Romang', 22),
(2104, 'Rosario', 22),
(2105, 'Rueda', 22),
(2106, 'Rufino', 22),
(2107, 'Sa Pereira', 22),
(2108, 'Saguier', 22),
(2109, 'Saladero M. Cabal', 22),
(2110, 'Salto Grande', 22),
(2111, 'San Agustín', 22),
(2112, 'San Antonio de Obligado', 22),
(2113, 'San Bernardo (N.J.)', 22),
(2114, 'San Bernardo (S.J.)', 22),
(2115, 'San Carlos Centro', 22),
(2116, 'San Carlos N.', 22),
(2117, 'San Carlos S.', 22),
(2118, 'San Cristóbal', 22),
(2119, 'San Eduardo', 22),
(2120, 'San Eugenio', 22),
(2121, 'San Fabián', 22),
(2122, 'San Fco. de Santa Fé', 22),
(2123, 'San Genaro', 22),
(2124, 'San Genaro N.', 22),
(2125, 'San Gregorio', 22),
(2126, 'San Guillermo', 22),
(2127, 'San Javier', 22),
(2128, 'San Jerónimo del Sauce', 22),
(2129, 'San Jerónimo N.', 22),
(2130, 'San Jerónimo S.', 22),
(2131, 'San Jorge', 22),
(2132, 'San José de La Esquina', 22),
(2133, 'San José del Rincón', 22),
(2134, 'San Justo', 22),
(2135, 'San Lorenzo', 22),
(2136, 'San Mariano', 22),
(2137, 'San Martín de Las Escobas', 22),
(2138, 'San Martín N.', 22),
(2139, 'San Vicente', 22),
(2140, 'Sancti Spititu', 22),
(2141, 'Sanford', 22),
(2142, 'Santo Domingo', 22),
(2143, 'Santo Tomé', 22),
(2144, 'Santurce', 22),
(2145, 'Sargento Cabral', 22),
(2146, 'Sarmiento', 22),
(2147, 'Sastre', 22),
(2148, 'Sauce Viejo', 22),
(2149, 'Serodino', 22),
(2150, 'Silva', 22),
(2151, 'Soldini', 22),
(2152, 'Soledad', 22),
(2153, 'Soutomayor', 22),
(2154, 'Sta. Clara de Buena Vista', 22),
(2155, 'Sta. Clara de Saguier', 22),
(2156, 'Sta. Isabel', 22),
(2157, 'Sta. Margarita', 22),
(2158, 'Sta. Maria Centro', 22),
(2159, 'Sta. María N.', 22),
(2160, 'Sta. Rosa', 22),
(2161, 'Sta. Teresa', 22),
(2162, 'Suardi', 22),
(2163, 'Sunchales', 22),
(2164, 'Susana', 22),
(2165, 'Tacuarendí', 22),
(2166, 'Tacural', 22),
(2167, 'Tartagal', 22),
(2168, 'Teodelina', 22),
(2169, 'Theobald', 22),
(2170, 'Timbúes', 22),
(2171, 'Toba', 22),
(2172, 'Tortugas', 22),
(2173, 'Tostado', 22),
(2174, 'Totoras', 22),
(2175, 'Traill', 22),
(2176, 'Venado Tuerto', 22),
(2177, 'Vera', 22),
(2178, 'Vera y Pintado', 22),
(2179, 'Videla', 22),
(2180, 'Vila', 22),
(2181, 'Villa Amelia', 22),
(2182, 'Villa Ana', 22),
(2183, 'Villa Cañas', 22),
(2184, 'Villa Constitución', 22),
(2185, 'Villa Eloísa', 22),
(2186, 'Villa Gdor. Gálvez', 22),
(2187, 'Villa Guillermina', 22),
(2188, 'Villa Minetti', 22),
(2189, 'Villa Mugueta', 22),
(2190, 'Villa Ocampo', 22),
(2191, 'Villa San José', 22),
(2192, 'Villa Saralegui', 22),
(2193, 'Villa Trinidad', 22),
(2194, 'Villada', 22),
(2195, 'Virginia', 22),
(2196, 'Wheelwright', 22),
(2197, 'Zavalla', 22),
(2198, 'Zenón Pereira', 22),
(2199, 'Añatuya', 23),
(2200, 'Árraga', 23),
(2201, 'Bandera', 23),
(2202, 'Bandera Bajada', 23),
(2203, 'Beltrán', 23),
(2204, 'Brea Pozo', 23),
(2205, 'Campo Gallo', 23),
(2206, 'Capital', 23),
(2207, 'Chilca Juliana', 23),
(2208, 'Choya', 23),
(2209, 'Clodomira', 23),
(2210, 'Col. Alpina', 23),
(2211, 'Col. Dora', 23),
(2212, 'Col. El Simbolar Robles', 23),
(2213, 'El Bobadal', 23),
(2214, 'El Charco', 23),
(2215, 'El Mojón', 23),
(2216, 'Estación Atamisqui', 23),
(2217, 'Estación Simbolar', 23),
(2218, 'Fernández', 23),
(2219, 'Fortín Inca', 23),
(2220, 'Frías', 23),
(2221, 'Garza', 23),
(2222, 'Gramilla', 23),
(2223, 'Guardia Escolta', 23),
(2224, 'Herrera', 23),
(2225, 'Icaño', 23),
(2226, 'Ing. Forres', 23),
(2227, 'La Banda', 23),
(2228, 'La Cañada', 23),
(2229, 'Laprida', 23),
(2230, 'Lavalle', 23),
(2231, 'Loreto', 23),
(2232, 'Los Juríes', 23),
(2233, 'Los Núñez', 23),
(2234, 'Los Pirpintos', 23),
(2235, 'Los Quiroga', 23),
(2236, 'Los Telares', 23),
(2237, 'Lugones', 23),
(2238, 'Malbrán', 23),
(2239, 'Matara', 23),
(2240, 'Medellín', 23),
(2241, 'Monte Quemado', 23),
(2242, 'Nueva Esperanza', 23),
(2243, 'Nueva Francia', 23),
(2244, 'Palo Negro', 23),
(2245, 'Pampa de Los Guanacos', 23),
(2246, 'Pinto', 23),
(2247, 'Pozo Hondo', 23),
(2248, 'Quimilí', 23),
(2249, 'Real Sayana', 23),
(2250, 'Sachayoj', 23),
(2251, 'San Pedro de Guasayán', 23),
(2252, 'Selva', 23),
(2253, 'Sol de Julio', 23),
(2254, 'Sumampa', 23),
(2255, 'Suncho Corral', 23),
(2256, 'Taboada', 23),
(2257, 'Tapso', 23),
(2258, 'Termas de Rio Hondo', 23),
(2259, 'Tintina', 23),
(2260, 'Tomas Young', 23),
(2261, 'Vilelas', 23),
(2262, 'Villa Atamisqui', 23),
(2263, 'Villa La Punta', 23),
(2264, 'Villa Ojo de Agua', 23),
(2265, 'Villa Río Hondo', 23),
(2266, 'Villa Salavina', 23),
(2267, 'Villa Unión', 23),
(2268, 'Vilmer', 23),
(2269, 'Weisburd', 23),
(2270, 'Río Grande', 24),
(2271, 'Tolhuin', 24),
(2272, 'Ushuaia', 24),
(2273, 'Acheral', 25),
(2274, 'Agua Dulce', 25),
(2275, 'Aguilares', 25),
(2276, 'Alderetes', 25),
(2277, 'Alpachiri', 25),
(2278, 'Alto Verde', 25),
(2279, 'Amaicha del Valle', 25),
(2280, 'Amberes', 25),
(2281, 'Ancajuli', 25),
(2282, 'Arcadia', 25),
(2283, 'Atahona', 25),
(2284, 'Banda del Río Sali', 25),
(2285, 'Bella Vista', 25),
(2286, 'Buena Vista', 25),
(2287, 'Burruyacú', 25),
(2288, 'Capitán Cáceres', 25),
(2289, 'Cevil Redondo', 25),
(2290, 'Choromoro', 25),
(2291, 'Ciudacita', 25),
(2292, 'Colalao del Valle', 25),
(2293, 'Colombres', 25),
(2294, 'Concepción', 25),
(2295, 'Delfín Gallo', 25),
(2296, 'El Bracho', 25),
(2297, 'El Cadillal', 25),
(2298, 'El Cercado', 25),
(2299, 'El Chañar', 25),
(2300, 'El Manantial', 25),
(2301, 'El Mojón', 25),
(2302, 'El Mollar', 25),
(2303, 'El Naranjito', 25),
(2304, 'El Naranjo', 25),
(2305, 'El Polear', 25),
(2306, 'El Puestito', 25),
(2307, 'El Sacrificio', 25),
(2308, 'El Timbó', 25),
(2309, 'Escaba', 25),
(2310, 'Esquina', 25),
(2311, 'Estación Aráoz', 25),
(2312, 'Famaillá', 25),
(2313, 'Gastone', 25),
(2314, 'Gdor. Garmendia', 25),
(2315, 'Gdor. Piedrabuena', 25),
(2316, 'Graneros', 25),
(2317, 'Huasa Pampa', 25),
(2318, 'J. B. Alberdi', 25),
(2319, 'La Cocha', 25),
(2320, 'La Esperanza', 25),
(2321, 'La Florida', 25),
(2322, 'La Ramada', 25),
(2323, 'La Trinidad', 25),
(2324, 'Lamadrid', 25),
(2325, 'Las Cejas', 25),
(2326, 'Las Talas', 25),
(2327, 'Las Talitas', 25),
(2328, 'Los Bulacio', 25),
(2329, 'Los Gómez', 25),
(2330, 'Los Nogales', 25),
(2331, 'Los Pereyra', 25),
(2332, 'Los Pérez', 25),
(2333, 'Los Puestos', 25),
(2334, 'Los Ralos', 25),
(2335, 'Los Sarmientos', 25),
(2336, 'Los Sosa', 25),
(2337, 'Lules', 25),
(2338, 'M. García Fernández', 25),
(2339, 'Manuela Pedraza', 25),
(2340, 'Medinas', 25),
(2341, 'Monte Bello', 25),
(2342, 'Monteagudo', 25),
(2343, 'Monteros', 25),
(2344, 'Padre Monti', 25),
(2345, 'Pampa Mayo', 25),
(2346, 'Quilmes', 25),
(2347, 'Raco', 25),
(2348, 'Ranchillos', 25),
(2349, 'Río Chico', 25),
(2350, 'Río Colorado', 25),
(2351, 'Río Seco', 25),
(2352, 'Rumi Punco', 25),
(2353, 'San Andrés', 25),
(2354, 'San Felipe', 25),
(2355, 'San Ignacio', 25),
(2356, 'San Javier', 25),
(2357, 'San José', 25),
(2358, 'San Miguel de 25', 25),
(2359, 'San Pedro', 25),
(2360, 'San Pedro de Colalao', 25),
(2361, 'Santa Rosa de Leales', 25),
(2362, 'Sgto. Moya', 25),
(2363, 'Siete de Abril', 25),
(2364, 'Simoca', 25),
(2365, 'Soldado Maldonado', 25),
(2366, 'Sta. Ana', 25),
(2367, 'Sta. Cruz', 25),
(2368, 'Sta. Lucía', 25),
(2369, 'Taco Ralo', 25),
(2370, 'Tafí del Valle', 25),
(2371, 'Tafí Viejo', 25),
(2372, 'Tapia', 25),
(2373, 'Teniente Berdina', 25),
(2374, 'Trancas', 25),
(2375, 'Villa Belgrano', 25),
(2376, 'Villa Benjamín Araoz', 25),
(2377, 'Villa Chiligasta', 25),
(2378, 'Villa de Leales', 25),
(2379, 'Villa Quinteros', 25),
(2380, 'Yánima', 25),
(2381, 'Yerba Buena', 25),
(2382, 'Yerba Buena (S)', 25);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marca`
--

CREATE TABLE `marca` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(1000) NOT NULL,
  `imagen` varchar(100) NOT NULL DEFAULT 'marca_default.png',
  `fecha_creacion` datetime NOT NULL DEFAULT current_timestamp(),
  `fecha_edicion` datetime NOT NULL DEFAULT current_timestamp(),
  `estado` varchar(10) NOT NULL DEFAULT 'A'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `marca`
--

INSERT INTO `marca` (`id`, `nombre`, `descripcion`, `imagen`, `fecha_creacion`, `fecha_edicion`, `estado`) VALUES
(1, 'Samsung', 'Tecnología', '61fe9b2e5f6e9-samsung_marca.jpg', '2021-08-20 13:20:44', '2021-08-20 13:20:44', 'A'),
(2, 'Apple', 'Tecnología', '61fe9ba7ec6cc-descarga.png', '2021-08-20 13:20:44', '2021-08-20 13:20:44', 'A'),
(3, 'Nike', 'Ropa Deportiva', '61ec8d3660b95-Nike.png', '2022-01-22 20:03:18', '2022-01-22 20:03:18', 'A'),
(4, 'Adidas', 'Ropa Deportiva', '61ec942909469-addidas.png', '2022-01-22 20:32:57', '2022-01-22 20:32:57', 'A'),
(5, 'Topper', 'e', '61f5737bc4e59-Topper_arg_logo.png', '2022-01-22 20:47:37', '2022-01-22 20:47:37', 'I'),
(6, 'Puma', 'Ropa Deportiva', '61fe9298de8ad-puma.jpg', '2022-02-05 12:07:04', '2022-02-05 12:07:04', 'A'),
(7, 'Motorola', 'Tecnología', '6222b84499936-motorola.jpg', '2022-03-04 22:09:24', '2022-03-04 22:09:24', 'A'),
(8, 'Flecha', 'Calzado Deportivo', '620811912cfcd-Flecha.png', '2022-03-04 22:12:46', '2022-03-04 22:12:46', 'A'),
(9, 'Xiaomi', 'Tecnología', '6222c1e2aaeb3-Xiaomi-Logo.png', '2022-03-04 22:51:49', '2022-03-04 22:51:49', 'A'),
(10, 'Stoness', 'Calzado Deportivo', '622a1b6813ba7-Stone.jpg', '2022-03-10 14:13:26', '2022-03-10 14:13:26', 'A'),
(11, 'H&M', 'Indumentaria Hombre, Mujer', '622d06b210063-622d06b210066.png', '2022-03-12 17:37:53', '2022-03-12 17:37:53', 'A'),
(12, 'Lacoste', 'Calzado Deportivo', '62327f37f3253-62327f37f3254.jpg', '2022-03-16 21:23:41', '2022-03-16 21:23:41', 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mensaje`
--

CREATE TABLE `mensaje` (
  `id` int(11) NOT NULL,
  `estado` varchar(10) NOT NULL DEFAULT 'A',
  `fecha_creacion` datetime NOT NULL DEFAULT current_timestamp(),
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `mensaje`
--

INSERT INTO `mensaje` (`id`, `estado`, `fecha_creacion`, `id_usuario`) VALUES
(1, 'A', '2022-03-19 18:58:54', 1),
(2, 'A', '2022-03-23 21:04:36', 1),
(3, 'A', '2022-03-26 18:18:23', 1),
(4, 'A', '2022-03-26 18:18:24', 1),
(5, 'A', '2022-03-26 18:18:25', 1),
(6, 'A', '2022-03-26 18:18:26', 1),
(7, 'A', '2022-03-26 18:18:27', 1),
(8, 'A', '2022-03-26 18:18:29', 1),
(9, 'A', '2022-03-26 18:18:29', 1),
(10, 'A', '2022-03-26 18:18:30', 1),
(11, 'A', '2022-03-26 18:20:15', 1),
(12, 'A', '2022-04-19 21:33:01', 1),
(13, 'A', '2022-04-21 14:05:59', 1),
(14, 'A', '2022-04-23 14:00:17', 2),
(15, 'A', '2022-04-23 14:05:37', 2),
(16, 'A', '2022-04-27 20:10:25', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modulo`
--

CREATE TABLE `modulo` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `icono` varchar(100) NOT NULL,
  `estado` varchar(10) NOT NULL DEFAULT 'A'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `modulo`
--

INSERT INTO `modulo` (`id`, `nombre`, `icono`, `estado`) VALUES
(1, 'Mi perfil', '<i class=\"fas fa-user bg-info\"></i>', 'A'),
(2, 'Mis compras', '<i class=\"fas fa-shopping-cart bg-success\"></i>', 'A'),
(3, 'Producto', '<i class=\"fas fa-box bg-primary\"></i>', 'A'),
(4, 'Notificaciones', '<i class=\"far fa-bell bg-warning\"></i>', 'A'),
(5, 'Favoritos', '<i class=\"fas fa-heart bg-danger\"></i>', 'A'),
(6, 'Marcas', '<i class=\"fas fa-apple-alt bg-secondary\"></i>', 'A'),
(7, 'Mensaje', '<i class=\"far fa-envelope bg-warning\"></i>', 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notificacion`
--

CREATE TABLE `notificacion` (
  `id` int(11) NOT NULL,
  `titulo` varchar(500) NOT NULL,
  `asunto` varchar(500) NOT NULL,
  `contenido` varchar(1000) NOT NULL,
  `imagen` varchar(500) NOT NULL,
  `url_1` varchar(1000) DEFAULT NULL,
  `url_2` varchar(1000) DEFAULT NULL,
  `fecha_creacion` datetime NOT NULL DEFAULT current_timestamp(),
  `estado_abierto` int(10) NOT NULL DEFAULT 0,
  `estado` varchar(10) NOT NULL DEFAULT 'A',
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `notificacion`
--

INSERT INTO `notificacion` (`id`, `titulo`, `asunto`, `contenido`, `imagen`, `url_1`, `url_2`, `fecha_creacion`, `estado_abierto`, `estado`, `id_usuario`) VALUES
(1, 'Samsung Galaxy A21S', 'Alguien realizó una pregunta en tu producto', 'Quedan en stock de color blanco ?', 'a21s-principal.png', 'Views/descripcion.php?name=Samsung Galaxy A21S&&id=oyWLV2zvZfKAz4e2G9uEFw==', NULL, '2021-09-23 00:11:00', 1, 'A', 1),
(2, 'Samsung Galaxy A21S', 'El vendedor te respondió tu pregunta', 'Si tengo stock aun quedan 10 unidades', 'a21s-principal.png', 'Views/descripcion.php?name=Samsung Galaxy A21S&&id=oyWLV2zvZfKAz4e2G9uEFw==', NULL, '2021-09-23 00:34:18', 1, 'A', 5),
(3, 'Samsung Galaxy A21S', 'Alguien realizó una pregunta en tu producto', 'Podrían enviar el producto por medio de Uber ?', 'a21s-principal.png', 'Views/descripcion.php?name=Samsung Galaxy A21S&&id=oyWLV2zvZfKAz4e2G9uEFw==', NULL, '2021-09-25 12:39:34', 1, 'A', 1),
(4, 'Samsung Galaxy A21S', 'El vendedor te respondió tu pregunta', 'Ningún problema lo podemos enviar por ese medio', 'a21s-principal.png', 'Views/descripcion.php?name=Samsung Galaxy A21S&&id=oyWLV2zvZfKAz4e2G9uEFw==', NULL, '2021-09-29 14:00:57', 1, 'A', 5),
(5, 'iPhone 11', 'Alguien realizó una pregunta en tu producto', 'Queda en stock disponible en color negro?', 'iPhone11-principal.png', 'Views/descripcion.php?name=iPhone 11&&id=ikWiIdsoykIoPZ0059v4Vg==', NULL, '2021-09-29 15:31:29', 1, 'A', 1),
(6, 'iPhone 11', 'El vendedor te respondió tu pregunta', 'si tenemos en stock. Podes realizar la compra', 'iPhone11-principal.png', 'Views/descripcion.php?name=iPhone 11&&id=ikWiIdsoykIoPZ0059v4Vg==', NULL, '2021-09-29 15:32:47', 1, 'A', 5),
(7, 'Samsung Galaxy A21S', 'Alguien realizó una pregunta en tu producto', 'Pondrían enviar mi pedido por Uber ? ', 'a21s-principal.png', 'Views/descripcion.php?name=Samsung Galaxy A21S&&id=oyWLV2zvZfKAz4e2G9uEFw==', NULL, '2021-10-02 12:39:02', 1, 'A', 1),
(8, 'iPhone 11', 'Alguien realizó una pregunta en tu producto', 'Quisiera saber si queda en stock ?', 'iPhone11-principal.png', 'Views/descripcion.php?name=iPhone 11&&id=ikWiIdsoykIoPZ0059v4Vg==', NULL, '2021-10-08 16:31:18', 1, 'A', 1),
(9, 'iPhone 11', 'El vendedor te respondió tu pregunta', 'Si tenemos en stock, podes ofertar', 'iPhone11-principal.png', 'Views/descripcion.php?name=iPhone 11&&id=ikWiIdsoykIoPZ0059v4Vg==', NULL, '2021-10-08 16:34:01', 1, 'A', 2),
(10, 'Samsung Galaxy A21S', 'Alguien realizó una pregunta en tu producto', 'Queda en stock en color Rojo ?', 'a21s-principal.png', 'Views/descripcion.php?name=Samsung Galaxy A21S&&id=oyWLV2zvZfKAz4e2G9uEFw==', NULL, '2021-10-08 16:55:56', 1, 'I', 1),
(11, 'Samsung Galaxy A21S', 'El vendedor te respondió tu pregunta', 'si te lo podemos enviar por Uber', 'a21s-principal.png', 'Views/descripcion.php?name=Samsung Galaxy A21S&&id=oyWLV2zvZfKAz4e2G9uEFw==', NULL, '2021-10-08 16:58:25', 1, 'A', 2),
(12, 'Samsung Galaxy A21S', 'El vendedor te respondió tu pregunta', 'Si teneos en stock podes ofertar', 'a21s-principal.png', 'Views/descripcion.php?name=Samsung Galaxy A21S&&id=oyWLV2zvZfKAz4e2G9uEFw==', NULL, '2021-10-08 16:58:55', 1, 'A', 2),
(13, 'Samsung Galaxy A21S', 'Alguien realizó una pregunta en tu producto', 'Queda en stock de color blanco ?', 'a21s-principal.png', 'Views/descripcion.php?name=Samsung Galaxy A21S&&id=oyWLV2zvZfKAz4e2G9uEFw==', NULL, '2021-10-09 11:59:25', 1, 'I', 1),
(14, 'Samsung Galaxy A21S', 'El vendedor te respondió tu pregunta', 'Si hay stock podes ofertar', 'a21s-principal.png', 'Views/descripcion.php?name=Samsung Galaxy A21S&&id=oyWLV2zvZfKAz4e2G9uEFw==', NULL, '2021-10-09 12:10:16', 1, 'A', 2),
(15, 'Samsung Galaxy A21S', 'Alguien realizó una pregunta en tu producto', 'Quisiera saber cuanto tiempo tiene de garantía ?', 'a21s-principal.png', 'Views/descripcion.php?name=Samsung Galaxy A21S&&id=oyWLV2zvZfKAz4e2G9uEFw==', NULL, '2021-10-13 14:17:12', 1, 'A', 1),
(16, 'Samsung Galaxy A21S', 'El vendedor te respondió tu pregunta', 'Este producto tiene 3 años de garantía. ', 'a21s-principal.png', 'Views/descripcion.php?name=Samsung Galaxy A21S&&id=oyWLV2zvZfKAz4e2G9uEFw==', NULL, '2021-10-13 15:52:38', 1, 'A', 2),
(17, 'iPhone 11', 'Alguien realizó una pregunta en tu producto', 'Hay algún descuento en este producto ?', 'iPhone11-principal.png', 'Views/descripcion.php?name=iPhone 11&&id=ikWiIdsoykIoPZ0059v4Vg==', NULL, '2021-10-23 12:54:34', 1, 'A', 1),
(18, 'Samsung Galaxy A21S', 'Alguien realizó una pregunta en tu producto', 'Podrían llevarlo a la casa de mi hermano ?', 'a21s-principal.png', 'Views/descripcion.php?name=Samsung Galaxy A21S&&id=oyWLV2zvZfKAz4e2G9uEFw==', NULL, '2021-10-27 12:37:56', 1, 'A', 1),
(19, 'Samsung Galaxy A21S', 'El vendedor te respondió tu pregunta', 'Si, te lo llevamos a la casa de tu hermano', 'a21s-principal.png', 'Views/descripcion.php?name=Samsung Galaxy A21S&&id=oyWLV2zvZfKAz4e2G9uEFw==', NULL, '2021-10-27 12:39:52', 1, 'A', 5),
(20, 'iPhone 11', 'El vendedor te respondió tu pregunta', 'Te puedo hacer el 5% de descuento adicional si ofertas hoy', 'iPhone11-principal.png', 'Views/descripcion.php?name=iPhone 11&&id=ikWiIdsoykIoPZ0059v4Vg==', NULL, '2021-10-27 15:55:51', 1, 'A', 2),
(21, 'Samsung Galaxy A21S', 'Alguien realizó una pregunta en tu producto', 'podría reservarme uno para el Viernes ?', 'a21s-principal.png', 'Views/descripcion.php?name=Samsung Galaxy A21S&&id=oyWLV2zvZfKAz4e2G9uEFw==', NULL, '2021-11-10 12:43:11', 0, 'A', 1),
(22, 'iPhone 11', 'Alguien realizó una pregunta en tu producto', 'Hay Stock disponible ?', 'iPhone11-principal.png', 'Views/descripcion.php?name=iPhone 11&&id=ikWiIdsoykIoPZ0059v4Vg==', NULL, '2021-11-13 12:52:06', 0, 'A', 1),
(23, 'iPhone 11', 'El vendedor te respondió tu pregunta', 'Si tenemos stock disponible, podes ofertar', 'iPhone11-principal.png', 'Views/descripcion.php?name=iPhone 11&&id=ikWiIdsoykIoPZ0059v4Vg==', NULL, '2021-11-13 12:54:33', 1, 'A', 2),
(24, 'Samsung Galaxy A21S', 'El vendedor te respondió tu pregunta', 'Perfecto reservado para el viernes', 'a21s-principal.png', 'Views/descripcion.php?name=Samsung Galaxy A21S&&id=oyWLV2zvZfKAz4e2G9uEFw==', NULL, '2021-12-06 13:21:15', 0, 'A', 2),
(25, 'Samsung Galaxy A21S', 'Alguien realizó una pregunta en tu producto', 'Necesitaría saber si se puede cambiar por color Blanco ?', 'a21s-principal.png', 'Views/descripcion.php?name=Samsung Galaxy A21S&&id=oyWLV2zvZfKAz4e2G9uEFw==', NULL, '2021-12-06 13:23:00', 0, 'A', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pregunta`
--

CREATE TABLE `pregunta` (
  `id` int(11) NOT NULL,
  `contenido` varchar(1000) NOT NULL,
  `fecha_creacion` datetime NOT NULL DEFAULT current_timestamp(),
  `estado` varchar(10) NOT NULL DEFAULT 'A',
  `respuesta` int(10) NOT NULL DEFAULT 0,
  `id_producto_tienda` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pregunta`
--

INSERT INTO `pregunta` (`id`, `contenido`, `fecha_creacion`, `estado`, `respuesta`, `id_producto_tienda`, `id_usuario`) VALUES
(1, 'Este producto es nuevo ?', '2021-08-28 13:44:32', 'A', 1, 1, 5),
(2, 'Quisiera saber el coste del envío del producto ?', '2021-08-28 13:44:34', 'A', 1, 1, 5),
(3, 'Cuanto tiempo demora en llegar el producto a destino ?', '2021-09-04 23:22:21', 'A', 1, 1, 5),
(4, 'Hay algún descuento en este producto ?', '2021-09-15 16:40:53', 'A', 1, 1, 5),
(5, 'Cuanto tiempo de garantía tiene este producto ?', '2021-09-15 16:44:16', 'A', 1, 1, 5),
(6, 'Quisiera saber si lo pueden enviar por mercado envió ?', '2021-09-18 22:48:09', 'A', 1, 2, 5),
(7, 'Hay en stock en este momento ?', '2021-09-18 22:56:12', 'A', 1, 1, 2),
(8, 'Quedan en stock de color blanco ?', '2021-09-23 00:11:00', 'A', 1, 1, 5),
(9, 'Podrían enviar el producto por medio de Uber ?', '2021-09-25 12:39:34', 'A', 1, 1, 5),
(10, 'Queda en stock disponible en color negro?', '2021-09-29 15:31:29', 'A', 1, 2, 5),
(11, 'Pondrían enviar mi pedido por Uber ? ', '2021-10-02 12:39:02', 'A', 1, 1, 2),
(12, 'Quisiera saber si queda en stock ?', '2021-10-08 16:31:18', 'A', 1, 2, 2),
(13, 'Queda en stock en color Rojo ?', '2021-10-08 16:55:56', 'A', 1, 1, 2),
(14, 'Queda en stock de color blanco ?', '2021-10-09 11:59:25', 'A', 1, 1, 2),
(15, 'Quisiera saber cuanto tiempo tiene de garantía ?', '2021-10-13 14:17:12', 'A', 1, 1, 2),
(16, 'Hay algún descuento en este producto ?', '2021-10-23 12:54:34', 'A', 1, 2, 2),
(17, 'Podrían llevarlo a la casa de mi hermano ?', '2021-10-27 12:37:56', 'A', 1, 1, 5),
(18, 'podría reservarme uno para el Viernes ?', '2021-11-10 12:43:11', 'A', 1, 1, 2),
(19, 'Hay Stock disponible ?', '2021-11-13 12:52:06', 'A', 1, 2, 2),
(20, 'Necesitaría saber si se puede cambiar por color Blanco ?', '2021-12-06 13:23:00', 'A', 0, 1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `SKU` varchar(50) NOT NULL,
  `detalles` varchar(1000) NOT NULL,
  `imagen_principal` varchar(100) NOT NULL DEFAULT 'producto_default.png',
  `fecha_creacion` datetime NOT NULL DEFAULT current_timestamp(),
  `fecha_edicion` datetime NOT NULL DEFAULT current_timestamp(),
  `estado` varchar(10) NOT NULL DEFAULT 'A',
  `id_marca` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id`, `nombre`, `SKU`, `detalles`, `imagen_principal`, `fecha_creacion`, `fecha_edicion`, `estado`, `id_marca`) VALUES
(1, 'Samsung Galaxy A21S', '2fgdsg5-GFrt', 'El procesamiento rápido y amplio almacenamiento de Galaxy A21s te permiten concentrarte en el ahora. Un procesador Octa-core avanzado y 4 GB de RAM brindan un rendimiento suave y eficiente. Además, podés descargar más y eliminar menos con el almacenamiento interno de 128 GB. Y agregá aún más con una tarjeta microSD de 512 GB.', 'a21s-principal.png', '2021-08-20 13:33:28', '2021-08-20 13:33:28', 'A', 1),
(2, 'iPhone 11', 'aewrKL-llkp', 'El Apple iPhone 11 es el sucesor del iPhone Xr para el 2019. Este año el iPhone 11 llega con una pantalla de 6.1 pulgadas con resolución Liquid Retina y potenciado por un procesador Apple A13 Bionic con 64GB, 128GB o 256GB de almacenamiento interno. La cámara posterior del iPhone 11 ahora es dual, con un lente regular de 12 MP y otro gran angular de 12 MP, mientras que su cámara frontal es de 12 MP. El iPhone 11 cuenta con una batería de 3110 mAh con carga rápida, parlantes stereo con sonido Dolby Atmos, carga inalámbrica y utiliza reconocimiento de rostro Face ID para seguridad.', 'iPhone11-principal.png', '2021-08-20 13:33:28', '2021-08-20 13:33:28', 'A', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto_subcategoria`
--

CREATE TABLE `producto_subcategoria` (
  `id` int(11) NOT NULL,
  `fecha_creacion` datetime NOT NULL DEFAULT current_timestamp(),
  `fecha_edicion` datetime NOT NULL DEFAULT current_timestamp(),
  `estado` varchar(10) NOT NULL DEFAULT 'A',
  `id_producto` int(11) NOT NULL,
  `id_subcategoria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `producto_subcategoria`
--

INSERT INTO `producto_subcategoria` (`id`, `fecha_creacion`, `fecha_edicion`, `estado`, `id_producto`, `id_subcategoria`) VALUES
(1, '2021-08-20 14:16:09', '2021-08-20 14:16:09', 'A', 1, 1),
(2, '2021-08-20 14:16:09', '2021-08-20 14:16:09', 'A', 2, 1),
(3, '2021-08-20 14:16:09', '2021-08-20 14:16:09', 'A', 1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto_tienda`
--

CREATE TABLE `producto_tienda` (
  `id` int(11) NOT NULL,
  `precio` float NOT NULL,
  `cantidad` int(11) NOT NULL,
  `descuento` int(11) NOT NULL,
  `garantia` varchar(100) NOT NULL,
  `estado_envio` varchar(100) NOT NULL,
  `fecha_creacion` datetime NOT NULL DEFAULT current_timestamp(),
  `fecha_edicion` datetime NOT NULL DEFAULT current_timestamp(),
  `estado` varchar(10) NOT NULL DEFAULT 'A',
  `id_producto` int(11) NOT NULL,
  `id_tienda` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `producto_tienda`
--

INSERT INTO `producto_tienda` (`id`, `precio`, `cantidad`, `descuento`, `garantia`, `estado_envio`, `fecha_creacion`, `fecha_edicion`, `estado`, `id_producto`, `id_tienda`) VALUES
(1, 36000, 10, 10, '3 años', 'gratis', '2021-08-20 14:28:10', '2021-08-20 14:28:10', 'A', 1, 1),
(2, 100000, 10, 5, '5 años', '', '2021-08-20 14:28:10', '2021-08-20 14:28:10', 'A', 2, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `provincias`
--

CREATE TABLE `provincias` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `provincias`
--

INSERT INTO `provincias` (`id`, `nombre`) VALUES
(1, 'Buenos Aires'),
(2, 'Buenos Aires-GBA'),
(3, 'Capital Federal'),
(4, 'Catamarca'),
(5, 'Chaco'),
(6, 'Chubut'),
(7, 'Córdoba'),
(8, 'Corrientes'),
(9, 'Entre Ríos'),
(10, 'Formosa'),
(11, 'Jujuy'),
(12, 'La Pampa'),
(13, 'La Rioja'),
(14, 'Mendoza'),
(15, 'Misiones'),
(16, 'Neuquén'),
(17, 'Río Negro'),
(18, 'Salta'),
(19, 'San Juan'),
(20, 'San Luis'),
(21, 'Santa Cruz'),
(22, 'Santa Fe'),
(23, 'Santiago del Estero'),
(24, 'Tierra del Fuego'),
(25, 'Tucumán');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `resena`
--

CREATE TABLE `resena` (
  `id` int(11) NOT NULL,
  `calificacion` int(10) NOT NULL,
  `descripcion` varchar(1000) NOT NULL,
  `fecha_creacion` datetime NOT NULL DEFAULT current_timestamp(),
  `fecha_edicion` datetime NOT NULL DEFAULT current_timestamp(),
  `estado` varchar(10) NOT NULL DEFAULT 'A',
  `id_producto_tienda` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `resena`
--

INSERT INTO `resena` (`id`, `calificacion`, `descripcion`, `fecha_creacion`, `fecha_edicion`, `estado`, `id_producto_tienda`, `id_usuario`) VALUES
(1, 5, 'Buen producto, llego en perfecto estado, recomiendo esta tienda.', '2021-08-20 14:33:53', '2021-08-20 14:33:53', 'A', 1, 5),
(2, 4, 'Buen producto, llegó casi a tiempo. El vendedor se preocupo por la venta.', '2021-08-20 14:33:53', '2021-08-20 14:33:53', 'A', 2, 5),
(3, 3, 'Llego el empaque malogrado.', '2021-08-20 14:33:53', '2021-08-20 14:33:53', 'A', 1, 5),
(4, 4, 'Excelente vendedor, se preocupó demasiado por la venta.', '2021-08-22 00:21:06', '2021-08-22 00:21:06', 'A', 1, 1),
(5, 5, 'Buen producto', '2021-08-22 00:50:52', '2021-08-22 00:50:52', 'A', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `respuesta`
--

CREATE TABLE `respuesta` (
  `id` int(11) NOT NULL,
  `contenido` varchar(1000) NOT NULL,
  `fecha_creacion` datetime NOT NULL DEFAULT current_timestamp(),
  `estado` varchar(10) NOT NULL DEFAULT 'A',
  `id_pregunta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `respuesta`
--

INSERT INTO `respuesta` (`id`, `contenido`, `fecha_creacion`, `estado`, `id_pregunta`) VALUES
(1, 'Si el producto es nuevo y viene con caja totalmente cerrada.', '2021-08-28 13:47:18', 'A', 1),
(2, 'Depende del destino donde valla.', '2021-09-04 23:26:00', 'A', 2),
(3, 'Tiene 2 años de garantía.', '2021-09-18 21:39:05', 'A', 5),
(4, 'Ya el producto esta en oferta!!!!!', '2021-09-18 21:42:15', 'A', 4),
(5, 'El tiempo en la semana es de 24hs. máximo', '2021-09-18 21:42:59', 'A', 3),
(6, 'Tenemos en stock disponible', '2021-09-18 23:16:16', 'A', 7),
(7, 'Si. Lo podemos enviar por mercado envió', '2021-09-18 23:17:33', 'A', 6),
(8, 'Si tengo stock aun quedan 10 unidades', '2021-09-23 00:34:18', 'A', 8),
(9, 'Ningún problema lo podemos enviar por ese medio', '2021-09-29 14:00:57', 'A', 9),
(10, 'si tenemos en stock. Podes realizar la compra', '2021-09-29 15:32:47', 'A', 10),
(11, 'Si tenemos en stock, podes ofertar', '2021-10-08 16:34:01', 'A', 12),
(12, 'si te lo podemos enviar por Uber', '2021-10-08 16:58:25', 'A', 11),
(13, 'Si teneos en stock podes ofertar', '2021-10-08 16:58:55', 'A', 13),
(14, 'Si hay stock podes ofertar', '2021-10-09 12:10:16', 'A', 14),
(15, 'Este producto tiene 3 años de garantía. ', '2021-10-13 15:52:38', 'A', 15),
(16, 'Si, te lo llevamos a la casa de tu hermano', '2021-10-27 12:39:52', 'A', 17),
(17, 'Te puedo hacer el 5% de descuento adicional si ofertas hoy', '2021-10-27 15:55:51', 'A', 16),
(18, 'Si tenemos stock disponible, podes ofertar', '2021-11-13 12:54:33', 'A', 19),
(19, 'Perfecto reservado para el viernes', '2021-12-06 13:21:15', 'A', 18);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solicitud_marca`
--

CREATE TABLE `solicitud_marca` (
  `id` int(11) NOT NULL,
  `nombre` varchar(1000) NOT NULL,
  `descripcion` varchar(1000) NOT NULL,
  `imagen` varchar(1000) NOT NULL,
  `observacion` varchar(10000) DEFAULT NULL,
  `estado` varchar(10) NOT NULL DEFAULT 'A',
  `estado_solicitud` varchar(10) NOT NULL DEFAULT '0',
  `fecha_creacion` datetime NOT NULL DEFAULT current_timestamp(),
  `fecha_edicion` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `aprobado_por` int(11) DEFAULT NULL,
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `solicitud_marca`
--

INSERT INTO `solicitud_marca` (`id`, `nombre`, `descripcion`, `imagen`, `observacion`, `estado`, `estado_solicitud`, `fecha_creacion`, `fecha_edicion`, `aprobado_por`, `id_usuario`) VALUES
(1, 'Flecha', 'Calzado Deportivo', '620811912cfcd-Flecha.png', NULL, 'A', '2', '2022-02-12 16:59:13', '2022-03-04 22:12:46', 2, 1),
(2, 'Xiaomi', 'Tecnología', '6222c1e2aaeb3-Xiaomi-Logo.png', 'No se aproba la solicitud ya que existe una marca con el mismo nombre Motorola', 'A', '2', '2022-02-19 14:40:21', '2022-03-04 22:51:49', 2, 1),
(3, 'Stone', 'Calzado Deportivo', '622a1b6813ba7-Stone.jpg', 'Cambie la imagen se ve en blanco y negro', 'A', '2', '2022-03-10 12:38:16', '2022-03-10 14:13:26', 2, 1),
(4, 'G-Star', 'Indumentaria Hombre, Mujeres', '622d0ba25097f-622d0ba250982.png', 'Corrige la descripción', 'A', '1', '2022-03-12 18:07:05', '2022-03-23 21:04:36', 2, 1),
(5, 'Lacoste', 'Calzado Deportivo', '62327f37f3253-62327f37f3254.jpg', NULL, 'A', '2', '2022-03-16 21:22:16', '2022-03-16 21:23:41', 2, 1),
(6, 'prueba1', 'eeee', '623f8261345c4-623f8261345c8.png', NULL, 'A', '0', '2022-03-26 18:15:13', '2022-03-26 18:15:13', NULL, 1),
(7, 'prueba2', '111111', '623f827be54bc-623f827be54c2.png', NULL, 'A', '1', '2022-03-26 18:15:39', '2022-03-26 18:18:30', NULL, 1),
(8, 'prueba3', 'qqqqq', '623f8290c0838-623f8290c0839.png', NULL, 'A', '1', '2022-03-26 18:16:00', '2022-03-26 18:18:29', NULL, 1),
(9, 'prueba4', 'aaaaa', '623f82a627882-623f82a627887.png', NULL, 'A', '1', '2022-03-26 18:16:22', '2022-03-26 18:18:29', NULL, 1),
(10, 'prueba5', 'fsddfsdfsd', '623f82ba82603-623f82ba82607.png', NULL, 'A', '1', '2022-03-26 18:16:42', '2022-03-26 18:18:27', NULL, 1),
(11, 'prueba6', 'Calzado Deportivo', '623f82d286e32-623f82d286e38.png', NULL, 'A', '1', '2022-03-26 18:17:06', '2022-03-26 18:18:26', NULL, 1),
(12, 'prueba7', 'sdfsdfsdf', '623f82f23ee49-623f82f23ee50.jpg', NULL, 'A', '1', '2022-03-26 18:17:38', '2022-03-26 18:18:25', NULL, 1),
(13, 'prueba8', '1111111111111', '623f8300734c0-623f8300734c3.jpg', NULL, 'A', '1', '2022-03-26 18:17:52', '2022-03-26 18:18:24', NULL, 1),
(14, 'prueba9 ', 'fsddfsdfsd', '623f83119fa0b-623f83119fa10.png', NULL, 'A', '1', '2022-03-26 18:18:09', '2022-03-26 18:18:23', NULL, 1),
(15, 'prueba10', 'dfgd', '623f8366851e2-623f8366851e8.png', NULL, 'A', '1', '2022-03-26 18:19:34', '2022-03-26 18:20:15', NULL, 1),
(16, 'Pirulo', 'Ropa Infantil', '625f549a9049a-625f549a9049b.jpg', NULL, 'A', '1', '2022-04-19 21:32:26', '2022-04-19 21:33:01', NULL, 1),
(17, 'Pepito', 'Calzado Deportivo', '62618ed965581-62618ed965582.jpg', NULL, 'A', '1', '2022-04-21 14:05:29', '2022-04-21 14:05:59', NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `subcategoria`
--

CREATE TABLE `subcategoria` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `fecha_creacion` datetime NOT NULL DEFAULT current_timestamp(),
  `fecha_edicion` datetime NOT NULL DEFAULT current_timestamp(),
  `estado` varchar(10) NOT NULL DEFAULT 'A',
  `id_categoria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `subcategoria`
--

INSERT INTO `subcategoria` (`id`, `nombre`, `fecha_creacion`, `fecha_edicion`, `estado`, `id_categoria`) VALUES
(1, 'Liberados', '2021-08-20 14:14:15', '2021-08-20 14:14:15', 'A', 1),
(2, 'Movistar', '2021-08-20 14:14:15', '2021-08-20 14:14:15', 'A', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tienda`
--

CREATE TABLE `tienda` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `razon_social` varchar(200) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `CUIT` varchar(12) NOT NULL,
  `imagen` varchar(100) NOT NULL DEFAULT 'tienda_default.png',
  `fecha_creacion` datetime NOT NULL DEFAULT current_timestamp(),
  `fecha_edicion` datetime NOT NULL DEFAULT current_timestamp(),
  `estado` varchar(10) NOT NULL DEFAULT 'A',
  `id_usuario` int(11) NOT NULL,
  `id_localidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tienda`
--

INSERT INTO `tienda` (`id`, `nombre`, `razon_social`, `direccion`, `CUIT`, `imagen`, `fecha_creacion`, `fecha_edicion`, `estado`, `id_usuario`, `id_localidad`) VALUES
(1, 'MORRONE SHOP', 'Morrone Pablo Martín', 'El Arreo 220 - La Reja - Buenos Aires GBA', '20223625909', 'tienda_default.png', '2021-08-20 14:21:33', '2021-08-20 14:21:33', 'A', 1, 200);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_historial`
--

CREATE TABLE `tipo_historial` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `icono` varchar(100) NOT NULL,
  `estado` varchar(10) NOT NULL DEFAULT 'A'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipo_historial`
--

INSERT INTO `tipo_historial` (`id`, `nombre`, `icono`, `estado`) VALUES
(1, 'Editar', '<i class=\"far fa-edit\"></i>', 'A'),
(2, 'Crear', '<i class=\"fas fa-plus\"></i>', 'A'),
(3, 'Borrar', '<i class=\"far fa-trash-alt\"></i>', 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_usuario`
--

CREATE TABLE `tipo_usuario` (
  `id` int(11) NOT NULL,
  `tipo` varchar(50) NOT NULL,
  `estado` varchar(10) NOT NULL DEFAULT 'A'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipo_usuario`
--

INSERT INTO `tipo_usuario` (`id`, `tipo`, `estado`) VALUES
(1, 'Root', 'A'),
(2, 'Administrador', 'A'),
(3, 'Vendedor', 'A'),
(4, 'Cliente', 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `user` varchar(50) NOT NULL,
  `pass` varchar(255) NOT NULL,
  `nombres` varchar(50) NOT NULL,
  `apellidos` varchar(50) NOT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `referencia` varchar(100) DEFAULT NULL,
  `dni` bigint(12) NOT NULL,
  `email` varchar(200) NOT NULL,
  `telefono` bigint(12) DEFAULT NULL,
  `avatar` varchar(200) NOT NULL DEFAULT 'user_default.png',
  `estado` varchar(10) NOT NULL DEFAULT 'A',
  `id_tipo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `user`, `pass`, `nombres`, `apellidos`, `direccion`, `referencia`, `dni`, `email`, `telefono`, `avatar`, `estado`, `id_tipo`) VALUES
(1, 'nataliaoduber', '7l03cuwx4PrLgLWv40ymSg==', 'Natalia Elvira', 'Oduber', 'El Arreo 220 - La Reja - Bs. As.', 'Entre Cortejarena y García Lorca - Portón Negro', 94654750, 'nataliaoduber@gmail.com', 1138661609, '61d70c883d7d6-lamejorfoto.jpg', 'A', 3),
(2, 'morronepablo', '7l03cuwx4PrLgLWv40ymSg==', 'Pablo Martin', 'Morrone', NULL, NULL, 22362590, 'morronepablo@gmail.com', 1138669097, '61469865cedca-pablo.jpg', 'A', 2),
(3, 'codewaruser', '12345', 'Juan', 'Cosme', NULL, NULL, 12345678, 'juan.diego.polo.cosme.warpice@gmail.com', 1234567890, 'user_default.png', 'A', 2),
(4, 'Warpiceuser', '12345', 'juan', 'diego', NULL, NULL, 12345678, 'juan.diego.polo.cosme.warpice@gmail.com', 1234567890, 'user_default.png', 'A', 2),
(5, 'martintrinidad', '7l03cuwx4PrLgLWv40ymSg==', 'Martin', 'Trinidad', NULL, NULL, 20123334, 'martin@gmail.com', 1165332389, 'user_default.png', 'A', 2),
(6, 'pedroalfonzo', '7l03cuwx4PrLgLWv40ymSg==', 'Pedro', 'Alfonzo', NULL, NULL, 33112244, 'pedroalfonzo@gmail.com', 1122345678, 'user_default.png', 'A', 2),
(7, 'juliocesar', '7l03cuwx4PrLgLWv40ymSg==', 'Julio', 'Cesar', NULL, NULL, 88888888, 'juliocesar@gmail.com', 1188776655, 'user_default.png', 'A', 2),
(8, 'maxihoeffler', '7l03cuwx4PrLgLWv40ymSg==', 'Maximiliano', 'Hoeffler', NULL, NULL, 3088765, 'maxihoeffler@gmail.com', 1155657667, 'user_default.png', 'A', 2),
(9, 'victoriagallo', '7l03cuwx4PrLgLWv40ymSg==', 'Victoria', 'Gallo', NULL, NULL, 2688765, 'victoriagallo@gmail.com', 1134233222, 'user_default.png', 'A', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_provincia`
--

CREATE TABLE `usuario_provincia` (
  `id` int(11) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `referencia` varchar(255) DEFAULT NULL,
  `estado` varchar(10) NOT NULL DEFAULT 'A',
  `id_localidad` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuario_provincia`
--

INSERT INTO `usuario_provincia` (`id`, `direccion`, `referencia`, `estado`, `id_localidad`, `id_usuario`) VALUES
(1, 'El Arreo 220', 'entre cortejarena y garcia lorca, porton negro', 'A', 200, 1),
(2, 'Arrecifes 455', 'Casa Hermana Pablo', 'A', 164, 1),
(3, 'Garcia Lorca 789 - La Reja - Bs. As.', 'Casa Vecino', 'I', 200, 1),
(4, 'El Arreo 250', 'Vecino del frente', 'A', 200, 1),
(5, 'Pergamino 424', 'Casa de la madre', 'A', 164, 5),
(6, 'El Arreo 220', 'Casa Particular', 'A', 200, 2),
(9, 'Garcia Lorca 789', 'Vecino Octavio', 'A', 200, 1),
(10, 'Juan V. Justo y Av, Corrientes', 'Manuel Peña', 'I', 283, 1),
(11, 'Arrecifes 455', 'Hermana', 'I', 164, 2),
(12, 'El Arreo 225', 'Vecino', 'A', 200, 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `caracteristica`
--
ALTER TABLE `caracteristica`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `destino`
--
ALTER TABLE `destino`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_usuario` (`id_usuario`,`id_mensaje`),
  ADD KEY `id_mensaje` (`id_mensaje`);

--
-- Indices de la tabla `favorito`
--
ALTER TABLE `favorito`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_usuario` (`id_usuario`,`id_producto_tienda`),
  ADD KEY `id_producto_tienda` (`id_producto_tienda`);

--
-- Indices de la tabla `historial`
--
ALTER TABLE `historial`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_tipo_historial` (`id_tipo_historial`,`id_modulo`,`id_usuario`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_modulo` (`id_modulo`);

--
-- Indices de la tabla `imagen`
--
ALTER TABLE `imagen`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indices de la tabla `localidades`
--
ALTER TABLE `localidades`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_provincia` (`id_provincia`);

--
-- Indices de la tabla `marca`
--
ALTER TABLE `marca`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `mensaje`
--
ALTER TABLE `mensaje`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `modulo`
--
ALTER TABLE `modulo`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `notificacion`
--
ALTER TABLE `notificacion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `pregunta`
--
ALTER TABLE `pregunta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_producto_tienda` (`id_producto_tienda`,`id_usuario`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_marca` (`id_marca`);

--
-- Indices de la tabla `producto_subcategoria`
--
ALTER TABLE `producto_subcategoria`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_producto` (`id_producto`,`id_subcategoria`),
  ADD KEY `id_subcategoria` (`id_subcategoria`);

--
-- Indices de la tabla `producto_tienda`
--
ALTER TABLE `producto_tienda`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_producto` (`id_producto`,`id_tienda`),
  ADD KEY `id_tienda` (`id_tienda`);

--
-- Indices de la tabla `provincias`
--
ALTER TABLE `provincias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `resena`
--
ALTER TABLE `resena`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_producto_tienda` (`id_producto_tienda`,`id_usuario`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `respuesta`
--
ALTER TABLE `respuesta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_pregunta` (`id_pregunta`);

--
-- Indices de la tabla `solicitud_marca`
--
ALTER TABLE `solicitud_marca`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `subcategoria`
--
ALTER TABLE `subcategoria`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_categoria` (`id_categoria`);

--
-- Indices de la tabla `tienda`
--
ALTER TABLE `tienda`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_usuario` (`id_usuario`,`id_localidad`),
  ADD KEY `id_localidad` (`id_localidad`);

--
-- Indices de la tabla `tipo_historial`
--
ALTER TABLE `tipo_historial`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipo_usuario`
--
ALTER TABLE `tipo_usuario`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_tipo` (`id_tipo`);

--
-- Indices de la tabla `usuario_provincia`
--
ALTER TABLE `usuario_provincia`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_provincia` (`id_localidad`,`id_usuario`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `caracteristica`
--
ALTER TABLE `caracteristica`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `destino`
--
ALTER TABLE `destino`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=108;

--
-- AUTO_INCREMENT de la tabla `favorito`
--
ALTER TABLE `favorito`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `historial`
--
ALTER TABLE `historial`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=174;

--
-- AUTO_INCREMENT de la tabla `imagen`
--
ALTER TABLE `imagen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `localidades`
--
ALTER TABLE `localidades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2383;

--
-- AUTO_INCREMENT de la tabla `marca`
--
ALTER TABLE `marca`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `mensaje`
--
ALTER TABLE `mensaje`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `modulo`
--
ALTER TABLE `modulo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `notificacion`
--
ALTER TABLE `notificacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `pregunta`
--
ALTER TABLE `pregunta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `producto_subcategoria`
--
ALTER TABLE `producto_subcategoria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `producto_tienda`
--
ALTER TABLE `producto_tienda`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `provincias`
--
ALTER TABLE `provincias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `resena`
--
ALTER TABLE `resena`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `respuesta`
--
ALTER TABLE `respuesta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `solicitud_marca`
--
ALTER TABLE `solicitud_marca`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `subcategoria`
--
ALTER TABLE `subcategoria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tienda`
--
ALTER TABLE `tienda`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tipo_historial`
--
ALTER TABLE `tipo_historial`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tipo_usuario`
--
ALTER TABLE `tipo_usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `usuario_provincia`
--
ALTER TABLE `usuario_provincia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `caracteristica`
--
ALTER TABLE `caracteristica`
  ADD CONSTRAINT `caracteristica_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id`);

--
-- Filtros para la tabla `destino`
--
ALTER TABLE `destino`
  ADD CONSTRAINT `destino_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`),
  ADD CONSTRAINT `destino_ibfk_2` FOREIGN KEY (`id_mensaje`) REFERENCES `mensaje` (`id`);

--
-- Filtros para la tabla `favorito`
--
ALTER TABLE `favorito`
  ADD CONSTRAINT `favorito_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`),
  ADD CONSTRAINT `favorito_ibfk_2` FOREIGN KEY (`id_producto_tienda`) REFERENCES `producto_tienda` (`id`);

--
-- Filtros para la tabla `historial`
--
ALTER TABLE `historial`
  ADD CONSTRAINT `historial_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`),
  ADD CONSTRAINT `historial_ibfk_2` FOREIGN KEY (`id_tipo_historial`) REFERENCES `tipo_historial` (`id`),
  ADD CONSTRAINT `historial_ibfk_3` FOREIGN KEY (`id_modulo`) REFERENCES `modulo` (`id`);

--
-- Filtros para la tabla `imagen`
--
ALTER TABLE `imagen`
  ADD CONSTRAINT `imagen_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id`);

--
-- Filtros para la tabla `localidades`
--
ALTER TABLE `localidades`
  ADD CONSTRAINT `localidades_ibfk_1` FOREIGN KEY (`id_provincia`) REFERENCES `provincias` (`id`);

--
-- Filtros para la tabla `mensaje`
--
ALTER TABLE `mensaje`
  ADD CONSTRAINT `mensaje_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`);

--
-- Filtros para la tabla `notificacion`
--
ALTER TABLE `notificacion`
  ADD CONSTRAINT `notificacion_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`);

--
-- Filtros para la tabla `pregunta`
--
ALTER TABLE `pregunta`
  ADD CONSTRAINT `pregunta_ibfk_1` FOREIGN KEY (`id_producto_tienda`) REFERENCES `producto_tienda` (`id`),
  ADD CONSTRAINT `pregunta_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`);

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`id_marca`) REFERENCES `marca` (`id`);

--
-- Filtros para la tabla `producto_subcategoria`
--
ALTER TABLE `producto_subcategoria`
  ADD CONSTRAINT `producto_subcategoria_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id`),
  ADD CONSTRAINT `producto_subcategoria_ibfk_2` FOREIGN KEY (`id_subcategoria`) REFERENCES `subcategoria` (`id`);

--
-- Filtros para la tabla `producto_tienda`
--
ALTER TABLE `producto_tienda`
  ADD CONSTRAINT `producto_tienda_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id`),
  ADD CONSTRAINT `producto_tienda_ibfk_2` FOREIGN KEY (`id_tienda`) REFERENCES `tienda` (`id`);

--
-- Filtros para la tabla `resena`
--
ALTER TABLE `resena`
  ADD CONSTRAINT `resena_ibfk_1` FOREIGN KEY (`id_producto_tienda`) REFERENCES `producto_tienda` (`id`),
  ADD CONSTRAINT `resena_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`);

--
-- Filtros para la tabla `respuesta`
--
ALTER TABLE `respuesta`
  ADD CONSTRAINT `respuesta_ibfk_1` FOREIGN KEY (`id_pregunta`) REFERENCES `pregunta` (`id`);

--
-- Filtros para la tabla `solicitud_marca`
--
ALTER TABLE `solicitud_marca`
  ADD CONSTRAINT `solicitud_marca_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`);

--
-- Filtros para la tabla `subcategoria`
--
ALTER TABLE `subcategoria`
  ADD CONSTRAINT `subcategoria_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id`);

--
-- Filtros para la tabla `tienda`
--
ALTER TABLE `tienda`
  ADD CONSTRAINT `tienda_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`),
  ADD CONSTRAINT `tienda_ibfk_2` FOREIGN KEY (`id_localidad`) REFERENCES `localidades` (`id`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`id_tipo`) REFERENCES `tipo_usuario` (`id`);

--
-- Filtros para la tabla `usuario_provincia`
--
ALTER TABLE `usuario_provincia`
  ADD CONSTRAINT `usuario_provincia_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`),
  ADD CONSTRAINT `usuario_provincia_ibfk_3` FOREIGN KEY (`id_localidad`) REFERENCES `localidades` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
