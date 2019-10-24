--SELECT ProductID, Name, ListPrice, StandardCost, ListPrice - StandardCost AS Margin FROM SalesLT.Product

-- CAST e CONVERT funcionam da mesma forma
-- select CAST(ProductID as varchar(5)) + ':' + Name AS ProductName FROM SalesLT.Product
-- select convert(varchar(5), ProductID) + ':' + Name AS ProductName FROM SalesLT.Product

--SELECT SellStartDate, CONVERT(nvarchar(30), SellStartDate) AS ConvertedDate,  CONVERT(nvarchar(30),SellStartDate, 126) AS ISOConvertedDateFRom SalesLT.Product

--select Name, ISNULL(TRY_CAST(Size AS Integer),0) AS NumericSize FROM SalesLT.Product -- se o isnull não der certo, então retorne zero
--SELECT ProductNumber, ISNULL(Color,'')+', '+ISNULL(Size,'') AS ProductDetails FROM SalesLT.Product
--SELECT Name, NULLIF(Color, 'MULTI') AS SingleColor FROM SalesLT.Product

--SELECT Name,
	--	CASE	
		--	WHEN SellEndDate IS NULL THEN 'ON SALE'
			--ELSE 'DISCONTINUED'
		--END AS SalesStatus
	--FROM SalesLT.Product

	SELECT Name,
		CASE Size
			WHEN 'S' THEN 'SMALL'
			WHEN 'M' THEN 'MEDIUM'
			WHEN 'X' THEN 'LARGE'
			WHEN 'XL' THEN 'EXTRA LARGE'
			ELSE ISNULL(Size,'UNIQUE')
		END AS ProductSize
	FROM SalesLT.Product