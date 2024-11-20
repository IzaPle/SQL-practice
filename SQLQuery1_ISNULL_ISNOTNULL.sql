--1. Wy�wietl rekordy z tabeli Person.Person, gdzie nie podano drugiego imienia (MiddleName)
SELECT *
FROM Person.Person
WHERE MiddleName IS NULL
--2. Wy�wietl rekordy z tabeli Person.Person, gdzie drugie imi� jest podane
SELECT *
FROM Person.Person
WHERE MiddleName IS NOT NULL
--3. Wy�wietl z tabeli Person.Person:
-FirstName
-MiddleName
-LastName
---napis z po��czenia ze sob� FirstName ' ' MiddleName ' ' i  LastName

SELECT 
FirstName
,MiddleName
,LastName
,FirstName+' '+MiddleName+' '+LastName AS 'Pe�ne imie i nazwisko'
FROM Person.Person

--4. Je�li jeszcze tego nie zrobi�e� dodaj wyra�enie, kt�re obs�u�y sytuacj�, gdy MiddleName jest NULL. W takim przypadku chcemy prezentowa� tylko FirstName ' ' i LastName
SELECT 
FirstName
,MiddleName
,LastName
,FirstName+' '+ISNULL(MiddleName,'')+' '+LastName
FROM Person.Person

--5. Je�li jeszcze tego nie zrobi�e� - wyeliminuj podw�j� spacj�, jaka mo�e si� pojawi� mi�dzy FirstName i LastNamr gdy MiddleName jest NULL.
SELECT 
FirstName
,MiddleName
,LastName
,FirstName+' '+ISNULL(MiddleName+' ','')+LastName
FROM Person.Person

--6.Firma podpisuje umow� z firm� kuriersk�. Cena us�ugi ma zale�e� od rozmiaru w drugiej kolejno�ci ci�aru, a gdy te nie s� znane od warto�ci wysy�anego przedmiotu.
Napisz zapytanie, kt�re wy�wietli z tabeli Production.Product:
-productId
-Name
-size, weight i listprice
---i kolumn� wyliczan�, kt�ra poka�e size (je�li jest NOT NULL), lub weight (je�li jest NOT NULL) lub listprice w przeciwnym razie

SELECT
ProductID
,Name
,Size
,Weight
,ListPrice 
,COALESCE(Size, CAST(Weight AS varchar(10)), CAST(ListPrice AS varchar(10))) AS 'cecha przedmiotu'
FROM Production.Product
Order by 'cecha przedmiotu' DESC

--7. Firma kurierska oczekuje aby informacja w ostatniej kolumnie by�a dodatkowo oznaczona:
-je�li zawiera informacje o rozmiarze, to ma by� poprzedzona napisem S:
-je�li zawiera informacje o ci�arze, to ma by� poprzedzone napisem W:
-w przeciwnym razie ma si� pojawia� L:

SELECT
ProductID
,Name
,Size
,Weight
,ListPrice 
,COALESCE('s '+Size, 'w '+CAST(Weight AS varchar(10)), 'l '+CAST(ListPrice AS varchar(10))) AS 'cecha przedmiotu'
FROM Production.Product
Order by 'cecha przedmiotu' DESC