-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 29, 2021 at 09:31 AM
-- Server version: 5.7.32
-- PHP Version: 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `bdd_SWAP`
--
CREATE DATABASE IF NOT EXISTS `bdd_SWAP` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `bdd_SWAP`;

-- --------------------------------------------------------

--
-- Table structure for table `Administrateur`
--

DROP TABLE IF EXISTS `Administrateur`;
CREATE TABLE `Administrateur` (
  `id_utilisateur` int(11) NOT NULL,
  `id_admin` int(11) NOT NULL,
  `mdp_admin` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Bien`
--

DROP TABLE IF EXISTS `Bien`;
CREATE TABLE `Bien` (
  `id_echangeable` int(11) NOT NULL,
  `marque` varchar(50) DEFAULT NULL,
  `couleur` varchar(30) DEFAULT NULL,
  `taille_dim` varchar(10) DEFAULT NULL,
  `id_cat_bien` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `CatBien`
--

DROP TABLE IF EXISTS `CatBien`;
CREATE TABLE `CatBien` (
  `id_cat_bien` int(11) NOT NULL,
  `nom` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `CatService`
--

DROP TABLE IF EXISTS `CatService`;
CREATE TABLE `CatService` (
  `id_cat_service` int(11) NOT NULL,
  `nom` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Echangeable`
--

DROP TABLE IF EXISTS `Echangeable`;
CREATE TABLE `Echangeable` (
  `id_echangeable` int(11) NOT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `id_utilisateur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Service`
--

DROP TABLE IF EXISTS `Service`;
CREATE TABLE `Service` (
  `id_echangeable` int(11) NOT NULL,
  `swapservice` tinyint(1) DEFAULT NULL,
  `id_cat_service` int(11) NOT NULL,
  `cout_uo` float DEFAULT NULL,
  `unite_oeuvre` text,
  `ouverte` tinyint(1) DEFAULT NULL,
  `debut` date DEFAULT NULL,
  `fin` date DEFAULT NULL,
  `pts_augmentation_swapskill_ar_uo` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Swapskill`
--

DROP TABLE IF EXISTS `Swapskill`;
CREATE TABLE `Swapskill` (
  `id_cat_service` int(11) NOT NULL,
  `id_utilisateur` int(11) NOT NULL,
  `swapskill` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Transaction`
--

DROP TABLE IF EXISTS `Transaction`;
CREATE TABLE `Transaction` (
  `id_transaction` int(11) NOT NULL,
  `montant_echange` float DEFAULT NULL,
  `swapskill_gagne` float DEFAULT NULL,
  `validee` tinyint(1) DEFAULT NULL,
  `id_utilisateur_donneur` int(11) NOT NULL,
  `id_utilisateur_receveur` int(11) NOT NULL,
  `id_echangeable` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `UtilisateurVirtuel`
--

DROP TABLE IF EXISTS `UtilisateurVirtuel`;
CREATE TABLE `UtilisateurVirtuel` (
  `id_utilisateur` int(11) NOT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `prenom` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `photo` blob,
  `swaplikes` float DEFAULT NULL,
  `adresse` varchar(200) DEFAULT NULL,
  `mdp` varchar(100) DEFAULT NULL,
  `solde` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Administrateur`
--
ALTER TABLE `Administrateur`
  ADD PRIMARY KEY (`id_utilisateur`);

--
-- Indexes for table `Bien`
--
ALTER TABLE `Bien`
  ADD PRIMARY KEY (`id_echangeable`),
  ADD KEY `id_cat_bien` (`id_cat_bien`);

--
-- Indexes for table `CatBien`
--
ALTER TABLE `CatBien`
  ADD PRIMARY KEY (`id_cat_bien`);

--
-- Indexes for table `CatService`
--
ALTER TABLE `CatService`
  ADD PRIMARY KEY (`id_cat_service`);

--
-- Indexes for table `Echangeable`
--
ALTER TABLE `Echangeable`
  ADD PRIMARY KEY (`id_echangeable`),
  ADD KEY `id_utilisateur` (`id_utilisateur`);

--
-- Indexes for table `Service`
--
ALTER TABLE `Service`
  ADD PRIMARY KEY (`id_echangeable`),
  ADD KEY `id_cat_service` (`id_cat_service`);

--
-- Indexes for table `Swapskill`
--
ALTER TABLE `Swapskill`
  ADD PRIMARY KEY (`id_cat_service`,`id_utilisateur`),
  ADD KEY `id_utilisateur` (`id_utilisateur`);

--
-- Indexes for table `Transaction`
--
ALTER TABLE `Transaction`
  ADD PRIMARY KEY (`id_transaction`),
  ADD KEY `id_utilisateur_donneur` (`id_utilisateur_donneur`),
  ADD KEY `id_utilisateur_receveur` (`id_utilisateur_receveur`),
  ADD KEY `id_echangeable` (`id_echangeable`);

--
-- Indexes for table `UtilisateurVirtuel`
--
ALTER TABLE `UtilisateurVirtuel`
  ADD PRIMARY KEY (`id_utilisateur`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Administrateur`
--
ALTER TABLE `Administrateur`
  MODIFY `id_utilisateur` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Bien`
--
ALTER TABLE `Bien`
  MODIFY `id_echangeable` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `CatBien`
--
ALTER TABLE `CatBien`
  MODIFY `id_cat_bien` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `CatService`
--
ALTER TABLE `CatService`
  MODIFY `id_cat_service` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Echangeable`
--
ALTER TABLE `Echangeable`
  MODIFY `id_echangeable` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Service`
--
ALTER TABLE `Service`
  MODIFY `id_echangeable` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Swapskill`
--
ALTER TABLE `Swapskill`
  MODIFY `id_utilisateur` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Transaction`
--
ALTER TABLE `Transaction`
  MODIFY `id_transaction` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `UtilisateurVirtuel`
--
ALTER TABLE `UtilisateurVirtuel`
  MODIFY `id_utilisateur` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Administrateur`
--
ALTER TABLE `Administrateur`
  ADD CONSTRAINT `administrateur_ibfk_1` FOREIGN KEY (`id_utilisateur`) REFERENCES `UtilisateurVirtuel` (`id_utilisateur`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Bien`
--
ALTER TABLE `Bien`
  ADD CONSTRAINT `bien_ibfk_1` FOREIGN KEY (`id_echangeable`) REFERENCES `Echangeable` (`id_echangeable`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bien_ibfk_2` FOREIGN KEY (`id_cat_bien`) REFERENCES `CatBien` (`id_cat_bien`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Echangeable`
--
ALTER TABLE `Echangeable`
  ADD CONSTRAINT `echangeable_ibfk_1` FOREIGN KEY (`id_utilisateur`) REFERENCES `UtilisateurVirtuel` (`id_utilisateur`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Service`
--
ALTER TABLE `Service`
  ADD CONSTRAINT `service_ibfk_1` FOREIGN KEY (`id_echangeable`) REFERENCES `Echangeable` (`id_echangeable`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `service_ibfk_2` FOREIGN KEY (`id_cat_service`) REFERENCES `CatService` (`id_cat_service`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Swapskill`
--
ALTER TABLE `Swapskill`
  ADD CONSTRAINT `swapskill_ibfk_1` FOREIGN KEY (`id_cat_service`) REFERENCES `CatService` (`id_cat_service`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `swapskill_ibfk_2` FOREIGN KEY (`id_utilisateur`) REFERENCES `UtilisateurVirtuel` (`id_utilisateur`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Transaction`
--
ALTER TABLE `Transaction`
  ADD CONSTRAINT `transaction_ibfk_1` FOREIGN KEY (`id_utilisateur_donneur`) REFERENCES `UtilisateurVirtuel` (`id_utilisateur`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `transaction_ibfk_2` FOREIGN KEY (`id_utilisateur_receveur`) REFERENCES `UtilisateurVirtuel` (`id_utilisateur`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `transaction_ibfk_3` FOREIGN KEY (`id_echangeable`) REFERENCES `Echangeable` (`id_echangeable`) ON DELETE CASCADE ON UPDATE CASCADE;
