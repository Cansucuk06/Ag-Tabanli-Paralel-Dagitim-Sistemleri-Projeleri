SELECT 
	UPPER(LEFT(SUBSTRING(LTRIM(RawName), 1, CHARINDEX(' ', LTRIM(RawName) + ' ') - 1), 1)) + 
    LOWER(SUBSTRING(SUBSTRING(LTRIM(RawName), 1, CHARINDEX(' ', LTRIM(RawName) + ' ') - 1), 2, 8000)) + 
    ' ' +
    UPPER(LEFT(LTRIM(SUBSTRING(LTRIM(RawName), CHARINDEX(' ', LTRIM(RawName) + ' '), 8000)), 1)) + 
    LOWER(SUBSTRING(LTRIM(SUBSTRING(LTRIM(RawName), CHARINDEX(' ', LTRIM(RawName) + ' '), 8000)), 2, 8000)) 
    AS CleanName,
	ISNULL(LOWER(LTRIM(RTRIM(RawEmail))), 'bilinmiyor@sirket.com') AS CleanEmail,
	CASE
		WHEN RawPhone LIKE '%[0-9]%' THEN
		 REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(RawPhone, '-', ''), '(', ''), ')', ''), ' ', ''), '.', '')
		ELSE '0000000000'
	END AS CleanPhone
FROM dbo.Staging_Customers;
