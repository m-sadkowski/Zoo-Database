INSERT INTO Osoby (id_osoby, imie, nazwisko, numer_telefonu, e_mail, pesel, data_urodzenia)
VALUES
(1, 'Jan', 'Kowalski', '+48123456789', 'jan.kowalski@email.com', '12345678901', '1985-03-15'),
(2, 'Anna', 'Nowak', '+48234567890', 'anna.nowak@email.com', '98765432109', '1990-07-20'),
(3, 'Marek', 'Zalewski', '+48345678901', 'marek.zalewski@email.com', '45612378901', '1975-01-01'),
(4, 'Katarzyna', 'Kwiatkowska', '+48456789012', 'katarzyna.kwiatkowska@email.com', '11223344556', '1980-06-10'),
(5, 'Piotr', 'Jankowski', '+48567890123', 'piotr.jankowski@email.com', '33445566778', '1995-11-22'),
(6, 'Zuzanna', 'Lejkowska', '+48505972894', 'lejkowska774@gmail.com', '21152115151', '2004-06-25'),
(7, 'Oliwia', 'Klaman', '+48765456786', 'klamanoliwia0@gmail.com', '88877788900', '2000-04-13'),
(8, 'Dawid', 'Matys', '+48505555555', 'matysiak200@gmail.com', '21152555151', '2004-06-17'),
(9, 'Micha³', 'Weso³y', '+48777888876', 'wesolymichal@gmail.com', '88877788900', '1998-01-12'),
(10, 'Ewa', 'Zielinska', '+48782233445', 'ewa.zielinska@email.com', '23456789012', '1988-09-30'),
(11, 'Tomasz', 'Brzozowski', '+48504567656', 'tomasz.brzozowski@email.com', '34567890123', '1992-02-14'),
(12, 'Barbara', 'Kowalczyk', '+48667788999', 'barbara.kowalczyk@email.com', '45678901234', '1979-12-01'),
(13, 'Marek', 'Majewski', '+48444556677', 'marek.majewski@email.com', '56789012345', '1991-08-25'),
(14, 'Julia', 'Lewandowska', '+48501728394', 'julia.lewandowska@email.com', '67890123456', '1997-11-05'),
(15, 'Patryk', 'Nowicki', '+48777755522', 'patryk.nowicki@email.com', '78901234567', '2002-05-15');

INSERT INTO Pracownicy (id_osoby, data_zatrudnienia, placa, data_zwolnienia)
VALUES
(1, '2010-05-01', 5000.00, NULL),
(2, '2015-09-15', 4800.00, NULL),
(3, '2005-03-20', 6000.00, '2024-11-05'),
(4, '2018-06-10', 5500.00, NULL),
(5, '2020-08-01', 4500.00, NULL),
(6, '2012-03-10', 8100.00, NULL),
(7, '2017-07-22', 9200.00, NULL),
(8, '2013-01-15', 9500.00, NULL),
(9, '2016-11-30', 8700.00, NULL),
(10, '2019-04-10', 8500.00, NULL),
(11, '2021-02-22', 4000.00, NULL),
(12, '2022-05-14', 3900.00, NULL),
(13, '2020-09-10', 4600.00, NULL),
(14, '2014-08-05', 4200.00, NULL),
(15, '2011-12-01', 4700.00, NULL);

INSERT INTO Kierownicy (id_osoby, typ)
VALUES
(7, 'Kierownik Magazynu'),
(8, 'Kierownik ZOO'),
(9, 'Kierownik Sekcji'),
(10, 'Kierownik Sekcji');

INSERT INTO Opiekunowie (id_opiekuna, data_ostatnich_badan)
VALUES
(1, '2024-11-30'),
(2, '2024-12-05'),
(4, '2023-12-12'),
(5, '2024-06-05'),
(11, '2023-12-12'),
(12, '2024-08-15'),
(13, '2024-05-01'),
(14, '2024-02-16');

INSERT INTO Sekcje (nazwa_sekcji, lokalizacja)
VALUES
('Sekcja afrykañska', 'Pó³nocny-zachód'),
('Sekcja arktyczna', 'Wschód'),
('Sekcja deszczowa', 'Pó³nocny-wschód'),
('Sekcja umiarkowana', 'Zachód'),
('Sekcja oceaniczna', 'Po³udniowy-zachód');

INSERT INTO Wybiegi (numer_wybiegu, typ_wybiegu, pojemnosc, id_opiekuna, nazwa_sekcji)
VALUES
(1, 'Klatka', 10, 2, 'Sekcja arktyczna'),
(2, 'Wybieg zewnêtrzny', 5, 2, 'Sekcja arktyczna'),
(3, 'Terrarium', 3, 4, 'Sekcja deszczowa'),
(4, 'Terrarium', 5, 4, 'Sekcja deszczowa'),
(5, 'Terrarium', 5, 4, 'Sekcja deszczowa'),
(6, 'Akwarium', 20, 5, 'Sekcja oceaniczna'),
(7, 'Akwarium', 30, 5, 'Sekcja oceaniczna'),
(8, 'Akwarium', 40, 5, 'Sekcja oceaniczna'),
(9, 'Wybieg wewnêtrzny', 7, 5, 'Sekcja umiarkowana'),
(10, 'Wybieg zewnêtrzny', 7, 13, 'Sekcja umiarkowana'),
(11, 'Wybieg zewnêtrzny', 7, 13, 'Sekcja umiarkowana'),
(12, 'Wybieg zewnêtrzny', 10, 14, 'Sekcja afrykañska'),
(13, 'Wybieg zewnêtrzny', 10, 14, 'Sekcja afrykañska'),
(14, 'Wybieg wewnêtrzny', 8, 11, 'Sekcja afrykañska'),
(15, 'Klatka', 5, 11, 'Sekcja afrykañska'),
(16, 'Wybieg zewnêtrzny', 15, 1, 'Sekcja arktyczna'),
(17, 'Terrarium', 6, 4, 'Sekcja deszczowa'),
(18, 'Wybieg wewnêtrzny', 8, 4, 'Sekcja deszczowa'), 
(19, 'Wybieg zewnêtrzny', 10, 14, 'Sekcja afrykañska');

INSERT INTO Gatunki (nazwa_gatunku, czy_zagrozony, nazwa_binominalna, rodzina, podrodzina, opis)
VALUES
('Tygrys', 1, 'Panthera tigris', 'Felidae', 'Pantherinae', 'Wielki drapie¿nik z Azji'),
('Lew', 1, 'Panthera leo', 'Felidae', 'Pantherinae', 'Król d¿ungli'),
('Panda', 1, 'Ailuropoda melanoleuca', 'Ursidae', 'Ursinae', 'Charakterystyczne czarno-bia³e zwierzê'),
('¯yrafa', 0, 'Giraffa camelopardalis', 'Giraffidae', 'Giraffinae', 'Zwierzê o d³ugiej szyi, zamieszkuje Afrykê'),
('Nosoro¿ec', 0, 'Rhinocerotidae', 'Rhinocerotidae', 'Rhinocerotinae', NULL),
('NiedŸwiedŸ brunatny', 1, 'Ursus arctos', NULL, NULL, 'Du¿y drapie¿nik, zamieszkuje lasy i góry'),
('NiedŸwiedŸ polarny', 1, 'Ursus maritimus', NULL, NULL, 'Zwierzê zamieszkuj¹ce arktyczne obszary, dobrze przystosowane do zimna'),
('Pingwin', 0, 'Spheniscidae', 'Spheniscidae', 'Spheniscinae', 'Ptak nielotny, zamieszkuje zimne rejony œwiata'),
('Panda ruda', 1, 'Ailurus fulgens', 'Ailuridae', 'Ailurinae', 'Zwierzê o rudym futrze, ¿yj¹ce w Azji'),
('Rekin bia³y', 1, 'Carcharodon carcharias', 'Lamnidae', 'Lamninae', 'Du¿y drapie¿ny rekin'),
('Rekin wielorybi', 1, 'Rhincodon typus', NULL, NULL, 'Najwiêkszy znany gatunek rekinów, ¿ywi siê planktonem'),
('¯ó³w b³otny', 0, 'Emys orbicularis', 'Emydidae', 'Emydinae', '¯ó³w zamieszkuj¹cy wody s³odkie'),
('¯ó³w morski', 0, 'Chelonia mydas', 'Cheloniidae', 'Cheloniinae', '¯ó³w morski, znany z d³ugich migracji'),
('Gekon lamparci', 0, 'Eublepharis macularius', NULL, NULL, NULL),
('Kapibara', 0, 'Hydrochoerus hydrochaeris', 'Caviidae', 'Hydrochoerinae', 'Najwiêkszy gryzoñ na œwiecie, zamieszkuje tereny podmok³e w Ameryce Po³udniowej'),
('Okapi', 1, 'Okapia johnstoni', 'Giraffidae', 'Giraffinae', 'Zwierzê leœne spokrewnione z ¿yraf¹, zamieszkuj¹ce lasy deszczowe w Afryce');


INSERT INTO Zwierzeta (imie, nazwa_gatunku, data_urodzenia, czy_w_ciazy, waga, data_ostatniego_wazenia, plec, notatki, numer_wybiegu)
VALUES
('Tomek', 'Tygrys', '2020-01-01', 0, 200.00, '2024-11-01', 'M', 'Wielki tygrys', 9),  
('Rex', 'Tygrys', '2019-03-15', 0, 210.00, '2024-11-01', 'M', 'Bardzo aktywny', 9), 
('Simba', 'Lew', '2018-07-05', 0, 180.00, '2024-11-01', 'M', 'Silny i dominuj¹cy', 12),
('Nala', 'Lew', '2019-09-10', 1, 170.00, '2024-11-01', '¯', 'W ci¹¿y', 12),  
('Bobo', 'Panda', '2017-02-20', 0, 100.00, '2024-12-01', 'M', 'Spokojny', 4),  
('Ming', 'Panda', '2016-05-10', 0, 110.00, '2024-12-01', '¯', 'Spokojna i leniwa', 4), 
('Giraffo', '¯yrafa', '2015-12-15', 0, 800.00, '2024-11-01', 'M', 'Lubi wysokie ga³êzie', 13), 
('Zara', '¯yrafa', '2016-11-20', 0, 850.00, '2024-11-01', '¯', NULL, 13), 
('Rino', 'Nosoro¿ec', '2018-04-10', 0, 1500.00, '2024-11-01', 'M', 'Potê¿ny', 14), 
('Dora', 'Nosoro¿ec', '2017-10-01', 0, 1400.00, '2024-11-01', '¯', 'Leniwa, ale silna', 14), 
('Bruno', 'NiedŸwiedŸ brunatny', '2016-06-12', 0, 300.00, '2024-11-01', 'M', 'Silny, uwielbia miód', 16), 
('Klara', 'NiedŸwiedŸ brunatny', '2017-08-20', 0, 280.00, '2024-11-01', '¯', NULL, 16), 
('Polka', 'NiedŸwiedŸ polarny', '2017-12-10', 0, 350.00, '2024-11-01', '¯', NULL, 16),
('Wojtek', 'NiedŸwiedŸ polarny', '2018-01-15', 0, 340.00, '2024-11-01', 'M', 'Aktywny i g³odny', 16), 
('Lena', 'NiedŸwiedŸ polarny', '2016-03-05', 0, 360.00, '2024-11-01', '¯', 'Zimowa specjalistka', 1), 
('Pawe³', 'Pingwin', '2019-11-22', 0, 5.00, '2024-12-01', 'M', 'P³ywa szybko', 2), 
('Piotrek', 'Pingwin', '2020-01-10', 0, 6.00, '2024-12-01', 'M', 'Œwietny p³ywak', 2),
('Klaudia', 'Pingwin', '2018-09-30', 0, 4.50, '2024-12-01', '¯', NULL, 2), 
('Pikok', 'Pingwin', '2017-05-25', 0, 6.50, '2024-12-01', 'M', NULL, 2), 
('Paulina', 'Pingwin', '2016-12-10', 0, 7.00, '2024-12-01', '¯', 'Spokojny, czêsto odpoczywa', 2),
('Rajo', 'Rekin bia³y', '2015-07-15', 0, NULL, NULL, 'M', 'Wielki ³owca', 6), 
('Karol', 'Rekin bia³y', '2016-10-05', 0, NULL, NULL, 'M', NULL, 6),  
('Dyzio', '¯ó³w b³otny', '2019-02-10', 0, 15.00, '2024-12-01', 'M', 'Lubi s³odkie wody', 10), 
('Nika', '¯ó³w b³otny', '2018-11-15', 0, 16.00, '2024-12-01', '¯', 'Spokojna', 10),  
('Hyzio', '¯ó³w morski', '2017-06-25', 0, 100.00, '2024-12-01', 'M', NULL, 8), 
('Zuza', '¯ó³w morski', '2016-12-05', 0, 95.00, '2024-12-01', '¯', 'Lubi ciep³e wody', 8),  
('Bobek', 'Gekon lamparci', '2020-07-30', 0, 0.20, '2024-12-01', 'M', 'Ma³y, z plamkami', 3),  
('Olivka', 'Gekon lamparci', '2019-10-15', 1, 0.18, '2024-12-01', '¯', NULL, 3),
('Kapi', 'Kapibara', '2019-06-15', 0, 50.00, '2024-11-01', 'M', 'Lubi wodê i trawê', 17),
('Luna', 'Kapibara', '2020-03-10', 0, 45.00, '2024-11-01', '¯', 'Spokojna i towarzyska', 17),
('Oki', 'Okapi', '2018-08-05', 0, 250.00, '2024-11-01', 'M', 'Lubi owoce i liœcie', 18),
('Tara', 'Okapi', '2017-04-25', 0, 240.00, '2024-11-01', '¯', 'Uwielbia liœcie', 18),
('Zuri', '¯yrafa', '2016-09-15', 0, 900.00, '2024-11-01', '¯', 'Bardzo ciekawska', 19);

INSERT INTO Diety (id_diety, rodzaj_diety)
VALUES
(1, 'Miêsna'),
(2, 'Miêsna'),
(3, 'Miêsna'),
(4, 'Miêsna'),
(5, 'Miêsna'),
(6, 'Miêsna'),
(7, 'Miêsna'),
(8, 'Roœlinna'),
(9, 'Roœlinna'),
(10, 'Roœlinna'),
(11, 'Roœlinna'),
(12, 'Roœlinna'),
(13, 'Mieszana'),
(14, 'Mieszana'),
(15, 'Mieszana'),
(16, 'Mieszana'),
(17, 'Mieszana'),
(18, 'Miêsna'),  
(19, 'Roœlinna'); 

INSERT INTO POSIADA_DIETE (nazwa_gatunku, id_diety)
VALUES
('Tygrys', 1),
('Lew', 2),
('Panda', 8),
('¯yrafa', 9),
('NiedŸwiedŸ brunatny', 15),
('NiedŸwiedŸ polarny', 3),
('Pingwin', 4),
('Rekin bia³y', 5),
('Gekon lamparci', 3),
('Kapibara', 9), 
('Okapi', 9),
('¯ó³w morski', 18),
('¯ó³w b³otny', 18),
('¯ó³w b³otny', 19);

INSERT INTO Jedzenie (nazwa_jedzenia, cena, kategoria, energia, tluszcz, weglowodany, cukier, bialko, sol)  
VALUES  
('Koœci wo³owe', 5.00, 'Miêso', 250, 20.0, 0.0, 0.0, 15.0, 0.2),  
('Mleko', 2.50, 'Inne', 60, 3.5, 4.7, 4.7, 3.3, 0.1),  
('Jajka kurze', 3.00, 'Inne', 155, 11.0, 1.1, 1.0, 13.0, 0.4),  
('Jab³ka', 2.00, 'Owoce', 52, 0.2, 14.0, 10.0, 0.3, 0.0),  
('Kapusta', 1.20, 'Warzywa', 25, 0.1, 6.0, 3.2, 1.3, 0.1),  
('Eukaliptus', 4.00, 'Ziarno', 150, 1.5, 12.0, 4.0, 3.0, 0.2),  
('Pstr¹gi', 12.00, 'Ryby', 180, 10.0, 0.0, 0.0, 20.0, 0.5),  
('Dorsze', 10.50, 'Ryby', 105, 0.8, 0.0, 0.0, 22.0, 0.3),  
('Miêso drobiowe', 8.00, 'Miêso', 165, 8.0, 0.0, 0.0, 31.0, 0.2),  
('Miêso wieprzowe', 9.50, 'Miêso', 250, 20.0, 0.0, 0.0, 25.0, 0.3),  
('Banany', 3.00, 'Owoce', 89, 0.3, 23.0, 12.0, 1.1, 0.0),  
('Marchew', 1.50, 'Warzywa', 41, 0.2, 10.0, 5.0, 1.0, 0.1),  
('Ziemniaki', 2.00, 'Warzywa', 77, 0.1, 17.0, 0.8, 2.0, 0.1),  
('S³onecznik', 6.00, 'Ziarno', 570, 50.0, 20.0, 2.6, 20.0, 0.2),  
('Orzechy laskowe', 8.00, 'Orzechy', 628, 61.0, 17.0, 4.0, 15.0, 0.0),  
('Dynia', 3.00, 'Warzywa', 26, 0.1, 7.0, 2.8, 1.0, 0.1),  
('Buraki', 2.50, 'Warzywa', 43, 0.2, 10.0, 7.0, 1.6, 0.2),  
('Truskawki', 4.00, 'Owoce', 32, 0.3, 8.0, 4.9, 0.7, 0.0),  
('Kukurydza', 3.50, 'Ziarno', 96, 1.5, 21.0, 6.3, 3.4, 0.2),
('Sa³ata', 1.50, 'Warzywa', 15, 0.2, 2.9, 0.8, 1.0, 0.1),  
('Rukola', 2.00, 'Warzywa', 20, 0.3, 3.6, 0.7, 2.6, 0.1),  
('Melon', 3.00, 'Owoce', 34, 0.1, 8.3, 7.8, 0.8, 0.0),  
('Kwiaty hibiskusa', 5.00, 'Inne', 25, 0.2, 6.0, 4.5, 0.5, 0.1);  

INSERT INTO Zamienniki_jedzenia (nazwa_zamiennika, nazwa_jedzenia, proporcja)
VALUES  
('Kapusta', 'Marchew', 1.2),  
('Buraki', 'Kapusta', 1.1),  
('Ziemniaki', 'Dynia', 1.5),    
('Banany', 'Jab³ka', 1.3),  
('Truskawki', 'Jab³ka', 1.0),  
('Marchew', 'Jab³ka', 1.0),   
('Miêso drobiowe', 'Miêso wieprzowe', 0.9),  
('Dorsze', 'Pstr¹gi', 0.8),  
('Pstr¹gi', 'Dorsze', 1.1),  
('Mleko', 'Jajka kurze', 1.5),  
('Kukurydza', 'S³onecznik', 1.2),  
('S³onecznik', 'Orzechy laskowe', 0.9),  
('Orzechy laskowe', 'Eukaliptus', 1.3),
('Melon', 'Truskawki', 0.9),
('Kwiaty hibiskusa', 'Eukaliptus', 1.3);  


INSERT INTO Posi³ki (id_posilku, id_diety)
VALUES
(1, 1), -- Miêsna
(2, 2), -- Roœlinna
(3, 3), -- Mieszana
(4, 8),   -- Roœlinna
(5, 9),   -- Roœlinna
(6, 15),  -- Mieszana
(7, 16),  -- Mieszana
(8, 5),   -- Miêsna
(9, 17),  -- Mieszana
(10, 4),  -- Miêsna
(11, 6),  -- Miêsna
(12, 7),  -- Miêsna
(13, 10), -- Roœlinna
(14, 11), -- Roœlinna
(15, 12), -- Roœlinna
(16, 9), -- Roœlinna
(17, 9), -- Roœlinna
(18, 18),  
(19, 19); 

INSERT INTO Porcja (id_porcji, id_posilku, nazwa_jedzenia, ilosc)
VALUES
(1, 1, 'Koœci wo³owe', 1000),
(2, 1, 'Miêso wieprzowe', 1000),
(3, 2, 'Dorsze', 500),
(4, 2, 'Pstr¹gi', 500),
(5, 4, 'Jab³ka', 300),
(6, 4, 'Marchew', 200),
(7, 5, 'Miêso drobiowe', 1000),
(8, 5, 'Ziemniaki', 500),
(9, 6, 'Banany', 400),
(10, 6, 'Kapusta', 300),
(11, 7, 'Mleko', 200),
(12, 8, 'Pstr¹gi', 800),
(13, 8, 'Dorsze', 600),
(14, 9, 'Eukaliptus', 100),
(15, 9, 'S³onecznik', 50),
(16, 10, 'Dynia', 150),
(17, 11, 'Orzechy laskowe', 30),
(18, 11, 'Truskawki', 400),
(19, 12, 'Kukurydza', 500),
(20, 13, 'Miêso drobiowe', 700),
(21, 13, 'Koœci wo³owe', 500),
(22, 14, 'Pstr¹gi', 1000),
(23, 15, 'Miêso wieprzowe', 1000),
(26, 16, 'Kapusta', 300),
(27, 16, 'Marchew', 200),
(28, 17, 'Jab³ka', 250),
(29, 17, 'Truskawki', 150),
(30, 16, 'Sa³ata', 300),
(31, 16, 'Rukola', 200),
(32, 16, 'Melon', 150),
(33, 16, 'Kwiaty hibiskusa', 100),
(34, 17, 'Sa³ata', 350),
(35, 17, 'Ogórek', 250),
(36, 17, 'Liœcie mniszka lekarskiego', 200),
(37, 18, 'Dorsze',   500),
(38, 18, 'Pstr¹gi',  500),
(39, 19, 'Kapusta',  300),
(40, 19, 'Sa³ata',   300),
(41, 19, 'Dynia',    200);

INSERT INTO JEST_CZESCIA (id_posilku, id_diety)
VALUES
(1, 1),
(1, 2),
(2, 2),
(3, 3),
(4, 8),
(5, 9),
(6, 15),
(7, 16),
(8, 5),
(9, 17),
(10, 4),
(11, 6),
(12, 7),
(13, 10),
(14, 11),
(15, 12),
(18, 18),
(19, 19);

INSERT INTO Harmonogramy (id_harmonogramu, czas_karmienia, dzien_karmienia, id_diety, id_opiekuna, imie, nazwa_gatunku)
VALUES
(1, '08:00', 'Poniedzia³ek', 1, 1, 'Simba', 'Lew'),
(2, '12:00', 'Wtorek', 1, 2, 'Tomek', 'Tygrys'),
(3, '18:00', 'Œroda', 1, 5, 'Pawe³', 'Pingwin'),
(4, '10:00', 'Czwartek', 2, 4, 'Rex', 'Tygrys'),
(5, '14:30', 'Pi¹tek', 3, 11, 'Nala', 'Lew'),
(6, '19:00', 'Sobota', 8, 12, 'Bobo', 'Panda'),
(7, '07:15', 'Niedziela', 9, 13, 'Ming', 'Panda'),
(8, '09:00', 'Poniedzia³ek', 15, 14, 'Zara', '¯yrafa'),
(9, '13:00', 'Wtorek', 16, 5, 'Dora', 'Nosoro¿ec'),
(10, '17:45', 'Œroda', 5, 1, 'Bruno', 'NiedŸwiedŸ brunatny'),
(11, '20:00', 'Czwartek', 4, 2, 'Klara', 'NiedŸwiedŸ brunatny'),
(12, '08:30', 'Pi¹tek', 2, 4, 'Lena', 'NiedŸwiedŸ polarny'),
(13, '16:00', 'Sobota', 3, 5, 'Pawe³', 'Pingwin'),
(14, '11:00', 'Niedziela', 5, 11, 'Piotrek', 'Pingwin'),
(15, '18:30', 'Poniedzia³ek', 17, 12, 'Klaudia', 'Pingwin'),
(16, '08:00', 'Czwartek', 1, 1, 'Simba', 'Lew'),
(17, '09:00', 'Poniedzia³ek', 9, 4, 'Kapi', 'Kapibara'),
(18, '15:00', 'Œroda', 9, 4, 'Luna', 'Kapibara'),
(19, '10:30', 'Wtorek', 9, 4, 'Oki', 'Okapi'),
(20, '14:00', 'Czwartek', 9, 4, 'Tara', 'Okapi'),
(21, '11:00', 'Sobota', 9, 14, 'Zuri', '¯yrafa'),
(22, '07:30', 'Pi¹tek', 3, 14, 'Giraffo', '¯yrafa'),
(23, '09:00', 'Pi¹tek', 5, 14, 'Zuri', '¯yrafa'),
(24, '11:15', 'Pi¹tek', 8, 14, 'Tara', 'Okapi'),
(25, '09:00', 'Poniedzia³ek', 15, 13, 'Bruno', 'NiedŸwiedŸ brunatny'),
(26, '15:30', 'Œroda', 15, 13, 'Bruno', 'NiedŸwiedŸ brunatny'),
(27, '08:45', 'Wtorek', 3, 12, 'Polka', 'NiedŸwiedŸ polarny'),
(28, '13:15', 'Pi¹tek', 3, 12, 'Polka', 'NiedŸwiedŸ polarny'),
(29, '10:30', 'Czwartek', 3, 11, 'Klara', 'NiedŸwiedŸ brunatny'),
(30, '17:00', 'Sobota', 3, 11, 'Klara', 'NiedŸwiedŸ brunatny');

INSERT INTO Raporty (id_raportu, data_karmienia, czy_nakarmione, notatki, id_opiekuna, id_harmonogramu)
VALUES
(1, '2024-12-15', 1, 'Zjad³ wszystko', 1, 1),
(2, '2024-12-15', 0, 'Nie chcia³ jeœæ', 2, 2),
(3, '2024-12-15', 1, 'Zjad³ czêœciowo', 5, 3),
(4, '2024-12-16', 1, 'Zjad³ wszystko', 4, 4),
(5, '2024-12-16', 1, 'Bardzo dobry apetyt', 11, 5),
(6, '2024-12-16', 0, 'Odmawia jedzenia', 12, 6),
(7, '2024-12-16', 1, 'Zjad³ czêœciowo', 13, 7),
(8, '2024-12-16', 1, 'Wybrzydza³ trochê', 14, 8),
(9, '2024-12-16', 1, 'Wszystko ok', 5, 9),
(10, '2024-12-16', 1, 'Zjad³ do koñca', 1, 10),
(11, '2024-12-16', 0, 'Chory, nie jad³', 1, 11),
(12, '2024-12-16', 1, 'Ma³y apetyt', 4, 12),
(13, '2024-12-16', 1, 'Zjedzone, brak zastrze¿eñ', 11, 13),
(14, '2024-12-16', 1, 'Smakuje mu', 12, 14),
(15, '2024-12-16', 1, 'Œwietny humor po jedzeniu', 13, 15),
(16, '2024-12-17', 1, 'Zjad³ wszystko', 12, 14),
(17, '2024-12-19', 1, 'Wygl¹da³ na zadowolonego', 12, 14),
(18, '2024-12-21', 1, 'Œwietny apetyt', 12, 14),
(19, '2024-12-13', 1, 'Zjad³ wszystko, brak uwag', 14, 22),
(20, '2024-12-13', 0, 'Nie chcia³ jeœæ, wymaga obserwacji', 14, 23),
(21, '2024-12-13', 1, 'Wybrzydza³, ale zjad³ wiêkszoœæ', 14, 24),
(22, '2024-12-02', 1, 'Zjad³ wszystko, dobry apetyt', 13, 25),
(23, '2024-12-04', 1, 'Zjedzone w ca³oœci', 13, 26),
(24, '2024-12-03', 1, 'Zjad³a, brak uwag', 12, 27),
(25, '2024-12-06', 1, 'Zjad³a wszystko, aktywna', 12, 28),
(26, '2024-12-05', 1, 'Ma³y apetyt, ale zjad³a', 11, 29),
(27, '2024-12-07', 1, 'Zjedzone w ca³oœci', 11, 30);

INSERT INTO Przypisanie_Diety (numer_przypisania, data_rozpoczecia, data_zakoncznia, dodatkowe_informacje, id_diety)
VALUES
(1, '2024-12-01', '2024-12-10', 'Dieta dla lwów spodziewaj¹cych siê dziecka', 2),
(2, '2024-12-11', '2024-12-20', NULL, 3),
(3, '2024-12-21', '2024-12-30', NULL, 4),
(4, '2024-12-15', '2024-12-25', NULL, 5),
(5, '2024-12-05', '2024-12-14', NULL, 8),
(6, '2024-12-10', '2024-12-20', NULL, 9),
(7, '2024-12-01', '2024-12-31', 'Specjalna dieta z powodu choroby oczu', 15),
(8, '2024-12-02', '2024-12-10', NULL, 16),
(9, '2024-12-11', '2024-12-15', NULL, 17),
(10, '2024-12-05', '2024-12-12', NULL, 1),
(11, '2024-12-06', '2024-12-13', NULL, 2),
(12, '2024-12-07', '2024-12-14', NULL, 3),
(13, '2024-12-08', '2024-12-15', NULL, 10),
(14, '2024-12-09', '2024-12-16', NULL, 11),
(15, '2024-12-10', '2024-12-17', NULL, 12);

INSERT INTO POSIADA_PRZYPISANIE (numer_przypisania, imie, nazwa_gatunku)
VALUES
(1, 'Simba', 'Lew'),
(1, 'Nala', 'Lew'),
(2, 'Polka', 'NiedŸwiedŸ polarny'),
(3, 'Rex', 'Tygrys'),
(4, 'Bobo', 'Panda'),
(5, 'Zara', '¯yrafa'),
(6, 'Dora', 'Nosoro¿ec'),
(7, 'Bruno', 'NiedŸwiedŸ brunatny'),
(8, 'Wojtek', 'NiedŸwiedŸ polarny'),
(9, 'Pawe³', 'Pingwin'),
(10, 'Piotrek', 'Pingwin'),
(11, 'Pikok', 'Pingwin'),
(12, 'Rajo', 'Rekin bia³y'),
(13, 'Dyzio', '¯ó³w b³otny'),
(14, 'Hyzio', '¯ó³w morski'),
(15, 'Bobek', 'Gekon lamparci');

