-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 13, 2018 at 03:35 AM
-- Server version: 5.7.17
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `h18circuits`
--

-- --------------------------------------------------------

--
-- Table structure for table `adresse`
--

DROP TABLE IF EXISTS `adresse`;
CREATE TABLE `adresse` (
  `idAdresse` int(11) NOT NULL,
  `numeroCivique` int(11) NOT NULL,
  `nomRue` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `noAppartement` int(11) NOT NULL,
  `ville` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `province` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `codePostal` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `pays` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `idClient` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `circuit`
--

DROP TABLE IF EXISTS `circuit`;
CREATE TABLE `circuit` (
  `idCircuit` int(11) NOT NULL,
  `nomCircuit` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `nbPlacesMinimum` int(11) DEFAULT NULL,
  `nbPlacesMaximum` int(11) DEFAULT NULL,
  `nbPlacesReservees` int(11) DEFAULT NULL,
  `etat` tinyint(1) NOT NULL,
  `dateDepart` date DEFAULT NULL,
  `dateArrivee` date DEFAULT NULL,
  `photoCircuit` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `prixCircuit` float DEFAULT NULL,
  `guide` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `transport` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `connexion`
--

DROP TABLE IF EXISTS `connexion`;
CREATE TABLE `connexion` (
  `courriel` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `facalfaire` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Le champ mdp'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `connexion`
--

INSERT INTO `connexion` (`courriel`, `facalfaire`) VALUES
('admin@moreyalu.com', 'admin'),
('foo@bar.com', 'foobar'),
('marc@moreyalu.com', 'marc');

-- --------------------------------------------------------

--
-- Table structure for table `etape`
--

DROP TABLE IF EXISTS `etape`;
CREATE TABLE `etape` (
  `idEtape` int(11) NOT NULL,
  `nomEtape` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `id_circuit` int(11) NOT NULL,
  `nombreJour` int(11) DEFAULT NULL,
  `dateArrivee` date DEFAULT NULL,
  `dateDepart` date DEFAULT NULL,
  `descriptionEtape` text COLLATE utf8_unicode_ci,
  `photoEtape` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jour`
--

DROP TABLE IF EXISTS `jour`;
CREATE TABLE `jour` (
  `idJour` int(11) NOT NULL,
  `nomJour` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `nomVille` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `id_etape` int(11) NOT NULL,
  `hotel` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `urlHotel` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `restaurant` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `urlRestaurant` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `activite` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rabais`
--

DROP TABLE IF EXISTS `rabais`;
CREATE TABLE `rabais` (
  `idRabais` int(11) NOT NULL,
  `nom` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `idCircuit` int(11) NOT NULL,
  `pourcentage` float NOT NULL,
  `idEmploye` int(11) NOT NULL,
  `codePromo` varchar(10) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
CREATE TABLE `reservation` (
  `idReservation` int(11) NOT NULL,
  `idCircuit` int(11) NOT NULL,
  `idClient` int(11) NOT NULL,
  `dateReservation` date NOT NULL,
  `soldeInitial` float(15,2) NOT NULL,
  `paiementsEffectues` float(15,2) NOT NULL,
  `soldeCourant` float(15,2) NOT NULL,
  `dateEcheance` date NOT NULL,
  `idRabais` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `usager`
--

DROP TABLE IF EXISTS `usager`;
CREATE TABLE `usager` (
  `idUsager` int(11) NOT NULL,
  `nomUsager` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `prenomUsager` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `adresse` int(11) NOT NULL,
  `ddnUsager` int(11) DEFAULT NULL,
  `telephoneUsager` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `photoUsager` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `etat` tinyint(1) NOT NULL,
  `idReservation` int(11) DEFAULT NULL,
  `courriel` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `voyageur`
--

DROP TABLE IF EXISTS `voyageur`;
CREATE TABLE `voyageur` (
  `idVoyageur` int(11) NOT NULL,
  `nomVoyageur` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `prenomVoyageur` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `ddnVoyageur` date NOT NULL,
  `sexeVoyageur` tinyint(1) NOT NULL,
  `noPasseport` varchar(9) COLLATE utf8_unicode_ci NOT NULL,
  `idReservation` int(11) NOT NULL,
  `idClient` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adresse`
--
ALTER TABLE `adresse`
  ADD PRIMARY KEY (`idAdresse`),
  ADD KEY `idClient` (`idClient`),
  ADD KEY `idAdresse` (`idAdresse`);

--
-- Indexes for table `circuit`
--
ALTER TABLE `circuit`
  ADD PRIMARY KEY (`idCircuit`),
  ADD KEY `idCircuit` (`idCircuit`);

--
-- Indexes for table `connexion`
--
ALTER TABLE `connexion`
  ADD PRIMARY KEY (`courriel`),
  ADD UNIQUE KEY `courriel` (`courriel`),
  ADD KEY `courriel_2` (`courriel`),
  ADD KEY `courriel_3` (`courriel`);

--
-- Indexes for table `etape`
--
ALTER TABLE `etape`
  ADD PRIMARY KEY (`idEtape`),
  ADD KEY `id_circuit` (`id_circuit`);

--
-- Indexes for table `jour`
--
ALTER TABLE `jour`
  ADD PRIMARY KEY (`idJour`),
  ADD KEY `nomVille` (`nomVille`),
  ADD KEY `id_etape` (`id_etape`);

--
-- Indexes for table `rabais`
--
ALTER TABLE `rabais`
  ADD PRIMARY KEY (`idRabais`),
  ADD KEY `idRabais` (`idRabais`),
  ADD KEY `idEmploye` (`idEmploye`),
  ADD KEY `idCircuit` (`idCircuit`);

--
-- Indexes for table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`idReservation`),
  ADD KEY `idCircuit` (`idCircuit`),
  ADD KEY `idClient` (`idClient`),
  ADD KEY `idRabais` (`idRabais`);

--
-- Indexes for table `usager`
--
ALTER TABLE `usager`
  ADD PRIMARY KEY (`idUsager`),
  ADD KEY `idReservation` (`idReservation`),
  ADD KEY `adresse` (`adresse`),
  ADD KEY `courriel` (`courriel`);

--
-- Indexes for table `voyageur`
--
ALTER TABLE `voyageur`
  ADD PRIMARY KEY (`idVoyageur`),
  ADD UNIQUE KEY `noPasseport` (`noPasseport`),
  ADD KEY `idReservation` (`idReservation`),
  ADD KEY `idClient` (`idClient`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `adresse`
--
ALTER TABLE `adresse`
  MODIFY `idAdresse` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `circuit`
--
ALTER TABLE `circuit`
  MODIFY `idCircuit` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `etape`
--
ALTER TABLE `etape`
  MODIFY `idEtape` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `rabais`
--
ALTER TABLE `rabais`
  MODIFY `idRabais` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `idReservation` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `usager`
--
ALTER TABLE `usager`
  MODIFY `idUsager` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `voyageur`
--
ALTER TABLE `voyageur`
  MODIFY `idVoyageur` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `etape`
--
ALTER TABLE `etape`
  ADD CONSTRAINT `etape_ibfk_1` FOREIGN KEY (`id_circuit`) REFERENCES `circuit` (`idCircuit`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jour`
--
ALTER TABLE `jour`
  ADD CONSTRAINT `jour_ibfk_1` FOREIGN KEY (`id_etape`) REFERENCES `etape` (`idEtape`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `rabais`
--
ALTER TABLE `rabais`
  ADD CONSTRAINT `rabais_ibfk_1` FOREIGN KEY (`idCircuit`) REFERENCES `circuit` (`idCircuit`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`idReservation`) REFERENCES `client` (`idReservation`),
  ADD CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`idCircuit`) REFERENCES `circuit` (`idCircuit`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reservation_ibfk_3` FOREIGN KEY (`idClient`) REFERENCES `client` (`idClient`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reservation_ibfk_4` FOREIGN KEY (`idRabais`) REFERENCES `rabais` (`idRabais`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `usager`
--
ALTER TABLE `usager`
  ADD CONSTRAINT `usager_ibfk_1` FOREIGN KEY (`adresse`) REFERENCES `adresse` (`idAdresse`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `usager_ibfk_2` FOREIGN KEY (`idReservation`) REFERENCES `reservation` (`idReservation`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `usager_ibfk_3` FOREIGN KEY (`courriel`) REFERENCES `connexion` (`courriel`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `voyageur`
--
ALTER TABLE `voyageur`
  ADD CONSTRAINT `voyageur_ibfk_2` FOREIGN KEY (`idReservation`) REFERENCES `reservation` (`idReservation`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `voyageur_ibfk_3` FOREIGN KEY (`idClient`) REFERENCES `usager` (`idUsager`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
