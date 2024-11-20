--1. Napisz zapytanie do tabeli Sales.SalesOrderHeader. Wyfiltruj rekordy, które:
-Datê zamówienia (OrderDate) maj¹ miêdzy 2012-01-01 a 2012-03-31
-SalesPersonId ma mieæ wartoœæ (czyli nie jest null)
-TerritoryID  ma mieæ wartoœæ (czyli nie jest null)

SELECT
OrderDate
,SalesPersonID
,TerritoryID
FROM Sales.SalesOrderHeader
WHERE OrderDate BETWEEN '2012-01-01' AND '2012-03-31'
AND SalesPersonID IS NOT NULL
AND TerritoryID IS NOT NULL

--W wyniku ma byæ wyœwietlony:
-Miesi¹c z daty zamówienia
-SalesPersonId
-TerritoryID
-Suma z kolumny SubTotal

SELECT
MONTH(OrderDate) AS 'miesi¹c zamówienia'
,SalesPersonID
,TerritoryID
,SUM(SubTotal)
FROM Sales.SalesOrderHeader
WHERE OrderDate BETWEEN '2012-01-01' AND '2012-03-31'
AND SalesPersonID IS NOT NULL
AND TerritoryID IS NOT NULL
GROUP BY MONTH(OrderDate),SalesPersonID,TerritoryID


--2. Zmieñ zapytanie tak, aby wyœwietlane by³y tak¿e podsumowania dla:
-Miesi¹c i SalesPersonId
-Miesi¹c
-Ogó³em

SELECT
MONTH(OrderDate) AS 'miesi¹c zamówienia'
,SalesPersonID
,TerritoryID
,SUM(SubTotal)
FROM Sales.SalesOrderHeader
WHERE OrderDate BETWEEN '2012-01-01' AND '2012-03-31'
AND SalesPersonID IS NOT NULL
AND TerritoryID IS NOT NULL
GROUP BY ROLLUP (MONTH(OrderDate), SalesPersonID, TerritoryID)

--3. Zmieñ zapytanie tak aby widoczne by³y tak¿e sumy dla:
-Miesi¹c i TerritoryId
-SalesPersonId i TerritoryId
-SalesPersonId
-TerritoryId

SELECT
MONTH(OrderDate) AS 'miesi¹c zamówienia'
,SalesPersonID
,TerritoryID
,SUM(SubTotal)
FROM Sales.SalesOrderHeader
WHERE OrderDate BETWEEN '2012-01-01' AND '2012-03-31'
AND SalesPersonID IS NOT NULL
AND TerritoryID IS NOT NULL
GROUP BY CUBE (MONTH(OrderDate), SalesPersonID, TerritoryID)

--4. Zmieñ zapytanie tak, aby wyœwietli³y siê tylko sumy:
-miesi¹ca 
-miesi¹ca, SalesPersonId, TerritoryId

SELECT
MONTH(OrderDate) AS 'miesi¹c zamówienia'
,SalesPersonID
,TerritoryID
,SUM(SubTotal)
FROM Sales.SalesOrderHeader
WHERE OrderDate BETWEEN '2012-01-01' AND '2012-03-31'
AND SalesPersonID IS NOT NULL
AND TerritoryID IS NOT NULL
GROUP BY GROUPING SETS ((MONTH(OrderDate)), MONTH(OrderDate),SalesPersonID, TerritoryID)


ZACHOWAJ ROZWI¥ZANIA DO NASTÊPNEGO LABORATORIUM!