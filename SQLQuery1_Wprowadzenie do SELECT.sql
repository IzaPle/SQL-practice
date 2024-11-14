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


-- 4 Skopiuj poprzednie zapytanie i zmieñ je tak, aby wyœwietliæ tylko produkty w kolorze niebieskim (Color = 'blue')

SELECT 
pp.ProductID
,pp.Name
,pp.ListPrice
,pp.Color
FROM Production.Product pp
WHERE pp.Color='blue'

-- 5 Skopuj poprzednie zapytanie i zakomentuj w nim linijkê powoduj¹c¹ wyœwietlenie koloru
SELECT 
pp.ProductID
,pp.Name
,pp.ListPrice
,pp.Color
FROM Production.Product pp
--WHERE pp.Color='blue'

-- 6 PrzejdŸ do bazy danych tempdb
USE tempdb
GO

-- 7 Bêd¹c w bazie danych tempdb napisz polecenie, które wyœwietli wszystko z tabeli ScrapReason w schemacie Production z bazy danych AdventureWorks
SELECT * 
FROM AdventureWorks.Production.ScrapReason