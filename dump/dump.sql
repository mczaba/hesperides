/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: auto
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `auto` (
  `idv` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `voiture` varchar(40) NOT NULL,
  `immatriculation` varchar(20) NOT NULL,
  `Lot` int(6) NOT NULL,
  `ProprioV` int(5) unsigned NOT NULL,
  `ResidentVisiteurPers` text NOT NULL,
  `carte` varchar(10) NOT NULL,
  `Observation` text CHARACTER SET utf8 COLLATE utf8_estonian_ci NOT NULL,
  PRIMARY KEY (`idv`),
  UNIQUE KEY `idv` (`idv`),
  UNIQUE KEY `immatriculation` (`immatriculation`),
  KEY `voiture` (`voiture`),
  KEY `idv_2` (`idv`),
  KEY `idv_3` (`idv`)
) ENGINE = MyISAM AUTO_INCREMENT = 78 DEFAULT CHARSET = utf8;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: documents
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `documents` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `filepath` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `entrepriseId` int(11) NOT NULL,
  `postedat` datetime NOT NULL,
  `observation` text,
  PRIMARY KEY (`Id`)
) ENGINE = InnoDB AUTO_INCREMENT = 5 DEFAULT CHARSET = latin1;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: entreprises
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `entreprises` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `adresse` varchar(255) DEFAULT NULL,
  `telephone` text NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE = InnoDB AUTO_INCREMENT = 3 DEFAULT CHARSET = latin1;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: favourites
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `favourites` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE = InnoDB AUTO_INCREMENT = 9 DEFAULT CHARSET = latin1;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: locataires
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `locataires` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nom` text NOT NULL,
  `prenom` text,
  `telephone` text,
  `mobile` text,
  `mail` text,
  `observation` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE = MyISAM AUTO_INCREMENT = 263 DEFAULT CHARSET = utf8;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: lots
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `lots` (
  `numero` int(3) unsigned NOT NULL,
  `batiment` tinytext,
  `etage` tinytext NOT NULL,
  `porte` int(3) DEFAULT NULL,
  `orientation` tinytext,
  `type` tinytext NOT NULL,
  `observation` text,
  `tantieme` int(11) NOT NULL,
  `proprietaire` int(11) NOT NULL,
  `locataire` int(11) DEFAULT NULL,
  `superficie` int(11) DEFAULT NULL,
  PRIMARY KEY (`numero`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: membres
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `membres` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `admin` tinyint(1) NOT NULL,
  `gestionnaire` tinyint(1) NOT NULL,
  `lastSeen` datetime DEFAULT NULL,
  `documentPost` tinyint(1) NOT NULL DEFAULT '0',
  `documentModif` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE = InnoDB AUTO_INCREMENT = 11 DEFAULT CHARSET = latin1;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: notes
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `notes` (
  `Reference` int(11) NOT NULL,
  `Date` date NOT NULL,
  `Objet` text NOT NULL,
  `Nom` text NOT NULL,
  `Lot` int(11) NOT NULL,
  `Note` varchar(800) NOT NULL,
  PRIMARY KEY (`Reference`),
  KEY `Reference` (`Reference`)
) ENGINE = MyISAM DEFAULT CHARSET = utf8;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: personnel
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `personnel` (
  `idp` int(11) NOT NULL,
  `Nom` text NOT NULL,
  `Prenom` text NOT NULL,
  `Telephone` varchar(15) NOT NULL,
  `Qualite` text NOT NULL,
  PRIMARY KEY (`idp`)
) ENGINE = MyISAM DEFAULT CHARSET = utf8;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: proprietaires
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `proprietaires` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` text NOT NULL,
  `prenom` text,
  `civilite` tinytext NOT NULL,
  `adresse` text,
  `telephone` text,
  `mobile` text,
  `mail` text,
  `batiment` tinytext,
  `resident` tinyint(1) NOT NULL,
  `observations` text,
  `societe` text,
  PRIMARY KEY (`Id`),
  KEY `Id` (`Id`)
) ENGINE = InnoDB AUTO_INCREMENT = 135 DEFAULT CHARSET = utf8;

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: auto
# ------------------------------------------------------------

INSERT INTO
  `auto` (
    `idv`,
    `voiture`,
    `immatriculation`,
    `Lot`,
    `ProprioV`,
    `ResidentVisiteurPers`,
    `carte`,
    `Observation`
  )
VALUES
  (
    1,
    'Fiat Panda',
    'CR 885 BM',
    62,
    201,
    'R',
    '',
    'Mme GIRE a un parking au SS'
  );
INSERT INTO
  `auto` (
    `idv`,
    `voiture`,
    `immatriculation`,
    `Lot`,
    `ProprioV`,
    `ResidentVisiteurPers`,
    `carte`,
    `Observation`
  )
VALUES
  (
    3,
    'Citroen Berlingot',
    'CB 952 NW',
    111,
    202,
    '',
    '',
    ''
  );
INSERT INTO
  `auto` (
    `idv`,
    `voiture`,
    `immatriculation`,
    `Lot`,
    `ProprioV`,
    `ResidentVisiteurPers`,
    `carte`,
    `Observation`
  )
VALUES
  (5, 'Opel Astra ', 'AB 180 FA', 20, 203, '', '', '');
INSERT INTO
  `auto` (
    `idv`,
    `voiture`,
    `immatriculation`,
    `Lot`,
    `ProprioV`,
    `ResidentVisiteurPers`,
    `carte`,
    `Observation`
  )
VALUES
  (6, 'Renault Twingo', '9902 SM 89', 20, 203, '', '', '');
INSERT INTO
  `auto` (
    `idv`,
    `voiture`,
    `immatriculation`,
    `Lot`,
    `ProprioV`,
    `ResidentVisiteurPers`,
    `carte`,
    `Observation`
  )
VALUES
  (7, 'Renault', 'EE 095 LY', 32, 207, '', '', '');
INSERT INTO
  `auto` (
    `idv`,
    `voiture`,
    `immatriculation`,
    `Lot`,
    `ProprioV`,
    `ResidentVisiteurPers`,
    `carte`,
    `Observation`
  )
VALUES
  (8, 'Peugeot', 'AJ 679 KP', 32, 207, '', '', '');
INSERT INTO
  `auto` (
    `idv`,
    `voiture`,
    `immatriculation`,
    `Lot`,
    `ProprioV`,
    `ResidentVisiteurPers`,
    `carte`,
    `Observation`
  )
VALUES
  (
    9,
    'Alfa Romeo Mito Range',
    'AV 207 PY',
    82,
    209,
    'R',
    '',
    ''
  );
INSERT INTO
  `auto` (
    `idv`,
    `voiture`,
    `immatriculation`,
    `Lot`,
    `ProprioV`,
    `ResidentVisiteurPers`,
    `carte`,
    `Observation`
  )
VALUES
  (10, 'Ford Break', 'AD 349 KL', 0, 89, '', '', '');
INSERT INTO
  `auto` (
    `idv`,
    `voiture`,
    `immatriculation`,
    `Lot`,
    `ProprioV`,
    `ResidentVisiteurPers`,
    `carte`,
    `Observation`
  )
VALUES
  (11, 'Dacia Logan', 'DM 950CC', 0, 89, '', '', '');
INSERT INTO
  `auto` (
    `idv`,
    `voiture`,
    `immatriculation`,
    `Lot`,
    `ProprioV`,
    `ResidentVisiteurPers`,
    `carte`,
    `Observation`
  )
VALUES
  (12, 'Toyota Yaris', 'EK 647 LL', 0, 66, '', '', '');
INSERT INTO
  `auto` (
    `idv`,
    `voiture`,
    `immatriculation`,
    `Lot`,
    `ProprioV`,
    `ResidentVisiteurPers`,
    `carte`,
    `Observation`
  )
VALUES
  (13, 'Toyota', 'BC 141 MZ', 0, 13, '', '', '');
INSERT INTO
  `auto` (
    `idv`,
    `voiture`,
    `immatriculation`,
    `Lot`,
    `ProprioV`,
    `ResidentVisiteurPers`,
    `carte`,
    `Observation`
  )
VALUES
  (14, 'Ford Cmax', 'EJ 470 DT', 0, 97, '', '', '');
INSERT INTO
  `auto` (
    `idv`,
    `voiture`,
    `immatriculation`,
    `Lot`,
    `ProprioV`,
    `ResidentVisiteurPers`,
    `carte`,
    `Observation`
  )
VALUES
  (15, 'Toyota Aygo', 'DQ 546 KK', 0, 97, '', '', '');
INSERT INTO
  `auto` (
    `idv`,
    `voiture`,
    `immatriculation`,
    `Lot`,
    `ProprioV`,
    `ResidentVisiteurPers`,
    `carte`,
    `Observation`
  )
VALUES
  (16, 'Renault Clio', 'DB 671 ZQ', 26, 210, 'R', '', '');
INSERT INTO
  `auto` (
    `idv`,
    `voiture`,
    `immatriculation`,
    `Lot`,
    `ProprioV`,
    `ResidentVisiteurPers`,
    `carte`,
    `Observation`
  )
VALUES
  (
    17,
    'Volkswagen Golf',
    '326 EBE 77',
    26,
    0,
    'V',
    '',
    'Petite fille de Mme LAVERDURE, propriétaire de l\'appartement'
  );
INSERT INTO
  `auto` (
    `idv`,
    `voiture`,
    `immatriculation`,
    `Lot`,
    `ProprioV`,
    `ResidentVisiteurPers`,
    `carte`,
    `Observation`
  )
VALUES
  (18, 'Honda', 'EJ 958 DJ', 0, 48, '', '', '');
INSERT INTO
  `auto` (
    `idv`,
    `voiture`,
    `immatriculation`,
    `Lot`,
    `ProprioV`,
    `ResidentVisiteurPers`,
    `carte`,
    `Observation`
  )
VALUES
  (19, 'Renault clio', 'AN 386 BB', 0, 48, '', '', '');
INSERT INTO
  `auto` (
    `idv`,
    `voiture`,
    `immatriculation`,
    `Lot`,
    `ProprioV`,
    `ResidentVisiteurPers`,
    `carte`,
    `Observation`
  )
VALUES
  (20, 'Citroen ZX', 'AW 986 HS', 0, 65, '', '', '');
INSERT INTO
  `auto` (
    `idv`,
    `voiture`,
    `immatriculation`,
    `Lot`,
    `ProprioV`,
    `ResidentVisiteurPers`,
    `carte`,
    `Observation`
  )
VALUES
  (21, 'Citroen C2', 'AG 727 NA', 0, 208, '', '', '');
INSERT INTO
  `auto` (
    `idv`,
    `voiture`,
    `immatriculation`,
    `Lot`,
    `ProprioV`,
    `ResidentVisiteurPers`,
    `carte`,
    `Observation`
  )
VALUES
  (22, 'Fiat Punto Evo', 'AQ 147 HQ', 0, 208, '', '', '');
INSERT INTO
  `auto` (
    `idv`,
    `voiture`,
    `immatriculation`,
    `Lot`,
    `ProprioV`,
    `ResidentVisiteurPers`,
    `carte`,
    `Observation`
  )
VALUES
  (
    23,
    'Nissan pixo',
    'CB  706 HC',
    84,
    0,
    'V',
    '',
    'Fils BURON'
  );
INSERT INTO
  `auto` (
    `idv`,
    `voiture`,
    `immatriculation`,
    `Lot`,
    `ProprioV`,
    `ResidentVisiteurPers`,
    `carte`,
    `Observation`
  )
VALUES
  (24, 'Peugeot 207', 'AT 023 BN', 0, 45, '', '', '');
INSERT INTO
  `auto` (
    `idv`,
    `voiture`,
    `immatriculation`,
    `Lot`,
    `ProprioV`,
    `ResidentVisiteurPers`,
    `carte`,
    `Observation`
  )
VALUES
  (25, 'Toyota', 'EG 330 VF', 131, 115, 'R', '', '');
INSERT INTO
  `auto` (
    `idv`,
    `voiture`,
    `immatriculation`,
    `Lot`,
    `ProprioV`,
    `ResidentVisiteurPers`,
    `carte`,
    `Observation`
  )
VALUES
  (
    26,
    'Volkswagen Polo',
    'CG 246 CY',
    133,
    0,
    'V',
    '',
    'Fille de Mme LEBLANC'
  );
INSERT INTO
  `auto` (
    `idv`,
    `voiture`,
    `immatriculation`,
    `Lot`,
    `ProprioV`,
    `ResidentVisiteurPers`,
    `carte`,
    `Observation`
  )
VALUES
  (27, 'Volkswagen Polo', 'AM 182 ZX', 0, 11, '', '', '');
INSERT INTO
  `auto` (
    `idv`,
    `voiture`,
    `immatriculation`,
    `Lot`,
    `ProprioV`,
    `ResidentVisiteurPers`,
    `carte`,
    `Observation`
  )
VALUES
  (28, 'Peugeot 406', 'CR 918 NA', 0, 11, '', '', '');
INSERT INTO
  `auto` (
    `idv`,
    `voiture`,
    `immatriculation`,
    `Lot`,
    `ProprioV`,
    `ResidentVisiteurPers`,
    `carte`,
    `Observation`
  )
VALUES
  (30, 'Citroen C4', 'BZ 133 MN', 0, 25, '', '', '');
INSERT INTO
  `auto` (
    `idv`,
    `voiture`,
    `immatriculation`,
    `Lot`,
    `ProprioV`,
    `ResidentVisiteurPers`,
    `carte`,
    `Observation`
  )
VALUES
  (31, 'Renault Twingo', 'DC 918 SM', 0, 212, '', '', '');
INSERT INTO
  `auto` (
    `idv`,
    `voiture`,
    `immatriculation`,
    `Lot`,
    `ProprioV`,
    `ResidentVisiteurPers`,
    `carte`,
    `Observation`
  )
VALUES
  (32, 'OPEL', '167 CDH 77', 0, 107, '', '', '');
INSERT INTO
  `auto` (
    `idv`,
    `voiture`,
    `immatriculation`,
    `Lot`,
    `ProprioV`,
    `ResidentVisiteurPers`,
    `carte`,
    `Observation`
  )
VALUES
  (33, 'AUDI', 'CJ 141 JG', 0, 19, '', '', '');
INSERT INTO
  `auto` (
    `idv`,
    `voiture`,
    `immatriculation`,
    `Lot`,
    `ProprioV`,
    `ResidentVisiteurPers`,
    `carte`,
    `Observation`
  )
VALUES
  (34, 'Volkswagen Tiguan', 'CT 283 HK', 0, 19, '', '', '');
INSERT INTO
  `auto` (
    `idv`,
    `voiture`,
    `immatriculation`,
    `Lot`,
    `ProprioV`,
    `ResidentVisiteurPers`,
    `carte`,
    `Observation`
  )
VALUES
  (
    35,
    'Renault Scenic',
    'EK 294 QM',
    128,
    205,
    'R',
    '',
    ''
  );
INSERT INTO
  `auto` (
    `idv`,
    `voiture`,
    `immatriculation`,
    `Lot`,
    `ProprioV`,
    `ResidentVisiteurPers`,
    `carte`,
    `Observation`
  )
VALUES
  (36, 'Renault Megane', 'DE 722 DT', 0, 405, '', '', '');
INSERT INTO
  `auto` (
    `idv`,
    `voiture`,
    `immatriculation`,
    `Lot`,
    `ProprioV`,
    `ResidentVisiteurPers`,
    `carte`,
    `Observation`
  )
VALUES
  (37, 'Citroen C3', 'BG 940 NX', 0, 401, '', '', '');
INSERT INTO
  `auto` (
    `idv`,
    `voiture`,
    `immatriculation`,
    `Lot`,
    `ProprioV`,
    `ResidentVisiteurPers`,
    `carte`,
    `Observation`
  )
VALUES
  (38, 'Renault clio', 'EH 510 DS', 0, 402, '', '', '');
INSERT INTO
  `auto` (
    `idv`,
    `voiture`,
    `immatriculation`,
    `Lot`,
    `ProprioV`,
    `ResidentVisiteurPers`,
    `carte`,
    `Observation`
  )
VALUES
  (39, 'Citroen C4', 'CP 637 FS', 0, 403, '', '', '');
INSERT INTO
  `auto` (
    `idv`,
    `voiture`,
    `immatriculation`,
    `Lot`,
    `ProprioV`,
    `ResidentVisiteurPers`,
    `carte`,
    `Observation`
  )
VALUES
  (40, 'Peugeot 106', 'DT 908 FV', 0, 404, '', '', '');
INSERT INTO
  `auto` (
    `idv`,
    `voiture`,
    `immatriculation`,
    `Lot`,
    `ProprioV`,
    `ResidentVisiteurPers`,
    `carte`,
    `Observation`
  )
VALUES
  (41, 'Renault Clio', 'DL 035 TR', 106, 90, 'R', '', '');
INSERT INTO
  `auto` (
    `idv`,
    `voiture`,
    `immatriculation`,
    `Lot`,
    `ProprioV`,
    `ResidentVisiteurPers`,
    `carte`,
    `Observation`
  )
VALUES
  (42, 'Peugeot 207', 'CK 353 EH', 0, 218, '', '', '');
INSERT INTO
  `auto` (
    `idv`,
    `voiture`,
    `immatriculation`,
    `Lot`,
    `ProprioV`,
    `ResidentVisiteurPers`,
    `carte`,
    `Observation`
  )
VALUES
  (43, 'Ford ecosport', 'ED 120 ZP', 99, 216, 'R', '', '');
INSERT INTO
  `auto` (
    `idv`,
    `voiture`,
    `immatriculation`,
    `Lot`,
    `ProprioV`,
    `ResidentVisiteurPers`,
    `carte`,
    `Observation`
  )
VALUES
  (44, 'Peugeot 308', 'AM 355 PL', 104, 215, 'R', '', '');
INSERT INTO
  `auto` (
    `idv`,
    `voiture`,
    `immatriculation`,
    `Lot`,
    `ProprioV`,
    `ResidentVisiteurPers`,
    `carte`,
    `Observation`
  )
VALUES
  (45, 'Renault Scenic', 'EJ 445 LS', 55, 214, 'R', '', '');
INSERT INTO
  `auto` (
    `idv`,
    `voiture`,
    `immatriculation`,
    `Lot`,
    `ProprioV`,
    `ResidentVisiteurPers`,
    `carte`,
    `Observation`
  )
VALUES
  (46, '', 'BE 803 XG', 52, 219, '', '', '');
INSERT INTO
  `auto` (
    `idv`,
    `voiture`,
    `immatriculation`,
    `Lot`,
    `ProprioV`,
    `ResidentVisiteurPers`,
    `carte`,
    `Observation`
  )
VALUES
  (47, '', 'DT 915 LJ', 54, 220, 'R', '', '');
INSERT INTO
  `auto` (
    `idv`,
    `voiture`,
    `immatriculation`,
    `Lot`,
    `ProprioV`,
    `ResidentVisiteurPers`,
    `carte`,
    `Observation`
  )
VALUES
  (48, 'Citroen C4', 'CF 884 CB', 66, 221, 'R', '', '');
INSERT INTO
  `auto` (
    `idv`,
    `voiture`,
    `immatriculation`,
    `Lot`,
    `ProprioV`,
    `ResidentVisiteurPers`,
    `carte`,
    `Observation`
  )
VALUES
  (49, '', 'BE 252 LP', 0, 106, '', '', '');
INSERT INTO
  `auto` (
    `idv`,
    `voiture`,
    `immatriculation`,
    `Lot`,
    `ProprioV`,
    `ResidentVisiteurPers`,
    `carte`,
    `Observation`
  )
VALUES
  (
    50,
    '',
    'DW 965 HW',
    74,
    0,
    'V',
    '',
    'Fils de Mme RIENDONNANT'
  );
INSERT INTO
  `auto` (
    `idv`,
    `voiture`,
    `immatriculation`,
    `Lot`,
    `ProprioV`,
    `ResidentVisiteurPers`,
    `carte`,
    `Observation`
  )
VALUES
  (
    51,
    '',
    'DT 357 LP',
    74,
    0,
    'V',
    '',
    'Belle fille de Mme RIENDONNANT'
  );
INSERT INTO
  `auto` (
    `idv`,
    `voiture`,
    `immatriculation`,
    `Lot`,
    `ProprioV`,
    `ResidentVisiteurPers`,
    `carte`,
    `Observation`
  )
VALUES
  (52, 'Citroen C4', 'CG 789 BM', 0, 72, '', '', '');
INSERT INTO
  `auto` (
    `idv`,
    `voiture`,
    `immatriculation`,
    `Lot`,
    `ProprioV`,
    `ResidentVisiteurPers`,
    `carte`,
    `Observation`
  )
VALUES
  (53, 'RENAULT SCENIC', '1344 ZQ 94', 0, 7, '', '', '');
INSERT INTO
  `auto` (
    `idv`,
    `voiture`,
    `immatriculation`,
    `Lot`,
    `ProprioV`,
    `ResidentVisiteurPers`,
    `carte`,
    `Observation`
  )
VALUES
  (54, 'FIAT 500', 'CW 765 KG', 0, 9, '', '', '');
INSERT INTO
  `auto` (
    `idv`,
    `voiture`,
    `immatriculation`,
    `Lot`,
    `ProprioV`,
    `ResidentVisiteurPers`,
    `carte`,
    `Observation`
  )
VALUES
  (55, 'TOYOTA Yaris', 'DE 012 QJ', 0, 52, '', '', '');
INSERT INTO
  `auto` (
    `idv`,
    `voiture`,
    `immatriculation`,
    `Lot`,
    `ProprioV`,
    `ResidentVisiteurPers`,
    `carte`,
    `Observation`
  )
VALUES
  (56, 'AUDI Q3 Grise', 'EL 730 ES', 0, 105, '', '', '');
INSERT INTO
  `auto` (
    `idv`,
    `voiture`,
    `immatriculation`,
    `Lot`,
    `ProprioV`,
    `ResidentVisiteurPers`,
    `carte`,
    `Observation`
  )
VALUES
  (
    57,
    'AUDI A4',
    '8200 BVX',
    0,
    118,
    '',
    '',
    'Juillet 2018 véhicule en vente'
  );
INSERT INTO
  `auto` (
    `idv`,
    `voiture`,
    `immatriculation`,
    `Lot`,
    `ProprioV`,
    `ResidentVisiteurPers`,
    `carte`,
    `Observation`
  )
VALUES
  (58, 'Suzuki wagon R', 'DV 243 XS', 0, 38, '', '', '');
INSERT INTO
  `auto` (
    `idv`,
    `voiture`,
    `immatriculation`,
    `Lot`,
    `ProprioV`,
    `ResidentVisiteurPers`,
    `carte`,
    `Observation`
  )
VALUES
  (59, 'Peugeot 206', 'DV 248 XS', 0, 38, '', '', '');
INSERT INTO
  `auto` (
    `idv`,
    `voiture`,
    `immatriculation`,
    `Lot`,
    `ProprioV`,
    `ResidentVisiteurPers`,
    `carte`,
    `Observation`
  )
VALUES
  (60, 'Citroen C3', 'BP 240 YR', 33, 223, '', '', '');
INSERT INTO
  `auto` (
    `idv`,
    `voiture`,
    `immatriculation`,
    `Lot`,
    `ProprioV`,
    `ResidentVisiteurPers`,
    `carte`,
    `Observation`
  )
VALUES
  (
    61,
    'Citroen C4 Picasso',
    'DZ 354 NQ',
    33,
    223,
    '',
    '',
    ''
  );
INSERT INTO
  `auto` (
    `idv`,
    `voiture`,
    `immatriculation`,
    `Lot`,
    `ProprioV`,
    `ResidentVisiteurPers`,
    `carte`,
    `Observation`
  )
VALUES
  (62, 'OPEL', 'AC 452 KQ', 46, 226, '', '', '');
INSERT INTO
  `auto` (
    `idv`,
    `voiture`,
    `immatriculation`,
    `Lot`,
    `ProprioV`,
    `ResidentVisiteurPers`,
    `carte`,
    `Observation`
  )
VALUES
  (63, 'SUZUKI', 'DK 709 SD', 46, 226, '', '', '');
INSERT INTO
  `auto` (
    `idv`,
    `voiture`,
    `immatriculation`,
    `Lot`,
    `ProprioV`,
    `ResidentVisiteurPers`,
    `carte`,
    `Observation`
  )
VALUES
  (64, '', 'BX 051 PD', 0, 24, '', '', '');
INSERT INTO
  `auto` (
    `idv`,
    `voiture`,
    `immatriculation`,
    `Lot`,
    `ProprioV`,
    `ResidentVisiteurPers`,
    `carte`,
    `Observation`
  )
VALUES
  (
    65,
    '',
    'DP 614 KW',
    58,
    406,
    'V',
    '',
    'Dame de Compagnie de Mme COQUEREL'
  );
INSERT INTO
  `auto` (
    `idv`,
    `voiture`,
    `immatriculation`,
    `Lot`,
    `ProprioV`,
    `ResidentVisiteurPers`,
    `carte`,
    `Observation`
  )
VALUES
  (
    66,
    '',
    '788 EDK 77',
    58,
    0,
    'V',
    '',
    'Fils de Mme COQUEREL'
  );
INSERT INTO
  `auto` (
    `idv`,
    `voiture`,
    `immatriculation`,
    `Lot`,
    `ProprioV`,
    `ResidentVisiteurPers`,
    `carte`,
    `Observation`
  )
VALUES
  (67, '', 'CS 857 GZ', 87, 206, 'R', '', '');
INSERT INTO
  `auto` (
    `idv`,
    `voiture`,
    `immatriculation`,
    `Lot`,
    `ProprioV`,
    `ResidentVisiteurPers`,
    `carte`,
    `Observation`
  )
VALUES
  (68, '', 'DV 041 DG', 11, 226, 'R', '', '');
INSERT INTO
  `auto` (
    `idv`,
    `voiture`,
    `immatriculation`,
    `Lot`,
    `ProprioV`,
    `ResidentVisiteurPers`,
    `carte`,
    `Observation`
  )
VALUES
  (69, '', '421 ENF 77', 36, 5, 'R', '', '');
INSERT INTO
  `auto` (
    `idv`,
    `voiture`,
    `immatriculation`,
    `Lot`,
    `ProprioV`,
    `ResidentVisiteurPers`,
    `carte`,
    `Observation`
  )
VALUES
  (
    70,
    '',
    '395 CZY 77',
    55,
    0,
    'V',
    '',
    'Amie de Mme FOURNY'
  );
INSERT INTO
  `auto` (
    `idv`,
    `voiture`,
    `immatriculation`,
    `Lot`,
    `ProprioV`,
    `ResidentVisiteurPers`,
    `carte`,
    `Observation`
  )
VALUES
  (
    71,
    '',
    'ED 596 SW',
    89,
    0,
    'V',
    '',
    'Fille de Mme PARNAUDEAU'
  );
INSERT INTO
  `auto` (
    `idv`,
    `voiture`,
    `immatriculation`,
    `Lot`,
    `ProprioV`,
    `ResidentVisiteurPers`,
    `carte`,
    `Observation`
  )
VALUES
  (72, 'VISITEUR', 'ZZZ', 88, 0, 'V', '', '');
INSERT INTO
  `auto` (
    `idv`,
    `voiture`,
    `immatriculation`,
    `Lot`,
    `ProprioV`,
    `ResidentVisiteurPers`,
    `carte`,
    `Observation`
  )
VALUES
  (73, 'PEUGEOT 308 ', 'DG 585 KY', 49, 118, 'R', '', '');
INSERT INTO
  `auto` (
    `idv`,
    `voiture`,
    `immatriculation`,
    `Lot`,
    `ProprioV`,
    `ResidentVisiteurPers`,
    `carte`,
    `Observation`
  )
VALUES
  (
    74,
    '',
    'CZ 124 WB',
    133,
    0,
    'V',
    '',
    'Petit fils de Mme LEBLANC'
  );
INSERT INTO
  `auto` (
    `idv`,
    `voiture`,
    `immatriculation`,
    `Lot`,
    `ProprioV`,
    `ResidentVisiteurPers`,
    `carte`,
    `Observation`
  )
VALUES
  (
    75,
    'Renault Clio Grise',
    '796 AJY 29',
    114,
    213,
    'R',
    '18156',
    ''
  );
INSERT INTO
  `auto` (
    `idv`,
    `voiture`,
    `immatriculation`,
    `Lot`,
    `ProprioV`,
    `ResidentVisiteurPers`,
    `carte`,
    `Observation`
  )
VALUES
  (
    76,
    '',
    'AM 967 2X',
    131,
    0,
    'V',
    '',
    'Fils de M RICORDI'
  );
INSERT INTO
  `auto` (
    `idv`,
    `voiture`,
    `immatriculation`,
    `Lot`,
    `ProprioV`,
    `ResidentVisiteurPers`,
    `carte`,
    `Observation`
  )
VALUES
  (
    77,
    '',
    'BP 210 BN',
    10,
    37,
    'R',
    '',
    'Attente d\'une nouvelle immatriculation'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: documents
# ------------------------------------------------------------

INSERT INTO
  `documents` (
    `Id`,
    `title`,
    `filepath`,
    `type`,
    `status`,
    `entrepriseId`,
    `postedat`,
    `observation`
  )
VALUES
  (
    1,
    'edtretoast',
    'document/1614696129686-justificatif-rémunération.pdf',
    'Facture',
    0,
    2,
    '2021-03-02 14:42:09',
    NULL
  );
INSERT INTO
  `documents` (
    `Id`,
    `title`,
    `filepath`,
    `type`,
    `status`,
    `entrepriseId`,
    `postedat`,
    `observation`
  )
VALUES
  (
    2,
    'dsqd',
    'document/1615372043648-CV-Anglais.pdf',
    'Devis',
    0,
    2,
    '2021-03-10 10:27:23',
    'dsqdsqdqsd'
  );
INSERT INTO
  `documents` (
    `Id`,
    `title`,
    `filepath`,
    `type`,
    `status`,
    `entrepriseId`,
    `postedat`,
    `observation`
  )
VALUES
  (
    3,
    'test obs null',
    'document/1615372085490-CV-Anglais.pdf',
    'Devis',
    0,
    2,
    '2021-03-10 10:28:05',
    NULL
  );
INSERT INTO
  `documents` (
    `Id`,
    `title`,
    `filepath`,
    `type`,
    `status`,
    `entrepriseId`,
    `postedat`,
    `observation`
  )
VALUES
  (
    4,
    'test reset entreprise',
    'document/1615372112370-constat.pdf',
    'Devis',
    0,
    2,
    '2021-03-10 10:28:32',
    NULL
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: entreprises
# ------------------------------------------------------------

INSERT INTO
  `entreprises` (`Id`, `nom`, `type`, `adresse`, `telephone`)
VALUES
  (
    2,
    'test entreprise edit',
    'test',
    NULL,
    '0523548596\r\n2eme tel : osef'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: favourites
# ------------------------------------------------------------

INSERT INTO
  `favourites` (`Id`, `nom`, `email`)
VALUES
  (1, 'test', 'test@test.com');
INSERT INTO
  `favourites` (`Id`, `nom`, `email`)
VALUES
  (3, 'test2', 'test2@rtest.com');
INSERT INTO
  `favourites` (`Id`, `nom`, `email`)
VALUES
  (4, 'test3', 'test3@test.com');
INSERT INTO
  `favourites` (`Id`, `nom`, `email`)
VALUES
  (5, 'test4', 'test4@test.com');
INSERT INTO
  `favourites` (`Id`, `nom`, `email`)
VALUES
  (6, 'tesstt', 'tesstt@test.com');
INSERT INTO
  `favourites` (`Id`, `nom`, `email`)
VALUES
  (8, 'test5', 'test5@test.com');

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: locataires
# ------------------------------------------------------------

INSERT INTO
  `locataires` (
    `Id`,
    `nom`,
    `prenom`,
    `telephone`,
    `mobile`,
    `mail`,
    `observation`
  )
VALUES
  (
    201,
    'MARGUET',
    'Lucien',
    '09 80 69 70 77',
    '06 74 61 82 91',
    'infomarguet@gmail.com',
    'ancien locataire\r\nJosette GIRE\r\n06 41 40 75 70'
  );
INSERT INTO
  `locataires` (
    `Id`,
    `nom`,
    `prenom`,
    `telephone`,
    `mobile`,
    `mail`,
    `observation`
  )
VALUES
  (
    202,
    'STEINBACH',
    'Emilie',
    '',
    '06 69 76 65 27',
    'emiliestb@gmail.com',
    'Gérer par DAPOIGNY ORPI AVON'
  );
INSERT INTO
  `locataires` (
    `Id`,
    `nom`,
    `prenom`,
    `telephone`,
    `mobile`,
    `mail`,
    `observation`
  )
VALUES
  (203, 'CHAÏB', 'Sarah', '', '', '', ' ');
INSERT INTO
  `locataires` (
    `Id`,
    `nom`,
    `prenom`,
    `telephone`,
    `mobile`,
    `mail`,
    `observation`
  )
VALUES
  (
    204,
    'PLESSIS',
    'Dominique',
    '',
    '06 81 46 40 87',
    'dominique140749@gmail.com',
    ''
  );
INSERT INTO
  `locataires` (
    `Id`,
    `nom`,
    `prenom`,
    `telephone`,
    `mobile`,
    `mail`,
    `observation`
  )
VALUES
  (
    205,
    'DERIGNY',
    'Hubert',
    '01 60 70 81 44',
    '06 08 04 47 74',
    '',
    'Semble utiliser la cave 11, le grenier 12 et le parking 2°SS 350'
  );
INSERT INTO
  `locataires` (
    `Id`,
    `nom`,
    `prenom`,
    `telephone`,
    `mobile`,
    `mail`,
    `observation`
  )
VALUES
  (
    206,
    'CUGIER',
    'Marc',
    '',
    '06 10 75 16 12',
    'marccugier@aol.com',
    ''
  );
INSERT INTO
  `locataires` (
    `Id`,
    `nom`,
    `prenom`,
    `telephone`,
    `mobile`,
    `mail`,
    `observation`
  )
VALUES
  (
    207,
    'ALARY',
    '',
    '',
    '06 48 25 27 77',
    'Fils\r\nchristophe.alary@free.fr',
    'Cabinet JOFFRE'
  );
INSERT INTO
  `locataires` (
    `Id`,
    `nom`,
    `prenom`,
    `telephone`,
    `mobile`,
    `mail`,
    `observation`
  )
VALUES
  (
    209,
    'AHMAYMI',
    '',
    '',
    '06 79 03 03 58',
    'adnanmil@hotmail.fr',
    ''
  );
INSERT INTO
  `locataires` (
    `Id`,
    `nom`,
    `prenom`,
    `telephone`,
    `mobile`,
    `mail`,
    `observation`
  )
VALUES
  (
    210,
    'LAVERDURE',
    'Paulette & Michel',
    '01 60 74 48 79',
    '06 08 21 13 71',
    'laverdure.paulette@orange.fr',
    ''
  );
INSERT INTO
  `locataires` (
    `Id`,
    `nom`,
    `prenom`,
    `telephone`,
    `mobile`,
    `mail`,
    `observation`
  )
VALUES
  (
    211,
    'LEBLANC',
    'Marie Jacqueline',
    '',
    '06 82 69 70 84',
    '',
    ''
  );
INSERT INTO
  `locataires` (
    `Id`,
    `nom`,
    `prenom`,
    `telephone`,
    `mobile`,
    `mail`,
    `observation`
  )
VALUES
  (
    212,
    'DESBRUNS & LOBLEAU',
    'Camille & Quentin',
    '',
    '06 48 83 16 54',
    'q.lobleau@live.fr',
    ''
  );
INSERT INTO
  `locataires` (
    `Id`,
    `nom`,
    `prenom`,
    `telephone`,
    `mobile`,
    `mail`,
    `observation`
  )
VALUES
  (
    213,
    'AVERTY',
    'Julie',
    '',
    '06 35 90 34 67',
    'julie.averty@gmail.com',
    ''
  );
INSERT INTO
  `locataires` (
    `Id`,
    `nom`,
    `prenom`,
    `telephone`,
    `mobile`,
    `mail`,
    `observation`
  )
VALUES
  (
    214,
    'FOURNY',
    'Colette',
    '01 64 22 87 73',
    '06 30 15 89 66',
    'fournycolette@yahoo.fr',
    ''
  );
INSERT INTO
  `locataires` (
    `Id`,
    `nom`,
    `prenom`,
    `telephone`,
    `mobile`,
    `mail`,
    `observation`
  )
VALUES
  (
    215,
    'DONTENVILE',
    'Didier',
    '',
    '07 61 92 58 85',
    'didier.dontenville@gmail.com\r\n',
    ''
  );
INSERT INTO
  `locataires` (
    `Id`,
    `nom`,
    `prenom`,
    `telephone`,
    `mobile`,
    `mail`,
    `observation`
  )
VALUES
  (
    240,
    'CARUSO\r\n\r\n',
    'Dylan',
    '',
    'Dylan 06 80 65 48 87\r\nPère  06 20 88 34 82',
    '',
    ''
  );
INSERT INTO
  `locataires` (
    `Id`,
    `nom`,
    `prenom`,
    `telephone`,
    `mobile`,
    `mail`,
    `observation`
  )
VALUES
  (
    216,
    'BOISSAVY',
    'Alain',
    '',
    '06 38 45 43 60',
    'alain.boissavy@gmail.com',
    ''
  );
INSERT INTO
  `locataires` (
    `Id`,
    `nom`,
    `prenom`,
    `telephone`,
    `mobile`,
    `mail`,
    `observation`
  )
VALUES
  (
    217,
    'BUTIN',
    'Adrien',
    '',
    '06 86 00 51 8',
    'adrienbutin.89@gmail.com',
    ''
  );
INSERT INTO
  `locataires` (
    `Id`,
    `nom`,
    `prenom`,
    `telephone`,
    `mobile`,
    `mail`,
    `observation`
  )
VALUES
  (
    247,
    'VIDE LE BIHAN',
    'Corentine',
    '',
    '06 40 84 51 63',
    'corentine.lebihan@outlook.fr',
    'voiture\r\nAZ--282-PB'
  );
INSERT INTO
  `locataires` (
    `Id`,
    `nom`,
    `prenom`,
    `telephone`,
    `mobile`,
    `mail`,
    `observation`
  )
VALUES
  (
    218,
    'SEIGNEUR',
    'Nicolas',
    '',
    '06 45 88 78 80',
    'Ancien locataire\r\ngoossens.raphael@orange.fr',
    ''
  );
INSERT INTO
  `locataires` (
    `Id`,
    `nom`,
    `prenom`,
    `telephone`,
    `mobile`,
    `mail`,
    `observation`
  )
VALUES
  (
    219,
    'MAJANO',
    'Jennifer',
    '',
    '06 36 36 28 42',
    'majanojenn@gmail.com',
    ''
  );
INSERT INTO
  `locataires` (
    `Id`,
    `nom`,
    `prenom`,
    `telephone`,
    `mobile`,
    `mail`,
    `observation`
  )
VALUES
  (220, 'LAIR', 'Daphné', '', '06 72 87 32 40', '', '');
INSERT INTO
  `locataires` (
    `Id`,
    `nom`,
    `prenom`,
    `telephone`,
    `mobile`,
    `mail`,
    `observation`
  )
VALUES
  (
    221,
    'PONS',
    'Valerie',
    '',
    '06 09 56 54 02',
    'inconu@gmail.com',
    ''
  );
INSERT INTO
  `locataires` (
    `Id`,
    `nom`,
    `prenom`,
    `telephone`,
    `mobile`,
    `mail`,
    `observation`
  )
VALUES
  (
    222,
    'RIENDONNANT & REDOUTE',
    '',
    '',
    '06 64 86 69 41',
    '',
    'Mme REDOUTE Fille de Mme RIENDONNANT'
  );
INSERT INTO
  `locataires` (
    `Id`,
    `nom`,
    `prenom`,
    `telephone`,
    `mobile`,
    `mail`,
    `observation`
  )
VALUES
  (223, 'DE MURTAS', '', '', '06 34 15 09 59', '', '');
INSERT INTO
  `locataires` (
    `Id`,
    `nom`,
    `prenom`,
    `telephone`,
    `mobile`,
    `mail`,
    `observation`
  )
VALUES
  (
    224,
    'ISSLAME DAOUDA',
    'Bouchrat',
    '',
    '06 18 69 02 57',
    'bouchratperso89@gmail.com',
    ''
  );
INSERT INTO
  `locataires` (
    `Id`,
    `nom`,
    `prenom`,
    `telephone`,
    `mobile`,
    `mail`,
    `observation`
  )
VALUES
  (
    225,
    'COURDAVAULT',
    'Florian',
    '',
    '07 69 00 42 12 Florian\r\n07 69 06 10 95 mme',
    'courdavault.florian@gmail.com',
    ''
  );
INSERT INTO
  `locataires` (
    `Id`,
    `nom`,
    `prenom`,
    `telephone`,
    `mobile`,
    `mail`,
    `observation`
  )
VALUES
  (226, 'BELKEFI', '', '', '07 87 18 20 68', '', '');
INSERT INTO
  `locataires` (
    `Id`,
    `nom`,
    `prenom`,
    `telephone`,
    `mobile`,
    `mail`,
    `observation`
  )
VALUES
  (
    231,
    'DAUBRY',
    '',
    '',
    '06 29 81 94 26',
    'pierredaubry@yahoo.com',
    ''
  );
INSERT INTO
  `locataires` (
    `Id`,
    `nom`,
    `prenom`,
    `telephone`,
    `mobile`,
    `mail`,
    `observation`
  )
VALUES
  (
    227,
    'TISSEDRE',
    'INC',
    '01 77 03 25 31',
    '06 09 40 32 50',
    '',
    ''
  );
INSERT INTO
  `locataires` (
    `Id`,
    `nom`,
    `prenom`,
    `telephone`,
    `mobile`,
    `mail`,
    `observation`
  )
VALUES
  (
    228,
    'COULOM',
    'Patricia',
    '',
    '06 81 38 06 01',
    'patricia.coulom@wanadoo.fr',
    'Locataire précédent\r\nTUETA\r\n06 30 49 21 48\r\nguy.tueta@gmail.com\r\n'
  );
INSERT INTO
  `locataires` (
    `Id`,
    `nom`,
    `prenom`,
    `telephone`,
    `mobile`,
    `mail`,
    `observation`
  )
VALUES
  (
    229,
    'ETIENNE\r\nAURORE',
    'Manon & Anthony',
    '',
    'Manon 07 86 82 34 71\r\nAnthony 06 48 52 97 35',
    'manonn.etienne@gmail.com\r\nanthonyedouard.aurore@gmail.com',
    ''
  );
INSERT INTO
  `locataires` (
    `Id`,
    `nom`,
    `prenom`,
    `telephone`,
    `mobile`,
    `mail`,
    `observation`
  )
VALUES
  (
    230,
    'GRATIO',
    'Roland',
    '',
    '06 42 74 59 41',
    'gratio@orange.fr',
    ''
  );
INSERT INTO
  `locataires` (
    `Id`,
    `nom`,
    `prenom`,
    `telephone`,
    `mobile`,
    `mail`,
    `observation`
  )
VALUES
  (
    232,
    'ZAMARRENEO',
    'Thomas',
    '',
    '06 84 44 80 93',
    'zamarreneo.thomas@hotmail.fr',
    'Précédent locataire\r\nGUILLOY Kevin\r\n06 58 15 45 11\r\nkevin@guilloy'
  );
INSERT INTO
  `locataires` (
    `Id`,
    `nom`,
    `prenom`,
    `telephone`,
    `mobile`,
    `mail`,
    `observation`
  )
VALUES
  (
    233,
    'GINISTY',
    'Laurent',
    '',
    '06 03 80 12 10',
    'laurent.ginisty@gmzil.com',
    ''
  );
INSERT INTO
  `locataires` (
    `Id`,
    `nom`,
    `prenom`,
    `telephone`,
    `mobile`,
    `mail`,
    `observation`
  )
VALUES
  (
    234,
    'GRAND',
    'Valérie',
    '',
    '06 66 17 36 46',
    'grandvalerie@yahoo.dr',
    ''
  );
INSERT INTO
  `locataires` (
    `Id`,
    `nom`,
    `prenom`,
    `telephone`,
    `mobile`,
    `mail`,
    `observation`
  )
VALUES
  (
    235,
    'BULLOT',
    'Gabrielle',
    '',
    '06 83 06 51 11\r\n\r\npère\r\n06 83 45 96 44',
    'gabrielle.bullot@gmail.com',
    'voiture CD 440 ET'
  );
INSERT INTO
  `locataires` (
    `Id`,
    `nom`,
    `prenom`,
    `telephone`,
    `mobile`,
    `mail`,
    `observation`
  )
VALUES
  (
    236,
    'MORIN',
    'Alexandra',
    '',
    '06 98 74 43 20',
    'alexandramorin@hotmail.fr',
    ''
  );
INSERT INTO
  `locataires` (
    `Id`,
    `nom`,
    `prenom`,
    `telephone`,
    `mobile`,
    `mail`,
    `observation`
  )
VALUES
  (
    237,
    'MOREAU KARAGUINSKY',
    'Céline',
    '',
    '06 50 93 60 07',
    'cmoreaukaraguinsky@yahoo.fr',
    'Géré par Arthur Immo'
  );
INSERT INTO
  `locataires` (
    `Id`,
    `nom`,
    `prenom`,
    `telephone`,
    `mobile`,
    `mail`,
    `observation`
  )
VALUES
  (238, 'NOUGUHE', 'Virginie', '', '', '', '');
INSERT INTO
  `locataires` (
    `Id`,
    `nom`,
    `prenom`,
    `telephone`,
    `mobile`,
    `mail`,
    `observation`
  )
VALUES
  (
    239,
    'KONE',
    '',
    '',
    'Mme 06 52 48 10 58\r\nMr  06 52 25 91 06',
    'konekone37@yahoo.fr',
    ''
  );
INSERT INTO
  `locataires` (
    `Id`,
    `nom`,
    `prenom`,
    `telephone`,
    `mobile`,
    `mail`,
    `observation`
  )
VALUES
  (
    241,
    'RODRIGUES',
    'Laura',
    '',
    '07 51 29 10 65',
    'contact.lrodrigues@gmail.com',
    ''
  );
INSERT INTO
  `locataires` (
    `Id`,
    `nom`,
    `prenom`,
    `telephone`,
    `mobile`,
    `mail`,
    `observation`
  )
VALUES
  (
    242,
    'JOUVENOT',
    'Ginette',
    '',
    '06 87 16 27 39',
    '',
    ''
  );
INSERT INTO
  `locataires` (
    `Id`,
    `nom`,
    `prenom`,
    `telephone`,
    `mobile`,
    `mail`,
    `observation`
  )
VALUES
  (
    244,
    'EN VENTE CRESPO',
    'Elisa',
    '',
    '07 83 66 94 87',
    'elisa.crespo@live.fr',
    ''
  );
INSERT INTO
  `locataires` (
    `Id`,
    `nom`,
    `prenom`,
    `telephone`,
    `mobile`,
    `mail`,
    `observation`
  )
VALUES
  (
    245,
    'CATALA\r\nGEANT',
    'Clément\r\nEmmeline',
    '',
    '06 86 54 00 70\r\n06 13 16 23 98',
    'inconnu',
    ''
  );
INSERT INTO
  `locataires` (
    `Id`,
    `nom`,
    `prenom`,
    `telephone`,
    `mobile`,
    `mail`,
    `observation`
  )
VALUES
  (
    246,
    'BERLAND Laura\r\nDAVRY ',
    '',
    '',
    'BERLAND 06 99 78 68 15\r\nDAVRY   06 17 72 24 03',
    'maloe14@hotmail.com',
    ''
  );
INSERT INTO
  `locataires` (
    `Id`,
    `nom`,
    `prenom`,
    `telephone`,
    `mobile`,
    `mail`,
    `observation`
  )
VALUES
  (
    248,
    'BLANCHARD',
    'Magalie',
    '',
    '06 68 12 97 86',
    '',
    ''
  );
INSERT INTO
  `locataires` (
    `Id`,
    `nom`,
    `prenom`,
    `telephone`,
    `mobile`,
    `mail`,
    `observation`
  )
VALUES
  (249, 'ALCARAZ', '', '', '', 'ralcaraz61@gmail.com', '');
INSERT INTO
  `locataires` (
    `Id`,
    `nom`,
    `prenom`,
    `telephone`,
    `mobile`,
    `mail`,
    `observation`
  )
VALUES
  (
    251,
    'ROZENCWAZG',
    'Alain',
    '',
    '06 70 51 60 64',
    'alainrozencwazg@gmail.com',
    ''
  );
INSERT INTO
  `locataires` (
    `Id`,
    `nom`,
    `prenom`,
    `telephone`,
    `mobile`,
    `mail`,
    `observation`
  )
VALUES
  (
    252,
    'PEPORI\r\nFUTIN\r\n',
    'Richard',
    '',
    '06 59 91 25 28',
    'inconnu',
    ''
  );
INSERT INTO
  `locataires` (
    `Id`,
    `nom`,
    `prenom`,
    `telephone`,
    `mobile`,
    `mail`,
    `observation`
  )
VALUES
  (
    253,
    'BOUCHENEZ',
    'Mélanie',
    '',
    '06 28 66 20 67',
    'melaniebn@hotmail.fr',
    ''
  );
INSERT INTO
  `locataires` (
    `Id`,
    `nom`,
    `prenom`,
    `telephone`,
    `mobile`,
    `mail`,
    `observation`
  )
VALUES
  (
    254,
    'PAOLINI',
    'Michel',
    '',
    '06 21 92 22 89',
    'michelpaolini@neuf.fr',
    ''
  );
INSERT INTO
  `locataires` (
    `Id`,
    `nom`,
    `prenom`,
    `telephone`,
    `mobile`,
    `mail`,
    `observation`
  )
VALUES
  (
    255,
    'JACQUEMIN',
    'JACQUES ',
    '01 60 71 82 04',
    '06 72 34 25 48',
    'INCONNU',
    'M JACQUEMIN ancien propriétaire des lots 106-107-235-374 devient locataire après une vente à Mme HADJI'
  );
INSERT INTO
  `locataires` (
    `Id`,
    `nom`,
    `prenom`,
    `telephone`,
    `mobile`,
    `mail`,
    `observation`
  )
VALUES
  (
    256,
    'OLIVEIRA',
    'Raphael',
    '',
    '06 30 00 16 62',
    'raphaeliop22229@gmail.com',
    ''
  );
INSERT INTO
  `locataires` (
    `Id`,
    `nom`,
    `prenom`,
    `telephone`,
    `mobile`,
    `mail`,
    `observation`
  )
VALUES
  (261, 'testds', '', '', '', '', '');
INSERT INTO
  `locataires` (
    `Id`,
    `nom`,
    `prenom`,
    `telephone`,
    `mobile`,
    `mail`,
    `observation`
  )
VALUES
  (262, 'testlocdsq', 'dsqdsq', '', '', '', '');

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: lots
# ------------------------------------------------------------

INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    1,
    'A',
    'Rez de chaussée',
    NULL,
    'gauche',
    'Studio',
    '',
    39,
    33,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    2,
    'A',
    'Rez de chaussée',
    NULL,
    'gauche',
    '3 pièces',
    '',
    78,
    34,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    3,
    'A',
    'Rez de chaussée',
    NULL,
    'gauche',
    '2 pièces',
    'Jouissance privative d\'un jardin',
    70,
    34,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    4,
    'A',
    'Rez de chaussée',
    NULL,
    'face',
    '2 pièces',
    'Jouissance privative d\'un jardin',
    71,
    35,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    5,
    'A',
    'Rez de chaussée',
    NULL,
    'droite',
    '2 pièces',
    '',
    76,
    18,
    235,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    6,
    'A',
    'Rez de chaussée',
    NULL,
    'droite',
    'Studio',
    'Jouissance d\'un jardin privatif',
    45,
    36,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    7,
    'A',
    'Rez de chaussée',
    NULL,
    'droite',
    '2 pièces',
    '',
    72,
    36,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    8,
    'A',
    'Rez de chaussée',
    NULL,
    'droite',
    '2 pièces',
    'jouissance d\'un jardin privatif',
    72,
    8,
    228,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    9,
    'A',
    'Rez de chaussée',
    NULL,
    'droite',
    'Studio',
    'jouissance d\'un jardin privatif',
    38,
    8,
    231,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    10,
    'A',
    'Rez de chaussée',
    NULL,
    'droite',
    '2 pièces',
    '',
    68,
    37,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    11,
    'A',
    'Premier étage',
    NULL,
    'gauche',
    '2 pièces',
    '',
    65,
    38,
    227,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    12,
    'A',
    'Premier étage',
    NULL,
    'gauche',
    '3 pièces',
    '',
    76,
    28,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    13,
    'A',
    'Premier étage',
    NULL,
    'gauche',
    '2 pièces',
    '',
    63,
    39,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    14,
    'A',
    'Premier étage',
    NULL,
    'face',
    '2 pièces',
    '',
    63,
    15,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    15,
    'A',
    'Premier étage',
    NULL,
    'droite',
    '2 pièces',
    '',
    65,
    25,
    234,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    16,
    'A',
    'Premier étage',
    NULL,
    'droite',
    'Studio',
    '',
    34,
    42,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    17,
    'A',
    'Premier étage',
    NULL,
    'droite',
    '2 pièces',
    '',
    65,
    10,
    224,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    18,
    'A',
    'Premier étage',
    NULL,
    'droite',
    '2 pièces',
    '',
    65,
    43,
    241,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    19,
    'A',
    'Premier étage',
    NULL,
    'droite',
    'Studio',
    '',
    34,
    121,
    236,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    20,
    'A',
    'Premier étage',
    NULL,
    'droite',
    '2 pièces',
    '',
    65,
    44,
    203,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    21,
    'A',
    'Deuxième étage',
    NULL,
    'gauche',
    '2 pièces',
    '',
    68,
    45,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    22,
    'A',
    'Deuxième étage',
    NULL,
    'gauche',
    '3 pièces',
    '',
    80,
    47,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    23,
    'A',
    'Deuxième étage',
    NULL,
    'gauche',
    '2 pièces',
    '',
    66,
    117,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    24,
    'A',
    'Deuxième étage',
    NULL,
    'face',
    '2 pièces',
    '',
    66,
    48,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    25,
    'A',
    'Deuxième étage',
    NULL,
    'droite',
    '2 pièces',
    '',
    68,
    37,
    249,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    26,
    'A',
    'Deuxième étage',
    NULL,
    'droite',
    'Studio',
    '',
    35,
    50,
    210,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    27,
    'A',
    'Deuxième étage',
    NULL,
    'droite',
    '2 pièces',
    '',
    68,
    50,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    28,
    'A',
    'Deuxième étage',
    NULL,
    'droite',
    '2 pièces',
    '',
    68,
    51,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    29,
    'A',
    'Deuxième étage',
    NULL,
    'droite',
    'Studio',
    '',
    35,
    51,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    30,
    'A',
    'Deuxième étage',
    NULL,
    'droite',
    '2 pièces',
    '',
    68,
    53,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    31,
    'A',
    'Troisième étage',
    NULL,
    'gauche',
    '2 pièces',
    '',
    69,
    54,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    32,
    'A',
    'Troisième étage',
    NULL,
    'gauche',
    '3 pièces',
    '',
    84,
    13,
    207,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    33,
    'A',
    'Troisième étage',
    NULL,
    'gauche',
    '2 pièces',
    '',
    68,
    21,
    223,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    34,
    'A',
    'Troisième étage',
    NULL,
    'face',
    '2 pièces',
    '',
    68,
    18,
    238,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    35,
    'A',
    'Troisième étage',
    NULL,
    'droite',
    '2 pièces',
    '',
    69,
    127,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    36,
    'A',
    'Troisième étage',
    NULL,
    'droite',
    'Studio',
    '',
    37,
    5,
    202,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    37,
    'A',
    'Troisième étage',
    NULL,
    'droite',
    '2 pièces',
    '',
    72,
    56,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    38,
    'A',
    'Troisième étage',
    NULL,
    'droite',
    '2 pièces',
    '',
    72,
    1,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    39,
    'A',
    'Troisième étage',
    NULL,
    'droite',
    'Studio',
    '',
    37,
    57,
    237,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    40,
    'A',
    'Troisième étage',
    NULL,
    'droite',
    '2 pièces',
    '',
    69,
    57,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    41,
    'B',
    'Rez de chaussée',
    NULL,
    'gauche',
    'Studio',
    '',
    25,
    59,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    42,
    'B',
    'Rez de chaussée',
    NULL,
    'gauche',
    '3 pièces',
    '',
    92,
    16,
    217,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    43,
    'B',
    'Rez de chaussée',
    NULL,
    'gauche',
    '2 pièces',
    '',
    60,
    6,
    232,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    44,
    'B',
    'Rez de chaussée',
    NULL,
    'face',
    '2 pièces',
    '',
    61,
    119,
    218,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    45,
    'B',
    'Rez de chaussée',
    NULL,
    'droite',
    '3 pièces',
    '',
    88,
    18,
    226,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    46,
    'B',
    'Rez de chaussée',
    NULL,
    'droite',
    '3 pièces',
    '',
    90,
    61,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    47,
    'B',
    'Rez de chaussée',
    NULL,
    'droite',
    '3 pièces',
    '',
    91,
    30,
    246,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    48,
    'B',
    'Rez de chaussée',
    NULL,
    'droite',
    '3 pièces',
    '',
    88,
    62,
    239,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    49,
    'B',
    'Deuxième étage',
    NULL,
    'gauche',
    '2 pièces',
    '',
    56,
    118,
    233,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    50,
    'B',
    'Premier étage',
    NULL,
    'gauche',
    '3 pièces',
    '',
    84,
    63,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    51,
    'B',
    'Premier étage',
    NULL,
    'gauche',
    '2 pièces',
    '',
    63,
    4,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    52,
    'B',
    'Premier étage',
    NULL,
    'face',
    '2 pièces',
    '',
    64,
    64,
    219,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    53,
    'B',
    'Premier étage',
    NULL,
    'droite',
    '3 pièces',
    '',
    92,
    122,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    54,
    'B',
    'Premier étage',
    NULL,
    'droite',
    '3 pièces',
    '',
    94,
    65,
    220,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    55,
    'B',
    'Premier étage',
    NULL,
    'droite',
    '3 pièces',
    '',
    95,
    8,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    56,
    'B',
    'Premier étage',
    NULL,
    'droite',
    '3 pièces',
    '',
    92,
    66,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    57,
    'B',
    'Deuxième étage',
    NULL,
    'gauche',
    '2 pièces',
    '',
    58,
    67,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    58,
    'B',
    'Deuxième étage',
    NULL,
    'gauche',
    '3 pièces',
    '',
    88,
    68,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    59,
    'B',
    'Deuxième étage',
    NULL,
    'gauche',
    '2 pièces',
    '',
    66,
    69,
    225,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    60,
    'B',
    'Deuxième étage',
    NULL,
    'face',
    '2 pièces',
    '',
    67,
    70,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    61,
    'B',
    'Rez de chaussée',
    NULL,
    'droite',
    '3 pièces',
    '',
    97,
    73,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    62,
    'B',
    'Deuxième étage',
    NULL,
    'droite',
    '3 pièces',
    '',
    99,
    128,
    201,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    63,
    'B',
    'Deuxième étage',
    NULL,
    'droite',
    '3 pièces',
    '',
    100,
    71,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    64,
    'B',
    'Deuxième étage',
    NULL,
    'droite',
    '3 pièces',
    '',
    97,
    72,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    65,
    'B',
    'Troisième étage',
    NULL,
    'gauche',
    '2 pièces',
    '',
    61,
    74,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    66,
    'B',
    'Troisième étage',
    NULL,
    'gauche',
    '3 pièces',
    '',
    92,
    20,
    221,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    67,
    'B',
    'Troisième étage',
    NULL,
    'gauche',
    '2 pièces',
    '',
    68,
    75,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    68,
    'B',
    'Troisième étage',
    NULL,
    'face',
    '2 pièces',
    '',
    69,
    2,
    242,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    69,
    'B',
    'Troisième étage',
    NULL,
    'droite',
    '3 pièces',
    '',
    101,
    76,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    70,
    'B',
    'Troisième étage',
    NULL,
    'droite',
    '3 pièces',
    '',
    102,
    77,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    71,
    'B',
    'Troisième étage',
    NULL,
    'gauche',
    '3 pièces',
    '',
    103,
    55,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    72,
    'B',
    'Troisième étage',
    NULL,
    'droite',
    '3 pièces',
    '',
    101,
    78,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    73,
    'C',
    'Rez de chaussée',
    NULL,
    'gauche',
    'Studio',
    '',
    46,
    79,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    74,
    'C',
    'Rez de chaussée',
    NULL,
    'gauche',
    '2 pièces',
    '',
    76,
    80,
    222,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    75,
    'C',
    'Rez de chaussée',
    NULL,
    'gauche',
    '2 pièces',
    '',
    65,
    111,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    76,
    'C',
    'Rez de chaussée',
    NULL,
    'gauche',
    '2 pièces',
    '',
    63,
    98,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    77,
    'C',
    'Rez de chaussée',
    NULL,
    'face',
    '2 pièces',
    '',
    63,
    115,
    245,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    78,
    'C',
    'Rez de chaussée',
    NULL,
    'droite',
    '2 pièces',
    '',
    61,
    12,
    240,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    79,
    'C',
    'Rez de chaussée',
    NULL,
    'droite',
    '2 pièces',
    '',
    64,
    82,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    80,
    'C',
    'Rez de chaussée',
    NULL,
    'droite',
    '2 pièces',
    '',
    72,
    83,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    81,
    'C',
    'Rez de chaussée',
    NULL,
    'droite',
    '2 pièces',
    '',
    71,
    23,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    82,
    'C',
    'Premier étage',
    NULL,
    'gauche',
    '2 pièces',
    '',
    65,
    2,
    209,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    83,
    'C',
    'Premier étage',
    NULL,
    'gauche',
    '2 pièces',
    '',
    65,
    2,
    229,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    84,
    'C',
    'Premier étage',
    NULL,
    'gauche',
    '2 pièces',
    '',
    65,
    84,
    253,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    85,
    'C',
    'Premier étage',
    NULL,
    'gauche',
    'Chambre',
    '',
    18,
    132,
    244,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    86,
    'C',
    'Rez de chaussée',
    NULL,
    'gauche',
    'Studio',
    '',
    45,
    132,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    87,
    'C',
    'Premier étage',
    NULL,
    'face',
    '2 pièces',
    '',
    64,
    22,
    206,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    88,
    'C',
    'Premier étage',
    NULL,
    'droite',
    '2 pièces',
    '',
    64,
    19,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    89,
    'C',
    'Premier étage',
    NULL,
    'droite',
    '2 pièces',
    '',
    67,
    85,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    90,
    'C',
    'Premier étage',
    NULL,
    'droite',
    '2 pièces',
    '',
    67,
    86,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    91,
    'C',
    'Premier étage',
    NULL,
    'droite',
    'Chambre',
    '',
    19,
    86,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    92,
    'C',
    'Premier étage',
    NULL,
    'droite',
    'Studio',
    'Ancien proprio M FIshard les lots 92-227-325',
    45,
    129,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    93,
    'C',
    'Deuxième étage',
    NULL,
    'gauche',
    '2 pièces',
    '',
    68,
    87,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    94,
    'C',
    'Deuxième étage',
    NULL,
    'gauche',
    '2 pièces',
    '',
    68,
    7,
    230,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    95,
    'C',
    'Deuxième étage',
    NULL,
    'gauche',
    '2 pièces',
    '',
    68,
    99,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    96,
    'C',
    'Deuxième étage',
    NULL,
    'gauche',
    'Chambre',
    '',
    19,
    99,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    97,
    'C',
    'Deuxième étage',
    NULL,
    'gauche',
    'Studio',
    '',
    47,
    130,
    247,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    98,
    'C',
    'Deuxième étage',
    NULL,
    'face',
    '2 pièces',
    '',
    67,
    25,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    99,
    'C',
    'Deuxième étage',
    NULL,
    'droite',
    '2 pièces',
    '',
    67,
    31,
    216,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    100,
    'C',
    'Deuxième étage',
    NULL,
    'droite',
    '2 pièces',
    '',
    71,
    29,
    212,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    101,
    'C',
    'Deuxième étage',
    NULL,
    'droite',
    '2 pièces',
    '',
    71,
    3,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    102,
    'C',
    'Deuxième étage',
    NULL,
    'droite',
    'Chambre',
    'Accessible par un des lots directement contigü.',
    20,
    3,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    103,
    'C',
    'Deuxième étage',
    NULL,
    'droite',
    'Studio',
    '',
    47,
    97,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    104,
    'C',
    'Troisième étage',
    NULL,
    'gauche',
    '2 pièces',
    '',
    69,
    9,
    215,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    105,
    'C',
    'Troisième étage',
    NULL,
    'gauche',
    '2 pièces',
    '',
    70,
    89,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    106,
    'C',
    'Troisième étage',
    NULL,
    'gauche',
    '2 pièces',
    'vendu par JACQUEMIN anncien Proprio qui devient locataire des lots vendu\r\nensemble des lots 106-107-235-374',
    69,
    121,
    255,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    107,
    'C',
    'Troisième étage',
    NULL,
    'gauche',
    'Chambre',
    'vendu par JACQUEMIN anncien Proprio qui devient locataire des lots vendu\r\nensemble des lots 106-107-235-374',
    19,
    121,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    108,
    'C',
    'Troisième étage',
    NULL,
    'gauche',
    'Studio',
    '',
    49,
    41,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    109,
    'C',
    'Troisième étage',
    NULL,
    'face',
    '2 pièces',
    '',
    69,
    91,
    248,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    110,
    'C',
    'Troisième étage',
    NULL,
    'droite',
    '2 pièces',
    '',
    68,
    125,
    204,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    111,
    'C',
    'Troisième étage',
    NULL,
    'droite',
    '2 pièces',
    '',
    73,
    95,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    112,
    'C',
    'Troisième étage',
    NULL,
    'droite',
    '2 pièces',
    '',
    72,
    94,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    113,
    'C',
    'Troisième étage',
    NULL,
    'droite',
    'Chambre',
    '',
    20,
    94,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    114,
    'C',
    'Troisième étage',
    NULL,
    'droite',
    'Studio',
    '',
    49,
    9,
    213,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    115,
    'D',
    'Rez de chaussée',
    NULL,
    'gauche',
    '3 pièces',
    '',
    93,
    27,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    116,
    'D',
    'Rez de chaussée',
    NULL,
    'gauche',
    '3 pièces',
    '',
    80,
    101,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    117,
    'D',
    'Rez de chaussée',
    NULL,
    'face',
    '2 pièces',
    '',
    66,
    32,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    118,
    'D',
    'Rez de chaussée',
    NULL,
    'droite',
    '3 pièces',
    '',
    90,
    102,
    256,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    119,
    'D',
    'Rez de chaussée',
    NULL,
    'droite',
    'Studio',
    '',
    34,
    103,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    120,
    'D',
    'Premier étage',
    NULL,
    'gauche',
    '3 pièces',
    '',
    90,
    104,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    121,
    'D',
    'Premier étage',
    NULL,
    'gauche',
    '3 pièces',
    'JEVELOT',
    91,
    105,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    122,
    'D',
    'Premier étage',
    NULL,
    'face',
    '2 pièces',
    '',
    65,
    106,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    123,
    'D',
    'Premier étage',
    NULL,
    'droite',
    '3 pièces',
    '',
    87,
    107,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    124,
    'D',
    'Premier étage',
    NULL,
    'droite',
    '2 pièces',
    '',
    65,
    109,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    125,
    'D',
    'Deuxième étage',
    NULL,
    'gauche',
    '3 pièces',
    '',
    94,
    14,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    126,
    'D',
    'Deuxième étage',
    NULL,
    'gauche',
    '3 pièces',
    'Proprio jusqu\'en juillet 2019 VEKEMAN',
    95,
    91,
    254,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    127,
    'D',
    'Deuxième étage',
    NULL,
    'face',
    '2 pièces',
    '',
    68,
    112,
    251,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    128,
    'D',
    'Deuxième étage',
    NULL,
    'droite',
    '3 pièces',
    '',
    91,
    113,
    205,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    129,
    'D',
    'Troisième étage',
    NULL,
    'droite',
    '2 pièces',
    '',
    68,
    115,
    252,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    130,
    'D',
    'Troisième étage',
    NULL,
    'gauche',
    '3 pièces',
    '',
    97,
    17,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    131,
    'D',
    'Troisième étage',
    NULL,
    'gauche',
    '3 pièces',
    '',
    100,
    115,
    214,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    132,
    'D',
    'Troisième étage',
    NULL,
    'face',
    '2 pièces',
    '',
    69,
    131,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    133,
    'D',
    'Troisième étage',
    NULL,
    'droite',
    '3 pièces',
    '',
    95,
    116,
    211,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    134,
    'D',
    'Troisième étage',
    NULL,
    'droite',
    '2 pièces',
    '',
    69,
    24,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    135,
    'A',
    'Premier sous-sol',
    1,
    '',
    'Cave',
    '',
    1,
    34,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    136,
    'A',
    'Premier sous-sol',
    2,
    '',
    'Cave',
    '',
    1,
    47,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    137,
    'A',
    'Premier sous-sol',
    3,
    '',
    'Cave',
    '',
    1,
    28,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    138,
    'A',
    'Premier sous-sol',
    4,
    '',
    'Cave',
    '',
    1,
    13,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    139,
    'A',
    'Premier sous-sol',
    5,
    '',
    'Cave',
    '',
    1,
    50,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    140,
    'A',
    'Premier sous-sol',
    6,
    '',
    'Cave',
    '',
    1,
    51,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    141,
    'A',
    'Premier sous-sol',
    7,
    '',
    'Cave',
    '',
    1,
    56,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    142,
    'A',
    'Premier sous-sol',
    8,
    '',
    'Cave',
    '',
    1,
    1,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    143,
    'A',
    'Premier sous-sol',
    9,
    '',
    'Cave',
    '',
    2,
    15,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    144,
    'A',
    'Premier sous-sol',
    10,
    '',
    'Cave',
    '',
    2,
    25,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    145,
    'A',
    'Premier sous-sol',
    11,
    '',
    'Cave',
    '',
    2,
    117,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    146,
    'A',
    'Premier sous-sol',
    12,
    '',
    'Cave',
    '',
    2,
    48,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    147,
    'A',
    'Premier sous-sol',
    13,
    '',
    'Cave',
    '',
    2,
    37,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    148,
    'A',
    'Premier sous-sol',
    14,
    '',
    'Cave',
    '',
    2,
    21,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    149,
    'A',
    'Premier sous-sol',
    15,
    '',
    'Cave',
    '',
    2,
    18,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    150,
    'A',
    'Premier sous-sol',
    16,
    '',
    'Cave',
    '',
    2,
    127,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    151,
    'A',
    'Premier sous-sol',
    17,
    '',
    'Cave',
    '',
    2,
    45,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    152,
    'A',
    'Rez de chaussée',
    18,
    '',
    'Cave',
    '',
    2,
    57,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    153,
    'A',
    'Premier sous-sol',
    19,
    '',
    'Cave',
    '',
    2,
    54,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    154,
    'A',
    'Premier sous-sol',
    20,
    '',
    'Cave',
    '',
    2,
    37,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    155,
    'A',
    'Premier sous-sol',
    21,
    '',
    'Cave',
    '',
    2,
    34,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    156,
    'A',
    'Premier sous-sol',
    22,
    '',
    'Cave',
    '',
    2,
    35,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    157,
    'A',
    'Premier sous-sol',
    23,
    '',
    'Cave',
    '',
    2,
    18,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    158,
    'A',
    'Premier sous-sol',
    24,
    '',
    'Cave',
    '',
    2,
    39,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    159,
    'A',
    'Premier sous-sol',
    25,
    '',
    'Cave',
    '',
    3,
    36,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    160,
    'A',
    'Premier sous-sol',
    26,
    '',
    '3 pièces',
    '',
    1,
    33,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    161,
    'A',
    'Premier sous-sol',
    27,
    '',
    'Cave',
    '',
    1,
    36,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    162,
    'A',
    'Premier sous-sol',
    28,
    '',
    'Cave',
    '',
    1,
    8,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    163,
    'A',
    'Premier sous-sol',
    29,
    '',
    'Cave',
    'correspondant ',
    1,
    42,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    164,
    'A',
    'Premier sous-sol',
    30,
    '',
    'Cave',
    '',
    1,
    121,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    165,
    'A',
    'Premier sous-sol',
    31,
    '',
    'Cave',
    '',
    1,
    50,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    166,
    'A',
    'Premier sous-sol',
    32,
    '',
    'Cave',
    '',
    3,
    10,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    167,
    'A',
    'Premier sous-sol',
    40,
    '',
    'Cave',
    '',
    3,
    43,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    168,
    'A',
    'Rez de chaussée',
    39,
    '',
    'Cave',
    '',
    2,
    51,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    169,
    'A',
    'Premier sous-sol',
    38,
    '',
    'Cave',
    '',
    2,
    57,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    170,
    'A',
    'Premier sous-sol',
    37,
    '',
    'Cave',
    '',
    2,
    5,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    171,
    'A',
    'Premier sous-sol',
    36,
    '',
    'Cave',
    '',
    2,
    44,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    172,
    'A',
    'Premier sous-sol',
    35,
    '',
    'Cave',
    '',
    2,
    38,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    173,
    'A',
    'Premier sous-sol',
    34,
    '',
    'Cave',
    '',
    2,
    53,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    174,
    'A',
    'Premier sous-sol',
    33,
    '',
    'Cave',
    '',
    3,
    8,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    175,
    'B',
    'Premier sous-sol',
    91,
    '',
    'Cave',
    '',
    1,
    59,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    176,
    'B',
    'Premier sous-sol',
    88,
    '',
    'Cave',
    '',
    1,
    16,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    177,
    'B',
    'Premier sous-sol',
    85,
    '',
    'Cave',
    '',
    1,
    6,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    178,
    'B',
    'Premier sous-sol',
    84,
    '',
    'Cave',
    '',
    1,
    72,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    179,
    'B',
    'Premier sous-sol',
    83,
    '',
    'Cave',
    '',
    1,
    20,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    180,
    'B',
    'Premier sous-sol',
    82,
    '',
    'Cave',
    '',
    1,
    74,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    181,
    'B',
    'Premier sous-sol',
    81,
    '',
    'Cave',
    '',
    1,
    71,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    182,
    'B',
    'Premier sous-sol',
    87,
    '',
    'Cave',
    '',
    1,
    119,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    183,
    'B',
    'Premier sous-sol',
    90,
    '',
    'Cave',
    '',
    1,
    18,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    184,
    'B',
    'Premier sous-sol',
    89,
    '',
    'Cave',
    '',
    1,
    118,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    185,
    'B',
    'Premier sous-sol',
    86,
    '',
    'Cave',
    '',
    1,
    30,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    186,
    'B',
    'Premier sous-sol',
    80,
    '',
    'Cave',
    '',
    1,
    78,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    187,
    'B',
    'Premier sous-sol',
    79,
    '',
    'Cave',
    '',
    1,
    76,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    188,
    'B',
    'Premier sous-sol',
    78,
    '',
    'Cave',
    '',
    1,
    55,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    189,
    'B',
    'Premier sous-sol',
    77,
    '',
    'Cave',
    '',
    2,
    128,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    190,
    'B',
    'Premier sous-sol',
    70,
    '',
    'Cave',
    '',
    1,
    73,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    191,
    'B',
    'Premier sous-sol',
    69,
    '',
    'Cave',
    '',
    1,
    66,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    192,
    'B',
    'Premier sous-sol',
    74,
    '',
    'Cave',
    '',
    1,
    63,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    193,
    'B',
    'Premier sous-sol',
    75,
    '',
    'Cave',
    '',
    1,
    4,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    194,
    'B',
    'Premier sous-sol',
    76,
    '',
    'Cave',
    '',
    1,
    64,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    195,
    'B',
    'Premier sous-sol',
    73,
    '',
    'Cave',
    '',
    1,
    69,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    196,
    'B',
    'Premier sous-sol',
    72,
    '',
    'Cave',
    '',
    1,
    62,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    197,
    'B',
    'Premier sous-sol',
    71,
    '',
    'Cave',
    '',
    1,
    75,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    198,
    'B',
    'Premier sous-sol',
    68,
    '',
    'Cave',
    '',
    1,
    122,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    199,
    'B',
    'Premier sous-sol',
    67,
    '',
    'Cave',
    '',
    1,
    61,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    200,
    'B',
    'Premier sous-sol',
    61,
    '',
    'Cave',
    '',
    1,
    65,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    201,
    'B',
    'Premier sous-sol',
    62,
    '',
    'Cave',
    '',
    1,
    8,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    202,
    'B',
    'Premier sous-sol',
    63,
    '',
    'Cave',
    '',
    1,
    67,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    203,
    'B',
    'Premier sous-sol',
    64,
    '',
    'Cave',
    '',
    1,
    68,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    204,
    'B',
    'Premier sous-sol',
    65,
    '',
    'Cave',
    '',
    1,
    69,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    205,
    'B',
    'Premier sous-sol',
    66,
    '',
    'Cave',
    '',
    1,
    70,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    206,
    'B',
    'Premier sous-sol',
    60,
    '',
    'Cave',
    '',
    1,
    2,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    207,
    'B',
    'Premier sous-sol',
    59,
    '',
    'Cave',
    '',
    1,
    77,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    208,
    'B',
    'Premier sous-sol',
    58,
    '',
    'Cave',
    '',
    1,
    132,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    209,
    'B',
    'Premier sous-sol',
    57,
    '',
    'Cave',
    '',
    1,
    85,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    210,
    'B',
    'Premier sous-sol',
    56,
    '',
    'Cave',
    '',
    1,
    130,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    211,
    'B',
    'Premier sous-sol',
    52,
    '',
    'Cave',
    '',
    1,
    97,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    212,
    'B',
    'Premier sous-sol',
    53,
    '',
    'Cave',
    '',
    1,
    41,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    213,
    'B',
    'Premier sous-sol',
    54,
    '',
    'Cave',
    '',
    1,
    9,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    214,
    'C',
    'Premier sous-sol',
    46,
    '',
    'Cave',
    '',
    1,
    80,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    215,
    'C',
    'Premier sous-sol',
    47,
    '',
    'Cave',
    '',
    1,
    111,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    216,
    'C',
    'Premier sous-sol',
    48,
    '',
    'Cave',
    '',
    1,
    98,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    217,
    'C',
    'Premier sous-sol',
    49,
    '',
    'Cave',
    '',
    1,
    115,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    218,
    'C',
    'Premier sous-sol',
    50,
    '',
    'Cave',
    '',
    1,
    12,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    219,
    'C',
    'Premier sous-sol',
    51,
    '',
    'Cave',
    '',
    1,
    82,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    220,
    'C',
    'Premier sous-sol',
    45,
    '',
    'Cave',
    '',
    1,
    83,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    221,
    'C',
    'Premier sous-sol',
    44,
    '',
    'Cave',
    '',
    1,
    23,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    222,
    'C',
    'Premier sous-sol',
    43,
    '',
    'Cave',
    '',
    1,
    2,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    223,
    'C',
    'Premier sous-sol',
    42,
    '',
    'Cave',
    '',
    1,
    2,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    224,
    'C',
    'Premier sous-sol',
    41,
    '',
    'Cave',
    '',
    1,
    84,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    225,
    'B',
    'Premier sous-sol',
    36,
    '',
    'Cave',
    '',
    1,
    22,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    226,
    'C',
    'Premier sous-sol',
    37,
    '',
    'Cave',
    '',
    1,
    19,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    227,
    'C',
    'Premier sous-sol',
    38,
    '',
    'Cave',
    'Ancien proprio FISHARD\r\nlot 92-227-325',
    1,
    129,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    228,
    'C',
    'Premier sous-sol',
    39,
    '',
    'Cave',
    '',
    1,
    86,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    229,
    'C',
    'Premier sous-sol',
    40,
    '',
    'Cave',
    '',
    1,
    25,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    230,
    'C',
    'Premier sous-sol',
    35,
    '',
    'Cave',
    '',
    1,
    31,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    231,
    'C',
    'Premier sous-sol',
    34,
    '',
    'Cave',
    '',
    1,
    29,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    232,
    'C',
    'Premier sous-sol',
    33,
    '',
    'Cave',
    '',
    1,
    3,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    233,
    'C',
    'Premier sous-sol',
    32,
    '',
    'Cave',
    '',
    1,
    9,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    234,
    'C',
    'Premier sous-sol',
    31,
    '',
    'Cave',
    '',
    1,
    89,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    235,
    'C',
    'Premier sous-sol',
    30,
    '',
    'Cave',
    'vendu par JACQUEMIN anncien Proprio qui devient locataire des lots vendu\r\nensemble des lots 106-107-235-374',
    1,
    121,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    236,
    'C',
    'Premier sous-sol',
    29,
    '',
    'Cave',
    '',
    1,
    91,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    237,
    'C',
    'Quatrième étage',
    28,
    '',
    'Cave',
    '',
    1,
    125,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    238,
    'C',
    'Premier sous-sol',
    27,
    '',
    'Cave',
    '',
    1,
    95,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    239,
    'C',
    'Premier sous-sol',
    26,
    '',
    'Cave',
    '',
    1,
    94,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    240,
    'D',
    'Premier sous-sol',
    22,
    '',
    'Cave',
    '',
    1,
    27,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    241,
    'D',
    'Premier sous-sol',
    23,
    '',
    'Cave',
    '',
    1,
    101,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    242,
    'D',
    'Premier sous-sol',
    24,
    '',
    'Cave',
    '',
    1,
    32,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    243,
    'D',
    'Premier sous-sol',
    18,
    '',
    'Cave',
    '',
    1,
    102,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    244,
    'D',
    'Premier sous-sol',
    19,
    '',
    'Cave',
    '',
    1,
    103,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    245,
    'D',
    'Premier sous-sol',
    20,
    '',
    'Cave',
    '',
    1,
    104,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    246,
    'D',
    'Premier sous-sol',
    21,
    '',
    'Cave',
    '',
    1,
    105,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    247,
    'D',
    'Premier sous-sol',
    17,
    '',
    'Cave',
    '',
    1,
    106,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    248,
    'D',
    'Premier sous-sol',
    16,
    '',
    'Cave',
    '',
    1,
    107,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    249,
    'C',
    'Premier sous-sol',
    15,
    '',
    'Cave',
    '',
    1,
    87,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    250,
    'D',
    'Premier sous-sol',
    14,
    '',
    'Cave',
    '',
    1,
    7,
    259,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    251,
    'D',
    'Premier sous-sol',
    12,
    '',
    'Cave',
    '',
    1,
    79,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    252,
    'D',
    'Premier sous-sol',
    13,
    '',
    'Cave',
    '',
    1,
    99,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    253,
    'D',
    'Premier sous-sol',
    7,
    '',
    'Cave',
    '',
    1,
    109,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    254,
    'D',
    'Premier sous-sol',
    8,
    '',
    'Cave',
    '',
    1,
    14,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    255,
    'D',
    'Premier sous-sol',
    9,
    '',
    'Cave',
    'Ancien proprio VEKEMAN',
    1,
    91,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    256,
    'D',
    'Premier sous-sol',
    10,
    '',
    'Cave',
    '',
    1,
    112,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    257,
    'D',
    'Premier sous-sol',
    11,
    '',
    'Cave',
    '',
    1,
    113,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    258,
    'D',
    'Premier sous-sol',
    6,
    '',
    'Cave',
    '',
    1,
    115,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    259,
    'D',
    'Premier sous-sol',
    5,
    '',
    'Cave',
    '',
    1,
    17,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    260,
    'D',
    'Premier sous-sol',
    4,
    '',
    'Cave',
    '',
    1,
    115,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    261,
    'D',
    'Premier sous-sol',
    3,
    '',
    'Cave',
    '',
    1,
    131,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    262,
    'D',
    'Premier sous-sol',
    2,
    '',
    'Cave',
    '',
    1,
    116,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    263,
    'D',
    'Premier sous-sol',
    1,
    '',
    'Cave',
    '',
    1,
    24,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    264,
    'A',
    'Quatrième étage',
    NULL,
    'gauche',
    'Grenier',
    '',
    5,
    50,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    265,
    'A',
    'Rez de chaussée',
    NULL,
    'gauche',
    'Grenier',
    '',
    7,
    82,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    266,
    'A',
    'Quatrième étage',
    NULL,
    'gauche',
    'Grenier',
    '',
    5,
    54,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    267,
    'A',
    'Quatrième étage',
    NULL,
    'gauche',
    'Grenier',
    '',
    5,
    28,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    268,
    'A',
    'Quatrième étage',
    NULL,
    'gauche',
    'Grenier',
    '',
    5,
    37,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    269,
    'A',
    'Quatrième étage',
    NULL,
    'gauche',
    'Grenier',
    '',
    5,
    18,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    270,
    'A',
    'Quatrième étage',
    NULL,
    'gauche',
    'Grenier',
    '',
    7,
    127,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    271,
    'A',
    'Quatrième étage',
    NULL,
    'gauche',
    'Grenier',
    '',
    5,
    34,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    272,
    'A',
    'Quatrième étage',
    NULL,
    'face',
    'Grenier',
    '',
    6,
    37,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    273,
    'A',
    'Quatrième étage',
    NULL,
    'droite',
    'Grenier',
    '',
    5,
    36,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    274,
    'A',
    'Quatrième étage',
    NULL,
    'droite',
    'Grenier',
    '',
    7,
    43,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    275,
    'A',
    'Quatrième étage',
    NULL,
    'droite',
    'Grenier',
    '',
    7,
    10,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    276,
    'A',
    'Quatrième étage',
    NULL,
    'droite',
    'Grenier',
    '',
    3,
    21,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    277,
    'A',
    'Quatrième étage',
    NULL,
    'droite',
    'Grenier',
    '',
    5,
    45,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    278,
    'A',
    'Quatrième étage',
    NULL,
    'droite',
    'Grenier',
    '',
    3,
    48,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    279,
    'A',
    'Quatrième étage',
    NULL,
    'droite',
    'Grenier',
    '',
    3,
    18,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    280,
    'A',
    'Quatrième étage',
    NULL,
    'droite',
    'Grenier',
    '',
    5,
    5,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    281,
    'A',
    'Quatrième étage',
    NULL,
    'droite',
    'Grenier',
    '',
    3,
    34,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    282,
    'A',
    'Quatrième étage',
    NULL,
    'droite',
    'Grenier',
    '',
    7,
    1,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    283,
    'A',
    'Quatrième étage',
    NULL,
    'droite',
    'Grenier',
    '',
    7,
    13,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    284,
    'A',
    'Quatrième étage',
    NULL,
    'droite',
    'Grenier',
    '',
    5,
    57,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    285,
    'B',
    'Quatrième étage',
    NULL,
    '',
    'Grenier',
    '',
    5,
    100,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    286,
    'B',
    'Quatrième étage',
    NULL,
    'gauche',
    'Grenier',
    '',
    5,
    72,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    287,
    'B',
    'Quatrième étage',
    NULL,
    'gauche',
    'Grenier',
    '',
    5,
    8,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    288,
    'B',
    'Quatrième étage',
    NULL,
    'gauche',
    'Grenier',
    '',
    4,
    20,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    289,
    'B',
    'Quatrième étage',
    NULL,
    'gauche',
    'Grenier',
    '',
    4,
    2,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    290,
    'B',
    'Quatrième étage',
    NULL,
    'gauche',
    'Grenier',
    '',
    7,
    16,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    291,
    'B',
    'Quatrième étage',
    NULL,
    'gauche',
    'Grenier',
    '',
    5,
    66,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    292,
    'B',
    'Quatrième étage',
    NULL,
    'gauche',
    'Grenier',
    '',
    5,
    70,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    293,
    'B',
    'Quatrième étage',
    NULL,
    'face',
    'Grenier',
    '',
    7,
    70,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    294,
    'B',
    'Quatrième étage',
    NULL,
    'droite',
    'Grenier',
    '',
    7,
    76,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    295,
    'B',
    'Quatrième étage',
    NULL,
    'droite',
    'Grenier',
    '',
    5,
    61,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    296,
    'B',
    'Quatrième étage',
    NULL,
    'droite',
    'Grenier',
    '',
    5,
    61,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    297,
    'B',
    'Quatrième étage',
    NULL,
    'droite',
    'Grenier',
    '',
    5,
    78,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    298,
    'B',
    'Quatrième étage',
    NULL,
    'droite',
    'Grenier',
    '',
    4,
    71,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    299,
    'B',
    'Quatrième étage',
    NULL,
    'droite',
    'Grenier',
    '',
    3,
    77,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    300,
    'B',
    'Quatrième étage',
    NULL,
    'droite',
    'Grenier',
    '',
    4,
    73,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    301,
    'B',
    'Quatrième étage',
    NULL,
    'droite',
    'Grenier',
    '',
    3,
    18,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    302,
    'B',
    'Quatrième étage',
    NULL,
    'droite',
    'Grenier',
    '',
    5,
    74,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    303,
    'B',
    'Quatrième étage',
    NULL,
    'droite',
    'Grenier',
    '',
    4,
    64,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    304,
    'B',
    'Quatrième étage',
    NULL,
    'droite',
    'Grenier',
    '',
    6,
    61,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    305,
    'B',
    'Quatrième étage',
    NULL,
    'droite',
    'Grenier',
    '',
    5,
    3,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    306,
    'B',
    'Quatrième étage',
    NULL,
    'droite',
    'Grenier',
    '',
    5,
    65,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    307,
    'B',
    'Quatrième étage',
    NULL,
    'droite',
    'Grenier',
    '',
    7,
    11,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    308,
    'C',
    'Quatrième étage',
    NULL,
    'gauche',
    'Grenier',
    '',
    5,
    91,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    309,
    'C',
    'Quatrième étage',
    NULL,
    'gauche',
    'Grenier',
    '',
    7,
    12,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    310,
    'C',
    'Quatrième étage',
    NULL,
    'gauche',
    'Grenier',
    '',
    5,
    19,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    311,
    'C',
    'Quatrième étage',
    NULL,
    'gauche',
    'Grenier',
    '',
    7,
    94,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    312,
    'C',
    'Quatrième étage',
    NULL,
    'gauche',
    'Grenier',
    '',
    5,
    83,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    313,
    'C',
    'Quatrième étage',
    NULL,
    'gauche',
    'Grenier',
    '',
    6,
    95,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    314,
    'C',
    'Quatrième étage',
    NULL,
    'gauche',
    'Grenier',
    '',
    5,
    85,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    315,
    'C',
    'Quatrième étage',
    NULL,
    'gauche',
    'Grenier',
    '',
    7,
    23,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    316,
    'C',
    'Quatrième étage',
    NULL,
    'gauche',
    'Grenier',
    '',
    5,
    84,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    317,
    'C',
    'Quatrième étage',
    NULL,
    'face',
    'Grenier',
    '',
    7,
    7,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    318,
    'C',
    'Quatrième étage',
    NULL,
    '',
    'Grenier',
    '',
    7,
    98,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    319,
    'C',
    'Quatrième étage',
    NULL,
    'droite',
    'Grenier',
    '',
    5,
    87,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    320,
    'C',
    'Quatrième étage',
    NULL,
    'droite',
    'Grenier',
    '',
    6,
    2,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    321,
    'C',
    'Quatrième étage',
    NULL,
    'droite',
    'Grenier',
    '',
    4,
    132,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    322,
    'C',
    'Quatrième étage',
    NULL,
    'droite',
    'Grenier',
    '',
    3,
    99,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    323,
    'C',
    'Quatrième étage',
    NULL,
    'droite',
    'Grenier',
    '',
    4,
    25,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    324,
    'C',
    'Quatrième étage',
    NULL,
    'droite',
    'Grenier',
    '',
    6,
    31,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    325,
    'C',
    'Quatrième étage',
    NULL,
    'droite',
    'Grenier',
    'Ancien proprio FISHARD\r\nlot 92-227-325',
    5,
    129,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    326,
    'C',
    'Quatrième étage',
    NULL,
    'droite',
    'Grenier',
    '',
    6,
    115,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    327,
    'D',
    'Quatrième étage',
    NULL,
    'gauche',
    'Grenier',
    '',
    5,
    14,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    328,
    'D',
    'Quatrième étage',
    NULL,
    'gauche',
    'Grenier',
    '',
    6,
    104,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    329,
    'D',
    'Quatrième étage',
    NULL,
    'gauche',
    'Grenier',
    '',
    4,
    115,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    330,
    'D',
    'Quatrième étage',
    NULL,
    'gauche',
    'Grenier',
    '',
    3,
    2,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    331,
    'D',
    'Quatrième étage',
    NULL,
    'gauche',
    'Grenier',
    '',
    4,
    115,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    332,
    'D',
    'Quatrième étage',
    NULL,
    'gauche',
    'Grenier',
    '',
    6,
    115,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    333,
    'D',
    'Quatrième étage',
    NULL,
    'gauche',
    'Grenier',
    '',
    5,
    27,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    334,
    'D',
    'Quatrième étage',
    NULL,
    'face',
    'Grenier',
    '',
    6,
    107,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    335,
    'D',
    'Quatrième étage',
    NULL,
    'droite',
    'Grenier',
    '',
    5,
    113,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    336,
    'D',
    'Quatrième étage',
    NULL,
    'droite',
    'Grenier',
    '',
    6,
    116,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    337,
    'D',
    'Quatrième étage',
    NULL,
    'droite',
    'Grenier',
    '',
    4,
    105,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    338,
    'D',
    'Quatrième étage',
    NULL,
    'droite',
    'Grenier',
    '',
    3,
    32,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    339,
    'D',
    'Quatrième étage',
    NULL,
    'droite',
    'Grenier',
    '',
    3,
    17,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    340,
    'D',
    'Quatrième étage',
    NULL,
    'droite',
    'Grenier',
    '',
    6,
    79,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    341,
    'D',
    'Quatrième étage',
    NULL,
    'droite',
    'Grenier',
    'Ancien Proprio jusqu\'en juillet 2019\r\nVEKEMAN',
    5,
    91,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    342,
    '',
    'Second sous-sol',
    NULL,
    '',
    'Box',
    '',
    6,
    78,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    343,
    '',
    'Second sous-sol',
    NULL,
    '',
    'Box',
    '',
    6,
    95,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    344,
    '',
    'Second sous-sol',
    NULL,
    '',
    'Parking',
    'Box',
    6,
    57,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    345,
    '',
    'Second sous-sol',
    NULL,
    '',
    'Parking',
    '',
    4,
    128,
    201,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    346,
    '',
    'Second sous-sol',
    NULL,
    '',
    'Parking',
    '',
    4,
    61,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    347,
    '',
    'Second sous-sol',
    NULL,
    '',
    'Parking',
    '',
    4,
    108,
    213,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    348,
    '',
    'Second sous-sol',
    NULL,
    '',
    'Parking',
    'Jumelé avec le 347 en box',
    4,
    109,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    349,
    '',
    'Second sous-sol',
    NULL,
    '',
    'Parking',
    '',
    4,
    131,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    350,
    '',
    'Second sous-sol',
    NULL,
    '',
    'Parking',
    '',
    4,
    113,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    351,
    '',
    'Second sous-sol',
    NULL,
    '',
    'Parking',
    'box',
    7,
    30,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    352,
    '',
    'Second sous-sol',
    NULL,
    '',
    'Parking',
    'un box',
    6,
    1,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    353,
    '',
    'Second sous-sol',
    NULL,
    '',
    'Parking',
    'Jumelé avec le 354 en box',
    4,
    124,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    354,
    '',
    'Second sous-sol',
    NULL,
    '',
    'Parking',
    '',
    4,
    108,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    355,
    '',
    'Second sous-sol',
    NULL,
    '',
    'Parking',
    '',
    4,
    36,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    356,
    '',
    'Second sous-sol',
    NULL,
    '',
    'Parking',
    '',
    4,
    25,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    357,
    '',
    'Second sous-sol',
    NULL,
    '',
    'Parking',
    '',
    4,
    19,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    358,
    '',
    'Second sous-sol',
    NULL,
    '',
    'Parking',
    '',
    4,
    125,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    359,
    '',
    'Second sous-sol',
    NULL,
    '',
    'Parking',
    '',
    4,
    67,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    360,
    '',
    'Second sous-sol',
    NULL,
    '',
    'Parking',
    '',
    4,
    53,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    361,
    '',
    'Second sous-sol',
    NULL,
    '',
    'Parking',
    '',
    4,
    127,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    362,
    '',
    'Second sous-sol',
    NULL,
    '',
    'Parking',
    '',
    4,
    134,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    363,
    '',
    'Second sous-sol',
    NULL,
    '',
    'Parking',
    '',
    4,
    99,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    364,
    '',
    'Second sous-sol',
    NULL,
    '',
    'Parking',
    '',
    4,
    99,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    365,
    '',
    'Second sous-sol',
    NULL,
    '',
    'Parking',
    '',
    4,
    91,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    366,
    '',
    'Second sous-sol',
    NULL,
    '',
    'Parking',
    '',
    4,
    10,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    367,
    '',
    'Second sous-sol',
    NULL,
    '',
    'Parking',
    '',
    4,
    37,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    368,
    '',
    'Second sous-sol',
    NULL,
    '',
    'Parking',
    '',
    4,
    105,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    369,
    '',
    'Second sous-sol',
    NULL,
    '',
    'Parking',
    '',
    4,
    20,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    370,
    '',
    'Second sous-sol',
    NULL,
    '',
    'Parking',
    '',
    4,
    22,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    371,
    '',
    'Second sous-sol',
    NULL,
    '',
    'Parking',
    '',
    4,
    39,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    372,
    '',
    'Second sous-sol',
    NULL,
    '',
    'Parking',
    '',
    4,
    8,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    373,
    '',
    'Second sous-sol',
    NULL,
    '',
    'Parking',
    '',
    4,
    38,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    374,
    '',
    'Second sous-sol',
    NULL,
    '',
    'Parking',
    'vendu par JACQUEMIN anncien Proprio qui devient locataire des lots vendu\r\nensemble des lots 106-107-235-374',
    4,
    121,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    375,
    '',
    'Second sous-sol',
    NULL,
    '',
    'Parking',
    '',
    4,
    122,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    376,
    '',
    'Second sous-sol',
    NULL,
    '',
    'Parking',
    '',
    4,
    116,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    377,
    '',
    'Second sous-sol',
    NULL,
    '',
    'Parking',
    '',
    4,
    24,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    378,
    '',
    'Second sous-sol',
    NULL,
    '',
    'Box',
    '',
    8,
    126,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    379,
    '',
    'Second sous-sol',
    NULL,
    '',
    'Parking',
    'un box',
    7,
    52,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    380,
    '',
    'Premier sous-sol',
    NULL,
    '',
    'Parking',
    'Un box',
    7,
    133,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    381,
    '',
    'Premier sous-sol',
    NULL,
    '',
    'Box',
    '',
    7,
    12,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    382,
    '',
    'Premier sous-sol',
    NULL,
    '',
    'Parking',
    '',
    6,
    18,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    383,
    '',
    'Premier sous-sol',
    NULL,
    '',
    'Box',
    '',
    6,
    61,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    384,
    '',
    'Premier sous-sol',
    NULL,
    '',
    'Parking',
    '',
    4,
    17,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    385,
    '',
    'Premier sous-sol',
    NULL,
    '',
    'Parking',
    '',
    4,
    17,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    386,
    '',
    'Premier sous-sol',
    NULL,
    '',
    'Parking',
    '',
    4,
    68,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    387,
    '',
    'Premier sous-sol',
    NULL,
    '',
    'Parking',
    '',
    4,
    123,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    388,
    '',
    'Premier sous-sol',
    NULL,
    '',
    'Box',
    '',
    6,
    76,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    389,
    '',
    'Premier sous-sol',
    NULL,
    '',
    'Box',
    '',
    6,
    3,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    390,
    '',
    'Premier sous-sol',
    NULL,
    '',
    'Parking',
    '',
    4,
    70,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    391,
    '',
    'Premier sous-sol',
    NULL,
    '',
    'Parking',
    '',
    4,
    132,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    392,
    '',
    'Premier sous-sol',
    NULL,
    '',
    'Parking',
    '',
    4,
    55,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    393,
    '',
    'Premier sous-sol',
    NULL,
    '',
    'Parking',
    '',
    4,
    66,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    394,
    '',
    'Premier sous-sol',
    NULL,
    '',
    'Parking',
    '',
    4,
    87,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    395,
    '',
    'Premier sous-sol',
    NULL,
    '',
    'Parking',
    '',
    4,
    9,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    396,
    '',
    'Premier sous-sol',
    NULL,
    '',
    'Parking',
    '',
    4,
    7,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    397,
    '',
    'Premier sous-sol',
    NULL,
    '',
    'Parking',
    '',
    4,
    72,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    398,
    '',
    'Premier sous-sol',
    NULL,
    '',
    'Parking',
    '',
    4,
    71,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    399,
    '',
    'Premier sous-sol',
    NULL,
    '',
    'Parking',
    '',
    4,
    71,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    400,
    '',
    'Premier sous-sol',
    NULL,
    '',
    'Parking',
    '',
    4,
    123,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    401,
    '',
    'Premier sous-sol',
    NULL,
    '',
    'Parking',
    '',
    4,
    123,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    402,
    '',
    'Premier sous-sol',
    NULL,
    '',
    'Parking',
    '',
    4,
    121,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    403,
    '',
    'Premier sous-sol',
    NULL,
    '',
    'Parking',
    '',
    4,
    47,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    404,
    '',
    'Premier sous-sol',
    NULL,
    '',
    'Parking',
    '',
    4,
    94,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    405,
    '',
    'Premier sous-sol',
    NULL,
    '',
    'Parking',
    '',
    4,
    73,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    406,
    '',
    'Premier sous-sol',
    NULL,
    '',
    'Parking',
    '',
    4,
    77,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    407,
    '',
    'Premier sous-sol',
    NULL,
    '',
    'Parking',
    '',
    4,
    16,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    408,
    '',
    'Premier sous-sol',
    NULL,
    '',
    'Parking',
    '',
    4,
    4,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    409,
    '',
    'Premier sous-sol',
    NULL,
    '',
    'Parking',
    '',
    4,
    115,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    410,
    '',
    'Premier sous-sol',
    NULL,
    '',
    'Parking',
    '',
    4,
    98,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    411,
    '',
    'Premier sous-sol',
    NULL,
    '',
    'Parking',
    '',
    4,
    2,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    412,
    '',
    'Premier sous-sol',
    NULL,
    '',
    'Parking',
    '',
    4,
    34,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    413,
    '',
    'Premier sous-sol',
    NULL,
    '',
    'Parking',
    'Ancien Proprio jusqu\'en juillet 2019\r\nVEKEMAN',
    4,
    91,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    414,
    '',
    'Premier sous-sol',
    NULL,
    '',
    'Parking',
    '',
    4,
    99,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    415,
    '',
    'Premier sous-sol',
    NULL,
    '',
    'Box',
    '',
    8,
    104,
    NULL,
    NULL
  );
INSERT INTO
  `lots` (
    `numero`,
    `batiment`,
    `etage`,
    `porte`,
    `orientation`,
    `type`,
    `observation`,
    `tantieme`,
    `proprietaire`,
    `locataire`,
    `superficie`
  )
VALUES
  (
    99999,
    NULL,
    'Deuxième étage',
    NULL,
    NULL,
    '2 pièces',
    NULL,
    25,
    7,
    NULL,
    20
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: membres
# ------------------------------------------------------------

INSERT INTO
  `membres` (
    `Id`,
    `login`,
    `email`,
    `password`,
    `admin`,
    `gestionnaire`,
    `lastSeen`,
    `documentPost`,
    `documentModif`
  )
VALUES
  (
    1,
    'admin',
    'perenoelnancy@gmail.com',
    '$2a$10$hBWVhOHXz8FH70CUDUcZFuwKx2fXzRPp64BqzGj4mS2RmGFgefGsa',
    1,
    1,
    '2021-09-05 13:14:26',
    1,
    1
  );
INSERT INTO
  `membres` (
    `Id`,
    `login`,
    `email`,
    `password`,
    `admin`,
    `gestionnaire`,
    `lastSeen`,
    `documentPost`,
    `documentModif`
  )
VALUES
  (
    8,
    'gestionnaire',
    'martinczabadaj@gmail.com',
    '$2a$10$nit5Z3rmplCUg3.HBmNIQubX8etBelt8fHdvf/gUSGL7cuBLfOQFu',
    0,
    1,
    '2020-11-21 11:46:55',
    0,
    0
  );
INSERT INTO
  `membres` (
    `Id`,
    `login`,
    `email`,
    `password`,
    `admin`,
    `gestionnaire`,
    `lastSeen`,
    `documentPost`,
    `documentModif`
  )
VALUES
  (
    9,
    'docpost',
    'martinczabadaj@gmail.com',
    '$2a$10$UivPFHduV/.LJBnHG2uM2.e2S8ajESREO/BZ5/xoffJw.2O1SGlpO',
    0,
    0,
    '2020-11-27 10:34:46',
    1,
    0
  );
INSERT INTO
  `membres` (
    `Id`,
    `login`,
    `email`,
    `password`,
    `admin`,
    `gestionnaire`,
    `lastSeen`,
    `documentPost`,
    `documentModif`
  )
VALUES
  (
    10,
    'docmodif',
    'martinczabadaj@gmail.com',
    '$2a$10$cL/i6rbxyVhNjNzVvNvgfeRDo0T77PYIM2K0u3MuZL0jWxHzEKCwu',
    0,
    0,
    '2020-11-21 12:16:52',
    0,
    1
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: notes
# ------------------------------------------------------------

INSERT INTO
  `notes` (`Reference`, `Date`, `Objet`, `Nom`, `Lot`, `Note`)
VALUES
  (
    1,
    '2018-07-10',
    'BADGES',
    'RODRIGUEZ',
    110,
    'Monsieur RODRIGUEZ propriétaire du lot 110, ancien appartement de Monsieur LARGEAU, demande 2 badges supplémentaires prétextant qu\'il n\'en a qu\'un. Monsieur LARGEAU que j\'ai eu au téléphone me dit qu\'il en a 2,1 qui lui a été remis par l\'agence avec le trousseau de clés et l\'autre qui lui a été remis un soir par lui-même, Monsieur Rodriguez ayant sonné chez lui ce soir pour récupérer ce deuxième. Le troisième a été rangé par Monsieur LARGEAU et celui-ci ne le retrouve pas pour l\'instant il va essayer de le retrouver après son retour de vacances.'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: personnel
# ------------------------------------------------------------

INSERT INTO
  `personnel` (`idp`, `Nom`, `Prenom`, `Telephone`, `Qualite`)
VALUES
  (
    401,
    'GONIER',
    'Dominique',
    '06 30 16 12 26',
    'Dame de compagnie et Auxiliaire de vie'
  );
INSERT INTO
  `personnel` (`idp`, `Nom`, `Prenom`, `Telephone`, `Qualite`)
VALUES
  (
    402,
    'PRUD\'HOMME',
    'Cathy',
    '06 62 48 63 81',
    'Femme de ménage pour particulier'
  );
INSERT INTO
  `personnel` (`idp`, `Nom`, `Prenom`, `Telephone`, `Qualite`)
VALUES
  (
    403,
    'STASKUVICZ',
    'Karine',
    '',
    'Hotesse d\'accueil'
  );
INSERT INTO
  `personnel` (`idp`, `Nom`, `Prenom`, `Telephone`, `Qualite`)
VALUES
  (
    404,
    'TERNAT',
    'Christine',
    '',
    'Femme de ménage hespérides'
  );
INSERT INTO
  `personnel` (`idp`, `Nom`, `Prenom`, `Telephone`, `Qualite`)
VALUES
  (
    405,
    'DOS SANTOS',
    'Manuela',
    '',
    'Hotesse d\'accueil'
  );
INSERT INTO
  `personnel` (`idp`, `Nom`, `Prenom`, `Telephone`, `Qualite`)
VALUES
  (
    406,
    '',
    'Christine',
    '',
    'Dame de compagnie Mme COQUEREL'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: proprietaires
# ------------------------------------------------------------

INSERT INTO
  `proprietaires` (
    `Id`,
    `nom`,
    `prenom`,
    `civilite`,
    `adresse`,
    `telephone`,
    `mobile`,
    `mail`,
    `batiment`,
    `resident`,
    `observations`,
    `societe`
  )
VALUES
  (
    1,
    'BLANCHARD',
    'Anne',
    'Madame',
    '7 avenue du Touring club 77300 FONTAINEBLEAU',
    '01 64 22 61 72',
    '',
    'am.bl@free.fr',
    'A',
    1,
    '',
    NULL
  );
INSERT INTO
  `proprietaires` (
    `Id`,
    `nom`,
    `prenom`,
    `civilite`,
    `adresse`,
    `telephone`,
    `mobile`,
    `mail`,
    `batiment`,
    `resident`,
    `observations`,
    `societe`
  )
VALUES
  (
    2,
    'MAZET',
    'Emmanuel',
    'M',
    '15 rue cels 75014 PARIS',
    '',
    '06 59 90 01 18',
    'manu_mazet@hotmail.com',
    '',
    0,
    '',
    NULL
  );
INSERT INTO
  `proprietaires` (
    `Id`,
    `nom`,
    `prenom`,
    `civilite`,
    `adresse`,
    `telephone`,
    `mobile`,
    `mail`,
    `batiment`,
    `resident`,
    `observations`,
    `societe`
  )
VALUES
  (
    3,
    'REISS-COSTE',
    'Jean-Marie',
    'M',
    '7 avenue du Touring club 77300 FONTAINEBLEAU',
    '01 60 72 59 49',
    '',
    'reisscoste jeanmarie@orange.fr\r\n\r\nA vérifier',
    '',
    1,
    '',
    NULL
  );
INSERT INTO
  `proprietaires` (
    `Id`,
    `nom`,
    `prenom`,
    `civilite`,
    `adresse`,
    `telephone`,
    `mobile`,
    `mail`,
    `batiment`,
    `resident`,
    `observations`,
    `societe`
  )
VALUES
  (
    4,
    'SCI CHATEAU DE TAVERS\r\nMERLE D AUBIGNE\r\n',
    '',
    '',
    'Route louise \"Le coin du bois\"',
    '',
    '06 59 54 51 42',
    'alinapublika@mail.ru',
    '',
    0,
    'Ancien proprio\r\nGIRARD Bernard\r\n12 avenue du clos prieur 77150 FEROLLES-ATTILLY\r\n01 60 02 16 17\r\n06 07 28 70 76\r\nbernard.girard@gmail.com\r\nVendu le 26/03/2018',
    NULL
  );
INSERT INTO
  `proprietaires` (
    `Id`,
    `nom`,
    `prenom`,
    `civilite`,
    `adresse`,
    `telephone`,
    `mobile`,
    `mail`,
    `batiment`,
    `resident`,
    `observations`,
    `societe`
  )
VALUES
  (
    5,
    'BUISSON',
    'Florence',
    '',
    '',
    '',
    '06 12 83 92 59',
    'florence.buisson0965@orange.fr',
    'A',
    0,
    'Appartenait en totalité à HORN\r\nAchat le 21/02/2018',
    NULL
  );
INSERT INTO
  `proprietaires` (
    `Id`,
    `nom`,
    `prenom`,
    `civilite`,
    `adresse`,
    `telephone`,
    `mobile`,
    `mail`,
    `batiment`,
    `resident`,
    `observations`,
    `societe`
  )
VALUES
  (
    6,
    'COSTAGANNA',
    'Pascal',
    'Monsieur',
    '6 allée de Tournelle 77930 CHAILLY EN BIERE',
    '',
    '',
    'costafamily77@gmail.com',
    '',
    0,
    '',
    NULL
  );
INSERT INTO
  `proprietaires` (
    `Id`,
    `nom`,
    `prenom`,
    `civilite`,
    `adresse`,
    `telephone`,
    `mobile`,
    `mail`,
    `batiment`,
    `resident`,
    `observations`,
    `societe`
  )
VALUES
  (
    7,
    'CZABADAJ',
    'Didier',
    'Monsieur',
    'pas d\'adresse test\'',
    '01 48 85 42 26',
    '06 60 21 92 07',
    'didier.czabadaj@laposte.net',
    'C D',
    0,
    'investisseur',
    NULL
  );
INSERT INTO
  `proprietaires` (
    `Id`,
    `nom`,
    `prenom`,
    `civilite`,
    `adresse`,
    `telephone`,
    `mobile`,
    `mail`,
    `batiment`,
    `resident`,
    `observations`,
    `societe`
  )
VALUES
  (
    8,
    'MARTIN',
    'Marie',
    '',
    '5 route de Samois, Bâtiment B 5 Résidence La Sablière - 77210 AVON',
    '01 60 71 99 07',
    '06 44 83 94 71',
    'marie.martin77210@gmail.com',
    '',
    0,
    '',
    NULL
  );
INSERT INTO
  `proprietaires` (
    `Id`,
    `nom`,
    `prenom`,
    `civilite`,
    `adresse`,
    `telephone`,
    `mobile`,
    `mail`,
    `batiment`,
    `resident`,
    `observations`,
    `societe`
  )
VALUES
  (
    9,
    'CZABADAJ',
    'Martine',
    'Madame',
    '6 rue Louis Braille  941OO SAINT MAUR DES FOSSES',
    '01 48 85 42 26',
    '06 62 88 59 62',
    'martine.czabadaj@laposte.net',
    'C D',
    0,
    '',
    NULL
  );
INSERT INTO
  `proprietaires` (
    `Id`,
    `nom`,
    `prenom`,
    `civilite`,
    `adresse`,
    `telephone`,
    `mobile`,
    `mail`,
    `batiment`,
    `resident`,
    `observations`,
    `societe`
  )
VALUES
  (
    10,
    'DROUAULT',
    'Yseult',
    '',
    '11 rue du Moulin de Pierre à 92130 ISSY LES MOULINEAUX',
    '',
    '',
    'fredericbouvet@yahoo.fr',
    '',
    0,
    '',
    NULL
  );
INSERT INTO
  `proprietaires` (
    `Id`,
    `nom`,
    `prenom`,
    `civilite`,
    `adresse`,
    `telephone`,
    `mobile`,
    `mail`,
    `batiment`,
    `resident`,
    `observations`,
    `societe`
  )
VALUES
  (
    11,
    'ILIESCO',
    'Philippe',
    '',
    '',
    '',
    '06 20 15 70 34',
    'philippe.iliesco@noos.fr',
    '',
    0,
    'Ancien propriétaire Mme GOUGIS\r\n71-188-307-392',
    NULL
  );
INSERT INTO
  `proprietaires` (
    `Id`,
    `nom`,
    `prenom`,
    `civilite`,
    `adresse`,
    `telephone`,
    `mobile`,
    `mail`,
    `batiment`,
    `resident`,
    `observations`,
    `societe`
  )
VALUES
  (
    12,
    'RUET DESVIGNES',
    'Nicolas',
    '',
    '15 allée des Chênes à 77310 BOISSISE LE ROI',
    '01 64 09 85 47',
    '06 18 49 25 32',
    'christineruet@wanadoo.fr',
    '',
    0,
    'Mère Christine DESVIGNES épouse RUET,\r\nGrand Mère JOLY Suzanne',
    NULL
  );
INSERT INTO
  `proprietaires` (
    `Id`,
    `nom`,
    `prenom`,
    `civilite`,
    `adresse`,
    `telephone`,
    `mobile`,
    `mail`,
    `batiment`,
    `resident`,
    `observations`,
    `societe`
  )
VALUES
  (
    13,
    'BEZZINA DCD Indivision POINTEAU',
    'Eliane',
    'Madame',
    'Résidence LES HESPERIDES 7 avenue du Touring Club, 77300 FONTAINEBLEAU',
    '01 60 72 84 39',
    '06 87 54 39 48',
    'mariealice.pointeau@sfr.fr',
    '',
    0,
    'Madame BEZZINA est DCD et mère de Marie Alice POINTEAU dont les coordonnées sont les siennes',
    NULL
  );
INSERT INTO
  `proprietaires` (
    `Id`,
    `nom`,
    `prenom`,
    `civilite`,
    `adresse`,
    `telephone`,
    `mobile`,
    `mail`,
    `batiment`,
    `resident`,
    `observations`,
    `societe`
  )
VALUES
  (
    14,
    'CIBOULE LEQUEUX ',
    'Jeanine',
    '',
    'Résidence LES HESPERIDES 7 avenue du Touring Club – 77300 FONTAINEBLEAU',
    '01 64 24 52 05',
    '06 81 95 56 32',
    'ciboule.jeannine@wanadoo.fr',
    'D',
    1,
    '',
    NULL
  );
INSERT INTO
  `proprietaires` (
    `Id`,
    `nom`,
    `prenom`,
    `civilite`,
    `adresse`,
    `telephone`,
    `mobile`,
    `mail`,
    `batiment`,
    `resident`,
    `observations`,
    `societe`
  )
VALUES
  (
    15,
    'SEGALA',
    'Andrée',
    '',
    'Résidence LES HESPERIDES 7 avenue du Touring Club,77300 FONTAINEBLEAU',
    '01 60 71 02 11',
    '',
    '',
    '',
    1,
    '',
    NULL
  );
INSERT INTO
  `proprietaires` (
    `Id`,
    `nom`,
    `prenom`,
    `civilite`,
    `adresse`,
    `telephone`,
    `mobile`,
    `mail`,
    `batiment`,
    `resident`,
    `observations`,
    `societe`
  )
VALUES
  (
    16,
    'DESSIENNE',
    'Simon',
    'Monsieur',
    'Résidence LES HESPERIDES 7 avenue du Touring Club - 77300 FONTAINEBLEAU',
    '',
    '',
    'simon.dessienne@gmail.com',
    '',
    0,
    '',
    NULL
  );
INSERT INTO
  `proprietaires` (
    `Id`,
    `nom`,
    `prenom`,
    `civilite`,
    `adresse`,
    `telephone`,
    `mobile`,
    `mail`,
    `batiment`,
    `resident`,
    `observations`,
    `societe`
  )
VALUES
  (
    17,
    'CZABADAJ Mme & M',
    'Martine & Didier',
    'Mme & M',
    '',
    '',
    '',
    '',
    '',
    0,
    '',
    NULL
  );
INSERT INTO
  `proprietaires` (
    `Id`,
    `nom`,
    `prenom`,
    `civilite`,
    `adresse`,
    `telephone`,
    `mobile`,
    `mail`,
    `batiment`,
    `resident`,
    `observations`,
    `societe`
  )
VALUES
  (
    18,
    'POINTEAU',
    'Joël',
    'M',
    '65 rue Murillo  75014 VANVES\r\n',
    '',
    '06 87 27 30 73',
    '',
    '',
    0,
    'Anciens Copros\r\n\r\nMARCHENAY 45-183-301-382\r\n\r\nNENO lots 5-157-269 vendu le 03/10/2017\r\n\r\nGUYOT 34-149-279 03/10/2017',
    'SCI BONHEUR '
  );
INSERT INTO
  `proprietaires` (
    `Id`,
    `nom`,
    `prenom`,
    `civilite`,
    `adresse`,
    `telephone`,
    `mobile`,
    `mail`,
    `batiment`,
    `resident`,
    `observations`,
    `societe`
  )
VALUES
  (
    19,
    'SCI CAMPAIN MARTIN ',
    'Isabelle',
    'Madame',
    '9 rue du Rocher d\'Avon - Résidence Sophoras - 77210 AVON',
    '',
    '06 89 43 50 97',
    'isacampain@free.fr',
    '',
    0,
    'SCI Isabelle CAMPAIN',
    NULL
  );
INSERT INTO
  `proprietaires` (
    `Id`,
    `nom`,
    `prenom`,
    `civilite`,
    `adresse`,
    `telephone`,
    `mobile`,
    `mail`,
    `batiment`,
    `resident`,
    `observations`,
    `societe`
  )
VALUES
  (
    20,
    'JENCK',
    'Pierre',
    'M',
    '17 rue des Sescois 77590 BOIS LE ROI',
    '01 60 69 14 49',
    '06 08 16 76 00\r\n06 09 70 16 95  Mme',
    'pierre.jenck@free.fr',
    '',
    0,
    '',
    NULL
  );
INSERT INTO
  `proprietaires` (
    `Id`,
    `nom`,
    `prenom`,
    `civilite`,
    `adresse`,
    `telephone`,
    `mobile`,
    `mail`,
    `batiment`,
    `resident`,
    `observations`,
    `societe`
  )
VALUES
  (
    21,
    'DE MURTAS',
    'Antonio',
    '',
    '7 avenue du touring club',
    '',
    '06 34 15 09 59',
    '',
    'A',
    1,
    'Marie-Thérèse BOYER\r\n6 rue du capsir 66000 Perpignan\r\n06 83 23 58 13\r\n04 68 85 21 68\r\nmtb-xambeu@orange.fr\r\nVendu le 16/07/2019 ',
    NULL
  );
INSERT INTO
  `proprietaires` (
    `Id`,
    `nom`,
    `prenom`,
    `civilite`,
    `adresse`,
    `telephone`,
    `mobile`,
    `mail`,
    `batiment`,
    `resident`,
    `observations`,
    `societe`
  )
VALUES
  (
    22,
    'HEURTEAU',
    'Patrick',
    'Monsieur',
    '102 rue Grande 77760 RECLOSES',
    '',
    '01 64 24 23 25',
    'patrick.heurteau@sfr.fr',
    '',
    0,
    'Ancien Proprietaire :\r\nBRUNO FALIGAND née BIRAUD\r\nfabrice.bruno@saint-gobain.com\r\nVendu le 22/08/17',
    NULL
  );
INSERT INTO
  `proprietaires` (
    `Id`,
    `nom`,
    `prenom`,
    `civilite`,
    `adresse`,
    `telephone`,
    `mobile`,
    `mail`,
    `batiment`,
    `resident`,
    `observations`,
    `societe`
  )
VALUES
  (
    23,
    'SCI ALEMMA IMMO DESJARDIN ',
    '',
    '',
    '',
    '\r\n ',
    '06 50 15 11 50\r\nLE MARI\r\n06 72 10 92 70 M LANDAIS',
    'alexandra.desjardin@outlook.fr',
    '',
    0,
    'Vendu le 22/05/2018\r\nAncien proprio\r\nLECENDREUX Jacques\r\n188 rue de Vaugirard 75015 PARIS\r\n01 47 83 37 21\r\n06 77 49 98 13',
    NULL
  );
INSERT INTO
  `proprietaires` (
    `Id`,
    `nom`,
    `prenom`,
    `civilite`,
    `adresse`,
    `telephone`,
    `mobile`,
    `mail`,
    `batiment`,
    `resident`,
    `observations`,
    `societe`
  )
VALUES
  (
    24,
    'PONCET-BASTIDE',
    'David',
    'Monsieur',
    '12 rue Felix Faure 75015 PARIS',
    '',
    '06 62 62 87 62',
    'david.poncet-bastide123@orange.fr',
    '',
    1,
    '',
    NULL
  );
INSERT INTO
  `proprietaires` (
    `Id`,
    `nom`,
    `prenom`,
    `civilite`,
    `adresse`,
    `telephone`,
    `mobile`,
    `mail`,
    `batiment`,
    `resident`,
    `observations`,
    `societe`
  )
VALUES
  (
    25,
    'HERMIDA',
    'Marie',
    'Madame',
    '',
    '',
    '06 45 89 05 79',
    'mariapiedad.hermida@sfr.fr',
    '',
    1,
    'Résidente sur le lot 98\r\n\r\n\r\nAncien proprietaire des lots \r\n15-44\r\nMadame LAGENTE\r\nSuccession Lefevre\r\nVente le 08/06/2017\r\n\r\n\r\nAncien propriétaire des lots\r\n98-229-323-356 \r\nSUCC. DARMAGNAC  BAUDIN\r\nReprésentée par M et Mme BAUDIN Catherine sa fille\r\nVente le 25/07/2017',
    NULL
  );
INSERT INTO
  `proprietaires` (
    `Id`,
    `nom`,
    `prenom`,
    `civilite`,
    `adresse`,
    `telephone`,
    `mobile`,
    `mail`,
    `batiment`,
    `resident`,
    `observations`,
    `societe`
  )
VALUES
  (
    27,
    'LEGUILLON',
    'Marc',
    'Monsieur',
    '21/23 Quai Franklin Roosevelt 77920 SAMOIS',
    '',
    '',
    '',
    '',
    0,
    'Marié à  Madame Bénédicte BOUE',
    NULL
  );
INSERT INTO
  `proprietaires` (
    `Id`,
    `nom`,
    `prenom`,
    `civilite`,
    `adresse`,
    `telephone`,
    `mobile`,
    `mail`,
    `batiment`,
    `resident`,
    `observations`,
    `societe`
  )
VALUES
  (
    28,
    'JAMEUX Jean Christophe\r\nBERTHE Quentin',
    'Jean Christophe',
    'Monsieur',
    ' 7 avenue du Touring Club',
    '',
    'Jameux Jean Cristophe\r\n06 88 98 91 54',
    'Jameux Jean Cristophe\r\nechophile@echo.systems\r\n\r\nBerthe Quentin\r\nquentin.berthe@protonmail.ch',
    '',
    1,
    'Ancien Propriétaire\r\nAMORIM DE BRITO Marié à  Madame Delacir CRECENCIO\r\n17 rue de la montagne 77167 POLIGNY\r\nvendu le 27/10/2017',
    NULL
  );
INSERT INTO
  `proprietaires` (
    `Id`,
    `nom`,
    `prenom`,
    `civilite`,
    `adresse`,
    `telephone`,
    `mobile`,
    `mail`,
    `batiment`,
    `resident`,
    `observations`,
    `societe`
  )
VALUES
  (
    29,
    'SCI ZOUBIES CREUZET ',
    'Morgan',
    'Monsieur',
    '80 rue de courbuisson 77920 SAMOIS SUR SEINE',
    '',
    '',
    'momotj@hotmail.fr',
    '',
    0,
    '',
    NULL
  );
INSERT INTO
  `proprietaires` (
    `Id`,
    `nom`,
    `prenom`,
    `civilite`,
    `adresse`,
    `telephone`,
    `mobile`,
    `mail`,
    `batiment`,
    `resident`,
    `observations`,
    `societe`
  )
VALUES
  (
    30,
    'CAPVAN SCI DELCAMBRE',
    '',
    'Monsieur',
    '27 Avenue Franklin Roosevelt\r\n77210 AVON',
    '',
    '\r\n',
    'a.delcambre@wanadoo.fr',
    '',
    0,
    '',
    NULL
  );
INSERT INTO
  `proprietaires` (
    `Id`,
    `nom`,
    `prenom`,
    `civilite`,
    `adresse`,
    `telephone`,
    `mobile`,
    `mail`,
    `batiment`,
    `resident`,
    `observations`,
    `societe`
  )
VALUES
  (
    31,
    'SCI BRIGARICE CREUSET',
    'Florence et Patrice',
    'Madame',
    '',
    '',
    '',
    'florence.creuset@samois-sur-seine.fr',
    '',
    0,
    '',
    NULL
  );
INSERT INTO
  `proprietaires` (
    `Id`,
    `nom`,
    `prenom`,
    `civilite`,
    `adresse`,
    `telephone`,
    `mobile`,
    `mail`,
    `batiment`,
    `resident`,
    `observations`,
    `societe`
  )
VALUES
  (
    32,
    'JOVIGNOT',
    'Patrick',
    'Monsieur',
    '',
    '',
    '',
    'pjovignot@free.fr',
    '',
    0,
    'Avocat Maitre REBIFFE d Fontainebleau',
    NULL
  );
INSERT INTO
  `proprietaires` (
    `Id`,
    `nom`,
    `prenom`,
    `civilite`,
    `adresse`,
    `telephone`,
    `mobile`,
    `mail`,
    `batiment`,
    `resident`,
    `observations`,
    `societe`
  )
VALUES
  (
    33,
    'DAUPHIN',
    '',
    'Monsieur',
    '',
    '',
    '',
    '',
    '',
    0,
    'Mme DAUPHIN est DCD \r\nSuccession LAVOT',
    NULL
  );
INSERT INTO
  `proprietaires` (
    `Id`,
    `nom`,
    `prenom`,
    `civilite`,
    `adresse`,
    `telephone`,
    `mobile`,
    `mail`,
    `batiment`,
    `resident`,
    `observations`,
    `societe`
  )
VALUES
  (
    34,
    'FAIDIT',
    'SOLANGE',
    'Madame',
    '7 Avenue du touring club 77300 FONTAINEBLEAU\r\nDépartementale 65\r\nBois de la Tranchette\r\n89150 DOMATS',
    '03 86 88 64 40',
    '06 43 02 56 20',
    'solange221@orange.fr',
    '',
    0,
    '',
    NULL
  );
INSERT INTO
  `proprietaires` (
    `Id`,
    `nom`,
    `prenom`,
    `civilite`,
    `adresse`,
    `telephone`,
    `mobile`,
    `mail`,
    `batiment`,
    `resident`,
    `observations`,
    `societe`
  )
VALUES
  (
    35,
    'HASSID',
    'Carmil Anne',
    'Madame',
    '7 Avenue du touring club 77300 FONTAINEBLEAU',
    '01 60 72 59 45',
    '06 12 01 16 26',
    'carmilanne.hassid@wanadoo.fr',
    '',
    1,
    '',
    NULL
  );
INSERT INTO
  `proprietaires` (
    `Id`,
    `nom`,
    `prenom`,
    `civilite`,
    `adresse`,
    `telephone`,
    `mobile`,
    `mail`,
    `batiment`,
    `resident`,
    `observations`,
    `societe`
  )
VALUES
  (
    36,
    'TELLIER succession',
    '',
    'Monsieur',
    '',
    '',
    '',
    '',
    '',
    0,
    'Contacts\r\nFille de M TELLIER\r\nMme de Saint Quentin\r\n06 79 26 64 28\r\nFils de M TELLIER\r\nJean Christophe TELLIER\r\n+ 33 6 83 05 23 12\r\ntelljc@icloud.com\r\nen Belgique\r\n + 32 (0)2 559 98 05\r\n+32 (0)496 58 72 97\r\njc.tellier@ucb.com',
    NULL
  );
INSERT INTO
  `proprietaires` (
    `Id`,
    `nom`,
    `prenom`,
    `civilite`,
    `adresse`,
    `telephone`,
    `mobile`,
    `mail`,
    `batiment`,
    `resident`,
    `observations`,
    `societe`
  )
VALUES
  (
    37,
    'ALONSO',
    'José',
    'Monsieur',
    '7 avenue du touring club',
    '',
    '+33 6 73 68 08 45',
    'josealonso.paris@gmail.com',
    'A',
    0,
    'Propriétaire précédent\r\nDESJEUNES Claude\r\n\r\nLes Hespérides de Daumesnil 125 ter rue de Reuilly 75012 Paris\r\n\r\nLot 10,154, 268 le 27/04/2017\r\n\r\nCANIVEZ Marguerite pour les \r\nlots 25 147 272 367 le 31/08/2018',
    ''
  );
INSERT INTO
  `proprietaires` (
    `Id`,
    `nom`,
    `prenom`,
    `civilite`,
    `adresse`,
    `telephone`,
    `mobile`,
    `mail`,
    `batiment`,
    `resident`,
    `observations`,
    `societe`
  )
VALUES
  (
    38,
    'BUCHET',
    'Henri',
    'Monsieur',
    '27 rue Paul Jozon 77880 GREZ SUR LOING',
    '01 64 78 35 96',
    '06 83 15 47 91',
    'ml-buchet@orange.fr',
    '',
    0,
    'BUCHER Marie Laurence\r\nAppartement en attente d\'un locataire',
    NULL
  );
INSERT INTO
  `proprietaires` (
    `Id`,
    `nom`,
    `prenom`,
    `civilite`,
    `adresse`,
    `telephone`,
    `mobile`,
    `mail`,
    `batiment`,
    `resident`,
    `observations`,
    `societe`
  )
VALUES
  (
    39,
    'MARTOLINI',
    'Gabriel',
    'Monsieur',
    '',
    '06 83 27 26 04',
    '',
    '',
    '',
    1,
    'RAF',
    NULL
  );
INSERT INTO
  `proprietaires` (
    `Id`,
    `nom`,
    `prenom`,
    `civilite`,
    `adresse`,
    `telephone`,
    `mobile`,
    `mail`,
    `batiment`,
    `resident`,
    `observations`,
    `societe`
  )
VALUES
  (
    41,
    'SCHOUMAN',
    'hervé',
    'Monsieur',
    '74  Rue de Turenne PARIS',
    '',
    '06 21 31 55 82',
    '',
    '',
    0,
    'Patrick Jean SCHOUMAN s\'occupe des 2 appartements 16 et 108 de son frère DCD et de sa mère\r\n\r\n06 21 31 55 82\r\n\r\npj.schouman@pole-emploi.fr',
    NULL
  );
INSERT INTO
  `proprietaires` (
    `Id`,
    `nom`,
    `prenom`,
    `civilite`,
    `adresse`,
    `telephone`,
    `mobile`,
    `mail`,
    `batiment`,
    `resident`,
    `observations`,
    `societe`
  )
VALUES
  (
    42,
    'SCHOUMANN',
    'Monique',
    'Madame',
    '',
    '',
    '',
    '',
    '',
    0,
    '',
    NULL
  );
INSERT INTO
  `proprietaires` (
    `Id`,
    `nom`,
    `prenom`,
    `civilite`,
    `adresse`,
    `telephone`,
    `mobile`,
    `mail`,
    `batiment`,
    `resident`,
    `observations`,
    `societe`
  )
VALUES
  (
    43,
    'SCI DAD\r\nGérant Régis CHOTARD\r\n       Fabrice CHOTARD\r\n\r\n\r\n',
    'Fabrice',
    'Monsieur',
    '7 avenue du touring club 77300 FONTAINEBLEAU',
    '',
    'Fabrice CHOTARD\r\n06 75 07 14 57',
    'fabrice.chotard@cic.fr',
    '',
    0,
    'Ancien appartement de VERNUS jacques,appartement disjoint qui comportait le lot 18 et 19\r\nLot 18, 167, 274 vendu le 18/10/2017 a SQCI DAD\r\nL\'autre partie 19,164, 402 vendu le 18/10/207 à HADJI',
    NULL
  );
INSERT INTO
  `proprietaires` (
    `Id`,
    `nom`,
    `prenom`,
    `civilite`,
    `adresse`,
    `telephone`,
    `mobile`,
    `mail`,
    `batiment`,
    `resident`,
    `observations`,
    `societe`
  )
VALUES
  (
    44,
    'BADEN',
    'Nicolas',
    'Monsieur',
    '11 rue de champagne 94100 Saint Maur des fossés',
    '',
    '06 61 64 78 85',
    'nbaden94@gmail.com',
    'A',
    0,
    'ancien proprio\r\nDEVAUX-LANDRAGIN\r\nVendu le 17/01/2019',
    NULL
  );
INSERT INTO
  `proprietaires` (
    `Id`,
    `nom`,
    `prenom`,
    `civilite`,
    `adresse`,
    `telephone`,
    `mobile`,
    `mail`,
    `batiment`,
    `resident`,
    `observations`,
    `societe`
  )
VALUES
  (
    45,
    'BIENKOWSKI',
    'Roland',
    'Madame',
    '7 avenue du touring club\r\npour Roland',
    '01 64 24 73 55',
    '06 20 68 99 42 & 07 82 33 97 66',
    'fbienko@orange.fr & roland.bienkowski@gmail.com',
    'A',
    1,
    'Achat par Francette et Roland BIENKOWSKI en Novembre 2011\r\nRachat le 09/10/2017 par Roland de la part de sa soeur.',
    NULL
  );
INSERT INTO
  `proprietaires` (
    `Id`,
    `nom`,
    `prenom`,
    `civilite`,
    `adresse`,
    `telephone`,
    `mobile`,
    `mail`,
    `batiment`,
    `resident`,
    `observations`,
    `societe`
  )
VALUES
  (
    47,
    'PROPHETE',
    'lucette',
    'Madame',
    '7 avenue du touring club 77300 Fontainebleau',
    '',
    '',
    '',
    '',
    1,
    '',
    NULL
  );
INSERT INTO
  `proprietaires` (
    `Id`,
    `nom`,
    `prenom`,
    `civilite`,
    `adresse`,
    `telephone`,
    `mobile`,
    `mail`,
    `batiment`,
    `resident`,
    `observations`,
    `societe`
  )
VALUES
  (
    48,
    'GENNETAY ORLOFF',
    'Raymonde',
    'Madame',
    '7 avenue du touring club 77300 FONTAINEBLEAU',
    '06 84 08 21 43',
    '06 18 96 33 49',
    'forloff@orange.fr',
    '',
    1,
    'le deuxième numéro de portable est celui de Mme Orloff',
    NULL
  );
INSERT INTO
  `proprietaires` (
    `Id`,
    `nom`,
    `prenom`,
    `civilite`,
    `adresse`,
    `telephone`,
    `mobile`,
    `mail`,
    `batiment`,
    `resident`,
    `observations`,
    `societe`
  )
VALUES
  (
    50,
    'CASSARIN',
    'Pascal',
    'Monsieur',
    '26 Bis r Paroisse, 77300 FONTAINEBLEAU',
    '01 64 22 70 75 ',
    '',
    'p.cassarin@wanadoo.fr',
    '',
    0,
    'Medecin à Fontainebleau',
    NULL
  );
INSERT INTO
  `proprietaires` (
    `Id`,
    `nom`,
    `prenom`,
    `civilite`,
    `adresse`,
    `telephone`,
    `mobile`,
    `mail`,
    `batiment`,
    `resident`,
    `observations`,
    `societe`
  )
VALUES
  (
    51,
    'VEYSSIERE',
    'Gustave',
    'Monsieur',
    '7 avenue du touring club 77300 FONTAINEBLEAU',
    '',
    '',
    '',
    '',
    1,
    '',
    NULL
  );
INSERT INTO
  `proprietaires` (
    `Id`,
    `nom`,
    `prenom`,
    `civilite`,
    `adresse`,
    `telephone`,
    `mobile`,
    `mail`,
    `batiment`,
    `resident`,
    `observations`,
    `societe`
  )
VALUES
  (
    52,
    'VEYSSIERE',
    'Michelle',
    'Madame',
    '44 rue desboulangers 75005 Paris',
    '',
    '',
    '',
    '',
    0,
    '',
    NULL
  );
INSERT INTO
  `proprietaires` (
    `Id`,
    `nom`,
    `prenom`,
    `civilite`,
    `adresse`,
    `telephone`,
    `mobile`,
    `mail`,
    `batiment`,
    `resident`,
    `observations`,
    `societe`
  )
VALUES
  (
    53,
    'FROTE',
    'François',
    'Monsieur',
    '8 rue Recamier 75007 PARIS',
    '01 56 58 26 68',
    '06 18 03 19 89',
    'francois.frote@orange.fr',
    '',
    0,
    '',
    NULL
  );
INSERT INTO
  `proprietaires` (
    `Id`,
    `nom`,
    `prenom`,
    `civilite`,
    `adresse`,
    `telephone`,
    `mobile`,
    `mail`,
    `batiment`,
    `resident`,
    `observations`,
    `societe`
  )
VALUES
  (
    54,
    'MASANES',
    'Marie',
    'Madame',
    '7 avenue du touring club 77300 FONTAINEBLEAU',
    '',
    'Jean Pierre SCHAEFFER fils de Mme MAZANES\r\n06 24 66 50 12',
    'Jean Pierre SCHAEFFER fils de Mme MAZANES\r\njp.schaeffer@sfr.fr',
    '',
    1,
    'Jean Pierre SCHAEFFER fils de Mme MAZANES\r\n06 24 66 50 12\r\njp.schaeffer@sfr.fr',
    NULL
  );
INSERT INTO
  `proprietaires` (
    `Id`,
    `nom`,
    `prenom`,
    `civilite`,
    `adresse`,
    `telephone`,
    `mobile`,
    `mail`,
    `batiment`,
    `resident`,
    `observations`,
    `societe`
  )
VALUES
  (
    55,
    'LEVY',
    'Clément',
    'Monsieur',
    '\r\n\r\nex fils Olivier\r\n34 Bd Marbeau 75116 PARIS',
    '\r\n\r\n\r\nEX\r\n05 56 83 29 41 Mme\r\n05 56 60 91 94\r\n06 62 04 29 41\r\n',
    '+33 6 07 98 64 06\r\npère 06 07 55 09 82 didier LEVY\r\n\r\n\r\n\r\n\r\n\r\n06 76 10 87 96 Olivier SHAEFFER\r\n06 68 67 73 08 Mme SCHAEFFER\r\n',
    'Père dlevy.immo@gmail.com\r\n\r\n\r\n',
    '',
    1,
    'Vendu par ILLIECO le 14/11/2017 à ACDV TOURING appartenant à M Didier LEVY qui l\'a vendu à son fils CLEMENT le 15/05/2019',
    NULL
  );
INSERT INTO
  `proprietaires` (
    `Id`,
    `nom`,
    `prenom`,
    `civilite`,
    `adresse`,
    `telephone`,
    `mobile`,
    `mail`,
    `batiment`,
    `resident`,
    `observations`,
    `societe`
  )
VALUES
  (
    56,
    'BRIOIS',
    'SYLVIE',
    'Madame',
    '',
    '01 60 72 84 54',
    '07 71 10 96 35',
    '',
    'A',
    1,
    'Numéro téléphone de la fille :\r\n04 66 79 20 04',
    NULL
  );
INSERT INTO
  `proprietaires` (
    `Id`,
    `nom`,
    `prenom`,
    `civilite`,
    `adresse`,
    `telephone`,
    `mobile`,
    `mail`,
    `batiment`,
    `resident`,
    `observations`,
    `societe`
  )
VALUES
  (
    57,
    'BEAUMIER  CHALIFOUR',
    'Nicole',
    'Madame',
    'Résidence LES HESPERIDES 7 avenue du Touring Club - 77300 FONTAINEBLEAU',
    '',
    '',
    '',
    '',
    0,
    '',
    NULL
  );
INSERT INTO
  `proprietaires` (
    `Id`,
    `nom`,
    `prenom`,
    `civilite`,
    `adresse`,
    `telephone`,
    `mobile`,
    `mail`,
    `batiment`,
    `resident`,
    `observations`,
    `societe`
  )
VALUES
  (
    59,
    'BELGHORAF',
    'DJAMEL',
    'Monsieur',
    '5 ALLEE DE LA TOUR  77420 CHAMPS-SUR-MARNE ',
    '',
    '',
    '',
    '',
    0,
    '',
    NULL
  );
INSERT INTO
  `proprietaires` (
    `Id`,
    `nom`,
    `prenom`,
    `civilite`,
    `adresse`,
    `telephone`,
    `mobile`,
    `mail`,
    `batiment`,
    `resident`,
    `observations`,
    `societe`
  )
VALUES
  (
    61,
    'JACOTEY',
    'CHRISTIAN LOUIS',
    'Madame',
    ' 60 RUE BOISSIERE  75016 PARIS 16',
    '09 64 44 85 31\r\n01 60 71 01 27',
    '06 86 56 25 41',
    '',
    '',
    1,
    'RAF',
    NULL
  );
INSERT INTO
  `proprietaires` (
    `Id`,
    `nom`,
    `prenom`,
    `civilite`,
    `adresse`,
    `telephone`,
    `mobile`,
    `mail`,
    `batiment`,
    `resident`,
    `observations`,
    `societe`
  )
VALUES
  (
    62,
    'LEFEBVRE',
    'CAROLINE THERESE ELIANE',
    'Madame',
    '69 rue de la Benauge 63100 Bordeaux',
    '',
    '06 13 45 01 48',
    'lefebvrecaroline33@gmail.com',
    '',
    0,
    '',
    NULL
  );
INSERT INTO
  `proprietaires` (
    `Id`,
    `nom`,
    `prenom`,
    `civilite`,
    `adresse`,
    `telephone`,
    `mobile`,
    `mail`,
    `batiment`,
    `resident`,
    `observations`,
    `societe`
  )
VALUES
  (
    63,
    'CAUDRON CAILLOT',
    'GISELLE GABRIELLE',
    'Madame',
    '7 AV DU TOURING CLUB  77300 FONTAINEBLEAU',
    '',
    '',
    '',
    '',
    1,
    '',
    NULL
  );
INSERT INTO
  `proprietaires` (
    `Id`,
    `nom`,
    `prenom`,
    `civilite`,
    `adresse`,
    `telephone`,
    `mobile`,
    `mail`,
    `batiment`,
    `resident`,
    `observations`,
    `societe`
  )
VALUES
  (
    64,
    'WARET',
    'Thierry',
    'Monsieur',
    '363 bis rue des pyrénnées 75020',
    '',
    '06 84 93 12 92',
    'thierry.waret@gmail.com',
    '',
    0,
    'Anciens copros Indivision\r\nHEMMERLE Alain, Jean Louis, Patrick, Martine\r\nDCD Juillet 2015\r\nELISABETH MARIE HEMMERLE TUCVALERIEN',
    NULL
  );
INSERT INTO
  `proprietaires` (
    `Id`,
    `nom`,
    `prenom`,
    `civilite`,
    `adresse`,
    `telephone`,
    `mobile`,
    `mail`,
    `batiment`,
    `resident`,
    `observations`,
    `societe`
  )
VALUES
  (
    65,
    'LESEC LACHAUD',
    ' MAURICE ERNEST',
    'Monsieur',
    '7 AV DU TOURING CLUB  77300 FONTAINEBLEAU',
    '01 64  23 10 91',
    '',
    '',
    '',
    0,
    'INDIVISION : LESEC DANIELLE EP LACHAUD \r\n             LESEC  MAURICE',
    NULL
  );
INSERT INTO
  `proprietaires` (
    `Id`,
    `nom`,
    `prenom`,
    `civilite`,
    `adresse`,
    `telephone`,
    `mobile`,
    `mail`,
    `batiment`,
    `resident`,
    `observations`,
    `societe`
  )
VALUES
  (
    66,
    'FLORY',
    'Josette',
    'Madame',
    '7 AV DU TOURING CLUB  77300 FONTAINEBLEAU',
    '',
    'FLORY Jean Emmanuel\r\n06 59 31 48 53\r\nFLORY Isabelle\r\n06 70 99 26 43',
    'FLORY Jean Emmanuel son fils\r\nsherpa@club-internet.fr\r\nFLORY Isabelle sa fille\r\nisabelle.flory@departement77.fr',
    '',
    0,
    'Madame Flory est en maison de retraite et c\'est son fils FLORY Jean Emmanuel qui occupe le logement temporairement.\r\nSon mail est celui inscrit sur cette fiche',
    NULL
  );
INSERT INTO
  `proprietaires` (
    `Id`,
    `nom`,
    `prenom`,
    `civilite`,
    `adresse`,
    `telephone`,
    `mobile`,
    `mail`,
    `batiment`,
    `resident`,
    `observations`,
    `societe`
  )
VALUES
  (
    67,
    'SCI GLACEP\r\nLETENDARD',
    '',
    'Madame',
    ' ',
    '',
    '+33 6 80 72 53 67',
    '',
    'B',
    0,
    'Ancien Copro\r\nCOURTAUD  MIREY\r\n9 RUE DU SERGENT  77920 SAMOIS SUR SEINE\r\nMaison de retraite EPAD\r\nVendu le 12/06/2018',
    NULL
  );
INSERT INTO
  `proprietaires` (
    `Id`,
    `nom`,
    `prenom`,
    `civilite`,
    `adresse`,
    `telephone`,
    `mobile`,
    `mail`,
    `batiment`,
    `resident`,
    `observations`,
    `societe`
  )
VALUES
  (
    68,
    'COQUEREL  GOURDIN',
    'FERNANDE JULIETTE',
    'Madame',
    '7 AV DU TOURING CLUB  77300 FONTAINEBLEAU',
    '',
    '',
    '',
    'B',
    1,
    '',
    NULL
  );
INSERT INTO
  `proprietaires` (
    `Id`,
    `nom`,
    `prenom`,
    `civilite`,
    `adresse`,
    `telephone`,
    `mobile`,
    `mail`,
    `batiment`,
    `resident`,
    `observations`,
    `societe`
  )
VALUES
  (
    69,
    'BOUVET',
    '',
    'Monsieur',
    '5B Domaine du petit beauregard 78170 LA CELLE ST CLOUD',
    '',
    '06 63 04 07 90',
    'fredericbouvet@yahoo.fr',
    '',
    0,
    '',
    NULL
  );
INSERT INTO
  `proprietaires` (
    `Id`,
    `nom`,
    `prenom`,
    `civilite`,
    `adresse`,
    `telephone`,
    `mobile`,
    `mail`,
    `batiment`,
    `resident`,
    `observations`,
    `societe`
  )
VALUES
  (
    70,
    'CZABADAJ',
    'Mathias',
    '',
    '56 rue du Motel CACHAN 94230',
    '',
    '06 38 12 43 64 ',
    'mczabada@gmail.com',
    'B',
    0,
    'DE MONHOUDOU WATNEY ss curatel\r\nVendu par Maitre Carly SCHWARTZ à Fontainebleau le 06/03:2020',
    NULL
  );
INSERT INTO
  `proprietaires` (
    `Id`,
    `nom`,
    `prenom`,
    `civilite`,
    `adresse`,
    `telephone`,
    `mobile`,
    `mail`,
    `batiment`,
    `resident`,
    `observations`,
    `societe`
  )
VALUES
  (
    71,
    'DUBIE DUMESNY',
    'JOSETTE CHRISTIANE',
    'Madame',
    '7 AV DU TOURING CLUB  77300 FONTAINEBLEAU',
    '01 60 96 07 72',
    '06 37 07 37 01',
    '',
    '',
    1,
    '',
    NULL
  );
INSERT INTO
  `proprietaires` (
    `Id`,
    `nom`,
    `prenom`,
    `civilite`,
    `adresse`,
    `telephone`,
    `mobile`,
    `mail`,
    `batiment`,
    `resident`,
    `observations`,
    `societe`
  )
VALUES
  (
    72,
    'TRANIELLO ',
    'FERNAND',
    'Monsieur',
    '7 AV DU TOURING CLUB  77300 FONTAINEBLEAU',
    '01 60 72 00 38',
    'Fille de M Traniello Mme CARRET\r\n06 82 77 38 51\r\n',
    '',
    '',
    0,
    'DCD',
    NULL
  );
INSERT INTO
  `proprietaires` (
    `Id`,
    `nom`,
    `prenom`,
    `civilite`,
    `adresse`,
    `telephone`,
    `mobile`,
    `mail`,
    `batiment`,
    `resident`,
    `observations`,
    `societe`
  )
VALUES
  (
    73,
    'MARTIN',
    'DENISE FRANCINE LOUISE',
    'Madame',
    'Place du 18 juin 1940\r\n44504 La Baule',
    '01 64 22 38 68',
    '',
    '',
    '',
    1,
    '',
    NULL
  );
INSERT INTO
  `proprietaires` (
    `Id`,
    `nom`,
    `prenom`,
    `civilite`,
    `adresse`,
    `telephone`,
    `mobile`,
    `mail`,
    `batiment`,
    `resident`,
    `observations`,
    `societe`
  )
VALUES
  (
    74,
    'VAYSSIE',
    'ANNIE GERMAINE ODILE',
    'Madame',
    ' 2 RUE DU COMMANDEUR  75014 PARIS ',
    '01 43 27 60 41',
    '',
    '',
    '',
    0,
    '',
    NULL
  );
INSERT INTO
  `proprietaires` (
    `Id`,
    `nom`,
    `prenom`,
    `civilite`,
    `adresse`,
    `telephone`,
    `mobile`,
    `mail`,
    `batiment`,
    `resident`,
    `observations`,
    `societe`
  )
VALUES
  (
    75,
    'LEDON',
    'DENISE ADRIENNE',
    'Madame',
    '7 AV DU TOURING CLUB  77300 FONTAINEBLEAU',
    '01 60 96 49 11',
    '',
    '',
    '',
    1,
    '',
    NULL
  );
INSERT INTO
  `proprietaires` (
    `Id`,
    `nom`,
    `prenom`,
    `civilite`,
    `adresse`,
    `telephone`,
    `mobile`,
    `mail`,
    `batiment`,
    `resident`,
    `observations`,
    `societe`
  )
VALUES
  (
    76,
    'TOURING IMMO \r\nDELCAMBRE Arnaud',
    '',
    'Monsieur',
    '',
    '',
    '06 72 92 80 25',
    'a.delcambre@wanadoo.fr',
    'B',
    0,
    'DIALLO BOUBACAR SIDIKI\r\nMme 06 08 96 64 97\r\nM   06 73 05 88 51\r\n17 rue Dome Pedre 45200 MONTARGIS\r\n40 rue Barrier \"Les bateliers\" 73100 AIX LES BAINS',
    NULL
  );
INSERT INTO
  `proprietaires` (
    `Id`,
    `nom`,
    `prenom`,
    `civilite`,
    `adresse`,
    `telephone`,
    `mobile`,
    `mail`,
    `batiment`,
    `resident`,
    `observations`,
    `societe`
  )
VALUES
  (
    77,
    'SCI CLEOREJYR\r\nM ROUX',
    '',
    '',
    '44 rue Charles Meunier 77210 AVON',
    'SCI 01 60 71 05 45',
    '06 87 25 84 09',
    'jy.roux@life.fr\r\nalphadiagnostic.doi@gmail.com',
    '',
    0,
    'Ancien Copro :\r\n\r\nBOUTEAUD LAVIE GISELE ALBERTE\r\nGISELE ALBERTEendu 79 000 € 17/06/2017 ',
    NULL
  );
INSERT INTO
  `proprietaires` (
    `Id`,
    `nom`,
    `prenom`,
    `civilite`,
    `adresse`,
    `telephone`,
    `mobile`,
    `mail`,
    `batiment`,
    `resident`,
    `observations`,
    `societe`
  )
VALUES
  (
    78,
    'FICHARD',
    'JEAN ALBERT FRANCOIS',
    'Monsieur',
    '7 AV DU TOURING CLUB  77300 FONTAINEBLEAU',
    '',
    '',
    '',
    'B',
    1,
    '',
    NULL
  );
INSERT INTO
  `proprietaires` (
    `Id`,
    `nom`,
    `prenom`,
    `civilite`,
    `adresse`,
    `telephone`,
    `mobile`,
    `mail`,
    `batiment`,
    `resident`,
    `observations`,
    `societe`
  )
VALUES
  (
    79,
    'DE CHANTELOUP VANNIER',
    'JEANINE RENEE',
    'Madame',
    '7 AV DU TOURING CLUB  77300 FONTAINEBLEAU',
    '01 64 22 03 30',
    '',
    '',
    'C',
    1,
    '',
    NULL
  );
INSERT INTO
  `proprietaires` (
    `Id`,
    `nom`,
    `prenom`,
    `civilite`,
    `adresse`,
    `telephone`,
    `mobile`,
    `mail`,
    `batiment`,
    `resident`,
    `observations`,
    `societe`
  )
VALUES
  (
    80,
    'WACRENIER-VERRON',
    'ALINE RENEE',
    'Madame',
    'Joel Verron\r\n63 avenue pasteur\r\n93100 Montreuil \r\n\r\n\r\n3 RUE GUSTAVE BAUDOIN  77590 BOIS LE ROI',
    '01 74 65 30 55',
    '06 26 33 43 26',
    'joelverron2@gmail.com',
    '',
    0,
    '',
    NULL
  );
INSERT INTO
  `proprietaires` (
    `Id`,
    `nom`,
    `prenom`,
    `civilite`,
    `adresse`,
    `telephone`,
    `mobile`,
    `mail`,
    `batiment`,
    `resident`,
    `observations`,
    `societe`
  )
VALUES
  (
    82,
    'ROY / DUTEL',
    ' EMMANUEL HERVE JEAN-LUC',
    'Monsieur',
    '11 RUE DES GRANGES  77115 SIVRY-COURTRY',
    '',
    '',
    'mibroymanu@gmail.com',
    '',
    1,
    '',
    NULL
  );
INSERT INTO
  `proprietaires` (
    `Id`,
    `nom`,
    `prenom`,
    `civilite`,
    `adresse`,
    `telephone`,
    `mobile`,
    `mail`,
    `batiment`,
    `resident`,
    `observations`,
    `societe`
  )
VALUES
  (
    83,
    'HAYGNERE\r\n',
    'Emilie',
    'Madame',
    '6 LOT LES CHAUMIERES  77950 VOISENON',
    ' ',
    '06 95 58 22 91',
    'emilie.haygnere@gmail.com',
    'C',
    0,
    'Ancien copro\r\nDUBOIS CAUCHOIS MARTINET\r\nVendu le 20/06/2019',
    NULL
  );
INSERT INTO
  `proprietaires` (
    `Id`,
    `nom`,
    `prenom`,
    `civilite`,
    `adresse`,
    `telephone`,
    `mobile`,
    `mail`,
    `batiment`,
    `resident`,
    `observations`,
    `societe`
  )
VALUES
  (
    84,
    'BURON',
    'MARCEL JACQUES',
    'Monsieur',
    '7 AV DU TOURING CLUB  77300 FONTAINEBLEAU',
    '01 60 96 78 85',
    '06 48 56 07 05',
    '',
    'C',
    1,
    '',
    NULL
  );
INSERT INTO
  `proprietaires` (
    `Id`,
    `nom`,
    `prenom`,
    `civilite`,
    `adresse`,
    `telephone`,
    `mobile`,
    `mail`,
    `batiment`,
    `resident`,
    `observations`,
    `societe`
  )
VALUES
  (
    85,
    'PARNAUDEAU',
    'FRANCOISE MICHELINE',
    'Madame',
    '7',
    '',
    '',
    '',
    '',
    1,
    '',
    NULL
  );
INSERT INTO
  `proprietaires` (
    `Id`,
    `nom`,
    `prenom`,
    `civilite`,
    `adresse`,
    `telephone`,
    `mobile`,
    `mail`,
    `batiment`,
    `resident`,
    `observations`,
    `societe`
  )
VALUES
  (
    86,
    'KRAMP LE DIOLEN',
    'ALINE ELISE MARIE',
    'Madame',
    '7 AV DU TOURING CLUB  77300 FONTAINEBLEAU',
    '01 60 70 01 48',
    '',
    '',
    '',
    1,
    'Indivision KRAMP LE DIOLEN',
    NULL
  );
INSERT INTO
  `proprietaires` (
    `Id`,
    `nom`,
    `prenom`,
    `civilite`,
    `adresse`,
    `telephone`,
    `mobile`,
    `mail`,
    `batiment`,
    `resident`,
    `observations`,
    `societe`
  )
VALUES
  (
    87,
    'CIBOULE,BLONDEAU ',
    '',
    'Madame',
    '7 AV DU TOURING CLUB  77300 FONTAINEBLEAU',
    '',
    '',
    '',
    'C',
    1,
    'Ancien propriétaire : PARIS\r\nVendu le 13/12/2018\r\nMadame BLONDEAU nu propriétaire, fille de Madame CIBOULE qui est  usufruitière',
    NULL
  );
INSERT INTO
  `proprietaires` (
    `Id`,
    `nom`,
    `prenom`,
    `civilite`,
    `adresse`,
    `telephone`,
    `mobile`,
    `mail`,
    `batiment`,
    `resident`,
    `observations`,
    `societe`
  )
VALUES
  (
    89,
    'BERTHIER  CHAUDIERE',
    ' LOUISETTE',
    'Madame',
    '',
    '',
    '06 10 66 84 89',
    'jl.berthier@orange.fr',
    '',
    0,
    'Mme Berthier est en maison de retraite, son fils Jean-Luc Berthier s\'occupe maintenant de ses affaires.Le numéro de portable est le sien',
    NULL
  );
INSERT INTO
  `proprietaires` (
    `Id`,
    `nom`,
    `prenom`,
    `civilite`,
    `adresse`,
    `telephone`,
    `mobile`,
    `mail`,
    `batiment`,
    `resident`,
    `observations`,
    `societe`
  )
VALUES
  (
    91,
    'LEVY',
    'Pascal',
    'Monsieur',
    '',
    '',
    '06 80 46 09 83',
    'levy.7713@gmail.com',
    '',
    0,
    'Ancien proprio  ORSINI LUCIEN ANTOINE\r\nlots 109-236-308-365\r\nSon fils\r\nVillage Prunelli\r\nAghja vecchia\r\n20243 PRUNELLI DI FIUMORBO\r\nORSINI Chantal\r\n06 13 03 80 01\r\nVendu le 18/09/2018 120000 €\r\nVEKEMAN LOT 126-255-341-413\r\nVENDU LE 04/07/2019',
    NULL
  );
INSERT INTO
  `proprietaires` (
    `Id`,
    `nom`,
    `prenom`,
    `civilite`,
    `adresse`,
    `telephone`,
    `mobile`,
    `mail`,
    `batiment`,
    `resident`,
    `observations`,
    `societe`
  )
VALUES
  (
    94,
    'PONCET',
    'MADELEINE JEANNINE',
    'Madame',
    '7 AV DU TOURING CLUB  77300 FONTAINEBLEAU',
    '',
    '',
    '',
    '',
    1,
    '',
    NULL
  );
INSERT INTO
  `proprietaires` (
    `Id`,
    `nom`,
    `prenom`,
    `civilite`,
    `adresse`,
    `telephone`,
    `mobile`,
    `mail`,
    `batiment`,
    `resident`,
    `observations`,
    `societe`
  )
VALUES
  (
    95,
    'LARGEAU',
    'thierry',
    'Monsieur',
    '7 AV DU TOURING CLUB  77300 FONTAINEBLEAU',
    '',
    '06 61 42 24 16',
    'largeau.thierry@bbox.fr',
    '',
    1,
    '',
    NULL
  );
INSERT INTO
  `proprietaires` (
    `Id`,
    `nom`,
    `prenom`,
    `civilite`,
    `adresse`,
    `telephone`,
    `mobile`,
    `mail`,
    `batiment`,
    `resident`,
    `observations`,
    `societe`
  )
VALUES
  (
    97,
    'LABOUTIQUE',
    'Sylvain',
    'Monsieur',
    '',
    '',
    '06 61 75 69 13',
    'annie.meline@orange.fr',
    '',
    1,
    'Sous curatel de Mme Meline Annie, sa soeur, dont le portable est ci dessus.',
    NULL
  );
INSERT INTO
  `proprietaires` (
    `Id`,
    `nom`,
    `prenom`,
    `civilite`,
    `adresse`,
    `telephone`,
    `mobile`,
    `mail`,
    `batiment`,
    `resident`,
    `observations`,
    `societe`
  )
VALUES
  (
    98,
    'PERRIER HARISSON ',
    '',
    'Madame',
    'Résidence LES HESPERIDES 7 avenue du Touring Club - 77300 FONTAINEBLEAU',
    '',
    '',
    '',
    '',
    1,
    'INCONNU',
    NULL
  );
INSERT INTO
  `proprietaires` (
    `Id`,
    `nom`,
    `prenom`,
    `civilite`,
    `adresse`,
    `telephone`,
    `mobile`,
    `mail`,
    `batiment`,
    `resident`,
    `observations`,
    `societe`
  )
VALUES
  (
    99,
    'PICARD',
    'LAURENT',
    'Monsieur',
    '7 AVENUE DU TOURING CLUB\r\n77300 FONTAINEBLEAU',
    '',
    '',
    '',
    '',
    1,
    'INCONNU',
    NULL
  );
INSERT INTO
  `proprietaires` (
    `Id`,
    `nom`,
    `prenom`,
    `civilite`,
    `adresse`,
    `telephone`,
    `mobile`,
    `mail`,
    `batiment`,
    `resident`,
    `observations`,
    `societe`
  )
VALUES
  (
    100,
    'DE PHILY',
    '',
    'Madame',
    '3 rue du colonel Moll 75017 Paris',
    '06 13 51 63 70',
    '',
    '',
    '',
    0,
    'Anciennement propriétaire des lots 62-189-285-345\r\nles lots 62-189-345 ont été vendu à M VERNES pour 160 000 € en aout 2019',
    NULL
  );
INSERT INTO
  `proprietaires` (
    `Id`,
    `nom`,
    `prenom`,
    `civilite`,
    `adresse`,
    `telephone`,
    `mobile`,
    `mail`,
    `batiment`,
    `resident`,
    `observations`,
    `societe`
  )
VALUES
  (
    101,
    'BELORGEY',
    ' FRANCOISE',
    'Madame',
    '4 rue Cormier 77590 BOIS LE ROI',
    '01 60 69 18 41',
    '',
    '',
    '',
    0,
    '',
    NULL
  );
INSERT INTO
  `proprietaires` (
    `Id`,
    `nom`,
    `prenom`,
    `civilite`,
    `adresse`,
    `telephone`,
    `mobile`,
    `mail`,
    `batiment`,
    `resident`,
    `observations`,
    `societe`
  )
VALUES
  (
    102,
    'GUILLOT GUIGNON  ',
    'Jean',
    'Monsieur',
    'Mme. GUILLOT Danielle 10 CHEMIN DE LA RUELLE  91490 ONCY SUR ECOLE',
    '',
    '06 08 24 71 41 M GUILLOT\r\n\r\n06 61 88 47 25',
    'soocrate@orange.fr',
    '',
    0,
    'Suuession Mme GUILLOT Danielle sa fille',
    NULL
  );
INSERT INTO
  `proprietaires` (
    `Id`,
    `nom`,
    `prenom`,
    `civilite`,
    `adresse`,
    `telephone`,
    `mobile`,
    `mail`,
    `batiment`,
    `resident`,
    `observations`,
    `societe`
  )
VALUES
  (
    103,
    'NODE LANGLOIS',
    'OLIVIER JACQUES',
    'Monsieur',
    ' 11 RUE AMBROISE PARE  75010 PARIS',
    '09 52 23 47 53',
    '',
    '',
    '',
    0,
    '',
    NULL
  );
INSERT INTO
  `proprietaires` (
    `Id`,
    `nom`,
    `prenom`,
    `civilite`,
    `adresse`,
    `telephone`,
    `mobile`,
    `mail`,
    `batiment`,
    `resident`,
    `observations`,
    `societe`
  )
VALUES
  (
    104,
    'MBOUNGOU',
    'JOANNA',
    'Madame',
    '7 AV DU TOURING CLUB  77300 FONTAINEBLEAU',
    '',
    '07 77 60 34 23',
    'joanna.mboungou@hotmail.fr',
    '',
    1,
    '',
    NULL
  );
INSERT INTO
  `proprietaires` (
    `Id`,
    `nom`,
    `prenom`,
    `civilite`,
    `adresse`,
    `telephone`,
    `mobile`,
    `mail`,
    `batiment`,
    `resident`,
    `observations`,
    `societe`
  )
VALUES
  (
    105,
    'JEVELOT',
    'Alain',
    'Monsieur',
    '5 rue Breard 89190 Villeneuve l\'archevèque',
    '+33 3 86 86 78 08',
    '+33 6 26 32 18 39',
    'alain.jevelot@sfr.fr',
    '',
    0,
    '',
    NULL
  );
INSERT INTO
  `proprietaires` (
    `Id`,
    `nom`,
    `prenom`,
    `civilite`,
    `adresse`,
    `telephone`,
    `mobile`,
    `mail`,
    `batiment`,
    `resident`,
    `observations`,
    `societe`
  )
VALUES
  (
    106,
    'CAMOU',
    'HELENE PAULE',
    'Madame',
    '7 AV DU TOURING CLUB  77300 FONTAINEBLEAU',
    '01 60 70 10 14',
    '06 81 71 27 31',
    '',
    'D',
    1,
    '',
    NULL
  );
INSERT INTO
  `proprietaires` (
    `Id`,
    `nom`,
    `prenom`,
    `civilite`,
    `adresse`,
    `telephone`,
    `mobile`,
    `mail`,
    `batiment`,
    `resident`,
    `observations`,
    `societe`
  )
VALUES
  (
    107,
    'BROUDER  ALLORANT',
    ' SIMONNE JACQUELINE PAULETTE',
    'Madame',
    '7 AV DU TOURING CLUB  77300 FONTAINEBLEAU',
    '',
    '06 87 46 58 94',
    'thierry.brouder@wanadoo.fr',
    '',
    1,
    '',
    NULL
  );
INSERT INTO
  `proprietaires` (
    `Id`,
    `nom`,
    `prenom`,
    `civilite`,
    `adresse`,
    `telephone`,
    `mobile`,
    `mail`,
    `batiment`,
    `resident`,
    `observations`,
    `societe`
  )
VALUES
  (
    108,
    'VIDAL',
    'ERIC HUBERT DANIEL',
    'Monsieur',
    '',
    '',
    '06 03 88 58 75',
    '',
    '',
    0,
    '',
    NULL
  );
INSERT INTO
  `proprietaires` (
    `Id`,
    `nom`,
    `prenom`,
    `civilite`,
    `adresse`,
    `telephone`,
    `mobile`,
    `mail`,
    `batiment`,
    `resident`,
    `observations`,
    `societe`
  )
VALUES
  (
    109,
    'FOURNIER',
    'Bérangère',
    '',
    ' ',
    '',
    '06 42 69 30 34',
    'berengere.fournier25@orange.fr',
    'D',
    1,
    'Ancien Copro \r\nVIDAL  PATRICIA THERESE NICOLE\r\nVILLA CANDELARIA  15 AV DE LA REPUBLIQUE  64200 BIARRITZ',
    NULL
  );
INSERT INTO
  `proprietaires` (
    `Id`,
    `nom`,
    `prenom`,
    `civilite`,
    `adresse`,
    `telephone`,
    `mobile`,
    `mail`,
    `batiment`,
    `resident`,
    `observations`,
    `societe`
  )
VALUES
  (
    111,
    'TAVERNIER',
    'DENISE GERMAINE',
    'Madame',
    '7 AV DU TOURING CLUB  77300 FONTAINEBLEAU',
    '01 60 70 86 10',
    '07 70 07 57 37',
    '',
    '',
    1,
    '',
    NULL
  );
INSERT INTO
  `proprietaires` (
    `Id`,
    `nom`,
    `prenom`,
    `civilite`,
    `adresse`,
    `telephone`,
    `mobile`,
    `mail`,
    `batiment`,
    `resident`,
    `observations`,
    `societe`
  )
VALUES
  (
    112,
    'BOIS POTTIER',
    'ANNE MARIE THERESE ADELE',
    'Madame',
    '7 AV DU TOURING CLUB  77300 FONTAINEBLEAU',
    '',
    '06 11 04 60 15',
    '',
    '',
    1,
    'Contact\r\nNeveu de Mme BOIS\r\nM HILBRUNNER\r\nxayul75@live.fr\r\n06 11 04 60 15\r\n\r\nMme POTIER la Soeur\r\n06 88 74 37 04',
    NULL
  );
INSERT INTO
  `proprietaires` (
    `Id`,
    `nom`,
    `prenom`,
    `civilite`,
    `adresse`,
    `telephone`,
    `mobile`,
    `mail`,
    `batiment`,
    `resident`,
    `observations`,
    `societe`
  )
VALUES
  (
    113,
    'BADEN',
    'Christian & Liliane',
    '',
    '',
    '01 48 89 78 85',
    'Liliane 06 19 19 67 06 \r\nChristian 06 60 72 03 32\r\n',
    'liliane.baden@yahoo.fr',
    'D',
    1,
    'Ancien Copro\r\nLionel ISSARTEL\r\n48 rue de la Fontaine 92350 Le plessis Robinson\r\n06 75 27 73 40\r\nlionel.issartel@wanadoo.fr\r\nVendu le 25/03/2020',
    NULL
  );
INSERT INTO
  `proprietaires` (
    `Id`,
    `nom`,
    `prenom`,
    `civilite`,
    `adresse`,
    `telephone`,
    `mobile`,
    `mail`,
    `batiment`,
    `resident`,
    `observations`,
    `societe`
  )
VALUES
  (
    115,
    'CRISTOFINI',
    'Floriane & Mathieu',
    'Madame et Monsieur',
    '6 rue Louis Braille',
    '',
    '07 82 08 53 77 Floriane\r\n06 49 30 55 75 Mathieu',
    'floriane.staffolani@gmail.com\r\nmathieu.cristofini@gmail.com',
    'C D',
    0,
    'Ancien copro \r\nRICORDI 131-260-331-332-409\r\nvendu le 31/05/2018\r\nGAUDUIN 129-258-329\r\nvendu le 01/02/2019\r\nBUTIN 77-217-326\r\nvendu le 01/02/2019',
    NULL
  );
INSERT INTO
  `proprietaires` (
    `Id`,
    `nom`,
    `prenom`,
    `civilite`,
    `adresse`,
    `telephone`,
    `mobile`,
    `mail`,
    `batiment`,
    `resident`,
    `observations`,
    `societe`
  )
VALUES
  (
    116,
    'BRACQUART',
    ' PIERRE GEORGES HENRI GERMAIN ',
    'Monsieur',
    ' 9 RUE ROSA BONHEUR  77300 FONTAINEBLEAU',
    '',
    '06 80 07 49 22',
    'pbrac@bbox.fr',
    '',
    0,
    '',
    NULL
  );
INSERT INTO
  `proprietaires` (
    `Id`,
    `nom`,
    `prenom`,
    `civilite`,
    `adresse`,
    `telephone`,
    `mobile`,
    `mail`,
    `batiment`,
    `resident`,
    `observations`,
    `societe`
  )
VALUES
  (
    117,
    'SANTANA',
    'Laetitia',
    'Mlle',
    '7 avenue du touring club',
    '',
    '06 75 20 63 19',
    'l.santana@live.fr',
    '',
    1,
    '',
    NULL
  );
INSERT INTO
  `proprietaires` (
    `Id`,
    `nom`,
    `prenom`,
    `civilite`,
    `adresse`,
    `telephone`,
    `mobile`,
    `mail`,
    `batiment`,
    `resident`,
    `observations`,
    `societe`
  )
VALUES
  (
    118,
    'FREITAS',
    'Loic',
    'Monsieur',
    '7 avenue du touring club 77300 bat B',
    '',
    '',
    'loicfreitas2@gmail.com',
    '',
    1,
    '',
    NULL
  );
INSERT INTO
  `proprietaires` (
    `Id`,
    `nom`,
    `prenom`,
    `civilite`,
    `adresse`,
    `telephone`,
    `mobile`,
    `mail`,
    `batiment`,
    `resident`,
    `observations`,
    `societe`
  )
VALUES
  (
    119,
    'HARDY',
    '',
    'Monsieur',
    '13 rue de laSalle 77930 CELY EN BIERRE',
    '',
    '06 78 67 07 10',
    '',
    '',
    0,
    '',
    NULL
  );
INSERT INTO
  `proprietaires` (
    `Id`,
    `nom`,
    `prenom`,
    `civilite`,
    `adresse`,
    `telephone`,
    `mobile`,
    `mail`,
    `batiment`,
    `resident`,
    `observations`,
    `societe`
  )
VALUES
  (
    121,
    'HADJI',
    'Patricia',
    'Madame',
    'inconnue',
    'Pro AG3C\r\n01 64 22 15 37\r\n\r\ncontact\r\n\r\nM NOILLEAU décorateur\r\n06 36 56 86 34',
    '',
    'patricia.hadji@gmail.com',
    '',
    0,
    'Ancien appartement de VERNUS jacques,appartement disjoint qui comportait le lot 18 et 19\r\nLot 18, 167, 274 vendu le 18/10/2017 a SQCI DAD\r\nL\'autre partie 19,164, 402 vendu le 18/10/207 à HADJI\r\nles lots 106-107-235-374 appartenait à JACQUEMIN et vendu à HADJI le 19/09/2019',
    NULL
  );
INSERT INTO
  `proprietaires` (
    `Id`,
    `nom`,
    `prenom`,
    `civilite`,
    `adresse`,
    `telephone`,
    `mobile`,
    `mail`,
    `batiment`,
    `resident`,
    `observations`,
    `societe`
  )
VALUES
  (
    122,
    'SCI JIROLLE DELCAMBRE',
    '',
    '',
    '27 Avenue Franklin Roosevelt\r\n77210',
    '',
    '',
    '',
    '',
    0,
    '',
    NULL
  );
INSERT INTO
  `proprietaires` (
    `Id`,
    `nom`,
    `prenom`,
    `civilite`,
    `adresse`,
    `telephone`,
    `mobile`,
    `mail`,
    `batiment`,
    `resident`,
    `observations`,
    `societe`
  )
VALUES
  (
    123,
    'LEMOINE',
    'JEAN JACQUES',
    'M',
    '1 voie de la liberté\r\n77870 VULAINES SUR SEINE',
    '01 60 87 69 29',
    '06 61 63 72 99',
    'csp.level.red814@notaires.fr',
    '',
    0,
    'Proprio depuis 1986',
    NULL
  );
INSERT INTO
  `proprietaires` (
    `Id`,
    `nom`,
    `prenom`,
    `civilite`,
    `adresse`,
    `telephone`,
    `mobile`,
    `mail`,
    `batiment`,
    `resident`,
    `observations`,
    `societe`
  )
VALUES
  (
    124,
    'VIDAL',
    'Henri',
    '',
    'Résidence Chateau d\'Acadue\r\n1205 Av Temerland - Bat C\r\n64200 BIARRITZ3536348',
    '',
    '',
    '',
    '',
    0,
    'Père de Eric Vidal\r\nLe lot 353 est jumelé avec le 354 d\'Eric',
    NULL
  );
INSERT INTO
  `proprietaires` (
    `Id`,
    `nom`,
    `prenom`,
    `civilite`,
    `adresse`,
    `telephone`,
    `mobile`,
    `mail`,
    `batiment`,
    `resident`,
    `observations`,
    `societe`
  )
VALUES
  (
    125,
    'SCI JOCAT RODRIGUES M & Mme ',
    'José & Catherine',
    'M',
    '16 bis route de Fontainebleau 77930\r\nCHAILLY EN BIERE',
    '',
    '06 89 45 16 57',
    'sarljcn@wanadoo.fr',
    'C',
    0,
    'Appartement destiné à la location\r\nPropriétaire précédent LARGEAU père\r\nvendu le 27/02/2018 85000',
    NULL
  );
INSERT INTO
  `proprietaires` (
    `Id`,
    `nom`,
    `prenom`,
    `civilite`,
    `adresse`,
    `telephone`,
    `mobile`,
    `mail`,
    `batiment`,
    `resident`,
    `observations`,
    `societe`
  )
VALUES
  (
    126,
    'HEMMERLE',
    'Alain',
    'Monsieur',
    '',
    '',
    '06 68 60 42 60',
    '',
    '',
    0,
    '',
    NULL
  );
INSERT INTO
  `proprietaires` (
    `Id`,
    `nom`,
    `prenom`,
    `civilite`,
    `adresse`,
    `telephone`,
    `mobile`,
    `mail`,
    `batiment`,
    `resident`,
    `observations`,
    `societe`
  )
VALUES
  (
    127,
    'MAHAYNI',
    'Mohamed',
    'Monsieur',
    '7 avenue du touring club',
    '',
    '+33 6 25 82 65 57',
    'm_mahayni@outlook.com',
    '',
    1,
    'Ancien Copro SHAEFFERqui a \r\nVedu le 04/02/2019\r\nà LEVY Didier DL IMMOBILIER a \r\nVENDU le 10/072019\r\na M MAHAYNI 141500 € ',
    NULL
  );
INSERT INTO
  `proprietaires` (
    `Id`,
    `nom`,
    `prenom`,
    `civilite`,
    `adresse`,
    `telephone`,
    `mobile`,
    `mail`,
    `batiment`,
    `resident`,
    `observations`,
    `societe`
  )
VALUES
  (
    128,
    'VERNES Editions artistiques ',
    'Frederic',
    'Monsieur',
    '',
    '',
    '06 61 77 68 53',
    'jfredericvernes@gmail.com',
    'B',
    0,
    'Ancien Copro De PHILY qui a gardé le grenier 285\r\nVendu le 30/08/2029\r\nM VERNES est le gérant des éditions artistiques',
    NULL
  );
INSERT INTO
  `proprietaires` (
    `Id`,
    `nom`,
    `prenom`,
    `civilite`,
    `adresse`,
    `telephone`,
    `mobile`,
    `mail`,
    `batiment`,
    `resident`,
    `observations`,
    `societe`
  )
VALUES
  (
    129,
    'MORVAN',
    'Frederic',
    '',
    '7 avenue du touring club ',
    '',
    '06 13 53 38 22',
    'morvanfrederic@yahoo.fr',
    'C',
    1,
    'Ancien proprio FISHARD\r\nVENDU LE 17/15/2018',
    NULL
  );
INSERT INTO
  `proprietaires` (
    `Id`,
    `nom`,
    `prenom`,
    `civilite`,
    `adresse`,
    `telephone`,
    `mobile`,
    `mail`,
    `batiment`,
    `resident`,
    `observations`,
    `societe`
  )
VALUES
  (
    130,
    'POINTEAU',
    'Joel',
    '',
    '',
    '',
    '06 87 27 30 73',
    'nomail@nomail',
    'C',
    0,
    'Ancien proprio MARIN TRAINOR\r\nVendu le 12/10/2018',
    NULL
  );
INSERT INTO
  `proprietaires` (
    `Id`,
    `nom`,
    `prenom`,
    `civilite`,
    `adresse`,
    `telephone`,
    `mobile`,
    `mail`,
    `batiment`,
    `resident`,
    `observations`,
    `societe`
  )
VALUES
  (
    131,
    'QUENESSON',
    '',
    '',
    '',
    '',
    '',
    'toto@rien.fr',
    'D',
    1,
    'Achat le 10/08/2017 a son fils PICARD',
    NULL
  );
INSERT INTO
  `proprietaires` (
    `Id`,
    `nom`,
    `prenom`,
    `civilite`,
    `adresse`,
    `telephone`,
    `mobile`,
    `mail`,
    `batiment`,
    `resident`,
    `observations`,
    `societe`
  )
VALUES
  (
    132,
    'BERTHAU',
    'Nicolas',
    '',
    '',
    '',
    '06 51 69 49 18',
    '',
    'C',
    0,
    'Ancien proprio BURON\r\nVendu le 18/12/2019',
    NULL
  );
INSERT INTO
  `proprietaires` (
    `Id`,
    `nom`,
    `prenom`,
    `civilite`,
    `adresse`,
    `telephone`,
    `mobile`,
    `mail`,
    `batiment`,
    `resident`,
    `observations`,
    `societe`
  )
VALUES
  (
    133,
    'FOURNY',
    'Colette',
    '',
    '',
    '',
    '06 30 15 89 66',
    'fournycolette@yahoo.fr',
    '',
    1,
    'Ancien propriétaire du lot\r\nMARIE MARTIN\r\nVendu le 10/06/2019\r\nColette FOURNY est aussi locataire du lot 131',
    NULL
  );
INSERT INTO
  `proprietaires` (
    `Id`,
    `nom`,
    `prenom`,
    `civilite`,
    `adresse`,
    `telephone`,
    `mobile`,
    `mail`,
    `batiment`,
    `resident`,
    `observations`,
    `societe`
  )
VALUES
  (
    134,
    'testdsqd',
    '',
    'Madame',
    '',
    '',
    '',
    '',
    'B',
    1,
    '',
    ''
  );

/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
