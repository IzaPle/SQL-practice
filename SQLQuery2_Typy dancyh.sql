--1. Z tabeli HumanResources.Department wy�wietl nazw�. Zwr�� uwag� na nazw� pierwszego i ostatniego departamentu
SELECT *
FROM HumanResources.Department

--2.Napisz skrypt, w kt�rym:
--zadeklarujesz zmienn� napisow� ,UNICODE, o maksymalnej d�ugo�ci 1000 znak�w
DECLARE @n NVARCHAR(1000)

--przypisz do niej pusty napis

SET @n=''
PRINT @n
--poleceniem SELECT pobierz do tej zmiennej nazw� departamentu z rekordu z DepartamentID=1
SELECT @n=Name
FROM HumanResources.Department
WHERE DepartmentID='1'

--Wy�wietl t� zmienn�
PRINT @n
--Wy�wietl d�ugo�� napisu (w literkach) i ilo�� konsumowanej przez ni� pami�ci
SELECT LEN(@n),DATALENGTH(@n)
GO
--3. Skopiuj poprzednie polecenie i zmie� je tak, �e polecenie SELECT nie b�dzie zawiera� klauzuli WHERE. Nazwa kt�rego departamentu jest teraz warto�ci� zmiennej?
DECLARE @s1 NVARCHAR(1000)
SET @s1 = ''
SELECT @s1=Name FROM HumanResources.Department
PRINT @s1
GO
--4. Aktualizuj�c w SELECT zmienn� testow� zmie� wyra�enie na @s1+='/'+Name
--Sprawd� zawarto�� zmiennej tekstowej wy�wietlaj�c j�
DECLARE @s1 NVARCHAR(1000)
SET @s1 = ''
SELECT @s1+='/'+Name FROM HumanResources.Department
PRINT @s1
GO
--5. Sprawd� jaki typ jest u�ywany w poni�szych polach tabel i oce� jak d�ugi napis mo�na umie�ci� w zmiennej i ile pami�ci on zajmuje:

--HumanResources.Department - kolumna Name 
nVarchar(50) do 50 znak�w 100b
--HumanResources.Employes - kolumna MartialStatus
nchar(1) 1 znak 1b
--Production.Product -kolumna Color
nvarchar(15) do 15 znak�w 30 b