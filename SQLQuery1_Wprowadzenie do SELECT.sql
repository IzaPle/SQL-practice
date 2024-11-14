USE AdventureWorks
GO

--2
SELECT *
FROM Production.Product AS pp

--3
SELECT 
pp.ProductID
,pp.Name
,pp.ListPrice
,pp.Color
FROM Production.Product pp


-- 4 Skopiuj poprzednie zapytanie i zmie� je tak, aby wy�wietli� tylko produkty w kolorze niebieskim (Color = 'blue')

SELECT 
pp.ProductID
,pp.Name
,pp.ListPrice
,pp.Color
FROM Production.Product pp
WHERE pp.Color='blue'

-- 5 Skopuj poprzednie zapytanie i zakomentuj w nim linijk� powoduj�c� wy�wietlenie koloru
SELECT 
pp.ProductID
,pp.Name
,pp.ListPrice
,pp.Color
FROM Production.Product pp
--WHERE pp.Color='blue'

-- 6 Przejd� do bazy danych tempdb
USE tempdb
GO

-- 7 B�d�c w bazie danych tempdb napisz polecenie, kt�re wy�wietli wszystko z tabeli ScrapReason w schemacie Production z bazy danych AdventureWorks
SELECT * 
FROM AdventureWorks.Production.ScrapReason