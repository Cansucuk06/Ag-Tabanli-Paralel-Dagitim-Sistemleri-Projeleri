CREATE TABLE dbo.Production_Customers_Clean (
    CustomerID INT IDENTITY(1,1),
    FullName NVARCHAR(100),
    Email NVARCHAR(100),
    Phone NVARCHAR(20),
    IsProcessed BIT DEFAULT 1
);


INSERT INTO dbo.Production_Customers_Clean (FullName, Email, Phone)
SELECT 
    LTRIM(RTRIM(RawName)), 
    ISNULL(LOWER(RawEmail), 'eksik@mail.com'),
    RawPhone 
FROM dbo.Staging_Customers
WHERE RawEmail LIKE '%@%'; -- Sadece geçerli e-postasý olanlarý al (Basit doðrulama)