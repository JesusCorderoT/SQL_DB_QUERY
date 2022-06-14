----------------------------------------FUNCIONES DE CADENAS-------------------------------------------
--Las funciones de cadena realizan operaciones en valores de cadena y devuelven valores numéricos o de cadena.

--Función UPPER()
--Convierta el texto en mayúsculas:

-------------------------------------------SINTAXIS-------------------------------------
--UPPER(text)
/*text: es una expresión de datos de caracteres. character_expression puede ser una constante,
--variable o columna de carácter.*/

SELECT UPPER('texto en mayúsculas') as texto;

SELECT UPPER(nombre) AS NOMBRE
FROM Instructores

SELECT LOWER('HOLA') as texto;

--Función SUBSTRING()
--Extrae algunos caracteres de una cadena.
-------------------------------------------SINTAXIS-------------------------------------
--SUBSTRING(string, start, length)
--string: Es una expresión de carácter, binario, texto y ntexto.
--start: Es una expresión entera o bigint que especifica dónde comienzan los caracteres devueltos.
--length:Es una expresión entera o bigint positiva que especifica cuántos caracteres de la expresión se devolverán. 

SELECT SUBSTRING('Curso Sql', 1, 5) AS ExtracciónCadena;

SELECT SUBSTRING(rfc, 9, 2) as [Dia Nacimiento rfc]
FROM Instructores

--SELECT * FROM Instructores

--Función REPLACE()
--reemplaza todas las apariciones de una subcadena dentro de una cadena, con una nueva subcadena.
-------------------------------------------SINTAXIS-------------------------------------
--REPLACE(string, old_string, new_string)
--string: Es la expresión de cadena donde se va a buscar.
--old_string: Es la subcadena que se remplazara.
--new_string: Es la cadena de reemplazo.

SELECT REPLACE('Curso Sql', 'Sql', 'C#') as Cursos;

SELECT REPLACE(correo, '.com', '.mx') as Correo FROM Instructores

--SELECT * FROM Instructores
  -------------------------------------FUNCIONES AGREGADO--------------------------------------
--devuelven un solo valor, calculado a partir de valores de una columna.

--COUNT: devuelve el número total de filas seleccionadas por la consulta.
--MIN: devuelve el valor mínimo del campo que especifiquemos.
--MAX: devuelve el valor máximo del campo que especifiquemos.
--SUM: suma los valores del campo que especifiquemos. Sólo se puede utilizar en columnas numéricas.
--AVG: devuelve el valor promedio del campo que especifiquemos. Sólo se puede utilizar en columnas numéricas.



--Function AVG()
--devuelve el valor medio de una columna numérica.
-------------------------------------------SINTAXIS-------------------------------------
--SELECT AVG(column_name) FROM table_name

SELECT nombre,primerApellido,MIN(cuotaHora) FROM Instructores
GROUP BY nombre,primerApellido