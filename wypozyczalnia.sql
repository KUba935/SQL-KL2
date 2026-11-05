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

