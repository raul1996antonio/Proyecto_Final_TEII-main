-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-06-2023 a las 04:10:00
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `proyecto`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `ID_CLIENTE` int(11) NOT NULL,
  `NOMBRES` varchar(50) DEFAULT NULL,
  `APELLIDOS` varchar(70) DEFAULT NULL,
  `CEDULA_IDENTIDAD` varchar(30) DEFAULT NULL,
  `SEXO` varchar(10) DEFAULT NULL,
  `DIRECCION` varchar(100) DEFAULT NULL,
  `CELULAR` varchar(10) DEFAULT NULL,
  `CORREO` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`ID_CLIENTE`, `NOMBRES`, `APELLIDOS`, `CEDULA_IDENTIDAD`, `SEXO`, `DIRECCION`, `CELULAR`, `CORREO`) VALUES
(1, 'ALEJANDRO', 'CARRASCO MARTINEZ', '7123829LP', 'HOMBRE', 'AV. ALEJANDRO PAEZ CALLE ZABALETA NRO 1293', '76426398', 'ACARRASCO@GMAIL.COM'),
(2, 'JOSE CARLOS', 'QUISPE', '61729301SCZ', 'HOMBRE', 'AV. MARTINEZ CALLE ALEJO NRO 2931', '64576135', 'JQUISPE@GMAIL.COM'),
(3, 'RAUL', 'ANTONIO RAMIREZ', '10062212', 'Masculino', 'Villa Adela Calle 15', '65124541', 'antoni20raul@gmail.com'),
(4, 'JOEL', 'ANTONIO RAMIREZ', '8281623', 'MASCULINO', 'ZONA COSMO 79', '67734562', 'joel2837ramirez@gmail.com'),
(5, 'RAUL', 'ANTONIO RAMIREZ', '10062212', 'MASCULINO', 'ZONA COSMOS 79 EL ALTO', '65124541', 'antoni20raul@gmail.com');

--
-- Disparadores `clientes`
--
DELIMITER $$
CREATE TRIGGER `Reg_User_Pass_Ins` AFTER INSERT ON `clientes` FOR EACH ROW BEGIN
	SET @id = NEW.ID_CLIENTE;
	SET @user = (select concat(substring(NOMBRES,1,1),SUBSTRING_INDEX(SUBSTRING_INDEX(APELLIDOS, ' ',1), ' ',-1))from clientes where ID_CLIENTE=@id);
    SET @pass = (select sha1(convert(CEDULA_IDENTIDAD,SIGNED)) from clientes where ID_CLIENTE = @id);
    INSERT INTO usuarios (USUARIO,CONTRASEÑA,NIVEL,COD_CLIENTE) VALUES (@user,@pass,'CLIENTE',@id);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `Reg_User_Pass_Upd` AFTER UPDATE ON `clientes` FOR EACH ROW BEGIN
	SET @id = NEW.ID_CLIENTE;
	SET @user = (select concat(substring(NOMBRES,1,1),SUBSTRING_INDEX(SUBSTRING_INDEX(APELLIDOS, ' ',1), ' ',-1))from clientes where ID_CLIENTE=@id);
    SET @pass = (select sha1(convert(CEDULA_IDENTIDAD,SIGNED)) from clientes where ID_CLIENTE = @id);
    UPDATE usuarios SET USUARIO=@user, CONTRASEÑA=@pass WHERE COD_CLIENTE=@id;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimientos`
--

CREATE TABLE `movimientos` (
  `ID_REGISTRO` int(11) NOT NULL,
  `MONTO` int(11) NOT NULL,
  `FECHA` date DEFAULT NULL,
  `TIPO` varchar(8) DEFAULT NULL,
  `COD_CLI` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `movimientos`
--

INSERT INTO `movimientos` (`ID_REGISTRO`, `MONTO`, `FECHA`, `TIPO`, `COD_CLI`) VALUES
(3, 500, '2023-06-27', 'RETIRO', 3),
(5, 500, '2023-06-27', 'RETIRO', 4),
(6, 5000, '2023-06-27', 'RETIRO', 4),
(7, 1000, '2023-06-27', 'RETIRO', 5);

--
-- Disparadores `movimientos`
--
DELIMITER $$
CREATE TRIGGER `Reg_Movs` AFTER INSERT ON `movimientos` FOR EACH ROW BEGIN
	SET @id = NEW.COD_CLI;
	SET @saldo = (SELECT SALDO FROM reg_cuentas WHERE COD_CLIENTE=@id ORDER BY ID_REGISTRO DESC LIMIT 1);
	IF NEW.TIPO = 'DEPOSITO' THEN BEGIN 
    		INSERT INTO reg_cuentas (SALDO,FECHA,COD_CLIENTE) VALUES ((@saldo+(SELECT MONTO FROM movimientos WHERE TIPO='DEPOSITO' and COD_CLI = @id ORDER BY ID_REGISTRO DESC LIMIT 1)),CURDATE(),(SELECT ID_CLIENTE FROM clientes WHERE ID_CLIENTE = @id));
        END; END IF;
    IF NEW.TIPO = 'RETIRO' THEN BEGIN
    	INSERT INTO reg_cuentas (SALDO,FECHA,COD_CLIENTE) VALUES ((@saldo-(SELECT MONTO FROM movimientos WHERE TIPO='RETIRO' and COD_CLI = @id ORDER BY ID_REGISTRO DESC LIMIT 1)),CURDATE(),(SELECT ID_CLIENTE FROM clientes WHERE ID_CLIENTE = @id));
        END; END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `Updt_movs` BEFORE INSERT ON `movimientos` FOR EACH ROW BEGIN
    SET NEW.FECHA := CONCAT(CURDATE());
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reg_cuentas`
--

CREATE TABLE `reg_cuentas` (
  `ID_REGISTRO` int(11) NOT NULL,
  `SALDO` int(11) NOT NULL,
  `FECHA` date DEFAULT NULL,
  `COD_CLIENTE` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `reg_cuentas`
--

INSERT INTO `reg_cuentas` (`ID_REGISTRO`, `SALDO`, `FECHA`, `COD_CLIENTE`) VALUES
(1, 200, '2021-03-13', 1),
(2, 500, '2021-08-06', 2),
(3, 450, '2023-06-18', 1),
(4, 400, '2023-06-18', 2),
(5, 1500, '2023-06-18', 3),
(6, 1000, '2023-06-27', 3),
(7, 5000, '2023-06-27', 4),
(8, 3500, '2023-06-27', 4),
(9, 3000, '2023-06-27', 4),
(10, -2000, '2023-06-27', 4),
(11, 5000, '2023-06-27', 5),
(12, 4000, '2023-06-27', 5);

--
-- Disparadores `reg_cuentas`
--
DELIMITER $$
CREATE TRIGGER `Updt_cuentas` BEFORE INSERT ON `reg_cuentas` FOR EACH ROW BEGIN
    SET NEW.FECHA := CONCAT(CURDATE());
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `ID_USUARIO` int(11) NOT NULL,
  `USUARIO` varchar(70) DEFAULT NULL,
  `CONTRASEÑA` varchar(100) DEFAULT NULL,
  `NIVEL` varchar(13) DEFAULT NULL,
  `COD_CLIENTE` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`ID_USUARIO`, `USUARIO`, `CONTRASEÑA`, `NIVEL`, `COD_CLIENTE`) VALUES
(1, 'ACARRASCO', '5e0d3816c2bd0ce33f412ff94bda4959dad4257c', 'CLIENTE', 1),
(2, 'JQUISPE', 'c20680a918bf371b299b65f06e831ef0e5e1472d', 'CLIENTE', 2),
(5, 'RRAMIREZ', 'fcce2720e4c99e6b29ade5075b48bc11dc71f98e', 'CLIENTE', 5);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`ID_CLIENTE`);

--
-- Indices de la tabla `movimientos`
--
ALTER TABLE `movimientos`
  ADD PRIMARY KEY (`ID_REGISTRO`),
  ADD KEY `COD_CLI` (`COD_CLI`);

--
-- Indices de la tabla `reg_cuentas`
--
ALTER TABLE `reg_cuentas`
  ADD PRIMARY KEY (`ID_REGISTRO`),
  ADD KEY `COD_CLIENTE` (`COD_CLIENTE`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`ID_USUARIO`),
  ADD KEY `COD_CLIENTE` (`COD_CLIENTE`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `ID_CLIENTE` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `movimientos`
--
ALTER TABLE `movimientos`
  MODIFY `ID_REGISTRO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `reg_cuentas`
--
ALTER TABLE `reg_cuentas`
  MODIFY `ID_REGISTRO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `ID_USUARIO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `movimientos`
--
ALTER TABLE `movimientos`
  ADD CONSTRAINT `movimientos_ibfk_1` FOREIGN KEY (`COD_CLI`) REFERENCES `clientes` (`ID_CLIENTE`);

--
-- Filtros para la tabla `reg_cuentas`
--
ALTER TABLE `reg_cuentas`
  ADD CONSTRAINT `reg_cuentas_ibfk_1` FOREIGN KEY (`COD_CLIENTE`) REFERENCES `clientes` (`ID_CLIENTE`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`COD_CLIENTE`) REFERENCES `clientes` (`ID_CLIENTE`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
