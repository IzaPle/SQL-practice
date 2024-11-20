--1. Napisz zapytanie do tabeli Sales.SalesOrderHeader. Wyfiltruj rekordy, kt�re:
-Dat� zam�wienia (OrderDate) maj� mi�dzy 2012-01-01 a 2012-03-31
-SalesPersonId ma mie� warto�� (czyli nie jest null)
-TerritoryID  ma mie� warto�� (czyli nie jest null)

SELECT
OrderDate
,SalesPersonID
,TerritoryID
FROM Sales.SalesOrderHeader
WHERE OrderDate BETWEEN '2012-01-01' AND '2012-03-31'
AND SalesPersonID IS NOT NULL
AND TerritoryID IS NOT NULL

--W wyniku ma by� wy�wietlony:
-Miesi�c z daty zam�wienia
-SalesPersonId
-TerritoryID
-Suma z kolumny SubTotal

SELECT
MONTH(OrderDate) AS 'miesi�c zam�wienia'
,SalesPersonID
,TerritoryID
,SUM(SubTotal)
FROM Sales.SalesOrderHeader
WHERE OrderDate BETWEEN '2012-01-01' AND '2012-03-31'
AND SalesPersonID IS NOT NULL
AND TerritoryID IS NOT NULL
GROUP BY MONTH(OrderDate),SalesPersonID,TerritoryID


--2. Zmie� zapytanie tak, aby wy�wietlane by�y tak�e podsumowania dla:
-Miesi�c i SalesPersonId
-Miesi�c
-Og�em

SELECT
MONTH(OrderDate) AS 'miesi�c zam�wienia'
,SalesPersonID
,TerritoryID
,SUM(SubTotal)
FROM Sales.SalesOrderHeader
WHERE OrderDate BETWEEN '2012-01-01' AND '2012-03-31'
AND SalesPersonID IS NOT NULL
AND TerritoryID IS NOT NULL
GROUP BY ROLLUP (MONTH(OrderDate), SalesPersonID, TerritoryID)

--3. Zmie� zapytanie tak aby widoczne by�y tak�e sumy dla:
-Miesi�c i TerritoryId
-SalesPersonId i TerritoryId
-SalesPersonId
-TerritoryId

SELECT
MONTH(OrderDate) AS 'miesi�c zam�wienia'
,SalesPersonID
,TerritoryID
,SUM(SubTotal)
FROM Sales.SalesOrderHeader
WHERE OrderDate BETWEEN '2012-01-01' AND '2012-03-31'
AND SalesPersonID IS NOT NULL
AND TerritoryID IS NOT NULL
GROUP BY CUBE (MONTH(OrderDate), SalesPersonID, TerritoryID)

--4. Zmie� zapytanie tak, aby wy�wietli�y si� tylko sumy:
-miesi�ca 
-miesi�ca, SalesPersonId, TerritoryId

SELECT
MONTH(OrderDate) AS 'miesi�c zam�wienia'
,SalesPersonID
,TerritoryID
,SUM(SubTotal)
FROM Sales.SalesOrderHeader
WHERE OrderDate BETWEEN '2012-01-01' AND '2012-03-31'
AND SalesPersonID IS NOT NULL
AND TerritoryID IS NOT NULL
GROUP BY GROUPING SETS ((MONTH(OrderDate)), MONTH(OrderDate),SalesPersonID, TerritoryID)


ZACHOWAJ ROZWI�ZANIA DO NAST�PNEGO LABORATORIUM!