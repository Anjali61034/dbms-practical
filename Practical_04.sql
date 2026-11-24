-- Practical 4: Referential Integrity Using DDL Commands

USE DBMS_PracticeDB;
GO

-- Parent table 2: Books
CREATE TABLE Books (
    BookID     INT           CONSTRAINT PK_Books PRIMARY KEY,
    ISBN       VARCHAR(17)   NOT NULL CONSTRAINT UQ_Books_ISBN UNIQUE,
    Title      VARCHAR(120)  NOT NULL,
    Author     VARCHAR(80)   NOT NULL,
    Genre      VARCHAR(40),
    Copies     INT           CONSTRAINT CK_Books_Copies CHECK (Copies BETWEEN 1 AND 20)
);
GO

-- Child table: BookIssues references Members (Practical 3) and Books
CREATE TABLE BookIssues (
    IssueID     INT   CONSTRAINT PK_BookIssues PRIMARY KEY,
    MemberID    INT   NOT NULL,
    BookID      INT   NULL,
    IssueDate   DATE  NOT NULL CONSTRAINT DF_Issue_Date DEFAULT GETDATE(),
    DueDate     DATE  NOT NULL,
    ReturnDate  DATE  NULL,
    CONSTRAINT CK_Issue_Due CHECK (DueDate > IssueDate),
    CONSTRAINT FK_Issue_Member FOREIGN KEY (MemberID)
        REFERENCES Members(MemberID)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT FK_Issue_Book FOREIGN KEY (BookID)
        REFERENCES Books(BookID)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);
GO

INSERT INTO Books VALUES
(201, '978-0131103627', 'The C Programming Language', 'Kernighan & Ritchie', 'Computing', 4),
(202, '978-0073523323', 'Database System Concepts', 'Silberschatz', 'Computing', 6),
(203, '978-0073376301', 'Introduction to Operations Research', 'Hillier & Lieberman', 'Operations Research', 5),
(204, '978-0132555661', 'Operations Research: An Introduction', 'Hamdy Taha', 'Operations Research', 3),
(205, '978-0471137023', 'Probability and Statistics', 'Morris DeGroot', 'Statistics', 2),
(206, '978-0133943030', 'Software Engineering', 'Ian Sommerville', 'Computing', 4),
(207, '978-0471465720', 'Inventory Management and Production', 'Silver & Pyke', 'Operations Research', 2),
(208, '978-0262033848', 'Introduction to Algorithms', 'Cormen et al.', 'Computing', 5);
GO

INSERT INTO BookIssues (IssueID, MemberID, BookID, IssueDate, DueDate, ReturnDate) VALUES
(1, 1, 202, '2026-11-02', '2026-11-16', NULL),
(2, 1, 203, '2026-11-02', '2026-11-16', '2026-11-12'),
(3, 2, 205, '2026-11-03', '2026-11-17', NULL),
(4, 2, 201, '2026-11-03', '2026-11-17', NULL),
(5, 3, 204, '2026-11-04', '2026-11-18', '2026-11-15'),
(6, 4, 207, '2026-11-05', '2026-11-19', NULL),
(7, 5, 205, '2026-11-06', '2026-11-20', NULL),
(8, 6, 208, '2026-11-07', '2026-11-21', NULL),
(9, 7, 203, '2026-11-09', '2026-11-23', NULL),
(10, 8, 206, '2026-11-10', '2026-11-24', NULL),
(11, 9, 202, '2026-11-11', '2026-11-25', NULL),
(12, 10, 204, '2026-11-12', '2026-11-26', NULL);
GO

-- (a) View issued books using the relationships
SELECT i.IssueID, m.FullName, b.Title, i.IssueDate, i.DueDate, i.ReturnDate
FROM BookIssues i
JOIN Members m ON i.MemberID = m.MemberID
JOIN Books b   ON i.BookID   = b.BookID
ORDER BY i.IssueID;
GO

-- (b) Referential integrity check: MemberID 500 does not exist (rejected)
INSERT INTO BookIssues (IssueID, MemberID, BookID, IssueDate, DueDate)
VALUES (13, 500, 201, '2026-11-20', '2026-12-04');
GO

-- (c) ON UPDATE CASCADE: change MemberID 1 to 101 in the parent table
UPDATE Members SET MemberID = 101 WHERE MemberID = 1;
SELECT IssueID, MemberID, BookID FROM BookIssues WHERE MemberID = 101;
GO

-- (d) ON DELETE CASCADE: delete member 2, their issue records are removed too
DELETE FROM Members WHERE MemberID = 2;
SELECT * FROM BookIssues WHERE MemberID = 2;
GO

-- (e) ON DELETE SET NULL: delete book 205, BookID becomes NULL in child rows
DELETE FROM Books WHERE BookID = 205;
SELECT IssueID, MemberID, BookID, DueDate FROM BookIssues WHERE BookID IS NULL;
GO
