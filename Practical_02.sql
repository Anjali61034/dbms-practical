-- Practical 2: DDL Commands Without Constraints

USE DBMS_PracticeDB;
GO

-- Table WITHOUT any constraints
-- Numeric: INT, BIGINT, DECIMAL, FLOAT, TINYINT, SMALLINT
-- Text:    VARCHAR, NVARCHAR, CHAR, VARCHAR(MAX)
-- Special: DATE, DATETIME, BIT, UNIQUEIDENTIFIER
CREATE TABLE VintageStock (
    StockID         INT,
    Barcode         BIGINT,
    Price           DECIMAL(8,2),
    WeightKg        FLOAT,
    ConditionScore  TINYINT,
    Era             SMALLINT,
    ItemName        VARCHAR(80),
    Category        NVARCHAR(40),
    Size            VARCHAR(5),
    Grade           CHAR(1),
    Notes           VARCHAR(MAX),
    SourcedOn       DATE,
    ListedAt        DATETIME,
    IsSold          BIT,
    ItemGUID        UNIQUEIDENTIFIER
);
GO

INSERT INTO VintageStock VALUES
(1, 100008901007, 2899.00, 0.95, 8, 1990, 'Levi''s Trucker Denim Jacket', N'Jackets', 'L', 'B', 'Classic blue wash, light fading', '2026-08-03', '2026-10-01 10:37:00', 1, NEWID()),
(2, 100008901014, 4499.00, 1.4, 9, 2000, 'Carhartt Detroit Jacket', N'Jackets', 'XL', 'A', 'Duck canvas, blanket lined', '2026-08-06', '2026-10-02 11:14:00', 1, NEWID()),
(3, 100008901021, 1999.00, 0.4, 7, 1990, 'Nike Windrunner', N'Jackets', 'M', 'B', 'Colour-block nylon shell', '2026-08-09', '2026-10-03 11:51:00', 1, NEWID()),
(4, 100008901028, 1499.00, 0.22, 7, 1990, 'Harley Davidson Graphic Tee', N'T-Shirts', 'L', 'B', 'Single stitch, cracked print', '2026-08-12', '2026-10-04 12:28:00', 0, NEWID()),
(5, 100008901035, 2299.00, 0.7, 9, 2000, 'Champion Reverse Weave Hoodie', N'Hoodies', 'M', 'A', 'Grey heather, embroidered logo', '2026-08-15', '2026-10-05 13:05:00', 1, NEWID()),
(6, 100008901042, 1299.00, 0.3, 9, 2010, 'Ralph Lauren Oxford Shirt', N'Shirts', 'M', 'A', 'Button-down, pale blue', '2026-08-18', '2026-10-06 13:42:00', 1, NEWID()),
(7, 100008901049, 1599.00, 0.45, 6, 1990, 'Adidas Track Jacket', N'Jackets', 'S', 'C', 'Firebird style, minor pilling', '2026-08-21', '2026-10-07 14:19:00', 0, NEWID()),
(8, 100008901056, 1399.00, 0.55, 8, 1990, 'Tommy Hilfiger Rugby Polo', N'Shirts', 'XL', 'B', 'Striped heavy cotton', '2026-08-24', '2026-10-08 14:56:00', 0, NEWID()),
(9, 100008901063, 799.00, 0.12, 9, 2000, 'New York Yankees Cap', N'Caps', 'FREE', 'A', 'Wool blend, fitted', '2026-08-27', '2026-10-09 15:33:00', 1, NEWID()),
(10, 100008901070, 2799.00, 0.5, 9, 2000, 'Patagonia Fleece Pullover', N'Fleece', 'L', 'A', 'Snap-T, forest green', '2026-08-30', '2026-10-10 16:10:00', 1, NEWID()),
(11, 100008901077, 1199.00, 0.2, 5, 1990, 'Band Tour Tee - Rock', N'T-Shirts', 'M', 'C', 'Faded black, small hole', '2026-09-02', '2026-10-11 16:47:00', 1, NEWID()),
(12, 100008901084, 1699.00, 0.35, 8, 2010, 'Columbia Puffer Vest', N'Jackets', 'M', 'B', 'Packable down fill', '2026-09-05', '2026-10-12 17:24:00', 0, NEWID()),
(13, 100008901091, 1099.00, 0.42, 7, 1980, 'Wrangler Corduroy Shirt', N'Shirts', 'L', 'B', 'Brown wide-wale cord', '2026-09-08', '2026-10-13 18:01:00', 1, NEWID()),
(14, 100008901098, 3999.00, 1.6, 9, 1990, 'Puma Varsity Jacket', N'Jackets', 'L', 'A', 'Wool body, leather sleeves', '2026-09-11', '2026-10-14 18:38:00', 0, NEWID()),
(15, 100008901105, 899.00, 0.1, 8, 2000, 'Stussy Bucket Hat', N'Caps', 'FREE', 'B', 'Reversible, logo tag', '2026-09-14', '2026-10-15 19:15:00', 1, NEWID()),
(16, 100008901112, 999.00, 0.28, 8, 2000, 'Dickies Work Shirt', N'Shirts', 'XL', 'B', 'Short sleeve, navy', '2026-09-17', '2026-10-16 19:52:00', 0, NEWID()),
(17, 100008901119, 1499.00, 0.48, 7, 1990, 'Fila Half-Zip Sweatshirt', N'Sweatshirts', 'M', 'B', 'Navy with red trim', '2026-09-20', '2026-10-17 20:29:00', 1, NEWID()),
(18, 100008901126, 2199.00, 0.38, 9, 2000, 'Lacoste Cardigan', N'Knitwear', 'L', 'A', 'Merino wool, cream', '2026-09-23', '2026-10-18 21:06:00', 1, NEWID()),
(19, 100008901133, 6499.00, 1.1, 8, 1990, 'North Face Nuptse Jacket', N'Jackets', 'M', 'B', '700 fill, yellow/black', '2026-09-26', '2026-10-19 21:43:00', 1, NEWID()),
(20, 100008901140, 2499.00, 1.05, 6, 1980, 'Vintage Bomber MA-1', N'Jackets', 'XL', 'C', 'Sage green, worn cuffs', '2026-09-29', '2026-10-20 22:20:00', 0, NEWID()),
(21, 100008901147, 699.00, 0.18, 10, 2010, 'NASA Logo Tee', N'T-Shirts', 'S', 'A', 'Deadstock, never worn', '2026-10-02', '2026-10-21 22:57:00', 0, NEWID()),
(22, 100008901154, 3499.00, 0.15, 9, 2000, 'Burberry Check Scarf', N'Accessories', 'FREE', 'A', 'Cashmere, nova check', '2026-10-05', '2026-10-22 23:34:00', 1, NEWID()),
(23, 100008901161, 1299.00, 0.4, 7, 1990, 'Kappa Track Pants', N'Bottoms', 'M', 'B', 'Popper sides, black', '2026-10-08', '2026-10-24 00:11:00', 1, NEWID()),
(24, 100008901168, 1799.00, 0.6, 7, 1990, 'Guess Denim Overshirt', N'Shirts', 'L', 'B', 'Acid wash', '2026-10-11', '2026-10-25 00:48:00', 0, NEWID()),
(25, 100008901175, 1899.00, 0.25, 9, 1990, 'Umbro Football Jersey', N'Jerseys', 'L', 'A', 'Retro 1994 home kit', '2026-10-14', '2026-10-26 01:25:00', 1, NEWID()),
(26, 100008901182, 999.00, 0.52, 6, 1990, 'Reebok Classic Sweatshirt', N'Sweatshirts', 'XL', 'C', 'Faded logo, oversized', '2026-10-17', '2026-10-27 02:02:00', 1, NEWID()),
(27, 100008901189, 2299.00, 0.65, 8, 1990, 'Nautica Sailing Jacket', N'Jackets', 'L', 'B', 'Reversible windbreaker', '2026-10-20', '2026-10-28 02:39:00', 1, NEWID()),
(28, 100008901196, 599.00, 0.08, 9, 2010, 'Carhartt Beanie', N'Caps', 'FREE', 'A', 'Acrylic knit, brown', '2026-10-23', '2026-10-29 03:16:00', 0, NEWID()),
(29, 100008901203, 1999.00, 0.55, 8, 1990, 'Polo Sport Crewneck', N'Sweatshirts', 'M', 'B', 'Navy, chest flag print', '2026-10-26', '2026-10-30 03:53:00', 1, NEWID()),
(30, 100008901210, 5999.00, 2.1, 8, 1980, 'Leather Biker Jacket', N'Jackets', 'M', 'B', 'Genuine leather, asymmetric zip', '2026-10-29', '2026-10-31 04:30:00', 1, NEWID());
GO

SELECT * FROM VintageStock;
GO
