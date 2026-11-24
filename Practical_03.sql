-- Practical 3: DDL Commands With Constraints

USE DBMS_PracticeDB;
GO

-- Case example: Library Management System (Members table)
CREATE TABLE Members (
    MemberID      INT           CONSTRAINT PK_Members PRIMARY KEY,
    MembershipNo  VARCHAR(12)   NOT NULL CONSTRAINT UQ_Members_No UNIQUE,
    FullName      VARCHAR(100)  NOT NULL,
    Email         VARCHAR(100)  NOT NULL CONSTRAINT UQ_Members_Email UNIQUE,
    Phone         CHAR(10)      NOT NULL
                  CONSTRAINT CK_Members_Phone CHECK (Phone NOT LIKE '%[^0-9]%'),
    Age           INT           CONSTRAINT CK_Members_Age CHECK (Age BETWEEN 12 AND 80),
    MemberType    VARCHAR(10)   CONSTRAINT DF_Members_Type DEFAULT 'Student'
                  CONSTRAINT CK_Members_Type CHECK (MemberType IN ('Student', 'Faculty', 'Public')),
    City          VARCHAR(40)   CONSTRAINT DF_Members_City DEFAULT 'Delhi',
    JoinDate      DATE          CONSTRAINT DF_Members_Join DEFAULT GETDATE(),
    FineDue       DECIMAL(6,2)  CONSTRAINT DF_Members_Fine DEFAULT 0
                  CONSTRAINT CK_Members_Fine CHECK (FineDue >= 0)
);
GO

-- 27 records with explicit values (JoinDate uses DEFAULT)
INSERT INTO Members (MemberID, MembershipNo, FullName, Email, Phone, Age, MemberType, City, FineDue) VALUES
(1, 'LIB260001', 'Ishaan Malhotra', 'ishaan.malhotra@mail.com', '9811104729', 21, 'Student', 'Delhi', 0.00),
(2, 'LIB260002', 'Zoya Qureshi', 'zoya.qureshi@mail.com', '9811209458', 24, 'Student', 'Noida', 0.00),
(3, 'LIB260003', 'Tanmay Bhardwaj', 'tanmay.bhardwaj@mail.com', '9811314187', 47, 'Faculty', 'Gurugram', 15.50),
(4, 'LIB260004', 'Kritika Sood', 'kritika.sood@mail.com', '9811418916', 22, 'Student', 'Delhi', 0.00),
(5, 'LIB260005', 'Aryan Chawla', 'aryan.chawla@mail.com', '9811523645', 55, 'Public', 'Faridabad', 40.00),
(6, 'LIB260006', 'Simran Kaur', 'simran.kaur@mail.com', '9811628374', 20, 'Student', 'Delhi', 0.00),
(7, 'LIB260007', 'Vedant Arora', 'vedant.arora@mail.com', '9811733103', 42, 'Faculty', 'Ghaziabad', 0.00),
(8, 'LIB260008', 'Mahima Dutta', 'mahima.dutta@mail.com', '9811837832', 18, 'Student', 'Delhi', 10.00),
(9, 'LIB260009', 'Rehan Siddiqui', 'rehan.siddiqui@mail.com', '9811942561', 43, 'Public', 'Sonipat', 0.00),
(10, 'LIB260010', 'Anushka Goel', 'anushka.goel@mail.com', '9812047290', 24, 'Student', 'Delhi', 25.00),
(11, 'LIB260011', 'Parth Ahuja', 'parth.ahuja@mail.com', '9812152019', 19, 'Student', 'Delhi', 0.00),
(12, 'LIB260012', 'Naina Bedi', 'naina.bedi@mail.com', '9812256748', 22, 'Student', 'Noida', 0.00),
(13, 'LIB260013', 'Kunal Grover', 'kunal.grover@mail.com', '9812361477', 47, 'Faculty', 'Gurugram', 15.50),
(14, 'LIB260014', 'Sakshi Tyagi', 'sakshi.tyagi@mail.com', '9812466206', 20, 'Student', 'Delhi', 0.00),
(15, 'LIB260015', 'Dhruv Sethi', 'dhruv.sethi@mail.com', '9812570935', 45, 'Public', 'Faridabad', 40.00),
(16, 'LIB260016', 'Avni Batra', 'avni.batra@mail.com', '9812675664', 18, 'Student', 'Delhi', 0.00),
(17, 'LIB260017', 'Rudra Pandey', 'rudra.pandey@mail.com', '9812780393', 42, 'Faculty', 'Ghaziabad', 0.00),
(18, 'LIB260018', 'Jhanvi Sharma', 'jhanvi.sharma@mail.com', '9812885122', 24, 'Student', 'Delhi', 10.00),
(19, 'LIB260019', 'Lakshay Dhawan', 'lakshay.dhawan@mail.com', '9812989851', 33, 'Public', 'Sonipat', 0.00),
(20, 'LIB260020', 'Mansi Rawat', 'mansi.rawat@mail.com', '9813094580', 22, 'Student', 'Delhi', 25.00),
(21, 'LIB260021', 'Om Prakash Yadav', 'om.yadav@mail.com', '9813199309', 25, 'Student', 'Delhi', 0.00),
(22, 'LIB260022', 'Tanya Khurana', 'tanya.khurana@mail.com', '9813304038', 20, 'Student', 'Noida', 0.00),
(23, 'LIB260023', 'Yuvraj Gill', 'yuvraj.gill@mail.com', '9813408767', 47, 'Faculty', 'Gurugram', 15.50),
(24, 'LIB260024', 'Bhavya Jain', 'bhavya.jain@mail.com', '9813513496', 18, 'Student', 'Delhi', 0.00),
(25, 'LIB260025', 'Arnav Kohli', 'arnav.kohli@mail.com', '9813618225', 35, 'Public', 'Faridabad', 40.00),
(26, 'LIB260026', 'Charvi Mathur', 'charvi.mathur@mail.com', '9813722954', 24, 'Student', 'Delhi', 0.00),
(27, 'LIB260027', 'Siddhant Bose', 'siddhant.bose@mail.com', '9813827683', 42, 'Faculty', 'Ghaziabad', 0.00);
GO

-- 3 records relying on DEFAULT for MemberType, City, JoinDate and FineDue
INSERT INTO Members (MemberID, MembershipNo, FullName, Email, Phone, Age) VALUES
(28, 'LIB260028', 'Gauri Negi', 'gauri.negi@mail.com', '9813932412', 22),
(29, 'LIB260029', 'Moksh Bansal', 'moksh.bansal@mail.com', '9814037141', 23),
(30, 'LIB260030', 'Ira Venkatesh', 'ira.venkatesh@mail.com', '9814141870', 20);
GO

SELECT * FROM Members;
GO

-- Constraint check: Age 8 violates CK_Members_Age (statement is rejected)
INSERT INTO Members (MemberID, MembershipNo, FullName, Email, Phone, Age)
VALUES (31, 'LIB260031', 'Test Child', 'test.child@mail.com', '9811000031', 8);
GO
