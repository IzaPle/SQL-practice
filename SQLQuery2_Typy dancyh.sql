--1. Z tabeli HumanResources.Department wyœwietl nazwê. Zwróæ uwagê na nazwê pierwszego i ostatniego departamentu
SELECT *
FROM HumanResources.Department

--2.Napisz skrypt, w którym:
--zadeklarujesz zmienn¹ napisow¹ ,UNICODE, o maksymalnej d³ugoœci 1000 znaków
DECLARE @n NVARCHAR(1000)

--przypisz do niej pusty napis

SET @n=''
PRINT @n
--poleceniem SELECT pobierz do tej zmiennej nazwê departamentu z rekordu z DepartamentID=1
SELECT @n=Name
FROM HumanResources.Department
WHERE DepartmentID='1'

--Wyœwietl t¹ zmienn¹
PRINT @n
--Wyœwietl d³ugoœæ napisu (w literkach) i iloœæ konsumowanej przez ni¹ pamiêci
SELECT LEN(@n),DATALENGTH(@n)
GO
--3. Skopiuj poprzednie polecenie i zmieñ je tak, ¿e polecenie SELECT nie bêdzie zawieraæ klauzuli WHERE. Nazwa którego departamentu jest teraz wartoœci¹ zmiennej?
DECLARE @s1 NVARCHAR(1000)
SET @s1 = ''
SELECT @s1=Name FROM HumanResources.Department
PRINT @s1
GO
--4. Aktualizuj¹c w SELECT zmienn¹ testow¹ zmieñ wyra¿enie na @s1+='/'+Name
--SprawdŸ zawartoœæ zmiennej tekstowej wyœwietlaj¹c j¹
DECLARE @s1 NVARCHAR(1000)
SET @s1 = ''
SELECT @s1+='/'+Name FROM HumanResources.Department
PRINT @s1
GO
--5. SprawdŸ jaki typ jest u¿ywany w poni¿szych polach tabel i oceñ jak d³ugi napis mo¿na umieœciæ w zmiennej i ile pamiêci on zajmuje:

--HumanResources.Department - kolumna Name 
nVarchar(50) do 50 znaków 100b
--HumanResources.Employes - kolumna MartialStatus
nchar(1) 1 znak 1b
--Production.Product -kolumna Color
nvarchar(15) do 15 znaków 30 b