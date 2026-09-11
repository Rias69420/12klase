CREATE TABLE SKOLENI (
    ID INTEGER PRIMARY KEY,
    Vards TEXT NOT NULL,
    Uzvards TEXT NOT NULL,
    Vecums INTEGER NOT NULL,
    Dzim_diena DATE NOT NULL
);

INSERT INTO SKOLENI (ID, Vards, Uzvards, Vecums, Dzim_diena)
VALUES
(1, 'Jānis', 'Krūmiņš', 18, '2008-02-29'),
(2, 'Anna', 'Bērziņa', 18, '2008-01-01');

INSERT INTO SKOLENI (ID, Vards, Uzvards, Vecums, Dzim_diena) VALUES
(3, 'Pēteris', 'Neuzvārdots', 15, '2011-03-03');

SELECT * FROM SKOLENI;

SELECT *
FROM SKOLENI
WHERE uzvards LIKE 'K%';

SELECT Vards, uzvards, dzim_diena
FROM SKOLENI
WHERE vecums >= 18
ORDER BY Vards ASC;


SELECT *
FROM SKOLENI
WHERE Vards = 'Anna' AND Uzvards = 'Bērziņa';

DROP TABLE SKOLENI;