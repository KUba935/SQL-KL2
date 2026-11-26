Część 1
SELECT nazwa, cena_netto FROM produkty WHERE aktywny = 1 AND cena_netto > 1000 ORDER BY cena_netto DESC;
SELECT nazwa, marka, cena_netto FROM produkty ORDER BY cena_netto DESC LIMIT 10;
SELECT imie, nazwisko, miasto, data_urodzenia FROM klienci WHERE miasto IN ('Lublin', 'Kraków') AND data_urodzenia > '1990-01-01' ORDER BY nazwisko ASC, imie ASC;
SELECT imie, nazwisko, miasto, email FROM klienci WHERE telefon IS NULL ORDER BY miasto ASC, nazwisko ASC;