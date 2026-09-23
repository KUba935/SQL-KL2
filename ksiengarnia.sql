Zadanie 1
SELECT * FROM klienci WHERE miasto = 'Lublin';
Zadanie 2
SELECT tytul, Cena FROM ksiazki WHERE Cena > 40;
Zadanie 3
SELECT miasto, COUNT(*) AS liczba_klientow FROM klienci GROUP BY miasto;
Zadanie 4 
SELECT id_klienta, COUNT(*) FROM sprzedaz GROUP BY id_klienta;
Zadanie 5
SELECT * FROM klienci WHERE id_klienta NOT IN (SELECT id_klienta FROM sprzedaz);
Zadanie 6
SELECT DISTINCT k.* FROM klienci k JOIN sprzedaz s ON k.id_klienta = s.id_klienta JOIN ksiazki ks ON s.id_ksiazki = ks.id_ksiazki JOIN gatunki g ON ks.id_gatunku = g.id_gatunku WHERE g.gatunek = 'Fantastyka';
Zadanie 7
SELECT g.gatunek, AVG(ks.Cena) AS srednia_cena FROM gatunki g JOIN ksiazki ks ON g.id_gatunku = ks.id_gatunku GROUP BY g.gatunek;
Zadanie 8
SELECT ks.tytul FROM ksiazki ks LEFT JOIN sprzedaz s ON ks.id_ksiazki = s.id_ksiazki WHERE s.id_sprzedazy IS NULL;
Zadanie 9
SELECT id_klienta, COUNT(*) AS ilosc_zakupow FROM sprzedaz GROUP BY id_klienta HAVING COUNT(*) > 3;
Zadanie 10
SELECT w.wydawnictwo, COUNT(ks.id_ksiazki) AS ilosc_ksiazek FROM wydawnictwa w LEFT JOIN ksiazki ks ON w.id_wydawnictwa = ks.id_wydawnictwa GROUP BY w.wydawnictwo;
Zadanie 11
SELECT DISTINCT k.* FROM klienci k INNER JOIN sprzedaz s ON k.id_klienta = s.id_klienta INNER JOIN ksiazki ks ON s.id_ksiazki = ks.id_ksiazki INNER JOIN gatunki g ON ks.id_gatunku = g.id_gatunku WHERE g.gatunek IN ('Sensacja', 'Thriller');
Zadanie 13
SELECT g.gatunek, COUNT(ks.id_ksiazki) AS ilosc_ksiazek FROM gatunki g LEFT JOIN ksiazki ks ON g.id_gatunku = ks.id_gatunku GROUP BY g.gatunek;
Zadanie 14
SELECT ks.tytul, COUNT(*) AS ilosc_sprzedazy FROM ksiazki ks JOIN sprzedaz s ON ks.id_ksiazki = s.id_ksiazki GROUP BY ks.tytul HAVING COUNT(*) > 2;
Zadanie 15
SELECT p.imie, p.nazwisko, s.nazwa FROM pracownicy p JOIN stanowiska s ON p.id_stanowiska = s.id_stanowiska WHERE p.wynagrodzenie > (SELECT AVG(wynagrodzenie) FROM pracownicy);
Zadanie 16
SELECT DISTINCT ks.tytul FROM ksiazki ks INNER JOIN sprzedaz s ON ks.id_ksiazki = s.id_ksiazki INNER JOIN klienci k ON s.id_klienta = k.id_klienta WHERE k.nazwisko = 'Kowalski';
Zadanie 17
SELECT k.id_klienta, k.imie, k.nazwisko, SUM(ks.Cena) AS suma FROM klienci k JOIN sprzedaz s ON k.id_klienta = s.id_klienta JOIN ksiazki ks ON s.id_ksiazki = ks.id_ksiazki GROUP BY k.id_klienta, k.imie, k.nazwisko HAVING SUM(ks.Cena) > 100;
Zadanie 18
SELECT s.nazwa, COUNT(p.id_pracownika) AS liczba FROM stanowiska s LEFT JOIN pracownicy p ON s.id_stanowiska = p.id_stanowiska GROUP BY s.nazwa;
Zadanie 19
SELECT k.id_klienta, k.imie, k.nazwisko, COUNT(*) AS ilosc FROM klienci k JOIN sprzedaz s ON k.id_klienta = s.id_klienta GROUP BY k.id_klienta, k.imie, k.nazwisko ORDER BY ilosc DESC LIMIT 1;
Zadanie 20
SELECT k.id_klienta, k.imie, k.nazwisko FROM klienci k INNER JOIN sprzedaz s ON k.id_klienta = s.id_klienta INNER JOIN ksiazki ks ON s.id_ksiazki = ks.id_ksiazki INNER JOIN gatunki g ON ks.id_gatunku = g.id_gatunku WHERE g.gatunek IN ('Fantastyka', 'Sensacja') GROUP BY k.id_klienta, k.imie, k.nazwisko HAVING COUNT(DISTINCT g.gatunek) = 2;
Zadanie 21
SELECT k.id_klienta, k.imie, k.nazwisko, SUM(ks.Cena) AS laczna_wartosc FROM klienci k INNER JOIN sprzedaz s ON k.id_klienta = s.id_klienta INNER JOIN ksiazki ks ON s.id_ksiazki = ks.id_ksiazki GROUP BY k.id_klienta, k.imie, k.nazwisko HAVING SUM(ks.Cena) > ( SELECT AVG(wartosc) FROM ( SELECT SUM(ks2.Cena) AS wartosc FROM sprzedaz s2 JOIN ksiazki ks2 ON s2.id_ksiazki = ks2.id_ksiazki GROUP BY s2.id_klienta ) AS srednie_zakupy );
