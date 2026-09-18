CREATE TABLE Klases (
  ID INTEGER PRIMARY KEY,
  nosaukums TEXT NOT NULL,
  telpa INTEGER NOT NULL,
  audz TEXT NOT NULL,
  skol_sk INTEGER NOT NULL
);

CREATE TABLE SKOLENI (
    ID INTEGER PRIMARY KEY,
    Vards TEXT NOT NULL,
    Uzvards TEXT NOT NULL,
    Vecums INTEGER NOT NULL,
    Dzim_diena DATE NOT NULL,
    Klases_id INTEGER NOT NULL,
    FOREIGN KEY (Klases_id) REFERENCES Klases(ID)
);

INSERT INTO Klases (ID, nosaukums, telpa, audz, skol_sk) VALUES 
(1, '12.m', 209, 'B. Rutka', 20),
(2, '12.d', 110, 'J. Zarāne', 20),
(3, '12.b', 107, 'I. Puķīte', 20);

INSERT INTO SKOLENI 
    (ID, Vards, Uzvards, Vecums, Dzim_diena, Klases_id)
VALUES
    (1, 'Jānis', 'Krūmiņš', 18, '2008-02-29', 1),
    (2, 'Anna', 'Bērziņa', 18, '2008-01-01', 1),
    (3, 'Pēteris', 'Neuzvārdots', 15, '2011-03-03', 2),
    (4, 'Elza', 'Bērziņa', 17, '2003-02-01', 3);

SELECT * FROM SKOLENI;

SELECT * FROM Klases;


SELECT s.ID, s.Vards, s.Uzvards, s.Vecums, s.Dzim_diena, k.nosaukums
FROM SKOLENI s
JOIN Klases k ON s.Klases_id = k.ID
WHERE k.nosaukums = '12.m';

-- SELECT *
-- FROM SKOLENI
-- WHERE Uzvards LIKE 'K%';

-- SELECT Vards, Uzvards, Dzim_diena
-- FROM SKOLENI
-- WHERE Vecums >= 18
-- ORDER BY Vards ASC;

SELECT *
FROM SKOLENI
WHERE Vards = 'Anna' 
AND Uzvards = 'Bērziņa';

DROP TABLE SKOLENI;