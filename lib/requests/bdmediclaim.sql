-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-08-2021 a las 08:49:00
-- Versión del servidor: 10.4.14-MariaDB
-- Versión de PHP: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bdmediclaim`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `habito`
--

CREATE TABLE `habito` (
  `Nombre` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `Descripcion` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `Codigo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `habito`
--

INSERT INTO `habito` (`Nombre`, `Descripcion`, `Codigo`) VALUES
('Ejercicio', 'Camina al menos 30 minutos al día. ', 0),
('Ejercicio', 'Camina al menos 30 minutos al dia.', 1),
('No fumar', 'Evita el consumo de cigarrillo o tabaco.', 0),
('¡Covid-19!', 'Lava tus manos frecuentemente.', 0),
('¡Covid-19!', 'Usa guantes y tapabocas.', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medicamento`
--

CREATE TABLE `medicamento` (
  `Codigo` int(11) NOT NULL,
  `Nombre` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `Foto` text COLLATE utf8_spanish_ci NOT NULL,
  `Descripcion` text COLLATE utf8_spanish_ci NOT NULL,
  `Presentacion` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `Tipo` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `Laboratorio` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `Eficaz` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `Confiable` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `Seguro` varchar(10) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `medicamento`
--

INSERT INTO `medicamento` (`Codigo`, `Nombre`, `Foto`, `Descripcion`, `Presentacion`, `Tipo`, `Laboratorio`, `Eficaz`, `Confiable`, `Seguro`) VALUES
(1, 'Aspirina', 'https://st1.uvnimg.com/dc/2b/dced53c345a598e275cde9113899/medicina-web3.jpg', 'Se utiliza como medicamento para tratar el dolor, la fiebre y la inflamación, debido a su efecto inhibitorio, no selectivo, de la ciclooxigenasa.', 'Tableta de 100mg', 'Analgésico y antipirético. ', 'Bayer', 'SI', 'SI', 'SI');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paciente`
--

CREATE TABLE `paciente` (
  `Identificacion` varchar(11) COLLATE utf8_spanish_ci NOT NULL,
  `Foto` varchar(500) COLLATE utf8_spanish_ci NOT NULL,
  `Nombres` varchar(40) COLLATE utf8_spanish_ci NOT NULL,
  `Apellidos` varchar(40) COLLATE utf8_spanish_ci NOT NULL,
  `FechaNacimiento` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `Edad` varchar(4) COLLATE utf8_spanish_ci NOT NULL,
  `Direccion` text COLLATE utf8_spanish_ci NOT NULL,
  `Barrio` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `Telefono` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `Ciudad` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `Estado` varchar(50) COLLATE utf8_spanish_ci NOT NULL DEFAULT 'Activo',
  `FechaRegistro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `paciente`
--

INSERT INTO `paciente` (`Identificacion`, `Foto`, `Nombres`, `Apellidos`, `FechaNacimiento`, `Edad`, `Direccion`, `Barrio`, `Telefono`, `Ciudad`, `Estado`, `FechaRegistro`) VALUES
('32367', 'foto', 'junior', 'zabaleta', 'octubre', '24', 'calle', 'quinta', '2434', 'cali', 'Activo', '2021-06-10 22:13:48'),
('66445', 'foto', 'Kevin Jose', 'Gómez Diaz', '11/10/1999', '21', 'calle15 #13 24', 'La ceiba', '3017899090', 'Valledupar', 'Inactivo', '2021-06-05 10:13:19');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `receta`
--

CREATE TABLE `receta` (
  `CodigoReceta` char(8) COLLATE utf8_spanish_ci NOT NULL,
  `NombresPaciente` varchar(70) COLLATE utf8_spanish_ci NOT NULL,
  `IdentificacionPaciente` varchar(70) COLLATE utf8_spanish_ci NOT NULL,
  `CodigoMedicamento1` varchar(11) COLLATE utf8_spanish_ci NOT NULL,
  `NombreMedicamento1` varchar(70) COLLATE utf8_spanish_ci NOT NULL,
  `CantidadMedicamento1` varchar(3) COLLATE utf8_spanish_ci NOT NULL,
  `CodigoMedicamento2` varchar(11) COLLATE utf8_spanish_ci NOT NULL,
  `NombreMedicamento2` varchar(70) COLLATE utf8_spanish_ci NOT NULL,
  `CantidadMedicamento2` varchar(11) COLLATE utf8_spanish_ci NOT NULL,
  `CodigoMedicamento3` varchar(11) COLLATE utf8_spanish_ci NOT NULL,
  `NombreMedicamento3` varchar(70) COLLATE utf8_spanish_ci NOT NULL,
  `CantidadMedicamento3` varchar(3) COLLATE utf8_spanish_ci NOT NULL,
  `Disponible1` varchar(11) COLLATE utf8_spanish_ci NOT NULL,
  `Disponible2` varchar(11) COLLATE utf8_spanish_ci NOT NULL,
  `Disponible3` varchar(11) COLLATE utf8_spanish_ci NOT NULL,
  `HoraConsumo1` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `HoraConsumo2` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `HoraConsumo3` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `ApellidosPaciente` varchar(70) COLLATE utf8_spanish_ci NOT NULL,
  `Fecha` varchar(70) COLLATE utf8_spanish_ci NOT NULL,
  `TipoAfiliado` varchar(70) COLLATE utf8_spanish_ci NOT NULL,
  `Eps` varchar(70) COLLATE utf8_spanish_ci NOT NULL,
  `CentroAsistencial` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `NombreMedico` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `EstadoReceta` varchar(40) COLLATE utf8_spanish_ci NOT NULL DEFAULT 'No reclamada',
  `Observacion` varchar(255) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `receta`
--

INSERT INTO `receta` (`CodigoReceta`, `NombresPaciente`, `IdentificacionPaciente`, `CodigoMedicamento1`, `NombreMedicamento1`, `CantidadMedicamento1`, `CodigoMedicamento2`, `NombreMedicamento2`, `CantidadMedicamento2`, `CodigoMedicamento3`, `NombreMedicamento3`, `CantidadMedicamento3`, `Disponible1`, `Disponible2`, `Disponible3`, `HoraConsumo1`, `HoraConsumo2`, `HoraConsumo3`, `ApellidosPaciente`, `Fecha`, `TipoAfiliado`, `Eps`, `CentroAsistencial`, `NombreMedico`, `EstadoReceta`, `Observacion`) VALUES
('1G34GECZ', 'Kevin', '1065853708', '1', 'Acetaminofem', '30', '2', 'Viramina C', '60', '3', 'Sulfato ferroso', '30', 'Si', 'No', 'Si', '1 TAB cada 8h', '2 TAB cada 8h', '1 TAB cada 8h', 'Gomez Cantillo', '02/01/2021', 'Contributivo', 'Cajacopi S.A.S', 'Clinica Santa Fe.', 'Jhon Peralta Ochoa', 'No reclamada', 'Se recomienda practicar ejercicio media hora al dia, tomar 8 vasos de agua y cumplir con los controles medicos.');

--
-- Disparadores `receta`
--
DELIMITER $$
CREATE TRIGGER `generarcodigo` BEFORE INSERT ON `receta` FOR EACH ROW BEGIN

    declare str_len int default 8;
    declare ready int default 0;
    declare rnd_str text;
    while not ready do
        set rnd_str := lpad(conv(floor(rand()*pow(36,str_len)), 10, 36), str_len, 0);
        if not exists (select * from receta where CodigoReceta = rnd_str) then
            set new.CodigoReceta = rnd_str;
            set ready := 1;
        end if;
    end while;

END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recordatorio`
--

CREATE TABLE `recordatorio` (
  `Codigo` int(11) NOT NULL,
  `Nombre` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `Hora` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `Observacion` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `Recordarme` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `Foto` text COLLATE utf8_spanish_ci NOT NULL DEFAULT 'https://scontent.fbaq8-1.fna.fbcdn.net/v/t1.15752-9/fr/cp0/e15/q65/239752475_431156258256337_6429379609898833693_n.jpg?_nc_cat=102&ccb=1-5&_nc_sid=58c789&efg=eyJpIjoidCJ9&_nc_ohc=fzokT_k7x-8AX9JyJCc&_nc_ht=scontent.fbaq8-1.fna&oh=419b5dd05963ce1a73cc6986232ce107&oe=614E32F6'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `recordatorio`
--

INSERT INTO `recordatorio` (`Codigo`, `Nombre`, `Hora`, `Observacion`, `Recordarme`, `Foto`) VALUES
(1, 'Aspirina', '8:00', 'Dosis 1 (250mg)', 'Si', 'https://scontent.fbaq8-1.fna.fbcdn.net/v/t1.15752-9/fr/cp0/e15/q65/239752475_431156258256337_6429379609898833693_n.jpg?_nc_cat=102&ccb=1-5&_nc_sid=58c789&efg=eyJpIjoidCJ9&_nc_ohc=fzokT_k7x-8AX9JyJCc&_nc_ht=scontent.fbaq8-1.fna&oh=419b5dd05963ce1a73cc6986232ce107&oe=614E32F6'),
(2, 'Buscapina', '17:30', 'Dosis 1 (100mg)', 'No', 'https://scontent.fbaq8-1.fna.fbcdn.net/v/t1.15752-9/fr/cp0/e15/q65/239752475_431156258256337_6429379609898833693_n.jpg?_nc_cat=102&ccb=1-5&_nc_sid=58c789&efg=eyJpIjoidCJ9&_nc_ohc=fzokT_k7x-8AX9JyJCc&_nc_ht=scontent.fbaq8-1.fna&oh=419b5dd05963ce1a73cc6986232ce107&oe=614E32F6'),
(3, 'Cita', '14:00', 'Consultorio central S.A.S', 'Si', 'https://scontent.fbaq8-1.fna.fbcdn.net/v/t1.15752-9/fr/cp0/e15/q65/239752475_431156258256337_6429379609898833693_n.jpg?_nc_cat=102&ccb=1-5&_nc_sid=58c789&efg=eyJpIjoidCJ9&_nc_ohc=fzokT_k7x-8AX9JyJCc&_nc_ht=scontent.fbaq8-1.fna&oh=419b5dd05963ce1a73cc6986232ce107&oe=614E32F6'),
(4, 'Futbol, ', '20:00', 'Sección de practica deportiva.', 'Si', 'https://scontent.fbaq8-1.fna.fbcdn.net/v/t1.15752-9/fr/cp0/e15/q65/239752475_431156258256337_6429379609898833693_n.jpg?_nc_cat=102&ccb=1-5&_nc_sid=58c789&efg=eyJpIjoidCJ9&_nc_ohc=fzokT_k7x-8AX9JyJCc&_nc_ht=scontent.fbaq8-1.fna&oh=419b5dd05963ce1a73cc6986232ce107&oe=614E32F6');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `Identificacion` varchar(11) COLLATE utf8_spanish_ci NOT NULL,
  `Usuario` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `TipoUsuario` varchar(50) COLLATE utf8_spanish_ci NOT NULL DEFAULT 'Paciente',
  `Pass` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `FechaRegistro` varchar(50) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`Identificacion`, `Usuario`, `TipoUsuario`, `Pass`, `FechaRegistro`) VALUES
('1065853708', 'kevin', 'Paciente', 'kevin', '');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `habito`
--
ALTER TABLE `habito`
  ADD KEY `UNK` (`Codigo`);

--
-- Indices de la tabla `medicamento`
--
ALTER TABLE `medicamento`
  ADD PRIMARY KEY (`Codigo`);

--
-- Indices de la tabla `paciente`
--
ALTER TABLE `paciente`
  ADD PRIMARY KEY (`Identificacion`);

--
-- Indices de la tabla `receta`
--
ALTER TABLE `receta`
  ADD UNIQUE KEY `CodigoReceta` (`CodigoReceta`);

--
-- Indices de la tabla `recordatorio`
--
ALTER TABLE `recordatorio`
  ADD PRIMARY KEY (`Codigo`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`Identificacion`),
  ADD UNIQUE KEY `Usuario` (`Usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `medicamento`
--
ALTER TABLE `medicamento`
  MODIFY `Codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `recordatorio`
--
ALTER TABLE `recordatorio`
  MODIFY `Codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
