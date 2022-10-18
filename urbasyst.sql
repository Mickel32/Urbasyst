-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-04-2022 a las 01:49:02
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `urbasyst`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `actividad`
--

CREATE TABLE `actividad` (
  `idactividad` int(11) NOT NULL,
  `actividad_descripcion` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `actividad`
--

INSERT INTO `actividad` (`idactividad`, `actividad_descripcion`) VALUES
(1, 'Ingresos'),
(2, 'Egresos'),
(3, 'Provisiones');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargo`
--

CREATE TABLE `cargo` (
  `idcargo` int(11) NOT NULL,
  `cargo_descripcion` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cargo`
--

INSERT INTO `cargo` (`idcargo`, `cargo_descripcion`) VALUES
(1, 'Administrador'),
(2, 'Conserje'),
(3, 'Guardia'),
(4, 'Jardinero'),
(5, 'Empleado domestico');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuenta`
--

CREATE TABLE `cuenta` (
  `idcuenta` int(11) NOT NULL,
  `cuenta_descripcion` varchar(45) DEFAULT NULL,
  `idtipo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estructura`
--

CREATE TABLE `estructura` (
  `idestructura` int(11) NOT NULL,
  `idurba` int(11) DEFAULT NULL,
  `idpropietarios` varchar(13) DEFAULT NULL,
  `idtipo` int(11) DEFAULT NULL,
  `estructura_ubicacion` varchar(45) DEFAULT NULL,
  `estructura_descripcion` varchar(45) DEFAULT NULL,
  `estructura_cubierta` decimal(2,0) DEFAULT NULL,
  `estructura_abierta` decimal(2,0) DEFAULT NULL,
  `estructura_idpadre` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fpago`
--

CREATE TABLE `fpago` (
  `idfpago` int(11) NOT NULL,
  `fpago_desc` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `fpago`
--

INSERT INTO `fpago` (`idfpago`, `fpago_desc`) VALUES
(1, 'efectivo'),
(2, 'cheque'),
(3, 'transferencia'),
(4, 'tarjeta de credito');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `h_alicuota`
--

CREATE TABLE `h_alicuota` (
  `idh_alicuota` int(11) NOT NULL,
  `h_alicuota_fecha` datetime DEFAULT NULL,
  `id_transaccion` int(11) DEFAULT NULL,
  `idfpago` int(11) DEFAULT NULL,
  `idestructura` int(11) DEFAULT NULL,
  `idpersona` varchar(13) DEFAULT NULL,
  `valor` decimal(2,0) DEFAULT NULL,
  `idmotivo` int(11) DEFAULT NULL,
  `idusuario` int(11) DEFAULT NULL,
  `idperiodo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inquilinos`
--

CREATE TABLE `inquilinos` (
  `idinquilinos` varchar(13) NOT NULL,
  `idestructura` int(11) DEFAULT NULL,
  `idpropietario` varchar(13) DEFAULT NULL,
  `inq_fecha_ini` datetime DEFAULT NULL,
  `inq_fecha_fin` datetime DEFAULT NULL,
  `idstatus` int(11) DEFAULT NULL,
  `inquilinos_nombre` varchar(45) DEFAULT NULL,
  `inquilinos_telef` varchar(45) DEFAULT NULL,
  `inquilinos_correo` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mascota`
--

CREATE TABLE `mascota` (
  `idmascota` int(11) NOT NULL,
  `idestructura` int(11) DEFAULT NULL,
  `mascota_nombre` varchar(45) DEFAULT NULL,
  `mascota_color` varchar(45) DEFAULT NULL,
  `mascota_tipo` varchar(45) DEFAULT NULL,
  `mascota_observaciones` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `motivo`
--

CREATE TABLE `motivo` (
  `idmotivo` int(11) NOT NULL,
  `motivo_descripcion` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `motivo`
--

INSERT INTO `motivo` (`idmotivo`, `motivo_descripcion`) VALUES
(1, 'Alicuotas'),
(2, 'Alicotas Extraordinarias'),
(3, 'Agua Potable'),
(4, 'Luz Electrica'),
(5, 'Conserje');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nombre_factura`
--

CREATE TABLE `nombre_factura` (
  `idestructura` int(11) NOT NULL,
  `id_persona` varchar(13) NOT NULL,
  `direccion_factura` varchar(45) DEFAULT NULL,
  `telefefono_factura` varchar(10) DEFAULT NULL,
  `nombre_facturacol` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `operaciones`
--

CREATE TABLE `operaciones` (
  `idoperaciones` int(11) NOT NULL,
  `operaciones_desc` varchar(45) DEFAULT NULL,
  `operaciones_padre` int(11) DEFAULT NULL,
  `operaciones_link` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `operaciones`
--

INSERT INTO `operaciones` (`idoperaciones`, `operaciones_desc`, `operaciones_padre`, `operaciones_link`) VALUES
(1, 'Registros Administración', 0, '#'),
(2, 'Transacciones', 0, ''),
(3, 'Consultas Administración', 0, '#'),
(100, 'Registro Estructura', 1, ''),
(101, 'Registro Propietarios', 1, ''),
(102, 'Registro Empleados', 1, ''),
(103, 'Crear Cargos', 102, ''),
(104, 'Crear Empleados', 102, ''),
(201, 'Crear Periodos', 2, ''),
(202, 'Crear Cuenta', 2, ''),
(301, 'Reporte Alicuotas', 3, '#');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `periodos`
--

CREATE TABLE `periodos` (
  `idperiodos` int(11) NOT NULL,
  `periodo_año` int(11) DEFAULT NULL,
  `periodo_mes` int(11) DEFAULT NULL,
  `periodo_desde` datetime DEFAULT NULL,
  `periodo_sit` int(11) DEFAULT NULL,
  `periodo_hasta` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisos`
--

CREATE TABLE `permisos` (
  `idtipo_usu` int(11) DEFAULT NULL,
  `idoperaciones` int(11) DEFAULT NULL,
  `permisos_obs` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `propietarios`
--

CREATE TABLE `propietarios` (
  `idpropietarios` varchar(13) NOT NULL,
  `propietarios_nom` varchar(45) NOT NULL,
  `propietarios_telefono` varchar(10) DEFAULT NULL,
  `propietarios_telfijo` varchar(10) DEFAULT NULL,
  `propietarios_correo` varchar(45) DEFAULT NULL,
  `propietarios_fecha_nacim` datetime DEFAULT NULL,
  `idurba` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `idproveedor` varchar(13) NOT NULL,
  `proveedor_nombre` varchar(100) DEFAULT NULL,
  `proveedor_telef` varchar(10) DEFAULT NULL,
  `proveedor_email` varchar(45) DEFAULT NULL,
  `proveedor_telf_cel` varchar(10) DEFAULT NULL,
  `proveedor_direccion` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `p_relacionada`
--

CREATE TABLE `p_relacionada` (
  `idp_relacionada` varchar(13) NOT NULL,
  `idestructura` int(11) DEFAULT NULL,
  `id_propietarios` varchar(13) DEFAULT NULL,
  `p_relacionada_nombre` varchar(45) DEFAULT NULL,
  `idparentezco` int(11) DEFAULT NULL,
  `p_relacionada_fecha_nac` datetime DEFAULT NULL,
  `p_relacionada_direccion` varchar(45) DEFAULT NULL,
  `p_relacionada_telef` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_est`
--

CREATE TABLE `tipo_est` (
  `idtipo_est` int(11) NOT NULL,
  `tipo_est_descripcion` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipo_est`
--

INSERT INTO `tipo_est` (`idtipo_est`, `tipo_est_descripcion`) VALUES
(1, 'Lote'),
(2, 'Casa'),
(3, 'Departamento'),
(4, 'Edificio'),
(5, 'Conjunto');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_usu`
--

CREATE TABLE `tipo_usu` (
  `idtipo_usu` int(11) NOT NULL,
  `tipo_usu_desc` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipo_usu`
--

INSERT INTO `tipo_usu` (`idtipo_usu`, `tipo_usu_desc`) VALUES
(1, 'Administrador'),
(2, 'Residente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trabajadores`
--

CREATE TABLE `trabajadores` (
  `idtrabajador` varchar(13) NOT NULL,
  `trabajador_nombre` varchar(100) NOT NULL,
  `trabajador_direccion` varchar(100) DEFAULT NULL,
  `trabajador_celu` varchar(10) DEFAULT NULL,
  `trabajador_fecha_ing` datetime DEFAULT NULL,
  `trabajador_fecha_fin` datetime DEFAULT NULL,
  `trabajador_fecha_ant` datetime DEFAULT NULL,
  `idcargo` int(11) DEFAULT NULL,
  `idestructura` int(11) DEFAULT NULL,
  `trabajador_estado` int(11) DEFAULT NULL,
  `trabajador_fecha_nac` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `transaccion`
--

CREATE TABLE `transaccion` (
  `idtransaccion` int(11) NOT NULL,
  `idurba` int(11) DEFAULT NULL,
  `idperiodo` int(11) DEFAULT NULL,
  `transaccion_sit` int(11) DEFAULT NULL,
  `idcuenta` int(11) DEFAULT NULL,
  `transaccion_valor` decimal(2,0) DEFAULT NULL,
  `idusuario` int(11) DEFAULT NULL,
  `idmotivo` int(11) DEFAULT NULL,
  `transaccion_fecha` datetime DEFAULT NULL,
  `transaccion_detalle1` varchar(100) DEFAULT NULL,
  `transaccion_detalle2` varchar(100) DEFAULT NULL,
  `transaccion_comprobante` varchar(45) DEFAULT NULL,
  `idactividad` int(11) DEFAULT NULL,
  `idproveedor` varchar(13) DEFAULT NULL,
  `idestructura` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `urba`
--

CREATE TABLE `urba` (
  `idurba` int(11) NOT NULL,
  `urba_nom` varchar(45) NOT NULL,
  `urba_ruc` varchar(13) NOT NULL,
  `urba_direccion` varchar(45) DEFAULT NULL,
  `urba_sector` varchar(45) DEFAULT NULL,
  `urba_ciudad` varchar(45) DEFAULT NULL,
  `urba_representante` varchar(13) DEFAULT NULL,
  `urba_nombre_repres` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idusuario` int(11) NOT NULL,
  `usuario_nombre` varchar(45) DEFAULT NULL,
  `usuario_pass` varchar(255) DEFAULT NULL,
  `idtipo_usu` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idusuario`, `usuario_nombre`, `usuario_pass`, `idtipo_usu`) VALUES
(2, 'admin', '$2y$10$SCdgSdn5wdkf5HC64CZBRuxnDVLdPCFQtWa7QWne81H.6E7WuuEq2', 1),
(3, 'richi', '$2y$10$u.SDeyDfE/02hri1I1HwVeyTaOmzeGeL110ruemjx9lCwnockSWVy', 2),
(6, 'ricardo', '$2y$10$jSITWJnpCB1QJ34pJ44VSeIxBP8EU/cyOBpeJm6hwgXcgIv/gZLdu', 2),
(7, 'maite', '$2y$10$flzNVmQSHALY78Czhk92We.7EraS3QRteErV6CshPV/50LaW4WkmC', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehiculo`
--

CREATE TABLE `vehiculo` (
  `idvehiculo` varchar(7) NOT NULL,
  `idestructura` int(11) DEFAULT NULL,
  `vehiculo_tag` varchar(45) DEFAULT NULL,
  `vehiculo_color` varchar(45) DEFAULT NULL,
  `vehiculo_marca` varchar(45) DEFAULT NULL,
  `vehiculo_modelo` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `actividad`
--
ALTER TABLE `actividad`
  ADD PRIMARY KEY (`idactividad`);

--
-- Indices de la tabla `cargo`
--
ALTER TABLE `cargo`
  ADD PRIMARY KEY (`idcargo`);

--
-- Indices de la tabla `cuenta`
--
ALTER TABLE `cuenta`
  ADD PRIMARY KEY (`idcuenta`);

--
-- Indices de la tabla `estructura`
--
ALTER TABLE `estructura`
  ADD PRIMARY KEY (`idestructura`);

--
-- Indices de la tabla `fpago`
--
ALTER TABLE `fpago`
  ADD PRIMARY KEY (`idfpago`);

--
-- Indices de la tabla `h_alicuota`
--
ALTER TABLE `h_alicuota`
  ADD PRIMARY KEY (`idh_alicuota`);

--
-- Indices de la tabla `inquilinos`
--
ALTER TABLE `inquilinos`
  ADD PRIMARY KEY (`idinquilinos`);

--
-- Indices de la tabla `mascota`
--
ALTER TABLE `mascota`
  ADD PRIMARY KEY (`idmascota`);

--
-- Indices de la tabla `motivo`
--
ALTER TABLE `motivo`
  ADD PRIMARY KEY (`idmotivo`);

--
-- Indices de la tabla `nombre_factura`
--
ALTER TABLE `nombre_factura`
  ADD PRIMARY KEY (`idestructura`,`id_persona`);

--
-- Indices de la tabla `operaciones`
--
ALTER TABLE `operaciones`
  ADD PRIMARY KEY (`idoperaciones`);

--
-- Indices de la tabla `periodos`
--
ALTER TABLE `periodos`
  ADD PRIMARY KEY (`idperiodos`);

--
-- Indices de la tabla `propietarios`
--
ALTER TABLE `propietarios`
  ADD PRIMARY KEY (`idpropietarios`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`idproveedor`);

--
-- Indices de la tabla `p_relacionada`
--
ALTER TABLE `p_relacionada`
  ADD PRIMARY KEY (`idp_relacionada`);

--
-- Indices de la tabla `tipo_est`
--
ALTER TABLE `tipo_est`
  ADD PRIMARY KEY (`idtipo_est`);

--
-- Indices de la tabla `tipo_usu`
--
ALTER TABLE `tipo_usu`
  ADD PRIMARY KEY (`idtipo_usu`);

--
-- Indices de la tabla `trabajadores`
--
ALTER TABLE `trabajadores`
  ADD PRIMARY KEY (`idtrabajador`);

--
-- Indices de la tabla `transaccion`
--
ALTER TABLE `transaccion`
  ADD PRIMARY KEY (`idtransaccion`);

--
-- Indices de la tabla `urba`
--
ALTER TABLE `urba`
  ADD PRIMARY KEY (`idurba`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idusuario`),
  ADD UNIQUE KEY `usuario_nombre` (`usuario_nombre`) USING BTREE;

--
-- Indices de la tabla `vehiculo`
--
ALTER TABLE `vehiculo`
  ADD PRIMARY KEY (`idvehiculo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `urba`
--
ALTER TABLE `urba`
  MODIFY `idurba` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idusuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
