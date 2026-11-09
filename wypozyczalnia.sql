Warunkowe zapytania
Zadania proste
SELECT * FROM klienci WHERE data_rejestracji > 2020-01-01;
SELECT * FROM opinie WHERE ocena = 5;
SELECT * FROM platnosci WHERE metoda_platnosci = "karta";
SELECT * FROM faktury WHERE kwota_calosci > 400;
Zadania średnio trudne
SELECT imie, nazwisko FROM klienci WHERE nazwisko LIKE "K%";
SELECT kwota_calosci FROM faktury WHERE zaplacono = "tak";
SELECT * FROM opinie WHERE YEAR(data_opinii) = 2023 AND ocena >= 4;
SELECT * FROM platnosci WHERE kwota BETWEEN 400 AND 700;
SELECT DISTINCT k.* FROM Klienci k INNER JOIN opinie o ON o.id_klienta = k.id_klienta;
Zadania trudne
SELECT DISTINCT k.* FROM klienci k INNER JOIN Wypozyczenia w ON w.id_klienta = k.id_klienta INNER JOIN Faktury f ON f.id_wypozyczenia = w.id_wypozyczenia INNER JOIN Platnosci p ON p.id_faktury = f.id_faktury WHERE f.data_faktury >= '2023-01-01' AND f.data_faktury < '2024-01-01';
SELECT * FROM faktury WHERE kwota_calosci > 500 AND zaplacono = 'nie';
SELECT DISTINCT k.* FROM klienci k INNER JOIN Wypozyczenia w ON w.id_klienta = k.id_klienta INNER JOIN Faktury f ON f.id_wypozyczenia = w.id_wypozyczenia INNER JOIN Platnosci p ON p.id_faktury = f.id_faktury WHERE p.metoda_platnosci IN ('przelew', 'gotówka');
SELECT DISTINCT f.* FROM faktury f INNER JOIN Wypozyczenia w ON w.id_wypozyczenia = f.id_wypozyczenia INNER JOIN Opinie o ON o.id_samochodu = w.id_samochodu WHERE o.ocena < 4
SELECT k.id_klienta, k.imie, k.nazwisko FROM klienci k INNER JOIN Wypozyczenia w ON w.id_klienta = k.id_klienta INNER JOIN Opinie o ON o.id_klienta = k.id_klienta GROUP BY k.id_klienta, k.imie, k.nazwisko HAVING COUNT(DISTINCT o.id_samochodu) >= 2;

Grupowanie danych
Zadania proste
SELECT k.id_klienta, k.imie, k.nazwisko, COUNT(f.id_faktury) AS liczba_faktur FROM klienci k LEFT JOIN Wypozyczenia w ON w.id_klienta = k.id_klienta LEFT JOIN Faktury f ON f.id_wypozyczenia = w.id_wypozyczenia GROUP BY k.id_klienta, k.imie, k.nazwisko;
SELECT k.id_klienta, k.imie, k.nazwisko, COUNT(o.id_opinii) AS liczba_opinii FROM klienci k LEFT JOIN Opinie o ON o.id_klienta = k.id_klienta GROUP BY k.id_klienta, k.imie, k.nazwisko;
SELECT metoda_platnosci, AVG(kwota) AS srednia_kwota FROM platnosci GROUP BY metoda_platnosci;
SELECT MONTH(data_platnosci) AS miesiac, COUNT(*) AS liczba_platnosci FROM platnosci WHERE data_platnosci >= '2023-01-01' AND data_platnosci < '2024-01-01' GROUP BY MONTH(data_platnosci) ORDER BY miesiac;

Zadania średnio trudne
SELECT k.id_klienta, k.imie, k.nazwisko, COUNT(p.id_platnosci) AS liczba_platnosci FROM klienci k INNER JOIN wypozyczenia w ON w.id_klienta = k.id_klienta INNER JOIN faktury f ON f.id_wypozyczenia = w.id_wypozyczenia INNER JOIN platnosci p ON p.id_faktury = f.id_faktury GROUP BY k.id_klienta, k.imie, k.nazwisko HAVING COUNT(p.id_platnosci) >= 2;
SELECT s.id_samochodu, s.marka, s.model, AVG(o.ocena) AS srednia_ocena FROM samochody s INNER JOIN opinie o ON o.id_samochodu = s.id_samochodu GROUP BY s.id_samochodu, s.marka, s.model;
SELECT k.id_klienta, k.imie, k.nazwisko, AVG(o.ocena) AS srednia_ocena FROM klienci k INNER JOIN opinie o ON o.id_klienta = k.id_klienta GROUP BY k.id_klienta, k.imie, k.nazwisko HAVING AVG(o.ocena) >= 4;
SELECT YEAR(data_faktury) AS rok, MONTH(data_faktury) AS miesiac, COUNT(*) AS liczba_faktur FROM faktury GROUP BY YEAR(data_faktury), MONTH(data_faktury) ORDER BY rok, miesiac;

Zadania trudne
SELECT k.id_klienta, k.imie, k.nazwisko, AVG(f.kwota_calosci) AS srednia_kwota_faktur FROM klienci k INNER JOIN wypozyczenia w ON w.id_klienta = k.id_klienta INNER JOIN faktury f ON f.id_wypozyczenia = w.id_wypozyczenia GROUP BY k.id_klienta, k.imie, k.nazwisko HAVING AVG(f.kwota_calosci) > 600;
SELECT k.id_klienta, k.imie, k.nazwisko, SUM(p.kwota) AS suma_platnosci FROM klienci k INNER JOIN wypozyczenia w ON w.id_klienta = k.id_klienta INNER JOIN faktury f ON f.id_wypozyczenia = w.id_wypozyczenia INNER JOIN platnosci p ON p.id_faktury = f.id_faktury GROUP BY k.id_klienta, k.imie, k.nazwisko HAVING SUM(p.kwota) > 1000;
SELECT metoda_platnosci, AVG(kwota) AS srednia_kwota FROM platnosci GROUP BY metoda_platnosci HAVING AVG(kwota) > 500;
SELECT k.id_klienta, k.imie, k.nazwisko, COALESCE(f.liczba_faktur, 0) AS liczba_faktur, COALESCE(p.suma_platnosci, 0) AS suma_platnosci FROM klienci k LEFT JOIN ( SELECT w.id_klienta, COUNT(f.id_faktury) AS liczba_faktur FROM wypozyczenia w INNER JOIN faktury f ON f.id_wypozyczenia = w.id_wypozyczenia GROUP BY w.id_klienta ) f ON f.id_klienta = k.id_klienta LEFT JOIN ( SELECT w.id_klienta, SUM(p.kwota) AS suma_platnosci FROM wypozyczenia w INNER JOIN faktury f ON f.id_wypozyczenia = w.id_wypozyczenia INNER JOIN platnosci p ON p.id_faktury = f.id_faktury GROUP BY w.id_klienta ) p ON p.id_klienta = k.id_klienta;

Łączenie tabel
Zadania
SELECT f.*, p.id_platnosci, p.data_platnosci, p.kwota AS kwota_platnosci, p.metoda_platnosci FROM faktury f LEFT JOIN platnosci p ON p.id_faktury = f.id_faktury;
SELECT k.*, o.id_opinii, o.id_samochodu, o.ocena, o.komentarz, o.data_opinii, s.marka, s.model FROM klienci k LEFT JOIN opinie o ON o.id_klienta = k.id_klienta LEFT JOIN samochody s ON s.id_samochodu = o.id_samochodu;
SELECT k.*, f.* FROM klienci k LEFT JOIN wypozyczenia w ON w.id_klienta = k.id_klienta LEFT JOIN faktury f ON f.id_wypozyczenia = w.id_wypozyczenia;
SELECT f.*, p.id_platnosci, p.data_platnosci, p.kwota AS kwota_platnosci, p.metoda_platnosci FROM faktury f LEFT JOIN platnosci p ON p.id_faktury = f.id_faktury;
SELECT DISTINCT k.* FROM klienci k INNER JOIN wypozyczenia w ON w.id_klienta = k.id_klienta INNER JOIN faktury f ON f.id_wypozyczenia = w.id_wypozyczenia INNER JOIN platnosci p ON p.id_faktury = f.id_faktury WHERE p.metoda_platnosci = 'karta' AND EXISTS ( SELECT 1 FROM opinie o WHERE o.id_klienta = k.id_klienta );

