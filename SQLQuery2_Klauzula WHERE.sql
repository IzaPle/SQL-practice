--1. Wyœwietl wszystkie informacje z tabeli HumanResources.Employee. Uporz¹dkuj dane w kolejnoœci wg daty urodzenia (BirthDay) rosn¹co
SELECT*
FROM HumanResources.Employee 
ORDER BY BirthDate ASC

--2. Zmieñ kolejnoœæ na malej¹c¹
SELECT*
FROM HumanResources.Employee 
ORDER BY BirthDate DESC

--3. Wylicz w zapytaniu wiek (od roku z daty dzisiejszej odejmij rok z daty urodzenia). Zaaliasuj kolumnê jako Age. Posortuj dane wg tej kolumny malej¹co
SELECT YEAR(GETDATE()) - YEAR(BirthDate) AS Age
FROM HumanResources.Employee
ORDER BY Age DESC
--4. Z tabeli Production.Product wyœwietl ProductId, Name, ListPrice, Class, Style i Color. Uporz¹dkuj dane wg class i style
SELECT
ProductID
,Name
,ListPrice
,Class
,Style
,Color
FROM Production.Product
ORDER BY Class, Style
--5. Zmieñ poprzednie polecenie tak, aby sortowanie odbywa³o siê w oparciu o numer kolumny, a nie nazwê (pamiêtaj - to jest niezalecane rozwi¹zanie, ale warto je znaæ!)
SELECT
ProductID
,Name
,ListPrice
,Class
,Style
,Color
FROM Production.Product
ORDER BY 4, 5