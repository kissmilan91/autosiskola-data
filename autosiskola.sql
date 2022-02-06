﻿--
-- Script was generated by Devart dbForge Studio 2020 for MySQL, Version 9.0.689.0
-- Product home page: http://www.devart.com/dbforge/mysql/studio
-- Script date 2022. 02. 05. 20:58:59
-- Server version: 10.4.11
-- Client version: 4.1
--

-- 
-- Disable foreign keys
-- 
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

-- 
-- Set SQL mode
-- 
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 
-- Set character set the client will use to send SQL statements to the server
--
SET NAMES 'utf8';

--
-- Set default database
--
USE autosiskola;

--
-- Drop table `elmeleti_targyak`
--
DROP TABLE IF EXISTS elmeleti_targyak;

--
-- Drop table `gyakorlati_oraszamok`
--
DROP TABLE IF EXISTS gyakorlati_oraszamok;

--
-- Drop table `oktatok`
--
DROP TABLE IF EXISTS oktatok;

--
-- Drop table `tanulok`
--
DROP TABLE IF EXISTS tanulok;

--
-- Drop table `oktato_jarmuvek`
--
DROP TABLE IF EXISTS oktato_jarmuvek;

--
-- Drop table `kategoriak`
--
DROP TABLE IF EXISTS kategoriak;

--
-- Set default database
--
USE autosiskola;

--
-- Create table `kategoriak`
--
CREATE TABLE kategoriak (
  ID INT(11) NOT NULL AUTO_INCREMENT,
  Kategoria VARCHAR(6) DEFAULT NULL,
  Elmeleti_oraszam INT(11) DEFAULT NULL,
  Gyakorlati_oraszam INT(11) DEFAULT NULL,
  PRIMARY KEY (ID)
)
ENGINE = INNODB,
AUTO_INCREMENT = 12,
AVG_ROW_LENGTH = 2978,
CHARACTER SET utf8,
COLLATE utf8_hungarian_ci;

--
-- Create table `oktato_jarmuvek`
--
CREATE TABLE oktato_jarmuvek (
  ID INT(11) NOT NULL AUTO_INCREMENT,
  Oktatoi_engedely_szama VARCHAR(255) DEFAULT NULL,
  Oktatoi_engedely_ervenyessege DATE DEFAULT NULL,
  Forgalmi_engedely_szama VARCHAR(255) DEFAULT NULL,
  Rendszam VARCHAR(255) DEFAULT NULL,
  Gepjarmu_gyartmany VARCHAR(255) DEFAULT NULL,
  Gepjarmu_tipus VARCHAR(255) DEFAULT NULL,
  Oktathato_kategoria INT(11) DEFAULT NULL,
  PRIMARY KEY (ID)
)
ENGINE = INNODB,
AUTO_INCREMENT = 14,
AVG_ROW_LENGTH = 1365,
CHARACTER SET utf8,
COLLATE utf8_hungarian_ci;

--
-- Create foreign key
--
ALTER TABLE oktato_jarmuvek 
  ADD CONSTRAINT FK_oktato_jarmuvek_Oktathato_kategoria FOREIGN KEY (Oktathato_kategoria)
    REFERENCES kategoriak(ID) ON DELETE NO ACTION;

--
-- Create table `tanulok`
--
CREATE TABLE tanulok (
  ID INT(11) NOT NULL AUTO_INCREMENT,
  Vezeteknev VARCHAR(255) DEFAULT NULL,
  Keresztnev VARCHAR(255) DEFAULT NULL,
  Harmadiknev VARCHAR(255) DEFAULT NULL,
  Anyja_neve VARCHAR(255) DEFAULT NULL,
  Szuletesi_orszag VARCHAR(255) DEFAULT NULL,
  Szuletesi_hely VARCHAR(255) DEFAULT NULL,
  Szuletesi_ido DATE DEFAULT NULL,
  Allampolgarsag VARCHAR(255) DEFAULT NULL,
  Lakcim_irsz INT(11) DEFAULT NULL,
  Lakcim_telepules VARCHAR(255) DEFAULT NULL,
  Lakcim_utca VARCHAR(255) DEFAULT NULL,
  Lakcim_hazszam INT(11) DEFAULT NULL,
  Lakcim_egyeb VARCHAR(255) DEFAULT NULL,
  Ertesitesi_cim_irsz INT(11) DEFAULT NULL,
  Ertesitesi_cim_telepules VARCHAR(255) DEFAULT NULL,
  Ertesitesi_cim_utca VARCHAR(255) DEFAULT NULL,
  Ertesitesi_cim_hazszam INT(11) DEFAULT NULL,
  Ertesitesi_cim_egyeb VARCHAR(255) DEFAULT NULL,
  Email VARCHAR(50) DEFAULT NULL,
  Telefonszam VARCHAR(255) DEFAULT NULL,
  Szemelyiigazolvany_szama VARCHAR(255) DEFAULT NULL,
  Szemelyiigazolvany_ervenyesseg DATE DEFAULT NULL,
  Szemelyiigazolvany_kiallito_orszag VARCHAR(255) DEFAULT NULL,
  Jogositvany_szama VARCHAR(255) DEFAULT NULL,
  Jogositvany_ervenyesseg DATE DEFAULT NULL,
  Egeszsegugyi_csoportkod INT(6) DEFAULT NULL,
  Jogositvany_kiallito_orszag VARCHAR(255) DEFAULT NULL,
  Gondviselo_Email VARCHAR(50) DEFAULT NULL,
  Gondviselo_Telefonszam VARCHAR(255) DEFAULT NULL,
  Valasztott_kategoria INT(11) DEFAULT NULL,
  Valasztott_gyakorlati_oktato_jarmu INT(11) DEFAULT NULL,
  Felhasznalonev VARCHAR(10) DEFAULT NULL,
  Jelszo VARBINARY(32) DEFAULT NULL,
  PRIMARY KEY (ID)
)
ENGINE = INNODB,
AUTO_INCREMENT = 4,
AVG_ROW_LENGTH = 5461,
CHARACTER SET utf8,
COLLATE utf8_hungarian_ci;

--
-- Create foreign key
--
ALTER TABLE tanulok 
  ADD CONSTRAINT FK_tanulok_Valasztott_gyakorlati_oktato FOREIGN KEY (Valasztott_gyakorlati_oktato_jarmu)
    REFERENCES oktato_jarmuvek(ID) ON DELETE NO ACTION;

--
-- Create foreign key
--
ALTER TABLE tanulok 
  ADD CONSTRAINT FK_tanulok_Valasztott_kategoria FOREIGN KEY (Valasztott_kategoria)
    REFERENCES kategoriak(ID) ON DELETE NO ACTION;

--
-- Create table `oktatok`
--
CREATE TABLE oktatok (
  ID INT(11) NOT NULL AUTO_INCREMENT,
  Vezeteknev VARCHAR(255) DEFAULT NULL,
  Keresztnev VARCHAR(255) DEFAULT NULL,
  Harmadiknev VARCHAR(255) DEFAULT NULL,
  Anyja_neve VARCHAR(255) DEFAULT NULL,
  Szuletesi_orszag VARCHAR(255) DEFAULT NULL,
  Szuletesi_hely VARCHAR(255) DEFAULT NULL,
  Szuletesi_ido DATE DEFAULT NULL,
  Allampolgarsag VARCHAR(255) DEFAULT NULL,
  Lakcim_irsz INT(11) DEFAULT NULL,
  Lakcim_telepules VARCHAR(255) DEFAULT NULL,
  Lakcim_utca VARCHAR(255) DEFAULT NULL,
  Lakcim_hazszam INT(11) DEFAULT NULL,
  Lakcim_egyeb VARCHAR(255) DEFAULT NULL,
  Email VARCHAR(50) DEFAULT NULL,
  Telefonszam VARCHAR(255) DEFAULT NULL,
  Szemelyiigazolvany_szama VARCHAR(255) DEFAULT NULL,
  Jogositvany_szama VARCHAR(255) DEFAULT NULL,
  Oktato_azonosito INT(11) DEFAULT NULL,
  Oktato_jarmu INT(11) DEFAULT NULL,
  Oktathato_kategoria INT(11) DEFAULT NULL,
  felhasznalonev VARCHAR(10) DEFAULT NULL,
  jelszo VARBINARY(32) DEFAULT NULL,
  PRIMARY KEY (ID)
)
ENGINE = INNODB,
AUTO_INCREMENT = 5,
AVG_ROW_LENGTH = 5461,
CHARACTER SET utf8,
COLLATE utf8_hungarian_ci;

--
-- Create foreign key
--
ALTER TABLE oktatok 
  ADD CONSTRAINT FK_oktatok_Oktathato_kategoria FOREIGN KEY (Oktathato_kategoria)
    REFERENCES kategoriak(ID) ON DELETE NO ACTION;

--
-- Create foreign key
--
ALTER TABLE oktatok 
  ADD CONSTRAINT FK_oktatok_Oktato_jarmu FOREIGN KEY (Oktato_jarmu)
    REFERENCES oktato_jarmuvek(ID) ON DELETE NO ACTION;

--
-- Create table `gyakorlati_oraszamok`
--
CREATE TABLE gyakorlati_oraszamok (
  Kategoria_ID INT(11) DEFAULT NULL,
  A INT(11) DEFAULT NULL,
  Fv INT(11) DEFAULT NULL,
  Fo INT(11) DEFAULT NULL,
  Fh INT(11) DEFAULT NULL,
  Fe INT(11) DEFAULT NULL,
  Fk INT(11) DEFAULT NULL
)
ENGINE = INNODB,
AVG_ROW_LENGTH = 2978,
CHARACTER SET utf8,
COLLATE utf8_hungarian_ci;

--
-- Create foreign key
--
ALTER TABLE gyakorlati_oraszamok 
  ADD CONSTRAINT FK_gyakorlati_oraszamok_Kategoria FOREIGN KEY (Kategoria_ID)
    REFERENCES kategoriak(ID) ON DELETE NO ACTION;

--
-- Create table `elmeleti_targyak`
--
CREATE TABLE elmeleti_targyak (
  Kategoria_id INT(11) DEFAULT NULL,
  K TINYINT(1) DEFAULT NULL,
  Je TINYINT(1) DEFAULT NULL,
  SZu TINYINT(1) DEFAULT NULL,
  Bu TINYINT(1) DEFAULT NULL,
  Mu TINYINT(1) DEFAULT NULL
)
ENGINE = INNODB,
AVG_ROW_LENGTH = 1489,
CHARACTER SET utf8,
COLLATE utf8_hungarian_ci;

--
-- Create foreign key
--
ALTER TABLE elmeleti_targyak 
  ADD CONSTRAINT FK_elmeleti_oraszamok_Kategoria_id FOREIGN KEY (Kategoria_id)
    REFERENCES kategoriak(ID) ON DELETE NO ACTION;

-- 
-- Dumping data for table kategoriak
--
INSERT INTO kategoriak VALUES
(1, 'B', 28, 29),
(2, 'C', 80, 29),
(3, 'D1', 40, 29),
(4, 'D', 28, 29),
(5, 'BE', 22, 16),
(6, 'C1E', 20, 14),
(7, 'CE', 20, 14),
(8, 'D1E', 22, 14),
(9, 'DE', 20, 14),
(10, 'AM', 16, 10),
(11, 'T', 56, 24);

-- 
-- Dumping data for table oktato_jarmuvek
--
INSERT INTO oktato_jarmuvek VALUES
(1, '852369', '2026-02-05', 'CK95784', 'ABC-123', 'Opel', 'Astra H', 1),
(2, '758945', '2030-02-05', 'BC57899', 'TTT-999', 'Ford', 'Mondeo', 1),
(3, '758945', '2024-02-05', 'AS75849', 'CCC-458', 'Man', NULL, 2),
(4, '154758', '2022-02-05', 'BF54785', 'KCM-111', 'DAF', NULL, 2),
(5, '256525', '2030-02-05', 'KJ49395', 'AAB-234', 'Ford', 'Tourneo', 3),
(6, '657866', '2026-02-05', 'KP64645', 'AAA-116', 'Scania', 'Touring', 4),
(7, '877744', '2022-02-05', 'ZG44447', 'PAP-416', 'Lakókocsi', NULL, 5),
(8, '485755', '2024-02-05', 'JK55566', 'KAP-435', 'Mercedes', NULL, 6),
(9, '795554', '2023-02-05', 'JU86849', 'LAK-578', 'Renault', NULL, 7),
(10, '887574', '2026-02-05', 'KJ59685', 'NEO-616', 'Neoplan', 'Tourliner', 8),
(11, '445877', '2040-02-05', 'EL78954', 'ELK-466', 'Volvo', 'Electric 7900', 9),
(12, '575214', '2022-02-05', 'TK52488', 'ACB-911', 'Piagio', '50', 10),
(13, '781112', '2024-02-05', 'AB12457', 'ABA-124', 'NewHolland', 'T6', 11);

-- 
-- Dumping data for table tanulok
--
INSERT INTO tanulok VALUES
(1, 'Tanul', 'Elek', NULL, 'Anyja', 'Magyarország', 'Tatabánya', '1992-02-05', 'magyar', 9026, 'Győr', 'Oktatás utca', 1, NULL, 9026, 'Győr', 'Oktatás utca', 1, NULL, 'tanulok@jedlik.eu', '+36/70-888-2222', '25487BC', '2026-02-05', 'Magyarország', 'BC45879', '2026-02-05', 101, 'Magyarország', 'anya@jedlik.eu', '+36/20-888-4444', 1, 2, 'DTE', x'54616E756C6F3132333435'),
(2, 'Buta', 'Jancsi', 'Péter', 'Erika', 'Szlovák', 'Komárno', '1990-12-05', 'szlovák', 9024, 'Győr', 'Lakatos utca', 8, '2/B', 9024, 'Győr', 'Lakatos utca', 8, NULL, 'lakatos@jedlik.eu', '+36/50-111-5858', '58745CC', '2022-02-05', 'Szlovákia', '', NULL, NULL, NULL, 'jancsika@jedlik.eu', '+36/50-111-2222', 10, 12, 'DBJ', x'54616E756C6F3132333435'),
(3, 'Bukta', 'Lívia', NULL, 'Viktória', 'Románia', 'Bukarest', '1998-02-05', 'román', 9022, 'Győr', 'Vas utca', 8, '6.em', 9022, 'Győr', 'Vas utca', 8, '6.em', 'vasas@jedlik.eu', '+36/96-514-555', '25142KC', '2024-02-05', 'Románia', NULL, NULL, NULL, NULL, 'vasanya@jedlik-eu', '+36/90-123-456', 11, 13, 'DBL', x'54616E756C6F3132333435');

-- 
-- Dumping data for table oktatok
--
INSERT INTO oktatok VALUES
(1, 'Teszt', 'Elek', NULL, 'Anya', 'Magyarország', 'Győr', '1966-01-06', 'magyar', 9024, 'Győr', 'Jedlik utca', 6, NULL, 't.elek@jedlik.eu', '+36/70-123-4567', 'AS5684', '6548BS', 54872, 1, 1, 'TE', x'54453132333435'),
(2, 'Nagy', 'László', 'Tamás', 'Apa', 'Magyarország', 'Veszprém', '1984-02-05', 'magyar', 9028, 'Győr', 'Pipacs utca', 4, NULL, 'nlt@jedlik.eu', '+36/30-858-1122', 'DS5487', '6857KC', 98758, 3, 2, 'NL', x'4E4C3132333435'),
(3, 'Potya', 'János', NULL, 'Cili', 'Németország', 'Bern', '1959-02-05', 'német', 8200, 'Veszprém', 'Kacsa utca', 55, NULL, 'p.jancsi@jedlik.eu', '+36/20-888-1597', 'HK5987', '2549LB', 74859, 5, 3, 'PJ', x'504A3132333435');

-- 
-- Dumping data for table gyakorlati_oraszamok
--
INSERT INTO gyakorlati_oraszamok VALUES
(1, 9, 20, 4, 0, 2, 0),
(2, 6, 23, 4, 2, 2, 0),
(3, 6, 23, 4, 2, 2, 0),
(4, 6, 23, 4, 2, 0, 0),
(5, 6, 10, 4, 2, 0, 0),
(6, 6, 8, 2, 2, 0, 0),
(7, 6, 8, 2, 2, 0, 0),
(8, 6, 8, 2, 2, 0, 0),
(9, 6, 8, 2, 2, 0, 0),
(10, 4, 6, 0, 0, 0, 0),
(11, 6, 18, 5, 0, 0, 4);

-- 
-- Dumping data for table elmeleti_targyak
--
INSERT INTO elmeleti_targyak VALUES
(1, 1, 1, 1, 0, 0),
(2, 1, 1, 1, 1, 1),
(3, 1, 1, 1, 1, 0),
(4, 1, 1, 1, 1, 0),
(5, 1, 1, 1, 1, 1),
(6, 1, 1, 1, 1, 0),
(7, 1, 1, 1, 1, 0),
(8, 1, 1, 1, 1, 1),
(9, 1, 1, 1, 1, 0),
(10, 1, 1, 0, 0, 0),
(11, 1, 1, 1, 1, 1);

-- 
-- Restore previous SQL mode
-- 
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;

-- 
-- Enable foreign keys
-- 
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;