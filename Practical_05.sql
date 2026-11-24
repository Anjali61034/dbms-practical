-- Practical 5: DDL ALTER Commands

USE DBMS_PracticeDB;
GO

-- Library staff table with only two columns to begin with
CREATE TABLE StaffRecords (
    StaffID    INT          NOT NULL,
    StaffName  VARCHAR(40)  NOT NULL
);
GO

-- 1
ALTER TABLE StaffRecords ADD Designation VARCHAR(30);
-- 2
ALTER TABLE StaffRecords ADD Mobile VARCHAR(12);
-- 3
ALTER TABLE StaffRecords ADD DOB DATE;
-- 4
ALTER TABLE StaffRecords ADD Gender CHAR(1);
-- 5
ALTER TABLE StaffRecords ADD MonthlyPay DECIMAL(9,2);
-- 6
ALTER TABLE StaffRecords ADD ShiftType VARCHAR(10);
-- 7
ALTER TABLE StaffRecords ADD PinCode CHAR(6);
-- 8
ALTER TABLE StaffRecords ADD WorkEmail VARCHAR(80);
-- 9
ALTER TABLE StaffRecords ADD Remarks VARCHAR(200);
-- 10
ALTER TABLE StaffRecords ADD OvertimeHrs INT, Incentive DECIMAL(7,2);
-- 11
ALTER TABLE StaffRecords ALTER COLUMN StaffName VARCHAR(80) NOT NULL;
-- 12
ALTER TABLE StaffRecords ALTER COLUMN Mobile CHAR(10) NOT NULL;
-- 13
ALTER TABLE StaffRecords ALTER COLUMN MonthlyPay DECIMAL(11,2);
-- 14
ALTER TABLE StaffRecords ALTER COLUMN Designation NVARCHAR(50);
-- 15
ALTER TABLE StaffRecords ADD CONSTRAINT PK_Staff PRIMARY KEY (StaffID);
-- 16
ALTER TABLE StaffRecords ADD CONSTRAINT UQ_Staff_Mobile UNIQUE (Mobile);
-- 17
ALTER TABLE StaffRecords ADD CONSTRAINT UQ_Staff_Email UNIQUE (WorkEmail);
-- 18
ALTER TABLE StaffRecords ADD CONSTRAINT CK_Staff_Gender CHECK (Gender IN ('M', 'F', 'O'));
-- 19
ALTER TABLE StaffRecords ADD CONSTRAINT CK_Staff_Pay CHECK (MonthlyPay >= 15000);
-- 20
ALTER TABLE StaffRecords ADD CONSTRAINT CK_Staff_Shift CHECK (ShiftType IN ('Morning', 'Evening', 'Night'));
-- 21
ALTER TABLE StaffRecords ADD CONSTRAINT DF_Staff_Shift DEFAULT 'Morning' FOR ShiftType;
-- 22
ALTER TABLE StaffRecords ADD CONSTRAINT DF_Staff_Desig DEFAULT 'Library Assistant' FOR Designation;
-- 23
ALTER TABLE StaffRecords ADD CONSTRAINT DF_Staff_OT DEFAULT 0 FOR OvertimeHrs;
-- 24
ALTER TABLE StaffRecords NOCHECK CONSTRAINT CK_Staff_Pay;
-- 25
ALTER TABLE StaffRecords CHECK CONSTRAINT CK_Staff_Pay;
-- 26
ALTER TABLE StaffRecords DROP CONSTRAINT UQ_Staff_Email;
-- 27
ALTER TABLE StaffRecords DROP CONSTRAINT DF_Staff_OT;
-- 28
ALTER TABLE StaffRecords DROP COLUMN Remarks;
-- 29
ALTER TABLE StaffRecords DROP COLUMN OvertimeHrs, Incentive;
-- 30
ALTER TABLE BookIssues ADD Remarks VARCHAR(100);
GO

-- Verify the final structure
SELECT COLUMN_NAME, DATA_TYPE, CHARACTER_MAXIMUM_LENGTH, IS_NULLABLE, COLUMN_DEFAULT
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'StaffRecords'
ORDER BY ORDINAL_POSITION;

SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE TABLE_NAME = 'StaffRecords'
ORDER BY CONSTRAINT_TYPE, CONSTRAINT_NAME;
GO
