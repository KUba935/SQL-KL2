SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

CREATE TABLE `gatunki` (
  `id_gatunku` int(11) NOT NULL,
  `gatunek` varchar(35) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `gatunki` (`id_gatunku`, `gatunek`) VALUES
(1, 'Powiesc'),
(2, 'Kryminal'),
(3, 'Sensacja'),
(4, 'Fantastyka'),
(5, 'Poradniki'),
(6, 'Thriller'),
(7, 'Edukacyjne'),
(8, 'Komiks'),
(9, 'Poezja'),
(10, 'Dramat');

CREATE TABLE `klienci` (
  `id_klienta` int(11) NOT NULL,
  `imie` varchar(35) CHARACTER SET utf8 DEFAULT NULL,
  `nazwisko` varchar(35) CHARACTER SET utf8 DEFAULT NULL,
  `miasto` varchar(35) CHARACTER SET utf8 DEFAULT NULL,
  `kod_pocztowy` varchar(7) CHARACTER SET utf8 DEFAULT NULL,
  `ulica` varchar(35) CHARACTER SET utf8 DEFAULT NULL,
  `telefon` varchar(12) CHARACTER SET utf8 DEFAULT NULL,
  `login` varchar(35) CHARACTER SET utf8 DEFAULT NULL,
  `email` varchar(35) CHARACTER SET utf8 DEFAULT NULL,
  `haslo` varchar(35) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

INSERT INTO `klienci` (`id_klienta`, `imie`, `nazwisko`, `miasto`, `kod_pocztowy`, `ulica`, `telefon`, `login`, `email`, `haslo`) VALUES
(0, 'Jan', 'Wesoly', 'Lublin', '20-001', 'Pogodna', '123123456', 'jpogodny', 'jpogodny@mail.com', 'haslo'),
(1, 'Lukasz', 'Lewandowski', 'Poznan', NULL, NULL, NULL, 'llewandowski', NULL, 'haslo'),
(2, 'Jan', 'Nowak', 'Katowice', NULL, NULL, NULL, 'jnowak', NULL, 'haslo'),
(3, 'Maciej', 'Wojcik', 'Bydgoszcz', NULL, NULL, NULL, 'mwojcik', NULL, 'haslo'),
(4, 'Agnieszka', 'Jankowska', 'Lublin', NULL, NULL, NULL, 'ajankowska', NULL, 'haslo'),
(5, 'Tomasz', 'Mazur', 'Jelenia Gora', NULL, NULL, NULL, 'tmazur', NULL, 'haslo'),
(6, 'Michal', 'Zielinski', 'Krakow', NULL, NULL, NULL, 'mzielinski', NULL, 'haslo'),
(7, 'Artur', 'Rutkowski', 'Kielce', NULL, NULL, NULL, 'arutkowski', NULL, 'haslo'),
(8, 'Mateusz', 'Skorupa', 'Gdansk', NULL, NULL, NULL, 'mskorupa', NULL, 'haslo'),
(9, 'Jerzy', 'Rutkowski', 'Rybnik', NULL, NULL, NULL, 'jrutkowski', NULL, 'haslo'),
(10, 'Anna', 'Karenina', 'Pultusk', NULL, NULL, NULL, 'akarenina', NULL, 'haslo'),
(11, 'Anna', 'Kwiatowa', 'Lublin', '20-100', 'Poziomkowa 1', '12345643', 'akwiatowa', 'akwiatowa@mail.pl', 'haslo'),
(12, 'Maria', 'Wspaniala', 'Poznan', '65-343', 'Owocowa 49', '875493243', 'mwspaniala', 'mwspaniala@mail.pl', 'haslo'),
(13, 'Jan', 'Brzozowski', 'Poznan', '60-225', 'Jasna 14', '98765456', 'jbrzozowski', 'jbrzozowski@mail.pl', 'haslo'),
(14, 'Adam', 'Lipski', 'Lublin', '20-400', 'Sloneczna 3', '32343452', 'alipski', 'alipski@mail.pl', 'haslo');

CREATE TABLE `ksiazki` (
  `id_ksiazki` int(11) NOT NULL,
  `tytul` varchar(35) CHARACTER SET utf8 COLLATE utf8_polish_ci DEFAULT NULL,
  `id_autora` int(11) DEFAULT NULL,
  `id_wydawnictwa` int(11) DEFAULT NULL,
  `id_gatunku` int(11) DEFAULT NULL,
  `Cena` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `ksiazki` (`id_ksiazki`, `tytul`, `id_autora`, `id_wydawnictwa`, `id_gatunku`, `Cena`) VALUES
(1, 'HTML i CSS. Zaprojektuj i zbuduj.', 1, 1, 7, '76'),
(2, 'Szklany tron. Tom 1.', 2, 2, 4, '35'),
(3, 'Zapisane w wodzie', 3, 3, 3, '40'),
(4, 'Anioly i demony', 4, 4, 3, '49'),
(5, 'Nieznajomy', 5, 5, 3, '36'),
(6, 'Bez sladu.', 5, 5, 3, '35'),
(7, 'Wiersze zebrane.', 6, 6, 9, '27'),
(8, 'Mroczny rycerz kontratakuje', 7, 7, 8, '50'),
(9, 'Mysl!', 8, 8, 5, '80'),
(10, 'obca', 9, 9, 4, '30');

CREATE TABLE `pracownicy` (
  `id_pracownika` int(11) NOT NULL,
  `imie` varchar(35) DEFAULT NULL,
  `nazwisko` varchar(35) DEFAULT NULL,
  `id_stanowiska` int(11) DEFAULT NULL,
  `wynagrodzenie` float(7,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `pracownicy` (`id_pracownika`, `imie`, `nazwisko`, `id_stanowiska`, `wynagrodzenie`) VALUES
(1, 'Jan', 'Nowak', 2, 5000.00),
(2, 'Jan', 'Kowalski', 3, 3000.00),
(3, 'Anna', 'Szczesliwa', 1, 10000.00),
(4, 'Joanna', 'Kowalska', 3, 3500.00),
(5, 'Marek', 'Wojcik', 4, 3000.00),
(6, 'Katarzyna', 'Piekna', 6, 4000.00),
(7, 'Adam', 'Nowak', 3, 3000.00),
(8, 'Agnieszka', 'Bystra', 6, 5000.00);

CREATE TABLE `sprzedaz` (
  `id_sprzedazy` int(11) NOT NULL,
  `id_ksiazki` int(11) DEFAULT NULL,
  `id_klienta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

INSERT INTO `sprzedaz` (`id_sprzedazy`, `id_ksiazki`, `id_klienta`) VALUES
(1, 5, 1),
(2, 3, 2),
(3, 1, 5),
(4, 3, 6),
(5, 7, 2),
(6, 4, 1),
(7, 5, 2),
(8, 5, 5),
(9, 7, 2),
(10, 9, 2),
(11, 10, 1),
(12, 2, 3),
(13, 9, 3),
(14, 8, 4),
(15, 7, 3),
(16, 6, 12),
(17, 10, 14),
(18, 1, 8),
(19, 7, 12),
(20, 5, 13),
(21, 8, 1),
(22, 9, 14),
(23, 8, 12),
(24, 4, 6),
(25, 7, 14),
(26, 2, 12),
(27, 8, 10);

CREATE TABLE `stanowiska` (
  `id_stanowiska` int(11) NOT NULL,
  `nazwa` varchar(35) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `stanowiska` (`id_stanowiska`, `nazwa`) VALUES
(1, 'Dyrektor'),
(2, 'Kierownik'),
(3, 'Bibliotekarz'),
(4, 'Sprzatacz'),
(5, 'Stazysta'),
(6, 'Ksiegowy');

CREATE TABLE `wydawnictwa` (
  `id_wydawnictwa` int(11) NOT NULL,
  `wydawnictwo` varchar(35) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `wydawnictwa` (`id_wydawnictwa`, `wydawnictwo`) VALUES
(1, 'Helion'),
(2, 'Uroboros'),
(3, 'Swiat Ksiazki'),
(4, 'Sonia Draga'),
(5, 'Albatros'),
(6, 'UMCS'),
(7, 'Egmont Polska Sp. z o. o.'),
(8, 'Poligraf'),
(9, 'Znak'),
(10, 'Zysk i s-ka');

ALTER TABLE `gatunki`
  ADD PRIMARY KEY (`id_gatunku`);

ALTER TABLE `gatunki`
  MODIFY `id_gatunku` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

ALTER TABLE `klienci`
  ADD PRIMARY KEY (`id_klienta`),
  ADD UNIQUE KEY `id_klienta` (`id_klienta`);

ALTER TABLE `klienci`
  MODIFY `id_klienta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

ALTER TABLE `ksiazki`
  ADD PRIMARY KEY (`id_ksiazki`);

ALTER TABLE `ksiazki`
  MODIFY `id_ksiazki` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

ALTER TABLE `pracownicy`
  ADD PRIMARY KEY (`id_pracownika`);

ALTER TABLE `pracownicy`
  MODIFY `id_pracownika` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

ALTER TABLE `stanowiska`
  ADD PRIMARY KEY (`id_stanowiska`);

ALTER TABLE `stanowiska`
  MODIFY `id_stanowiska` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

ALTER TABLE `wydawnictwa`
  ADD PRIMARY KEY (`id_wydawnictwa`);

ALTER TABLE `wydawnictwa`
  MODIFY `id_wydawnictwa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

COMMIT;