USE AdventureWorks2022;
GO

CREATE TABLE dbo.Staging_Customers(
	RawName NVARCHAR(200),
	RawEmail NVARCHAR(200),
	RawPhone NVARCHAR(50),
	ImportDate DATETIME DEFAULT GETDATE()
);

INSERT INTO dbo.Staging_Customers (RawName, RawEmail, RawPhone) VALUES
('ahmet ÞAHÝN ', ' ahmet@gmail.com', '555-222-3333'),
('Mehmet Yýlmaz ', NULL, '(530) 345 67 89'),
('AYÞE DEMÝR', 'AYSE@GMAÝL.COM', '535.122.3647'),
('ali can', 'ali.can@outlook.com', 'invalid phone')