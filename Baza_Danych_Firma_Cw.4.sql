
-- Zadanie 1
CREATE DATABASE Firma; --Utworzenie bazy danych

--Zadnaie 2
CREATE SCHEMA Rozliczenia; --Utworzenie schematu



--Zadanie 3

--Dodanie czterech tabeli do schematu Rozliczenia:

CREATE TABLE Rozliczenia.Pracownicy (
ID_pracownika INT PRIMARY KEY NOT NULL, --Klucz g³ówny prosty
Imie NVARCHAR(50) NOT NULL,
Nazwisko NVARCHAR(50) NOT NULL,
Adres NVARCHAR(255),
Telefon INT 
);


CREATE TABLE Rozliczenia.Godziny (
ID_godziny INT PRIMARY KEY NOT NULL, --Klucz g³ówny prosty
Dzieñ DATE NOT NULL,
Liczba_godzin FLOAT NOT NULL,
ID_pracownika INT, --Klucz obcy
);


CREATE TABLE Rozliczenia.Premie (
ID_premii INT PRIMARY KEY NOT NULL, --Klucz g³ówny prosty
Rodzaj NVARCHAR(50),
Kwota FLOAT NOT NULL DEFAULT 0
);


CREATE TABLE Rozliczenia.Pensje (
ID_pensji INT PRIMARY KEY NOT NULL, --Klucz g³ówny prosty
Stanowisko NVARCHAR(100) NOT NULL,
Kwota FLOAT NOT NULL,
ID_premii INT, --Klucz obcy
);


--Zmodyfikowanie tabeli Godziny za pomoc¹ polecenia ALTER TABLE (dodanie klucza obcego z³o¿onego):
ALTER TABLE Rozliczenia.Godziny ADD CONSTRAINT FKey FOREIGN KEY (ID_pracownika) REFERENCES Rozliczenia.Pracownicy (ID_pracownika);

--Zmodyfikowanie tabeli Pensje za pomoc¹ polecenia ALTER TABLE (dodanie klucza obcego z³o¿onego):
ALTER TABLE Rozliczenia.Pensje ADD CONSTRAINT FKey2 FOREIGN KEY (ID_premii) REFERENCES Rozliczenia.Premie (ID_premii);




--Zadanie 4

-- Wype³nienie tabeli Pracownicy 10 rekordami: 
INSERT INTO Rozliczenia.Pracownicy VALUES(1, 'Koj', 'Adam', '31867 Kraków al.Mickiewicza 15', 885632417);
INSERT INTO Rozliczenia.Pracownicy VALUES(2, 'Koc', 'Ewa', '22005 Warszawa ul.Maki 22/34', 226547813);
INSERT INTO Rozliczenia.Pracownicy VALUES(3, 'Maj', 'Stefan', '32890 Bochnia ul.Zwierzyniecka 5', 998547654);
INSERT INTO Rozliczenia.Pracownicy VALUES(4, 'Kowalski', 'Mateusz', '32768 Wieliczka ul.Dobrzycka 78/1', 475654128);
INSERT INTO Rozliczenia.Pracownicy VALUES(5, 'Nowak', 'Katarzyna', '33657 Niepo³omice ul.D¹browskiej 80', 665862493);
INSERT INTO Rozliczenia.Pracownicy VALUES(6, 'Adamczyk', 'Jan', '30059 Kraków ul.Prosta 65/45', 557259352);
INSERT INTO Rozliczenia.Pracownicy VALUES(7, 'Kula', 'Weronika', '35890 Katowice ul.Magnoliowa 1b', 968542889);
INSERT INTO Rozliczenia.Pracownicy VALUES(8, 'Las', 'Filip', '70388 Lublin ul.Zak¹tek 3/49', 557236487);
INSERT INTO Rozliczenia.Pracownicy VALUES(9, 'Drabek', 'Natalia', '31098 Kraków ul.Krótka 56', 981547992);
INSERT INTO Rozliczenia.Pracownicy VALUES(10, 'Maj', 'Wojciech', '90001 £ódŸ ul.D¹browskiej 3a', 585264153);


-- Wype³nienie tabeli Godziny 10 rekordami: 
INSERT INTO Rozliczenia.Godziny VALUES(1, '2022-03-22', 6, 2);
INSERT INTO Rozliczenia.Godziny VALUES(2, '2022-03-22', 7, 4);
INSERT INTO Rozliczenia.Godziny VALUES(3, '2022-03-22', 7, 5);
INSERT INTO Rozliczenia.Godziny VALUES(4, '2022-03-22', 6, 8);
INSERT INTO Rozliczenia.Godziny VALUES(5, '2022-03-22', 5, 9); 
INSERT INTO Rozliczenia.Godziny VALUES(6, '2022-03-23', 4, 1);
INSERT INTO Rozliczenia.Godziny VALUES(7, '2022-03-23', 6, 3);
INSERT INTO Rozliczenia.Godziny VALUES(8, '2022-03-23', 8, 6);
INSERT INTO Rozliczenia.Godziny VALUES(9, '2022-03-23', 6, 7);
INSERT INTO Rozliczenia.Godziny VALUES(10, '2022-03-23', 7, 10);


-- Wype³nienie tabeli Premie 10 rekordami: 
INSERT INTO Rozliczenia.Premie VALUES(1, 'Za obni¿enie kosztów dzia³alnoœci', 200); 
INSERT INTO Rozliczenia.Premie VALUES(2, 'Za obni¿enie kosztów dzia³alnoœci', 200); 
INSERT INTO Rozliczenia.Premie VALUES(3, 'Za poprawê jakoœci', 100); 
INSERT INTO Rozliczenia.Premie VALUES(4, 'Za poprawê jakoœci', 100);
INSERT INTO Rozliczenia.Premie VALUES(5, 'Za poprawê jakoœci', 100); 
INSERT INTO Rozliczenia.Premie VALUES(6, 'Za wyniki sprzeda¿y', 100); 
INSERT INTO Rozliczenia.Premie VALUES(7, 'Za wyniki sprzeda¿y', 100); 
INSERT INTO Rozliczenia.Premie VALUES(8, 'Za wyniki sprzeda¿y', 100);
INSERT INTO Rozliczenia.Premie VALUES(9, 'Za przedterminowe wykonanie zadañ', 150);
INSERT INTO Rozliczenia.Premie VALUES(10, 'Za przedterminowe wykonanie zadañ', 150);


-- Wype³nienie tabeli Pensje 10 rekordami: 
INSERT INTO Rozliczenia.Pensje VALUES(1, 'Kierownik dzia³u sprzeda¿y', 4500, 1);
INSERT INTO Rozliczenia.Pensje VALUES(2, 'Kierownik zespo³u', 4000, 3);
INSERT INTO Rozliczenia.Pensje VALUES(3, 'Zastêpca kierownika zespo³u', 3500, 4);
INSERT INTO Rozliczenia.Pensje VALUES(4, 'Pierownik projektu', 4000, 10); 
INSERT INTO Rozliczenia.Pensje VALUES(5, 'Przedstawiciel handlowy', 3000, 6);
INSERT INTO Rozliczenia.Pensje VALUES(6, 'Przedstawiciel handlowy', 3000, 7);
INSERT INTO Rozliczenia.Pensje VALUES(7, 'Product Manager', 4000, 5);
INSERT INTO Rozliczenia.Pensje VALUES(8, 'Kierownik dostaw', 4000, 2);
INSERT INTO Rozliczenia.Pensje VALUES(9, 'Zastêpca kierownika dostaw', 3500, 9);
INSERT INTO Rozliczenia.Pensje VALUES(10, 'Specjalista ds. obs³ugi klienta', 3000, 8);


--Zadanie 5

SELECT Nazwisko, Adres FROM Rozliczenia.Pracownicy; --Wyœwietlenie nazwisk oraz adresów pracowników


--Zadanie 6

SELECT DATEPART(MM, Dzieñ) AS Miesi¹c,
DATEPART(dd, Dzieñ) AS Dzieñ
FROM Rozliczenia.Godziny;  -- Wyœwietlenie informacji o tym, który to dzieñ tygodnia i który miesi¹c (numery)


SET LANGUAGE Polish
SELECT DATENAME(MM, Dzieñ) AS Miesi¹c,
DATENAME(weekday, Dzieñ) AS Dzieñ
FROM Rozliczenia.Godziny;  -- Wyœwietlenie informacji o tym, jaki to dzieñ tygodnia i jaki miesi¹c (nazwy)


--Zadanie 7

EXEC SP_RENAME 'Rozliczenia.Pensje.Kwota', 'Kwota_brutto';

ALTER TABLE Rozliczenia.Pensje ADD Kwota_netto AS Pensje.Kwota_brutto*0.7

SELECT * FROM Rozliczenia.Pensje;
