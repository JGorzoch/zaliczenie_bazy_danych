CREATE VIEW `zapytanie1` AS
    SELECT 
        `auta`.`ID` AS `ID`,
        `auta`.`Model` AS `Model`,
        `auta`.`Marka` AS `Marka`,
        `auta`.`Rok` AS `Rok`,
        `auta`.`cena` AS `Cena`
    FROM
        `auta`
    ORDER BY `auta`.`cena`;

CREATE VIEW `zapytanie2` AS
    SELECT 
        `klienci`.`ID` AS `ID`,
        `klienci`.`Nazwisko` AS `Nazwisko`,
        `klienci`.`Imie` AS `Imie`,
        `klienci`.`Adres` AS `Adres`,
        `klienci`.`Miasto` AS `Miasto`,
        `klienci`.`Wiek` AS `Wiek`,
        `klienci`.`Czas_prawojazdy` AS `Czas_prawojazdy`
    FROM
        `klienci`
    WHERE
        (`klienci`.`Czas_prawojazdy` > 10);

CREATE VIEW `zapytanie3` AS
    SELECT 
        `klienci`.`Imie` AS `Imie`,
        `klienci`.`Nazwisko` AS `Nazwisko`,
        `auta`.`Model` AS `Model`
    FROM
        (`klienci`
        JOIN `auta`)
    WHERE
        (`klienci`.`ID` = `auta`.`ID`);

CREATE VIEW `zapytanie4` AS
    SELECT 
        `cennik`.`ID` AS `ID`,
        `cennik`.`IdAuta` AS `IdAuta`,
        `cennik`.`IleDni` AS `IleDni`,
        `cennik`.`CenaZaDzien` AS `CenaZaDzien`
    FROM
        `cennik`
    WHERE
        (`cennik`.`IleDni` > 7)
    LIMIT 1;

CREATE VIEW `zapytanie5` AS
    SELECT 
        `pracownicy`.`ID` AS `ID`,
        `pracownicy`.`Nazwisko` AS `Nazwisko`,
        `pracownicy`.`Imie` AS `Imie`,
        `pracownicy`.`Adres` AS `Adres`,
        `pracownicy`.`Wiek` AS `Wiek`,
        `pracownicy`.`DataZatrodnienia` AS `DataZatrodnienia`
    FROM
        `pracownicy`
    WHERE
        (`pracownicy`.`DataZatrodnienia` BETWEEN '2014-01-01' AND '2020-01-01');

CREATE VIEW `zapytanie6` AS
    SELECT 
        `klienci`.`ID` AS `ID`,
        `klienci`.`Nazwisko` AS `Nazwisko`,
        `klienci`.`Imie` AS `Imie`,
        `klienci`.`Czas_prawojazdy` AS `Czas_prawojazdy`,
        `cennik`.`IleDni` AS `IleDni`,
        `cennik`.`CenaZaDzien` AS `CenaZaDzien`,
        IF((`klienci`.`Czas_prawojazdy` > 15),
            (`cennik`.`CenaZaDzien` * 0.85),
            `cennik`.`CenaZaDzien`) AS `IF(Czas_prawojazdy>15, CenaZaDzien * 0.85, CenaZaDzien )`
    FROM
        (`klienci`
        JOIN `cennik`)
    ORDER BY `klienci`.`Czas_prawojazdy` DESC;
    
    CREATE VIEW `inner_join` AS
    SELECT 
        `wypozyczenia`.`ID` AS `ID`,
        `wypozyczenia`.`DataWypozyczenia` AS `DataWypozyczenia`,
        `wypozyczenia`.`status` AS `status`,
        `klienci`.`Nazwisko` AS `Nazwisko`,
        `klienci`.`Czas_prawojazdy` AS `Czas_prawojazdy`,
        `auta`.`Model` AS `Model`
    FROM
        ((`wypozyczenia`
        JOIN `klienci` ON ((`wypozyczenia`.`ID` = `klienci`.`ID`)))
        JOIN `auta` ON ((`wypozyczenia`.`ID` = `auta`.`ID`)));