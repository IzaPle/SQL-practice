--1. Pracujemy na tabeli Person.Person
---oblicz ilo�� rekord�w
SELECT COUNT(*)
FROM Person.Person

---oblicz ile os�b poda�o swoje drugie imi� (kolumna MiddleName)
SELECT COUNT(MiddleName)
FROM Person.Person

---oblicz ile os�b poda�o swoje pierwsze imi� (kolumna FirstName)
SELECT COUNT(FirstName)
FROM Person.Person

---oblicz ile os�b wyrazi�o zgod� na otrzymywanie maili (kolumna EmailPromotion ma by� r�wna 1)
SELECT COUNT(*)
FROM Person.Person
WHERE EmailPromotion='1'

--2. Pracujemy na tabeli Sales.SalesOrderDetail
---wyznacz ca�kowit� wielko�� sprzeda�y bez uwzgl�dnienia rabat�w - suma UnitPrice * OrderQty
SELECT
UnitPrice* OrderQty
FROM Sales.SalesOrderDetail

---wyznacz ca�kowit� wielko�� sprzeda�y z uwzgl�dnieniiem rabat�w - suma (UnitPrice-UnitPriceDiscount) * OrderQty
SELECT
(UnitPrice-UnitPriceDiscount) * OrderQty
FROM Sales.SalesOrderDetail

--3. Pracujemy na tabeli Production.Product.
---dla rekord�w z podkategorii 14
---wylicz minimaln� cen�, maksymaln� cen�, �redni� cen� i odchylenie standardowe dla ceny (u�yj funkcji STDEV)
SELECT MIN(ListPrice) AS 'Cena minimalna'
,MAX(ListPrice) AS 'Cena max'
,AVG(ListPrice) AS 'Cena �rednia'
,STDEV(ListPrice) AS 'odchylenie standardowe'
FROM Production.Product
WHERE ProductSubcategoryID='14'

--4. Pracujemy na tabeli Sales.SalesOrderHeader.
---wyznacz ilo�� zam�wie� zrealizowanych przez poszczeg�lnych pracownik�w (kolumna SalesPersonId)
SELECT 
SalesPersonID
, COUNT(*) AS AmountOfOrders
FROM Sales.SalesOrderHeader
GROUP BY SalesPersonID

--5. Wynik poprzedniego polecenia posortuj wg wyliczonej ilo�ci malej�co
SELECT 
SalesPersonID
, COUNT(*) AS AmountOfOrders
FROM Sales.SalesOrderHeader
GROUP BY SalesPersonID 
ORDER BY AmountOfOrders DESC

--6. Wynik poprzedniego polecenia ogranicz do zam�wie� z 2012 roku

SELECT 
SalesPersonID
, COUNT(*) AS AmountOfOrders
FROM Sales.SalesOrderHeader
WHERE OrderDate BETWEEN '2012-01-01 00:00:00.000' AND '2012-12-31 00:00:00.000'
GROUP BY SalesPersonID 
ORDER BY AmountOfOrders DESC

--7. Wynik poprzedniego polecenia ogranicz tak, aby prezentowani byli te rekordy, gdzie wyznaczona suma jest wi�ksza od 100000
SELECT 
SalesPersonID
,SUM(SubTotal)
, COUNT(*) AS AmountOfOrders
FROM Sales.SalesOrderHeader
WHERE OrderDate BETWEEN '2012-01-01 00:00:00.000' AND '2012-12-31 00:00:00.000'
GROUP BY SalesPersonID 
HAVING SUM(SubTotal)>'100000'
ORDER BY AmountOfOrders DESC

--8. Pracujemy na tabeli Sales.SalesOrderHeader. 
--Policz ile zam�wie� by�o dostarczanych z wykorzystaniem r�nych metod dostawy (kolumna ShipMethodId)
SELECT COUNT(*)
,ShipMethodID
FROM Sales.SalesOrderHeader
GROUP BY ShipMethodID
--9. Pracujemy na tabeli Production.Product
--Napisz zapytanie, kt�re wy�wietla:
---ProductID
---Name
---StandardCost
---ListPrice
---r�nic� mi�dzy ListPrice a StandardCost. Zaaliasuj j� "Profit"
---w wyniku opu�� te produkty kt�re maj� ListPrice lub StandardCost <=0

SELECT ProductID
,Name
,StandardCost
,ListPrice
,ListPrice-StandardCost AS Profit
FROM Production.Product
WHERE ListPrice>'0' AND StandardCost>'0'

--10. Bazuj�c na poprzednim zapytaniu, spr�bujemy wyznaczy� jakie kategorie produkt�w s� najbardziej zyskowne.
--Dla ka�dej podkategorii wyznacz �redni, minimalny i maksymalny profit. Uporz�dkuj wynik w kolejno�ci �redniego profitu malej�co
SELECT 
p.ProductSubcategoryID
,AVG(p.ListPrice -p.StandardCost) AS AvgProfit
,MIN(p.ListPrice -p.StandardCost) AS MinProfit
,MAX(p.ListPrice -p.StandardCost) AS MaxProfit
FROM Production.Product p
WHERE p.StandardCost > 0 AND p.ListPrice > 0
GROUP BY p.ProductSubcategoryID
ORDER BY AvgProfit DESC