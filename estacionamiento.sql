--
-- Database: `estacionamiento`
--

-- --------------------------------------------------------

--
-- Table structure for table `empresa`
--

CREATE TABLE `empresas` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `slogan` varchar(100) NOT NULL,
  `logo` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `empresas`
--

INSERT INTO `empresas` (`id`, `nombre`, `direccion`, `slogan`, `logo`) VALUES
(1, 'ITTEhuacan', 'Libramiento Tecnológico S/N, 75770 Tehuacan', 'Estacionamiento', '');

--
-- Table structure for table `notas`
--

CREATE TABLE `notas` (
  `id` int(11) NOT NULL,
  `placas` varchar(50) NOT NULL,
  `color` varchar(50),
  `modelo` varchar(50),
  `vehiculo_id` int(11) NOT NULL,
  `tarifa_id` int(11) NOT NULL,
  `lugar_id` int(11) NOT NULL,
  `entrada` datetime NOT NULL,
  `salida` datetime NOT NULL,
  `total` decimal NOT NULL,
  `estado` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tarifas`
--

CREATE TABLE `tarifas` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `fijo` tinyint(1) NOT NULL,
  `cantidad` decimal NOT NULL,
  `activo` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `slots`
--

CREATE TABLE `lugares` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT 0,
  `disponible` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `vehiculos`
--

CREATE TABLE `vehiculos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for table `empresas`
--
ALTER TABLE `empresas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notas`
--
ALTER TABLE `notas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tarifas`
--
ALTER TABLE `tarifas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lugares`
--
ALTER TABLE `lugares`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vehiculos`
--
ALTER TABLE `vehiculos`
  ADD PRIMARY KEY (`id`);


--
-- AUTO_INCREMENT for table `empresas`
--
ALTER TABLE `empresas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `notas`
--
ALTER TABLE `notas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tarifas`
--
ALTER TABLE `tarifas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `lugares`
--
ALTER TABLE `lugares`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `vehiculos`
--
ALTER TABLE `vehiculos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

alter table notas add foreign key(vehiculo_id) references vehiculos(id);
alter table notas add foreign key(lugar_id) references lugares(id);
alter table notas add foreign key(tarifa_id) references tarifas(id);
