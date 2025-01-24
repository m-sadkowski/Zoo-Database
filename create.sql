CREATE TABLE Osoby (
    id_osoby INT PRIMARY KEY, 
    imie VARCHAR(30) NOT NULL, 
    nazwisko VARCHAR(30) NOT NULL, 
    numer_telefonu CHAR(12) NOT NULL CHECK (numer_telefonu LIKE '+%[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'), 
    e_mail VARCHAR(100) CHECK (e_mail LIKE '%@%.%'),
    zdjecie VARBINARY(MAX), 
    pesel CHAR(11) NOT NULL CHECK (pesel LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'), 
    data_urodzenia DATE NOT NULL
);

CREATE TABLE Pracownicy (
    id_osoby INT PRIMARY KEY REFERENCES Osoby(id_osoby), 
    data_zatrudnienia DATE NOT NULL, 
    placa DECIMAL(10, 2) NOT NULL CHECK (placa >= 0), 
    data_zwolnienia DATE
);

CREATE TABLE Kierownicy (
    id_osoby INT PRIMARY KEY REFERENCES Pracownicy(id_osoby), 
    typ VARCHAR(50) NOT NULL CHECK (typ IN ('Kierownik Sekcji', 'Kierownik ZOO', 'Kierownik Magazynu'))
);

CREATE TABLE Opiekunowie (
    id_opiekuna INT PRIMARY KEY REFERENCES Pracownicy(id_osoby), 
    data_ostatnich_badan DATE NOT NULL
);

CREATE TABLE Wybiegi (
    numer_wybiegu SMALLINT PRIMARY KEY, 
    typ_wybiegu VARCHAR(30) NOT NULL CHECK (typ_wybiegu IN ('Klatka', 'Terrarium', 'Akwarium', 'Wybieg wewnêtrzny', 'Wybieg zewnêtrzny')), 
    pojemnosc SMALLINT NOT NULL CHECK (pojemnosc > 0), 
    id_opiekuna INT NOT NULL REFERENCES Opiekunowie(id_opiekuna), 
    nazwa_sekcji VARCHAR(30) NOT NULL
);

CREATE TABLE Sekcje (
    nazwa_sekcji VARCHAR(30) PRIMARY KEY, 
    lokalizacja VARCHAR(50) NOT NULL
);

CREATE TABLE Gatunki (
    nazwa_gatunku VARCHAR(30) PRIMARY KEY, 
    czy_zagrozony BIT NOT NULL, 
    nazwa_binominalna VARCHAR(50) NOT NULL, 
    rodzina VARCHAR(50), 
    podrodzina VARCHAR(50), 
    opis TEXT
);

CREATE TABLE Zwierzeta (
    imie VARCHAR(30) NOT NULL, 
    nazwa_gatunku VARCHAR(30) NOT NULL REFERENCES Gatunki(nazwa_gatunku), 
    data_urodzenia DATE NOT NULL, 
    czy_w_ciazy BIT DEFAULT 0, 
    waga DECIMAL(7, 2) CHECK (waga > 0), 
    data_ostatniego_wazenia DATE, 
    plec CHAR(1) NOT NULL CHECK (plec IN ('M', '¯', 'N')), 
    notatki TEXT, 
    numer_wybiegu SMALLINT NOT NULL REFERENCES Wybiegi(numer_wybiegu), 
    PRIMARY KEY (imie, nazwa_gatunku)
);

CREATE TABLE Diety (
    id_diety INT PRIMARY KEY, 
    rodzaj_diety VARCHAR(20) NOT NULL CHECK (rodzaj_diety IN ('Miêsna', 'Roœlinna', 'Mieszana'))
);

CREATE TABLE POSIADA_DIETE (
    nazwa_gatunku VARCHAR(30) NOT NULL REFERENCES Gatunki(nazwa_gatunku), 
    id_diety INT NOT NULL REFERENCES Diety(id_diety), 
    PRIMARY KEY (nazwa_gatunku, id_diety)
);

CREATE TABLE Przypisanie_Diety (
    numer_przypisania INT PRIMARY KEY, 
    data_rozpoczecia DATE NOT NULL, 
    data_zakoncznia DATE NOT NULL, 
    dodatkowe_informacje VARCHAR(1000),
    id_diety INT NOT NULL REFERENCES Diety(id_diety)
);

CREATE TABLE POSIADA_PRZYPISANIE (
    numer_przypisania INT NOT NULL REFERENCES Przypisanie_Diety(numer_przypisania), 
    imie VARCHAR(30) NOT NULL, 
    nazwa_gatunku VARCHAR(30) NOT NULL, 
    PRIMARY KEY (numer_przypisania, imie, nazwa_gatunku),
    FOREIGN KEY (imie, nazwa_gatunku) REFERENCES Zwierzeta(imie, nazwa_gatunku)
);

CREATE TABLE Posi³ki (
    id_posilku INT PRIMARY KEY, 
    id_diety INT NOT NULL REFERENCES Diety(id_diety)
);

CREATE TABLE Porcja (
    id_porcji INT PRIMARY KEY, 
    id_posilku INT NOT NULL REFERENCES Posi³ki(id_posilku), 
    nazwa_jedzenia VARCHAR(50) NOT NULL, 
    ilosc DECIMAL(6, 2) NOT NULL CHECK (ilosc > 0)
);

CREATE TABLE Jedzenie (
    nazwa_jedzenia VARCHAR(50) PRIMARY KEY, 
    cena DECIMAL(10, 2) NOT NULL CHECK (cena >= 0), 
    kategoria VARCHAR(20) NOT NULL CHECK (kategoria IN ('Owoce', 'Warzywa', 'Miêso', 'Ryby', 'Orzechy', 'Ziarno', 'Inne')), 
    energia SMALLINT CHECK (energia >= 0), 
    tluszcz DECIMAL(5, 3) CHECK (tluszcz >= 0), 
    weglowodany DECIMAL(5, 3) CHECK (weglowodany >= 0), 
    cukier DECIMAL(5, 3) CHECK (cukier >= 0), 
    bialko DECIMAL(5, 3) CHECK (bialko >= 0), 
    sol DECIMAL(5, 3) CHECK (sol >= 0)
);

CREATE TABLE Zamienniki_jedzenia (
    nazwa_zamiennika VARCHAR(50) PRIMARY KEY,
    nazwa_jedzenia VARCHAR(50) NOT NULL,
    proporcja DECIMAL(5, 2) NOT NULL,
    FOREIGN KEY (nazwa_zamiennika) REFERENCES Jedzenie(nazwa_jedzenia),
    FOREIGN KEY (nazwa_jedzenia) REFERENCES Jedzenie(nazwa_jedzenia)
);


CREATE TABLE JEST_CZESCIA (
    id_posilku INT NOT NULL REFERENCES Posi³ki(id_posilku), 
    id_diety INT NOT NULL REFERENCES Diety(id_diety), 
    PRIMARY KEY (id_posilku, id_diety)
);

CREATE TABLE Harmonogramy (
    id_harmonogramu SMALLINT PRIMARY KEY, 
    czas_karmienia TIME NOT NULL, 
    dzien_karmienia VARCHAR(15) NOT NULL CHECK (dzien_karmienia IN ('Poniedzia³ek', 'Wtorek', 'Œroda', 'Czwartek', 'Pi¹tek', 'Sobota', 'Niedziela')), 
    id_diety INT NOT NULL REFERENCES Diety(id_diety), 
    id_opiekuna INT NOT NULL REFERENCES Opiekunowie(id_opiekuna), 
    imie VARCHAR(30) NOT NULL, 
    nazwa_gatunku VARCHAR(30) NOT NULL, 
    FOREIGN KEY (imie, nazwa_gatunku) REFERENCES Zwierzeta(imie, nazwa_gatunku)
);

CREATE TABLE Raporty (
    id_raportu SMALLINT PRIMARY KEY, 
    data_karmienia DATE NOT NULL, 
    czy_nakarmione BIT NOT NULL, 
    notatki TEXT, 
    id_opiekuna INT NOT NULL REFERENCES Opiekunowie(id_opiekuna), 
    id_harmonogramu SMALLINT NOT NULL REFERENCES Harmonogramy(id_harmonogramu)
);