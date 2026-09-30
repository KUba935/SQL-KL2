Zadanie 1
SELECT * FROM produkty WHERE id_kategorii = 12;
Zadanie 2
SELECT imie, nazwisko, email FROM klienci WHERE miasto = 'Warszawa' AND typ_klienta = 'indywidualny';
Zadanie 3
SELECT imie, nazwisko FROM pracownicy WHERE dzial = 'Sprzedaż' ORDER BY nazwisko ASC;
Zadanie 4
SELECT nazwa_produktu, cena_sprzedazy FROM produkty WHERE cena_zakupu > 5000;
Zadanie 5
SELECT id_zamowienia, data_zamowienia FROM zamowienia WHERE status_zamowienia = 'zrealizowane';
Zadanie 6
SELECT nazwa_produktu FROM produkty ORDER BY nazwa_produktu ASC;
Zadanie 7
SELECT nr_faktury, kwota_brutto FROM faktury WHERE data_wystawienia BETWEEN '2023-03-01' AND '2023-03-31';
Zadanie 8
SELECT imie, nazwisko, data_zatrudnienia FROM pracownicy WHERE data_zatrudnienia > '2020-01-01';
Zadanie 9
SELECT imie, nazwisko FROM klienci WHERE typ_klienta = 'indywidualny' AND imie LIKE "A%";
Zadanie 10
SELECT nazwa_produktu, cena_sprzedazy FROM produkty WHERE jednostka_miary = 'szt';
Zadanie 11
SELECT nazwa_magazynu, miasto FROM magazyny WHERE miasto = 'Warszawa' OR miasto = 'Kraków';
Zadanie 12
SELECT id_zamowienia FROM zamowienia WHERE koszt_dostawy = '0';
Zadanie 13
SELECT imie, nazwisko, pensja_podstawowa FROM pracownicy WHERE plec = 'M' AND pensja_podstawowa > 8000;
Zadanie 14
SELECT nazwa_kategorii FROM kategorie_produktow WHERE nadrzedna_kategoria_id IS NULL;
Zadanie 15
SELECT nazwa_produktu FROM produkty WHERE nazwa_produktu LIKE '%Pro%';

Zadania średnie
Zadanie 16
SELECT kp.nazwa_kategorii, AVG(p.cena_sprzedazy) AS srednia_cena_sprzedazy FROM kategorie_produktow kp INNER JOIN produkty p ON kp.id_kategorii = p.id_kategorii GROUP BY kp.id_kategorii, kp.nazwa_kategorii ORDER BY srednia_cena_sprzedazy DESC;
Zadanie 17
SELECT nazwa_firmy, rabat_staly FROM klienci WHERE typ_klienta = 'firma' AND rabat_staly > 3.00 ORDER BY rabat_staly DESC;
Zadanie 18
SELECT CASE WHEN k.typ_klienta = 'firma' THEN k.nazwa_firmy ELSE CONCAT(k.imie, ' ', k.nazwisko) END AS nazwa_klienta, COUNT(z.id_zamowienia) AS liczba_zamowien FROM klienci k INNER JOIN zamowienia z ON k.id_klienta = z.id_klienta GROUP BY k.id_klienta HAVING liczba_zamowien >= 1 ORDER BY liczba_zamowien DESC;
Zadanie 19
SELECT MONTH(data_wystawienia) AS numer_miesiaca, CASE MONTH(data_wystawienia) WHEN 1 THEN 'Styczeń' WHEN 2 THEN 'Luty' WHEN 3 THEN 'Marzec' WHEN 4 THEN 'Kwiecień' WHEN 5 THEN 'Maj' WHEN 6 THEN 'Czerwiec' WHEN 7 THEN 'Lipiec' WHEN 8 THEN 'Sierpień' WHEN 9 THEN 'Wrzesień' WHEN 10 THEN 'Październik' WHEN 11 THEN 'Listopad' WHEN 12 THEN 'Grudzień' END AS nazwa_miesiaca, SUM(kwota_brutto) AS suma_faktur_brutto FROM faktury WHERE YEAR(data_wystawienia) = 2023 GROUP BY MONTH(data_wystawienia) ORDER BY numer_miesiaca;
Zadanie 20
SELECT p.nazwa_produktu, COUNT(sm.id_magazynu) AS liczba_magazynow FROM produkty p INNER JOIN stany_magazynowe sm ON p.id_produktu = sm.id_produktu GROUP BY p.id_produktu, p.nazwa_produktu HAVING liczba_magazynow > 1 ORDER BY liczba_magazynow DESC;
Zadanie 22
SELECT p.kod_produktu, p.nazwa_produktu, SUM(sm.ilosc) AS laczna_ilosc FROM produkty p INNER JOIN stany_magazynowe sm ON p.id_produktu = sm.id_produktu GROUP BY p.id_produktu, p.kod_produktu, p.nazwa_produktu HAVING laczna_ilosc > 0;
Zadanie 23
SELECT id_zamowienia, data_zamowienia FROM zamowienia WHERE CAST(data_zamowienia AS DATE) BETWEEN '2023-03-10' AND '2023-03-20';
Zadanie 24
SELECT nazwa_produktu,(cena_sprzedazy - cena_zakupu) AS marza, ROUND(((cena_sprzedazy - cena_zakupu) / cena_zakupu * 100), 2) AS procent_marzy FROM produkty WHERE (cena_sprzedazy - cena_zakupu) > 2000;
Zadanie 25
SELECT CASE WHEN k.typ_klienta = 'firma' THEN k.nazwa_firmy ELSE CONCAT(k.imie, ' ', k.nazwisko) END AS nazwa_klienta, COUNT(z.id_zamowienia) AS liczba_zamowien FROM klienci k INNER JOIN zamowienia z ON k.id_klienta = z.id_klienta GROUP BY k.id_klienta HAVING liczba_zamowien > 2 ORDER BY liczba_zamowien DESC;
Zadanie 26
SELECT dzial, ROUND(AVG(YEAR(CURRENT_DATE) - YEAR(data_urodzenia)), 1) AS sredni_wiek FROM pracownicy GROUP BY dzial
Zadanie 27
