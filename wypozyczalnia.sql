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

