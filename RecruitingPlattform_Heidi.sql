-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server Version:               5.7.19-log - MySQL Community Server (GPL)
-- Server Betriebssystem:        Win64
-- HeidiSQL Version:             9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Exportiere Datenbank Struktur für recruitingplattform
CREATE DATABASE IF NOT EXISTS `recruitingplattform` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `recruitingplattform`;

-- Exportiere Struktur von Tabelle recruitingplattform.account
CREATE TABLE IF NOT EXISTS `account` (
  `Account-ID` int(11) NOT NULL AUTO_INCREMENT,
  `Benutzername` varchar(45) NOT NULL,
  `Passwort` varchar(45) NOT NULL,
  `Vorname` varchar(45) NOT NULL,
  `Name` varchar(45) NOT NULL,
  `Geburtsdatum` date NOT NULL,
  `E-Mail` varchar(45) NOT NULL,
  `Telefonnr` int(11) NOT NULL,
  `Strasse` varchar(45) NOT NULL,
  `Hausnummer` varchar(50) NOT NULL,
  `Ort` varchar(45) NOT NULL,
  `PLZ` int(11) NOT NULL,
  PRIMARY KEY (`Account-ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Exportiere Daten aus Tabelle recruitingplattform.account: ~0 rows (ungefähr)
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
/*!40000 ALTER TABLE `account` ENABLE KEYS */;

-- Exportiere Struktur von Tabelle recruitingplattform.admin
CREATE TABLE IF NOT EXISTS `admin` (
  `Admin-ID` int(11) NOT NULL AUTO_INCREMENT,
  `BA-MA-ID` int(11) NOT NULL DEFAULT '0',
  `Rechte` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Admin-ID`),
  KEY `BA-MA-ID` (`BA-MA-ID`),
  CONSTRAINT `BA-MA-ID` FOREIGN KEY (`BA-MA-ID`) REFERENCES `ba-ma` (`BA-MA-ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Exportiere Daten aus Tabelle recruitingplattform.admin: ~0 rows (ungefähr)
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;

-- Exportiere Struktur von Tabelle recruitingplattform.ansprechpartner
CREATE TABLE IF NOT EXISTS `ansprechpartner` (
  `Ansprechpartner-ID` int(11) NOT NULL AUTO_INCREMENT,
  `Account-ID` int(11) NOT NULL,
  `PU-ID` int(11) NOT NULL,
  PRIMARY KEY (`Ansprechpartner-ID`),
  KEY `Account-ID` (`Account-ID`),
  KEY `PU-ID` (`PU-ID`),
  CONSTRAINT `Account-ID` FOREIGN KEY (`Account-ID`) REFERENCES `account` (`Account-ID`),
  CONSTRAINT `PU-ID` FOREIGN KEY (`PU-ID`) REFERENCES `pu` (`PU-ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Exportiere Daten aus Tabelle recruitingplattform.ansprechpartner: ~0 rows (ungefähr)
/*!40000 ALTER TABLE `ansprechpartner` DISABLE KEYS */;
/*!40000 ALTER TABLE `ansprechpartner` ENABLE KEYS */;

-- Exportiere Struktur von Tabelle recruitingplattform.ba-ma
CREATE TABLE IF NOT EXISTS `ba-ma` (
  `BA-MA-ID` int(11) NOT NULL AUTO_INCREMENT,
  `Account-ID` int(11) NOT NULL,
  PRIMARY KEY (`BA-MA-ID`),
  KEY `Account-ID2` (`Account-ID`),
  CONSTRAINT `Account-ID2` FOREIGN KEY (`Account-ID`) REFERENCES `account` (`Account-ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Exportiere Daten aus Tabelle recruitingplattform.ba-ma: ~0 rows (ungefähr)
/*!40000 ALTER TABLE `ba-ma` DISABLE KEYS */;
/*!40000 ALTER TABLE `ba-ma` ENABLE KEYS */;

-- Exportiere Struktur von Tabelle recruitingplattform.bewerbungsanschreiben
CREATE TABLE IF NOT EXISTS `bewerbungsanschreiben` (
  `Bewerbungsanschreiben-ID` int(11) NOT NULL AUTO_INCREMENT,
  `hinzugefuegt` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`Bewerbungsanschreiben-ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Exportiere Daten aus Tabelle recruitingplattform.bewerbungsanschreiben: ~0 rows (ungefähr)
/*!40000 ALTER TABLE `bewerbungsanschreiben` DISABLE KEYS */;
INSERT INTO `bewerbungsanschreiben` (`Bewerbungsanschreiben-ID`, `hinzugefuegt`) VALUES
	(1, 1);
/*!40000 ALTER TABLE `bewerbungsanschreiben` ENABLE KEYS */;

-- Exportiere Struktur von Tabelle recruitingplattform.dokument
CREATE TABLE IF NOT EXISTS `dokument` (
  `Dokument-ID` int(11) NOT NULL AUTO_INCREMENT,
  `Hochgeladen` tinyint(2) NOT NULL,
  `Zertifizierungen-ID` int(11) NOT NULL,
  `Lebenslauf-ID` int(11) NOT NULL,
  `Bewerbungsanschreiben-ID` int(11) NOT NULL,
  PRIMARY KEY (`Dokument-ID`),
  KEY `Zertifizierungen-ID` (`Zertifizierungen-ID`),
  KEY `Lebenslauf-ID` (`Lebenslauf-ID`),
  KEY `Bewerbungsanschreiben-ID` (`Bewerbungsanschreiben-ID`),
  CONSTRAINT `Bewerbungsanschreiben-ID` FOREIGN KEY (`Bewerbungsanschreiben-ID`) REFERENCES `bewerbungsanschreiben` (`Bewerbungsanschreiben-ID`),
  CONSTRAINT `Lebenslauf-ID` FOREIGN KEY (`Lebenslauf-ID`) REFERENCES `lebenslauf` (`Lebenslauf-ID`),
  CONSTRAINT `Zertifizierungen-ID` FOREIGN KEY (`Zertifizierungen-ID`) REFERENCES `zertifizierungen` (`Zertifizierungen-ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Exportiere Daten aus Tabelle recruitingplattform.dokument: ~1 rows (ungefähr)
/*!40000 ALTER TABLE `dokument` DISABLE KEYS */;
INSERT INTO `dokument` (`Dokument-ID`, `Hochgeladen`, `Zertifizierungen-ID`, `Lebenslauf-ID`, `Bewerbungsanschreiben-ID`) VALUES
	(1, 1, 1, 1, 1);
/*!40000 ALTER TABLE `dokument` ENABLE KEYS */;

-- Exportiere Struktur von Tabelle recruitingplattform.lebenslauf
CREATE TABLE IF NOT EXISTS `lebenslauf` (
  `Lebenslauf-ID` int(11) NOT NULL AUTO_INCREMENT,
  `hinzugefuegt` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`Lebenslauf-ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Exportiere Daten aus Tabelle recruitingplattform.lebenslauf: ~2 rows (ungefähr)
/*!40000 ALTER TABLE `lebenslauf` DISABLE KEYS */;
INSERT INTO `lebenslauf` (`Lebenslauf-ID`, `hinzugefuegt`) VALUES
	(1, 1),
	(2, 0);
/*!40000 ALTER TABLE `lebenslauf` ENABLE KEYS */;

-- Exportiere Struktur von Tabelle recruitingplattform.pu
CREATE TABLE IF NOT EXISTS `pu` (
  `PU-ID` int(11) NOT NULL AUTO_INCREMENT,
  `Firmenname` varchar(50) DEFAULT NULL,
  `Account-ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`PU-ID`),
  KEY `Account-ID3` (`Account-ID`),
  CONSTRAINT `Account-ID3` FOREIGN KEY (`Account-ID`) REFERENCES `account` (`Account-ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Exportiere Daten aus Tabelle recruitingplattform.pu: ~0 rows (ungefähr)
/*!40000 ALTER TABLE `pu` DISABLE KEYS */;
/*!40000 ALTER TABLE `pu` ENABLE KEYS */;

-- Exportiere Struktur von Tabelle recruitingplattform.semester
CREATE TABLE IF NOT EXISTS `semester` (
  `Semester-ID` int(11) NOT NULL AUTO_INCREMENT,
  `Semesterbeginn` date NOT NULL,
  PRIMARY KEY (`Semester-ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Exportiere Daten aus Tabelle recruitingplattform.semester: ~0 rows (ungefähr)
/*!40000 ALTER TABLE `semester` DISABLE KEYS */;
INSERT INTO `semester` (`Semester-ID`, `Semesterbeginn`) VALUES
	(1, '2017-08-23');
/*!40000 ALTER TABLE `semester` ENABLE KEYS */;

-- Exportiere Struktur von Tabelle recruitingplattform.studiengang
CREATE TABLE IF NOT EXISTS `studiengang` (
  `Studiengang-ID` int(11) NOT NULL AUTO_INCREMENT,
  `Studienfach` varchar(45) NOT NULL,
  PRIMARY KEY (`Studiengang-ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Exportiere Daten aus Tabelle recruitingplattform.studiengang: ~0 rows (ungefähr)
/*!40000 ALTER TABLE `studiengang` DISABLE KEYS */;
INSERT INTO `studiengang` (`Studiengang-ID`, `Studienfach`) VALUES
	(1, 'WI');
/*!40000 ALTER TABLE `studiengang` ENABLE KEYS */;

-- Exportiere Struktur von Tabelle recruitingplattform.user
CREATE TABLE IF NOT EXISTS `user` (
  `User-ID` int(11) NOT NULL AUTO_INCREMENT,
  `Anrede` char(4) NOT NULL,
  `Vorname` varchar(45) NOT NULL,
  `Name` varchar(45) NOT NULL,
  `Geburtsdatum` date NOT NULL,
  `Strasse` varchar(45) NOT NULL,
  `Hausnummer` varchar(50) NOT NULL,
  `PLZ` int(11) NOT NULL,
  `Ort` varchar(45) NOT NULL,
  `Land` varchar(50) NOT NULL,
  `Telefonnr` int(11) NOT NULL,
  `E-Mail` varchar(45) NOT NULL,
  `Studiengang-ID` int(11) NOT NULL,
  `Semester-ID` int(11) NOT NULL,
  `Dokument-ID` int(11) NOT NULL,
  `Workflow-ID` int(11) NOT NULL,
  PRIMARY KEY (`User-ID`),
  KEY `Workflow-ID` (`Workflow-ID`),
  KEY `Dokument-ID` (`Dokument-ID`),
  KEY `Semester-ID` (`Semester-ID`),
  KEY `Studiengang-ID` (`Studiengang-ID`),
  CONSTRAINT `Dokument-ID` FOREIGN KEY (`Dokument-ID`) REFERENCES `dokument` (`Dokument-ID`),
  CONSTRAINT `Semester-ID` FOREIGN KEY (`Semester-ID`) REFERENCES `semester` (`Semester-ID`),
  CONSTRAINT `Studiengang-ID` FOREIGN KEY (`Studiengang-ID`) REFERENCES `studiengang` (`Studiengang-ID`),
  CONSTRAINT `Workflow-ID` FOREIGN KEY (`Workflow-ID`) REFERENCES `workflow` (`Workflow-ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Exportiere Daten aus Tabelle recruitingplattform.user: ~0 rows (ungefähr)
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

-- Exportiere Struktur von Tabelle recruitingplattform.workflow
CREATE TABLE IF NOT EXISTS `workflow` (
  `Workflow-ID` int(11) NOT NULL AUTO_INCREMENT,
  `Next` tinyint(4) DEFAULT NULL,
  `Status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Workflow-ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Exportiere Daten aus Tabelle recruitingplattform.workflow: ~4 rows (ungefähr)
/*!40000 ALTER TABLE `workflow` DISABLE KEYS */;
INSERT INTO `workflow` (`Workflow-ID`, `Next`, `Status`) VALUES
	(1, 2, 'Eingegangen'),
	(2, 3, 'Bearbeitet'),
	(3, 4, 'Angenommen'),
	(4, 5, 'Abgelehnt');
/*!40000 ALTER TABLE `workflow` ENABLE KEYS */;

-- Exportiere Struktur von Tabelle recruitingplattform.zertifizierungen
CREATE TABLE IF NOT EXISTS `zertifizierungen` (
  `Zertifizierungen-ID` int(11) NOT NULL AUTO_INCREMENT,
  `hinzugefuegt` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`Zertifizierungen-ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Exportiere Daten aus Tabelle recruitingplattform.zertifizierungen: ~0 rows (ungefähr)
/*!40000 ALTER TABLE `zertifizierungen` DISABLE KEYS */;
INSERT INTO `zertifizierungen` (`Zertifizierungen-ID`, `hinzugefuegt`) VALUES
	(1, 0);
/*!40000 ALTER TABLE `zertifizierungen` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
