Review the documentation o [Join Fundamentals in SQL Server 2008 R2 Books Online](https://docs.microsoft.com/en-us/previous-versions/sql/sql-server-2008-r2/ms191517(v=sql.105)?redirectedfrom=MSDN)

Joins types
![](https://i.pinimg.com/originals/fa/72/5e/fa725ea8b5cc6ac8f77ee8c399d70303.png)


Demo: Using Inner Joins
```sql
---Demo: Using Inner Joins

--Basdic Inner join 

SELECT AdventureWorksLT2017.SalesLT.Product.Name AS ProductName, AdventureWorksLT2017.SalesLT.ProductCategory.Name AS Category
FROM AdventureWorksLT2017.SalesLT.Product 
INNER JOIN AdventureWorksLT2017.SalesLT.ProductCategory 
ON AdventureWorksLT2017.SalesLT.Product.ProductCategoryID = AdventureWorksLT2017.SalesLT.ProductCategory.ProductCategoryID;


--Table Aliases
SELECT p.Name AS ProductName, c.Name AS Category
FROM AdventureWorksLT2017.SalesLT.Product AS p 
INNER JOIN AdventureWorksLT2017.SalesLT.ProductCategory  AS c
ON p.ProductCategoryID = c.ProductCategoryID;

--Joining more than 2 tables

SELECT oh.OrderDate,oh.SalesOrderNumber, p.Name AS ProductName, od.UnitPrice
FROM AdventureWorksLT2017.SalesLT.SalesOrderHeader as oh 
 JOIN AdventureWorksLT2017.SalesLT.SalesOrderDetail  AS od
ON od.SalesOrderID = oh.SalesOrderID
JOIN AdventureWorksLT2017.SalesLT.Product as p
on od.ProductID = p.ProductID
ORDER BY  oh.OrderDate,oh.SalesOrderNumber, p.Name , od.UnitPrice

--Multiple join predicates
SELECT oh.OrderDate,oh.SalesOrderNumber, p.Name AS ProductName, od.UnitPrice
FROM AdventureWorksLT2017.SalesLT.SalesOrderHeader as oh 
 JOIN AdventureWorksLT2017.SalesLT.SalesOrderDetail  AS od
ON od.SalesOrderID = oh.SalesOrderID
JOIN AdventureWorksLT2017.SalesLT.Product as p
on od.ProductID = p.ProductID
and od.UnitPrice = p.ListPrice
ORDER BY  oh.OrderDate,oh.SalesOrderNumber, p.Name , od.UnitPrice;


--Demo: Using Outer Joins
--Get all customers, with sales orders for thoso who've bought anything

SELECT c.FirstName, c.LastName, oh.SalesOrderNumber
FROM AdventureWorksLT2017.SalesLT.Customer AS c
LEFT JOIN AdventureWorksLT2017.SalesLT.SalesOrderHeader as oh
ON c.CustomerID = oh.CustomerID
ORDER BY oh.SalesOrderNumber DESC;

--Retunr only the customers who havent purchased anything

SELECT c.FirstName, c.LastName, oh.SalesOrderNumber
FROM AdventureWorksLT2017.SalesLT.Customer AS c
LEFT JOIN AdventureWorksLT2017.SalesLT.SalesOrderHeader as oh
ON c.CustomerID = oh.CustomerID
WHERE oh.SalesOrderNumber IS NULL
ORDER BY oh.SalesOrderNumber DESC;

--More than 2 tables
SELECT p.Name AS ProductName, oh.SalesOrderNumber
FROM AdventureWorksLT2017.SalesLT.Product AS P
LEFT JOIN AdventureWorksLT2017.SalesLT.SalesOrderDetail AS od
ON p.ProductID = od.ProductID
LEFT JOIN AdventureWorksLT2017.SalesLT.SalesOrderHeader AS oh
ON od.SalesOrderID = oh.SalesOrderID
ORDER BY oh.SalesOrderNumber;

```
