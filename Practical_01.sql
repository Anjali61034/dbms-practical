-- Practical 1: Database Related Commands in MS-SQL

-- 1. Create a new database
CREATE DATABASE ThriftStoreDB;
GO

-- 2. View all databases on the server
SELECT name, database_id, create_date FROM sys.databases;
GO

-- 3. Switch to the new database
USE ThriftStoreDB;
GO

-- 4. Rename the database (switch to master first)
USE master;
GO
ALTER DATABASE ThriftStoreDB MODIFY NAME = DBMS_PracticeDB;
GO

-- 5. Change a database option (recovery model)
ALTER DATABASE DBMS_PracticeDB SET RECOVERY SIMPLE;
GO

-- 6. Verify the rename and the new option
SELECT name, state_desc, recovery_model_desc
FROM sys.databases WHERE name = 'DBMS_PracticeDB';
GO

-- 7. Create and drop a temporary database
CREATE DATABASE ScratchDB;
GO
DROP DATABASE ScratchDB;
GO

USE DBMS_PracticeDB;
GO
