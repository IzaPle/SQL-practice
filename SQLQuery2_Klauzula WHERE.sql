--1. Wy�wietl wszystkie informacje z tabeli HumanResources.Employee. Uporz�dkuj dane w kolejno�ci wg daty urodzenia (BirthDay) rosn�co
SELECT*
FROM HumanResources.Employee 
ORDER BY BirthDate ASC

--2. Zmie� kolejno�� na malej�c�
SELECT*
FROM HumanResources.Employee 
ORDER BY BirthDate DESC

--3. Wylicz w zapytaniu wiek (od roku z daty dzisiejszej odejmij rok z daty urodzenia). Zaaliasuj kolumn� jako Age. Posortuj dane wg tej kolumny malej�co
SELECT YEAR(GETDATE()) - YEAR(BirthDate) AS Age
FROM HumanResources.Employee
ORDER BY Age DESC
--4. Z tabeli Production.Product wy�wietl ProductId, Name, ListPrice, Class, Style i Color. Uporz�dkuj dane wg class i style
SELECT
ProductID
,Name
,ListPrice
,Class
,Style
,Color
FROM Production.Product
ORDER BY Class, Style
--5. Zmie� poprzednie polecenie tak, aby sortowanie odbywa�o si� w oparciu o numer kolumny, a nie nazw� (pami�taj - to jest niezalecane rozwi�zanie, ale warto je zna�!)
SELECT
ProductID
,Name
,ListPrice
,Class
,Style
,Color
FROM Production.Product
ORDER BY 4, 5