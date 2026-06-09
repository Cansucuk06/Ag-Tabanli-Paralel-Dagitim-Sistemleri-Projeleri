SELECT 
    (SELECT COUNT(*) FROM dbo.Staging_Customers) AS Toplam_Gelen_Veri,
    (SELECT COUNT(*) FROM dbo.Production_Customers_Clean) AS Basariyla_Yuklenen,
    ((SELECT COUNT(*) FROM dbo.Staging_Customers) - (SELECT COUNT(*) FROM dbo.Production_Customers_Clean)) AS Hatali_Kayip_Veri;