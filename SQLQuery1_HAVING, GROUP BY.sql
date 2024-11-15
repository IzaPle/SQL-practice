--1. Pracujemy na tabeli Person.Person
---oblicz iloœæ rekordów
SELECT COUNT(*)
FROM Person.Person

---oblicz ile osób poda³o swoje drugie imiê (kolumna MiddleName)
SELECT COUNT(MiddleName)
FROM Person.Person

---oblicz ile osób poda³o swoje pierwsze imiê (kolumna FirstName)
SELECT COUNT(FirstName)
FROM Person.Person

---oblicz ile osób wyrazi³o zgodê na otrzymywanie maili (kolumna EmailPromotion ma byæ równa 1)
SELECT COUNT(*)
FROM Person.Person
WHERE EmailPromotion='1'

--2. Pracujemy na tabeli Sales.SalesOrderDetail
---wyznacz ca³kowit¹ wielkoœæ sprzeda¿y bez uwzglêdnienia rabatów - suma UnitPrice * OrderQty
SELECT
UnitPrice* OrderQty
FROM Sales.SalesOrderDetail

---wyznacz ca³kowit¹ wielkoœæ sprzeda¿y z uwzglêdnieniiem rabatów - suma (UnitPrice-UnitPriceDiscount) * OrderQty
SELECT
(UnitPrice-UnitPriceDiscount) * OrderQty
FROM Sales.SalesOrderDetail

--3. Pracujemy na tabeli Production.Product.
---dla rekordów z podkategorii 14
---wylicz minimaln¹ cenê, maksymaln¹ cenê, œredni¹ cenê i odchylenie standardowe dla ceny (u¿yj funkcji STDEV)
SELECT MIN(ListPrice) AS 'Cena minimalna'
,MAX(ListPrice) AS 'Cena max'
,AVG(ListPrice) AS 'Cena œrednia'
,STDEV(ListPrice) AS 'odchylenie standardowe'
FROM Production.Product
WHERE ProductSubcategoryID='14'

--4. Pracujemy na tabeli Sales.SalesOrderHeader.
---wyznacz iloœæ zamówieñ zrealizowanych przez poszczególnych pracowników (kolumna SalesPersonId)
SELECT 
SalesPersonID
, COUNT(*) AS AmountOfOrders
FROM Sales.SalesOrderHeader
GROUP BY SalesPersonID

--5. Wynik poprzedniego polecenia posortuj wg wyliczonej iloœci malej¹co
SELECT 
SalesPersonID
, COUNT(*) AS AmountOfOrders
FROM Sales.SalesOrderHeader
GROUP BY SalesPersonID 
ORDER BY AmountOfOrders DESC

--6. Wynik poprzedniego polecenia ogranicz do zamówieñ z 2012 roku

SELECT 
SalesPersonID
, COUNT(*) AS AmountOfOrders
FROM Sales.SalesOrderHeader
WHERE OrderDate BETWEEN '2012-01-01 00:00:00.000' AND '2012-12-31 00:00:00.000'
GROUP BY SalesPersonID 
ORDER BY AmountOfOrders DESC

--7. Wynik poprzedniego polecenia ogranicz tak, aby prezentowani byli te rekordy, gdzie wyznaczona suma jest wiêksza od 100000
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
--Policz ile zamówieñ by³o dostarczanych z wykorzystaniem ró¿nych metod dostawy (kolumna ShipMethodId)
SELECT COUNT(*)
,ShipMethodID
FROM Sales.SalesOrderHeader
GROUP BY ShipMethodID
--9. Pracujemy na tabeli Production.Product
--Napisz zapytanie, które wyœwietla:
---ProductID
---Name
---StandardCost
---ListPrice
---ró¿nicê miêdzy ListPrice a StandardCost. Zaaliasuj j¹ "Profit"
---w wyniku opuœæ te produkty które maj¹ ListPrice lub StandardCost <=0

SELECT ProductID
,Name
,StandardCost
,ListPrice
,ListPrice-StandardCost AS Profit
FROM Production.Product
WHERE ListPrice>'0' AND StandardCost>'0'

--10. Bazuj¹c na poprzednim zapytaniu, spróbujemy wyznaczyæ jakie kategorie produktów s¹ najbardziej zyskowne.
--Dla ka¿dej podkategorii wyznacz œredni, minimalny i maksymalny profit. Uporz¹dkuj wynik w kolejnoœci œredniego profitu malej¹co
SELECT 
p.ProductSubcategoryID
,AVG(p.ListPrice -p.StandardCost) AS AvgProfit
,MIN(p.ListPrice -p.StandardCost) AS MinProfit
,MAX(p.ListPrice -p.StandardCost) AS MaxProfit
FROM Production.Product p
WHERE p.StandardCost > 0 AND p.ListPrice > 0
GROUP BY p.ProductSubcategoryID
ORDER BY AvgProfit DESC