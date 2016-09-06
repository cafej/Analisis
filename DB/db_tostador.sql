

create Database db_tostador

use db_tostador
--
-- Table structure for table `admistrador`
--

CREATE TABLE `admistrador` (
  `ID` int(11) NOT NULL,
  `Nombre` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `categoria`
--

CREATE TABLE `categoria` (
  `ID` int(11) NOT NULL,
  `Nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `clasificacion`
--

CREATE TABLE `clasificacion` (
  `IDCategoria` int(11) NOT NULL,
  `IDProducto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `colaborador`
--

CREATE TABLE `colaborador` (
  `ID` int(11) NOT NULL,
  `Direccion` varchar(100) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Telefono` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `compra`
--

CREATE TABLE `compra` (
  `ID` int(11) NOT NULL,
  `Fecha` date NOT NULL,
  `MontoFinal` int(11) NOT NULL,
  `IDProveedor` int(11) NOT NULL,
  `IDProducto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `detalle`
--

CREATE TABLE `detalle` (
  `Descripcion` varchar(50) NOT NULL,
  `IDVenta` int(11) NOT NULL,
  `IDProducto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pedido`
--

CREATE TABLE `pedido` (
  `ID` int(11) NOT NULL,
  `Fecha` date NOT NULL,
  `UnidadDeMedida` tinyint(1) NOT NULL,
  `CantidadDeMedida` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `producto`
--

CREATE TABLE `producto` (
  `UnidadDeMedida` tinyint(1) NOT NULL,
  `CantidadDeMedida` int(11) NOT NULL,
  `ID` int(11) NOT NULL,
  `Precio` int(11) NOT NULL,
  `IVA` int(11) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Stock` int(11) NOT NULL,
  `Compuesto` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `proveedor`
--

CREATE TABLE `proveedor` (
  `ID` int(11) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Web` varchar(100) NOT NULL,
  `Telefono` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `realizarpedido`
--

CREATE TABLE `realizarpedido` (
  `IDpedido` int(11) NOT NULL,
  `IDSucursal` int(11) NOT NULL,
  `IDAdminstrador` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sucursal`
--

CREATE TABLE `sucursal` (
  `ID` int(11) NOT NULL,
  `Direccion` varchar(100) NOT NULL,
  `Telefono` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `vende`
--

CREATE TABLE `vende` (
  `IDVenta` int(11) NOT NULL,
  `IDSucursal` int(11) NOT NULL,
  `IDColaborador` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `venta`
--

CREATE TABLE `venta` (
  `Descuento` int(11) NOT NULL,
  `ID` int(11) NOT NULL,
  `Fecha` date NOT NULL,
  `MontoFinal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admistrador`
--
ALTER TABLE `admistrador`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `clasificacion`
--
ALTER TABLE `clasificacion`
  ADD UNIQUE KEY `IDCategoria` (`IDCategoria`),
  ADD UNIQUE KEY `IDProducto` (`IDProducto`);

--
-- Indexes for table `colaborador`
--
ALTER TABLE `colaborador`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `compra`
--
ALTER TABLE `compra`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `IDProveedor` (`IDProveedor`),
  ADD UNIQUE KEY `IDProducto` (`IDProducto`);

--
-- Indexes for table `detalle`
--
ALTER TABLE `detalle`
  ADD UNIQUE KEY `IDVenta` (`IDVenta`),
  ADD UNIQUE KEY `IDProducto` (`IDProducto`);

--
-- Indexes for table `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `realizarpedido`
--
ALTER TABLE `realizarpedido`
  ADD UNIQUE KEY `IDpedido` (`IDpedido`),
  ADD UNIQUE KEY `IDSucursal` (`IDSucursal`),
  ADD UNIQUE KEY `IDAdminstrador` (`IDAdminstrador`);

--
-- Indexes for table `sucursal`
--
ALTER TABLE `sucursal`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `vende`
--
ALTER TABLE `vende`
  ADD UNIQUE KEY `IDVenta` (`IDVenta`),
  ADD UNIQUE KEY `IDSucursal` (`IDSucursal`),
  ADD UNIQUE KEY `IDColaborador` (`IDColaborador`);

--
-- Indexes for table `venta`
--
ALTER TABLE `venta`
  ADD PRIMARY KEY (`ID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `clasificacion`
--
ALTER TABLE `clasificacion`
  ADD CONSTRAINT `clasificacion_ibfk_1` FOREIGN KEY (`IDCategoria`) REFERENCES `categoria` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `clasificacion_ibfk_2` FOREIGN KEY (`IDProducto`) REFERENCES `producto` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `compra`
--
ALTER TABLE `compra`
  ADD CONSTRAINT `compra_ibfk_1` FOREIGN KEY (`IDProducto`) REFERENCES `producto` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `compra_ibfk_2` FOREIGN KEY (`IDProveedor`) REFERENCES `proveedor` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `detalle`
--
ALTER TABLE `detalle`
  ADD CONSTRAINT `detalle_ibfk_1` FOREIGN KEY (`IDVenta`) REFERENCES `venta` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detalle_ibfk_2` FOREIGN KEY (`IDProducto`) REFERENCES `producto` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `realizarpedido`
--
ALTER TABLE `realizarpedido`
  ADD CONSTRAINT `realizarpedido_ibfk_1` FOREIGN KEY (`IDpedido`) REFERENCES `pedido` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `realizarpedido_ibfk_2` FOREIGN KEY (`IDSucursal`) REFERENCES `sucursal` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `realizarpedido_ibfk_3` FOREIGN KEY (`IDAdminstrador`) REFERENCES `admistrador` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `vende`
--
ALTER TABLE `vende`
  ADD CONSTRAINT `vende_ibfk_1` FOREIGN KEY (`IDColaborador`) REFERENCES `colaborador` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `vende_ibfk_2` FOREIGN KEY (`IDVenta`) REFERENCES `venta` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `vende_ibfk_3` FOREIGN KEY (`IDSucursal`) REFERENCES `sucursal` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;


