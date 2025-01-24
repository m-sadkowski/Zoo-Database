/*---------------------------------------------------------------------------------------------*/
/* 1. Ile zarabia opiekun zajmujący się największą ilością zwierząt, które w diecie mają ryby? */
/*---------------------------------------------------------------------------------------------*/

SELECT TOP 1
    oso.imie,
    oso.nazwisko,
	pra.placa,
    COUNT(DISTINCT zwi.imie) AS liczba_zwierzat
FROM Opiekunowie opi 
	JOIN Pracownicy pra ON pra.id_osoby = opi.id_opiekuna
	JOIN Osoby oso ON pra.id_osoby = oso.id_osoby
	JOIN Wybiegi wyb ON opi.id_opiekuna = wyb.id_opiekuna 
	JOIN Zwierzeta zwi ON wyb.numer_wybiegu = zwi.numer_wybiegu
	JOIN POSIADA_PRZYPISANIE pos_p ON zwi.imie = pos_p.imie AND zwi.nazwa_gatunku = pos_p.nazwa_gatunku
	JOIN Przypisanie_Diety prz_d ON pos_p.numer_przypisania = prz_d.numer_przypisania
	JOIN Diety die ON prz_d.id_diety = die.id_diety
	JOIN Porcja por ON die.id_diety = por.id_posilku
WHERE 
	por.nazwa_jedzenia IN ('Dorsze', 'Pstrągi')
GROUP BY 
	oso.imie, oso.nazwisko, pra.placa
ORDER BY 
	liczba_zwierzat DESC

/*---------------------------------------------------------------------------------------------*/
/* 2. Na ilu wybiegach w poszczególnych sekcjach żyją same zwierzęta z dietą roślinożerną?     */
/*---------------------------------------------------------------------------------------------*/

/*
SELECT zwi.imie, zwi.nazwa_gatunku, wyb.numer_wybiegu, diety.rodzaj_diety
FROM Zwierzeta zwi
	JOIN Wybiegi wyb ON zwi.numer_wybiegu = wyb.numer_wybiegu
	JOIN POSIADA_DIETE pd ON pd.nazwa_gatunku = zwi.nazwa_gatunku
	JOIN Diety diety ON diety.id_diety = pd.id_diety
ORDER BY 
	wyb.numer_wybiegu DESC;
*/

SELECT 
    wyb.nazwa_sekcji,
    COUNT(DISTINCT wyb.numer_wybiegu) AS liczba_wybiegow_roslinozernych
FROM Wybiegi wyb
	JOIN Zwierzeta zwi ON wyb.numer_wybiegu = zwi.numer_wybiegu
	JOIN POSIADA_DIETE pos_d ON zwi.nazwa_gatunku = pos_d.nazwa_gatunku
	JOIN Diety die ON pos_d.id_diety = die.id_diety
WHERE 
	die.rodzaj_diety = 'Roślinna'
    AND NOT EXISTS (
        SELECT 1
        FROM Zwierzeta zwi_inne
        JOIN POSIADA_DIETE pos_d_inne ON zwi_inne.nazwa_gatunku = pos_d_inne.nazwa_gatunku
        JOIN Diety die_inne ON pos_d_inne.id_diety = die_inne.id_diety
        WHERE 
			zwi_inne.numer_wybiegu = wyb.numer_wybiegu AND die_inne.rodzaj_diety != 'Roślinna'
    )
GROUP BY 
	wyb.nazwa_sekcji;

/*---------------------------------------------------------------------------------------------*/
/* 3. Ile razy w grudniu został nakarmiony pingwin Piotrek? 4. Ile dostał jakich produktów?    */
/*---------------------------------------------------------------------------------------------*/

GO
CREATE OR ALTER VIEW Widok_Sekcja_Arktyczna AS
SELECT
    zw.imie AS zwierze_imie,
    zw.nazwa_gatunku AS nazwa_gatunku,
    zw.data_urodzenia,
    zw.waga,
    zw.plec,
    wy.nazwa_sekcji,
    har.czas_karmienia,
    har.dzien_karmienia,
    har.id_diety,
    por.nazwa_jedzenia,
    por.ilosc,
    rap.data_karmienia,
    rap.czy_nakarmione
FROM Zwierzeta zw
JOIN Wybiegi wy ON zw.numer_wybiegu = wy.numer_wybiegu
JOIN Harmonogramy har ON zw.imie = har.imie AND zw.nazwa_gatunku = har.nazwa_gatunku
JOIN Posiłki pos ON har.id_diety = pos.id_diety
JOIN Porcja por ON pos.id_posilku = por.id_posilku
LEFT JOIN Raporty rap ON har.id_harmonogramu = rap.id_harmonogramu
WHERE wy.nazwa_sekcji = 'Sekcja arktyczna';
GO

SELECT
    COUNT(DISTINCT data_karmienia) AS Liczba_karmień_Piotrka
FROM Widok_Sekcja_Arktyczna
WHERE 
    zwierze_imie = 'Piotrek'
    AND nazwa_gatunku = 'Pingwin'
    AND czy_nakarmione = 1
    AND MONTH(data_karmienia) = 12;

SELECT 
    nazwa_jedzenia,
    SUM(ilosc)/1000 AS laczna_ilosc
FROM Widok_Sekcja_Arktyczna
WHERE 
    zwierze_imie = 'Piotrek'
    AND nazwa_gatunku = 'Pingwin'
    AND czy_nakarmione = 1
    AND MONTH(data_karmienia) = 12
GROUP BY 
    nazwa_jedzenia;

/*---------------------------------------------------------------------------------------------*/
/* 5. Zestawienie wartości odżywczych otrzymanych przez zwierzęta w grudniu w poszczególnych   */
/*	  sekcjach, na podstawie raportów potwierdzających czy zwierzę zjadło.                     */
/*---------------------------------------------------------------------------------------------*/

SELECT 
    sek.nazwa_sekcji AS Sekcja,
    SUM(jed.energia * por.ilosc / 100) AS Energia_kcal,
    SUM(jed.tluszcz * por.ilosc / 100) AS Tluszcz_g,
    SUM(jed.weglowodany * por.ilosc / 100) AS Weglowodany_g,
    SUM(jed.cukier * por.ilosc / 100) AS Cukier_g,
    SUM(jed.bialko * por.ilosc / 100) AS Bialko_g,
    SUM(jed.sol * por.ilosc / 100) AS Sol_g
FROM 
    Raporty rap
	JOIN Harmonogramy har ON rap.id_harmonogramu = har.id_harmonogramu
	JOIN Zwierzeta zwi ON har.imie = zwi.imie AND har.nazwa_gatunku = zwi.nazwa_gatunku
	JOIN Wybiegi wyb ON zwi.numer_wybiegu = wyb.numer_wybiegu
	JOIN Sekcje sek ON wyb.nazwa_sekcji = sek.nazwa_sekcji
	JOIN Posiłki pos ON har.id_diety = pos.id_diety
	JOIN Porcja por ON pos.id_posilku = por.id_posilku
	JOIN Jedzenie jed ON por.nazwa_jedzenia = jed.nazwa_jedzenia
WHERE 
    rap.czy_nakarmione = 1 
    AND MONTH(rap.data_karmienia) = 12
GROUP BY 
    sek.nazwa_sekcji
ORDER BY 
    sek.nazwa_sekcji;

/*---------------------------------------------------------------------------------------------*/
/* 6. O której godzinie Julia Lewandowska miała ostatnie zwierzę do nakarmienia w piątek 13.12,*/
/*	  jakie to było zwierzę i co wynika z raportu, jeżeli zostało nakarmione?                  */
/*---------------------------------------------------------------------------------------------*/

SELECT /* TOP 1 */
    har.czas_karmienia AS godzina_karmienia,
    zwi.imie AS imie_zwierzecia,
    zwi.nazwa_gatunku AS gatunek,
    CASE 
        WHEN rap.czy_nakarmione IS NOT NULL THEN 
            CASE 
                WHEN rap.czy_nakarmione = 1 THEN 'Nakarmione' 
                ELSE 'Nie nakarmione' 
            END
        ELSE 'Brak raportu'
    END AS status_karmienia,
    rap.notatki AS notatki_z_raportu
FROM Harmonogramy har
JOIN Zwierzeta zwi ON har.imie = zwi.imie AND har.nazwa_gatunku = zwi.nazwa_gatunku
JOIN Opiekunowie opi ON har.id_opiekuna = opi.id_opiekuna
JOIN Osoby oso ON opi.id_opiekuna = oso.id_osoby
LEFT JOIN Raporty rap ON har.id_harmonogramu = rap.id_harmonogramu AND rap.data_karmienia = '2024-12-13'
WHERE 
    oso.imie = 'Julia' 
    AND oso.nazwisko = 'Lewandowska'
    AND har.dzien_karmienia = 'Piątek'
ORDER BY 
    har.czas_karmienia DESC

/*---------------------------------------------------------------------------------------------*/
/* 7. Ile razy zostały nakarmione niedźwiedzie brunatne i polarne w dniach 14.12 - 21.12?      */
/*---------------------------------------------------------------------------------------------*/

SELECT 
    COUNT(*) AS Liczba_karmień_niedźwiedzi
FROM Harmonogramy har
	JOIN Zwierzeta zwi ON har.imie = zwi.imie AND har.nazwa_gatunku = zwi.nazwa_gatunku
WHERE 
	zwi.nazwa_gatunku = 'Niedźwiedź brunatny' OR zwi.nazwa_gatunku = 'Niedźwiedź polarny'
	AND har.id_harmonogramu IN (
		SELECT id_harmonogramu
		FROM Raporty
		WHERE 
			data_karmienia BETWEEN '2024-12-01' AND '2024-12-31'
	);

/*---------------------------------------------------------------------------------------------*/
/* 8. Czym można zastąpić 100kg kapusty i 50kg marchewki?                                      */
/*---------------------------------------------------------------------------------------------*/

SELECT 
	zam.nazwa_jedzenia AS Jedzenie,
    zam.nazwa_zamiennika AS Zamiennik, 
    CASE 
        WHEN zam.nazwa_jedzenia = 'Kapusta' THEN 100 * zam.proporcja
        WHEN zam.nazwa_jedzenia = 'Marchew' THEN 50 * zam.proporcja
    END AS Ilość
FROM Zamienniki_jedzenia zam
JOIN Jedzenie jed ON zam.nazwa_zamiennika = jed.nazwa_jedzenia
WHERE zam.nazwa_jedzenia IN ('Kapusta', 'Marchew');

/*---------------------------------------------------------------------------------------------*/
/* 9. Jakie są wszystkie produkty, licząc zamienniki,                                          */
/*     możliwe do użycia w żywieniu żółwi będących obecnie w ZOO?                              */
/*---------------------------------------------------------------------------------------------*/

WITH ProduktyZolwi AS (
    SELECT DISTINCT
        por.nazwa_jedzenia,
        'Dieta' AS zrodlo
    FROM Posiłki pos
    JOIN Porcja por ON pos.id_posilku = por.id_posilku
    WHERE pos.id_diety IN (
        SELECT id_diety
        FROM POSIADA_DIETE
        WHERE nazwa_gatunku LIKE 'Żółw%'
    )
),
ZamiennikiZolwi AS (
    SELECT DISTINCT
        zam.nazwa_zamiennika AS nazwa_jedzenia,
        'Zamiennik' AS zrodlo
    FROM ProduktyZolwi pro
		JOIN Zamienniki_jedzenia zam ON pro.nazwa_jedzenia = zam.nazwa_jedzenia
)
SELECT DISTINCT
    nazwa_jedzenia,
    zrodlo
FROM
(
    SELECT * FROM ProduktyZolwi
    UNION ALL
    SELECT * FROM ZamiennikiZolwi
) AS Wszystkie
ORDER BY nazwa_jedzenia, zrodlo;


/*---------------------------------------------------------------------------------------------*/
/* 10. Ile razy zwierzęta odmówiły jedzenia w grudniu?                                         */
/*---------------------------------------------------------------------------------------------*/

SELECT COUNT(*) AS liczba_odmow
FROM Raporty rap
JOIN Harmonogramy har ON rap.id_harmonogramu = har.id_harmonogramu
JOIN Zwierzeta zwi ON har.imie = zwi.imie AND har.nazwa_gatunku = zwi.nazwa_gatunku
WHERE 
  rap.czy_nakarmione = 0
  AND MONTH(rap.data_karmienia) = 12;