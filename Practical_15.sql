-- Practical 15: Suppliers, Parts, and Catalog Queries

USE DBMS_PracticeDB;
GO

CREATE TABLE Suppliers (
       sid INT PRIMARY KEY,
       sname VARCHAR(100) NOT NULL,
       address VARCHAR(150)
);

CREATE TABLE Parts (
       pid INT PRIMARY KEY,
       pname VARCHAR(100) NOT NULL,
       color VARCHAR(30)
);

CREATE TABLE Catalog (
       sid INT FOREIGN KEY REFERENCES Suppliers(sid),
       pid INT FOREIGN KEY REFERENCES Parts(pid),
       cost REAL,
       PRIMARY KEY (sid, pid)
);
GO

INSERT INTO Suppliers VALUES
(1, 'Acme Widget Suppliers', '221B Baker Street'),
(2, 'Global Parts Co', '45 Industrial Park'),
(3, 'RedLine Supplies', '12 Market Road'),
(4, 'GreenTech Traders', '88 Eco Avenue'),
(5, 'Apex Hardware', '10 Tech Plaza');

INSERT INTO Parts VALUES
(101, 'Bolt', 'Red'),
(102, 'Nut', 'Red'),
(103, 'Washer', 'Green'),
(104, 'Gear', 'Blue'),
(105, 'Acme Special Valve', 'Yellow');

INSERT INTO Catalog VALUES
(1, 101, 10.50), (1, 102, 12.00), (1, 103, 15.00), (1, 104, 25.00), (1, 105,
50.00),
(2, 101, 14.00), (2, 102, 11.00), (2, 103, 18.00),
(3, 101, 9.50), (3, 102, 15.50),
(4, 103, 14.00),
(5, 101, 13.00), (5, 104, 30.00);

GO

SELECT DISTINCT P.pname
FROM Parts P
INNER JOIN Catalog C ON P.pid = C.pid;

SELECT S.sname
FROM Suppliers S
WHERE NOT EXISTS (
       SELECT P.pid FROM Parts P
       WHERE NOT EXISTS (
             SELECT C.pid FROM Catalog C
             WHERE C.sid = S.sid AND C.pid = P.pid
     )
);

SELECT S.sname
FROM Suppliers S
WHERE NOT EXISTS (
       SELECT P.pid FROM Parts P
       WHERE P.color = 'Red'
         AND NOT EXISTS (
               SELECT C.pid FROM Catalog C
               WHERE C.sid = S.sid AND C.pid = P.pid
         )
);

SELECT P.pname
FROM Parts P
INNER JOIN Catalog C ON P.pid = C.pid
INNER JOIN Suppliers S ON C.sid = S.sid
WHERE S.sname = 'Acme Widget Suppliers'
  AND NOT EXISTS (
         SELECT 1 FROM Catalog C2
         WHERE C2.pid = P.pid AND C2.sid <> S.sid
  );

SELECT DISTINCT C.sid
FROM Catalog C
WHERE C.cost > (
       SELECT AVG(C2.cost)
       FROM Catalog C2
       WHERE C2.pid = C.pid
);

SELECT P.pid, P.pname, S.sname, C.cost
FROM Parts P
INNER JOIN Catalog C ON P.pid = C.pid
INNER JOIN Suppliers S ON C.sid = S.sid
WHERE C.cost = (
     SELECT MAX(C2.cost)
     FROM Catalog C2
     WHERE C2.pid = P.pid
);

SELECT DISTINCT C.sid
FROM Catalog C
WHERE NOT EXISTS (
     SELECT 1
     FROM Catalog C2
     INNER JOIN Parts P ON C2.pid = P.pid
     WHERE C2.sid = C.sid AND P.color <> 'Red'
);

SELECT C.sid
FROM Catalog C
INNER JOIN Parts P ON C.pid = P.pid
WHERE P.color = 'Red'
INTERSECT
SELECT C.sid
FROM Catalog C
INNER JOIN Parts P ON C.pid = P.pid
WHERE P.color = 'Green';

SELECT DISTINCT C.sid
FROM Catalog C
INNER JOIN Parts P ON C.pid = P.pid
WHERE P.color = 'Red' OR P.color = 'Green';
GO
