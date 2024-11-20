--1. Wyœwietl rekordy z tabeli Person.Person, gdzie nie podano drugiego imienia (MiddleName)
SELECT *
FROM Person.Person
WHERE MiddleName IS NULL
--2. Wyœwietl rekordy z tabeli Person.Person, gdzie drugie imiê jest podane
SELECT *
FROM Person.Person
WHERE MiddleName IS NOT NULL
--3. Wyœwietl z tabeli Person.Person:
-FirstName
-MiddleName
-LastName
---napis z po³¹czenia ze sob¹ FirstName ' ' MiddleName ' ' i  LastName

SELECT 
FirstName
,MiddleName
,LastName
,FirstName+' '+MiddleName+' '+LastName AS 'Pe³ne imie i nazwisko'
FROM Person.Person

--4. Jeœli jeszcze tego nie zrobi³eœ dodaj wyra¿enie, które obs³u¿y sytuacjê, gdy MiddleName jest NULL. W takim przypadku chcemy prezentowaæ tylko FirstName ' ' i LastName
SELECT 
FirstName
,MiddleName
,LastName
,FirstName+' '+ISNULL(MiddleName,'')+' '+LastName
FROM Person.Person

--5. Jeœli jeszcze tego nie zrobi³eœ - wyeliminuj podwój¹ spacjê, jaka mo¿e siê pojawiæ miêdzy FirstName i LastNamr gdy MiddleName jest NULL.
SELECT 
FirstName
,MiddleName
,LastName
,FirstName+' '+ISNULL(MiddleName+' ','')+LastName
FROM Person.Person

--6.Firma podpisuje umowê z firm¹ kuriersk¹. Cena us³ugi ma zale¿eñ od rozmiaru w drugiej kolejnoœci ciê¿aru, a gdy te nie s¹ znane od wartoœci wysy³anego przedmiotu.
Napisz zapytanie, które wyœwietli z tabeli Production.Product:
-productId
-Name
-size, weight i listprice
---i kolumnê wyliczan¹, która poka¿e size (jeœli jest NOT NULL), lub weight (jeœli jest NOT NULL) lub listprice w przeciwnym razie

SELECT
ProductID
,Name
,Size
,Weight
,ListPrice 
,COALESCE(Size, CAST(Weight AS varchar(10)), CAST(ListPrice AS varchar(10))) AS 'cecha przedmiotu'
FROM Production.Product
Order by 'cecha przedmiotu' DESC

--7. Firma kurierska oczekuje aby informacja w ostatniej kolumnie by³a dodatkowo oznaczona:
-jeœli zawiera informacje o rozmiarze, to ma byæ poprzedzona napisem S:
-jeœli zawiera informacje o ciê¿arze, to ma byæ poprzedzone napisem W:
-w przeciwnym razie ma siê pojawiaæ L:

SELECT
ProductID
,Name
,Size
,Weight
,ListPrice 
,COALESCE('s '+Size, 'w '+CAST(Weight AS varchar(10)), 'l '+CAST(ListPrice AS varchar(10))) AS 'cecha przedmiotu'
FROM Production.Product
Order by 'cecha przedmiotu' DESC