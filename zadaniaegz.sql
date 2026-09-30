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
