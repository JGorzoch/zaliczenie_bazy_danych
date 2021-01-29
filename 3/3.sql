CREATE TABLE `auta` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Model` varchar(30) NOT NULL,
  `Marka` varchar(20) NOT NULL,
  `Rok` int NOT NULL DEFAULT '0',
  `cena` int NOT NULL,
  PRIMARY KEY (`ID`)
  );
  
  CREATE TABLE `cennik` (
  `ID` int NOT NULL,
  `IdAuta` int DEFAULT NULL,
  `IleDni` int DEFAULT NULL,
  `CenaZaDzien` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_IdAuta_idx` (`IdAuta`),
  CONSTRAINT `fk_IdAuta` FOREIGN KEY (`IdAuta`) REFERENCES `auta` (`ID`)
  );
  
  CREATE TABLE `klienci` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Nazwisko` varchar(30) DEFAULT NULL,
  `Imie` varchar(15) DEFAULT NULL,
  `Adres` varchar(50) DEFAULT NULL,
  `Miasto` varchar(30) DEFAULT NULL,
  `Wiek` int DEFAULT NULL,
  `Czas_prawojazdy` int DEFAULT NULL,
  PRIMARY KEY (`ID`)
  );
  
  CREATE TABLE `pracownicy` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Nazwisko` varchar(30) DEFAULT NULL,
  `Imie` varchar(15) DEFAULT NULL,
  `Adres` varchar(50) DEFAULT NULL,
  `Wiek` int DEFAULT NULL,
  `DataZatrodnienia` date DEFAULT NULL,
  PRIMARY KEY (`ID`)
  );
  
  CREATE TABLE `wypozyczenia` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `DataWypozyczenia` date DEFAULT NULL,
  `status` varchar(30) DEFAULT NULL,
  `IdAuta` int DEFAULT NULL,
  `IdPracownika` int DEFAULT NULL,
  `IdKlienta` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_IdPracownika_idx` (`IdPracownika`),
  KEY `fk_IdKlienta_idx` (`IdKlienta`),
  KEY `fk_IdAuta_idx` (`IdAuta`),
  CONSTRAINT `fk_IdAuta2` FOREIGN KEY (`IdAuta`) REFERENCES `auta` (`ID`),
  CONSTRAINT `fk_IdKlienta` FOREIGN KEY (`IdKlienta`) REFERENCES `klienci` (`ID`),
  CONSTRAINT `fk_IdPracownika` FOREIGN KEY (`IdPracownika`) REFERENCES `pracownicy` (`ID`)
);
  
  
  INSERT INTO `auta` VALUES (1,'M3 E30','BMW',1987,3000),(2,'Impala','Chevrolet',1960,1000),(3,'126p','Fiat',1974,500),(4,'Supra','Toyota',1993,6000),(5,'Golf mk1','Volkswagen',1977,700),(6,'Garbus','Volkswagen',1984,500);
  INSERT INTO `cennik` VALUES (1,NULL,5,95),(2,NULL,14,85),(3,NULL,30,75),(4,NULL,99999999,70);
  INSERT INTO `klienci` VALUES (1,'Walczak','Patrycja','Konarskiego Stanisława 98A/29','02-494 Konin',25,3),(2,'Bąk','Mieszko','Piękna 74A','77-007 Śrem',34,8),(3,'Michalska','Dorota','Spacerowa 24/00','80-050 Nowy Sącz',19,1),(4,'Pawlak','Paulina','Fiołkowa 66A','21-767 Jawor',42,12),(5,'Piotrowska','Lena','Hutnicza 22A','73-554 Bydgoszcz',40,20),(6,'Sokołowski','Eryk','Wierzbowa 85','62-853 Nowa Sól',68,50),(7,'Grabowski','Piotr','Harcerska 53A','37-731 Sandomierz',25,5),(8,'Baran','Norbert','Truskawkowa 00/51','19-920 Żyrardów',39,15),(9,'Kwiatkowska','Sara','Polna 40','00-146 Lubojenka',58,40),(10,'Kubiak','Marcel','Reja Mikołaja 10A/04','15-702 Franciszków',25,2);
  INSERT INTO `pracownicy` VALUES (1,'Mazur','Aurelia','Staromiejska 79A, 87-769 Krotoszyn',22,'2018-02-15'),(2,'Czerwiński','Maurycy','Długosza Jana 60A, 70-033 Ostróda',50,'1980-03-23'),(3,'Brzeziński','Iwo','Grójecka 51A/06, 84-550 Bełchatów',29,'2014-02-02'),(4,'Mazurek','Wiktoria','Poprzeczna 06/64, 99-389 Skierniewice',36,'2016-09-24');
  INSERT INTO `wypozyczenia` VALUES (1,'2020-02-26','jest',NULL,NULL,NULL),(2,'2021-01-16','jest',NULL,NULL,NULL),(3,'2020-09-05','jest',NULL,NULL,NULL),(4,'2020-04-10','jest',NULL,NULL,NULL),(5,'2020-09-07','jest',NULL,NULL,NULL),(6,'2021-04-01','jest',NULL,NULL,NULL),(7,'2020-02-10','jest',NULL,NULL,NULL),(8,'2020-11-18','jest',NULL,NULL,NULL),(9,'2020-01-02','jest',NULL,NULL,NULL),(12,'2020-06-01','Niema',NULL,NULL,NULL),(13,NULL,'jest',NULL,NULL,NULL);
