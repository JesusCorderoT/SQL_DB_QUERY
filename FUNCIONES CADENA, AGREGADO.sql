----------------------------------------FUNCIONES DE CADENAS-------------------------------------------
--Las funciones de cadena realizan operaciones en valores de cadena y devuelven valores num�ricos o de cadena.

--Funci�n UPPER()
--Convierta el texto en may�sculas:

-------------------------------------------SINTAXIS-------------------------------------
--UPPER(text)
/*text: es una expresi�n de datos de caracteres. character_expression puede ser una constante,
--variable o columna de car�cter.*/

SELECT UPPER('texto en may�sculas') as texto;

SELECT UPPER(nombre) AS NOMBRE
FROM Instructores

SELECT LOWER('HOLA') as texto;

--Funci�n SUBSTRING()
--Extrae algunos caracteres de una cadena.
-------------------------------------------SINTAXIS-------------------------------------
--SUBSTRING(string, start, length)
--string: Es una expresi�n de car�cter, binario, texto y ntexto.
--start: Es una expresi�n entera o bigint que especifica d�nde comienzan los caracteres devueltos.
--length:Es una expresi�n entera o bigint positiva que especifica cu�ntos caracteres de la expresi�n se devolver�n. 

SELECT SUBSTRING('Curso Sql', 1, 5) AS Extracci�nCadena;

SELECT SUBSTRING(rfc, 9, 2) as [Dia Nacimiento rfc]
FROM Instructores

--SELECT * FROM Instructores

--Funci�n REPLACE()
--reemplaza todas las apariciones de una subcadena dentro de una cadena, con una nueva subcadena.
-------------------------------------------SINTAXIS-------------------------------------
--REPLACE(string, old_string, new_string)
--string: Es la expresi�n de cadena donde se va a buscar.
--old_string: Es la subcadena que se remplazara.
--new_string: Es la cadena de reemplazo.

SELECT REPLACE('Curso Sql', 'Sql', 'C#') as Cursos;

SELECT REPLACE(correo, '.com', '.mx') as Correo FROM Instructores

--SELECT * FROM Instructores
  -------------------------------------FUNCIONES AGREGADO--------------------------------------
--devuelven un solo valor, calculado a partir de valores de una columna.

--COUNT: devuelve el n�mero total de filas seleccionadas por la consulta.
--MIN: devuelve el valor m�nimo del campo que especifiquemos.
--MAX: devuelve el valor m�ximo del campo que especifiquemos.
--SUM: suma los valores del campo que especifiquemos. S�lo se puede utilizar en columnas num�ricas.
--AVG: devuelve el valor promedio del campo que especifiquemos. S�lo se puede utilizar en columnas num�ricas.



--Function AVG()
--devuelve el valor medio de una columna num�rica.
-------------------------------------------SINTAXIS-------------------------------------
--SELECT AVG(column_name) FROM table_name

SELECT nombre,primerApellido,MIN(cuotaHora) FROM Instructores
GROUP BY nombre,primerApellido