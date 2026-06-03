--SQL Profiler için Sorgu
USE AdventureWorks2022;
SELECT * FROM Sales.SalesOrderHeader WHERE TotalDue > 1000;

--İndeks Yönetimi için Sorgu
USE AdventureWorks2022;
SELECT SalesOrderID, OrderDate, TotalDue, CustomerID
FROM Sales.SalesOrderHeader
WHERE OrderDate BETWEEN '2011-01-01' AND '2011-12-31'
AND TotalDue > 2000;

--İndeks Yönetimi
CREATE NONCLUSTERED INDEX [IX_SalesPerformance]
ON [Sales].[SalesOrderHeader] ([OrderDate],[TotalDue])
INCLUDE ([SalesOrderID],[CustomerID])
GO

--Veri Yöneticisi Rolleri
CREATE ROLE Reporting_User;
GRANT SELECT ON SCHEMA::Sales TO Reporting_User;

-- Bakım yapabilen bir rol 
CREATE ROLE DBA_Junior;
GRANT ALTER ON SCHEMA::Sales TO DBA_Junior;