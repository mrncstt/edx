```sql
--Selecionando tudo da tabela produtos
SELECT * FROM AdventureWorksLT2017.SalesLT.Product;

--Removing Duplicates
SELECT distinct(Color) 
FROM AdventureWorksLT2017.SalesLT.Product;

--Limiting Sorted Results
SELECT TOP 10 ProductCategoryID, Name 
FROM AdventureWorksLT2017.SalesLT.Product
ORDER BY ProductCategoryID, ListPrice DESC;


--Eliminating Duplicates and Sorting Results
SELECT DISTINCT ISNULL(Color, 'None') as Color 
FROM AdventureWorksLT2017.SalesLT.Product;

--Display a list of product coloers with the word 'None' if the value is null and dash if the size is null sorted by color

SELECT 
DISTINCT ISNULL(Color, 'None') as Color,
ISNULL(Size,'-') as SIZE 
FROM AdventureWorksLT2017.SalesLT.Product;

--Display the top 100 product by list price
SELECT TOP 100 *
FROM AdventureWorksLT2017.SalesLT.Product
ORDER BY ListPrice;

--Display the top 10 product by productnumber
SELECT TOP 10 *
FROM AdventureWorksLT2017.SalesLT.Product
ORDER BY ProductNumber;

--Display the top 10 product by productnumber
SELECT  *
FROM AdventureWorksLT2017.SalesLT.Product
ORDER BY ProductNumber
OFFSET 10 ROWS
FETCH FIRST 10 ROW ONLY;

-- Demo: Filtering and Using Predicates

--List information about product model 6
SELECT 
*
FROM AdventureWorksLT2017.SalesLT.Product
where ProductModelID = 6

--List information about product s that have product number begining FR
SELECT 
*
FROM AdventureWorksLT2017.SalesLT.Product
where ProductNumber LIKE '%R%';



--Find product that have no sell end date
SELECT Name

FROM AdventureWorksLT2017.SalesLT.Product
Where SellEndDate IS NOT NULL;


```



Exercicies
```sql
-- select unique cities, and state province
SELECT DISTINCT City, StateProvince
FROM SalesLT.Address;

-- select the top 10 percent from the Name column
SELECT TOP 10 PERCENT Name
FROM SalesLT.Product
-- order by the weight in descending order
ORDER BY Weight DESC;



SELECT Name
FROM SalesLT.Product
ORDER BY Weight DESC
-- offset 10 rows and get the next 100
OFFSET 10 ROWS FETCH NEXT 100 ROW ONLY;


-- select the Name, Color, and Size columns
SELECT Name, Color, Size
FROM SalesLT.Product
-- check ProductModelID is 1
WHERE  ProductModelID = 1;



-- select the ProductNumber and Name columns
SELECT ProductNumber, Name
FROM SalesLT.Product
-- check that Color is one of 'Black', 'Red' or 'White'
-- check that Size is one of 'S' or 'M'
WHERE Color IN ('Black', 'Red', 'White') AND Size IN ('S','M');

-- select the ProductNumber, Name, and ListPrice columns
SELECT ProductNumber, Name, ListPrice
FROM SalesLT.Product
-- filter for product numbers beginning with BK- using LIKE
WHERE ProductNumber LIKE '%BK-%';


-- select the ProductNumber, Name, and ListPrice columns
SELECT ProductNumber, Name, ListPrice
FROM SalesLT.Product
-- filter for ProductNumbers
WHERE ProductNumber LIKE 'BK-[^R]%-[0-9][0-9]';




``
