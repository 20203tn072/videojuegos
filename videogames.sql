-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-08-2021 a las 01:14:52
-- Versión del servidor: 10.4.20-MariaDB
-- Versión de PHP: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `videogames`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_create` (IN `p_nameCategory` VARCHAR(255), IN `p_nameGame` VARCHAR(255), IN `p_imgGame` LONGBLOB, IN `p_date_premiere` VARCHAR(255), IN `p_idCategory` INT)  BEGIN
    INSERT INTO category(name) VALUES(p_nameCategory);
    INSERT INTO games(name, img_game, date_premiere, Category_idCategory) VALUES(p_nameGame, p_imgGame, p_date_premiere, p_idCategory);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete` (IN `p_idGame` INT)  BEGIN
	UPDATE games SET status = 0 WHERE idGame = p_idGame;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_findGames` ()  BEGIN
	SELECT * FROM games AS G INNER JOIN category AS C ON G.idCategory_idCategory = C.idCategory;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_update` (IN `p_name` VARCHAR(255), IN `p_name2` VARCHAR(255), IN `p_imgGame` LONGBLOB, IN `p_date_premiere` VARCHAR(255), IN `p_idCategory` INT, IN `p_idGame` INT)  BEGIN
	DECLARE v_idGame INT;
    SELECT C.idCategory FROM games AS G INNER JOIN category AS C ON G.Category_idCategory = C.idCategory WHERE G.idGame = p_idGame INTO v_idGame;
    
    UPDATE category SET name = p_name WHERE idCategory = p_idCategory;
    
    UPDATE games SET name = p_name2, img_game = p_imgGame, date_premiere = p_date_premiere,	Category_idCategory = p_idCategory WHERE idGame = p_idGame;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `category`
--

CREATE TABLE `category` (
  `idCategory` int(11) NOT NULL,
  `name` varchar(120) NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `games`
--

CREATE TABLE `games` (
  `idGame` int(11) NOT NULL,
  `name` varchar(120) NOT NULL,
  `img_game` longblob NOT NULL,
  `date_premiere` date NOT NULL,
  `Category_idCategory` int(11) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `idUser` bigint(20) NOT NULL,
  `name` varchar(12) NOT NULL,
  `lastname` varchar(120) NOT NULL,
  `email` varchar(120) NOT NULL,
  `password` varchar(120) NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`idUser`, `name`, `lastname`, `email`, `password`, `status`) VALUES
(1, 'Abraham', 'Avelino', 'abraham@gmail.com', 'abraham1234', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`idCategory`);

--
-- Indices de la tabla `games`
--
ALTER TABLE `games`
  ADD PRIMARY KEY (`idGame`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`idUser`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `category`
--
ALTER TABLE `category`
  MODIFY `idCategory` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `games`
--
ALTER TABLE `games`
  MODIFY `idGame` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `idUser` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
