-- 1. Izvadi visus darbiniekus ar vārdu un amatu.
-- 2. Parādi visus darbiniekus, kas strādā IT departamentā.
-- 3. Atrodi visus darbiniekus, kuri pieņemti darbā pēc 2020-01-01.
-- 4. Parādi visus darbiniekus, kuru alga ir vairāk nekā 50 000.
-- 5. Izvadi darbiniekus no finanšu nodaļas, sakārtojot pēc algas augoši.
-- 6. Izvadi darbiniekus, sakārtojot tos pēc darba sākuma datuma (senākais pirmais).
-- 7. Parādi visus darbiniekus, kuru amats ir "Vadītājs".
-- 8. Izvadi pirmos 3 darbiniekus ar vislielākajām algām.
-- 9. Atrodi visus darbiniekus, kuru vārds sākas ar burtu "K".
-- 10. Parādi visus darbiniekus no Pārdošanas departamenta, sakārtojot pēc algas dilstoši.

--TABULAS IZVEIDES KODS

CREATE TABLE darbinieki (
    id INTEGER PRIMARY KEY,
    vards TEXT NOT NULL,
    departaments TEXT NOT NULL,
    amats TEXT NOT NULL,
    alga INTEGER NOT NULL,
    darba_sakums DATE NOT NULL
);

INSERT INTO darbinieki (vards, departaments, amats, alga, darba_sakums) VALUES
('Alise Jansone', 'Personāls', 'Vadītāja', 55000, '2018-04-12'),
('Kārlis Kalniņš', 'IT', 'Programmētājs', 72000, '2020-07-01'),
('Kārlis Ozols', 'Finanses', 'Analītiķis', 48000, '2019-02-15'),
('Diāna Eglīte', 'IT', 'Programmētāja', 75000, '2017-11-23'),
('Edgars Liepa', 'Finanses', 'Vadītājs', 65000, '2016-05-30'),
('Zane Bērziņa', 'Personāls', 'Personāla atlase', 42000, '2021-03-18'),
('Gatis Balodis', 'Pārdošana', 'Pārdevējs', 46000, '2019-09-12'),
('Elza Lapiņa', 'Pārdošana', 'Vadītāja', 68000, '2015-01-05'),
('Ivo Vilciņš', 'IT', 'Supports', 40000, '2022-01-11'),
('Katrīna Roze', 'Finanses', 'Analītiķe', 49000, '2020-06-22');

-- 1.
SELECT vards, amats FROM darbinieki;

-- 2.
SELECT * FROM darbinieki WHERE departaments = 'IT';

-- 3.
SELECT * FROM darbinieki WHERE darba_sakums > '2020-01-01';

-- 4.
SELECT * FROM darbinieki WHERE alga > 50000;

-- 5.
SELECT * FROM darbinieki WHERE departaments = 'Finanses' ORDER BY alga ASC;

-- 6.
SELECT * FROM darbinieki ORDER BY darba_sakums ASC;

-- 7.
SELECT * FROM darbinieki WHERE amats = 'Vadītājs';

-- 8.
SELECT * FROM darbinieki ORDER BY alga DESC LIMIT 3;

-- 9.
SELECT * FROM darbinieki WHERE vards LIKE 'K%';

-- 10.
SELECT * FROM darbinieki WHERE departaments = 'Pārdošana' ORDER BY alga DESC;
