-----------------------------------SUBTEMA: CONSULTAS BASICAS---------------------------
--Instrucción SQL SELECT
--La instrucción se utiliza para seleccionar datos de una base de datos.SELECT
--Los datos devueltos se almacenan en una tabla de resultados, denominada conjunto de resultados.

-------------------------------------------SINTAXIS------------------------------------- 
--SELECT column1, column2, ...
--FROM table_name;
--***************************************************************************************

--Seleccionar la tabla de alumnos 
select * from Alumnos
select primerApellido as [Apellido Paterno],segundoApellido as [Apellido Materno], nombre, telefono, correo from Alumnos

--//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/*La cláusula Top n de SQL Server se utiliza para especificar el número de filas 
de datos que se van a devolver.*/
-------------------------------------------SINTAXIS------------------------------------- 
--SELECT TOP (top_value) [PERCENT] 
--           Expressions
--FROM Tables
--           [WHERE Conditions]
--           [ORDER BY Expression [ASC | DESC]];
--*******************************************************************************************
---------------------------------------------------------------------------------------------
select top(3) primerApellido as [Apellido Paterno],segundoApellido as [Apellido Materno], nombre, telefono, correo 
from Alumnos

select top(50) PERCENT primerApellido as [Apellido Paterno],segundoApellido as [Apellido Materno], nombre, telefono, correo 
from Alumnos

select  primerApellido as [Apellido Paterno],segundoApellido as [Apellido Materno], nombre, telefono, correo 
from Alumnos

/*La palabra clave SQL ORDER BY
La palabra clave se utiliza para ordenar el conjunto de resultados en orden ascendente o descendente*/

-------------------------------------------SINTAXIS------------------------------------- 
--SELECT column1, column2, ...
--FROM table_name
--ORDER BY column1, column2, ... ASC|DESC;

select top(3) primerApellido as [Apellido Paterno],segundoApellido as [Apellido Materno], nombre, telefono, correo 
from Alumnos
ORDER BY primerApellido Desc;

/*La instrucción SQL SELECT INTO
La instrucción copia los datos de una tabla en una nueva tabla.SELECT INTO*/

--Copie todas las columnas en una tabla nueva:
-------------------------------------------SINTAXIS------------------------------------- 
--SELECT *
--INTO newtable [IN externaldb]
--FROM oldtable
--WHERE condition;
Use InstitutoTich
SELECT * INTO EjerciciosTich.dbo.Alumnos_Copia from Alumnos

use EjerciciosTich
SELECT * INTO Alumnos  from InstitutoTich.dbo.Alumnos

--Copie solo algunas columnas en una tabla nueva:
-------------------------------------------SINTAXIS------------------------------------- 
--SELECT column1, column2, column3, ...
--INTO newtable [IN externaldb]
--FROM oldtable
--WHERE condition;


-------------------------------------------------------------CONSULTAS MULTIPLES TABLAS--------------------------------------------------------------
--Union de tablas SQL Server
--Las uniones de SQL Server se usan para recuperar los datos de dos o más tablas relacionadas.


--Inner Join.
/*La unión interna en SQL Server se usa para devolver solo las filas coincidentes de ambas 
tablas involucradas en la unión mediante la eliminación de los registros no coincidentes.*/

-------------------------------------------SINTAXIS------------------------------------- 
--SELECT nombreColumna(s)
--FROM tabla1
--INNER JOIN tabla2
--ON tabla1.nombreColumna=table2.nombreColumna;
--*******************************************************************************************

SELECT Nombre as Curso, Horas as hora, fechaInicio,fechaTermino
	FROM Cursos INNER JOIN  CatCursos 
	ON Cursos.idCatCurso = CatCursos.id 
	WHERE Horas = 120

--Left Join.
/*La unión externa izquierda en SQL Server se usa para recuperar todas las filas coincidentes 
tanto de las tablas involucradas en la unión como de las filas no coincidentes de la tabla lateral izquierda.*/
-------------------------------------------SINTAXIS-------------------------------------
--SELECT nombreColumna(s)
--FROM tabla1
--LEFT JOIN tabla2
--ON tabla1.nombreColumna=tabla2.nombreColumna;

SELECT Nombre as Curso, Horas as hora, fechaInicio,fechaTermino
	FROM Cursos LEFT JOIN  CatCursos 
	ON Cursos.idCatCurso = CatCursos.id 
	WHERE Horas = 120

--Right Join.
/*se usa para recuperar todas las filas coincidentes tanto de las tablas involucradas en la unión 
como de las filas no coincidentes de la tabla del lado derecho.*/

-------------------------------------------SINTAXIS-------------------------------------
--SELECT nombreColumna(s)
--FROM tabla1
--RIGHT JOIN tabla2
--ON tabla1.nombreColumna=tabla2.nombreColumna;

SELECT Nombre as Curso, Horas as hora, fechaInicio,fechaTermino
	FROM Cursos RIGHT JOIN  CatCursos 
	ON Cursos.idCatCurso = CatCursos.id 
	WHERE Horas = 120

--Cross JOIN
 /*La CROSS JOIN no contiene una cláusula ON. En Cross Join, cada registro de una tabla se une con 
 cada registro de la otra tabla. En SQL Server, la unión cruzada no debe tener una cláusula ON o where.*/
 -------------------------------------------SINTAXIS-------------------------------------
  --select nombreColumna(s)
  --from tabla1
  --CROSS JOIN tabla2

  SELECT Nombre as Curso, Horas as hora, fechaInicio,fechaTermino
	FROM Cursos CROSS JOIN  CatCursos 
	
--Función ISNULL()
/*Devuelva el valor especificado SI la expresión es NULL, de lo contrario devuelva la expresión*/
-------------------------------------------SINTAXIS-------------------------------------
--ISNULL(expression, value)
--expression:Es la expresión que se va a comprobar para ver si es nula "NULL"
--value: Es la expresión que se va a devolver si la expression es nala"NULL"

SELECT ISNULL('Hola', 'Tich');
SELECT ISNULL(NULL, 'Alumnos');

--Función IIF()
--Devuelve un valor si una condición es Verdadera y otro valor si una condición es Falsa.
-------------------------------------------SINTAXIS-------------------------------------
--IIF(boolean_expression, true_value, false_value )

--boolean_expression: Expresión booleana válida.
--true_value: Valor que se devolverá si la expression es evalúa como Verdadera.
--false_value: Valor que se devolverá si la expression es evalúa como Falsa.

SELECT IIF(400>7000, 'Verdadero', 'Falso');

SELECT nombre,primerApellido,segundoApellido, IIF(cuotaHora>80, 'Especialista', 'Basico') as [Tipo Instructor]  
FROM Instructores

--Función CONCAT()
--Agrega dos o más cadenas juntas.
-------------------------------------------SINTAXIS-------------------------------------
--CONCAT(string1, string2, ...., string_n)

SELECT Concat('Hola',' ','Mundo') AS NombreCompleto

SELECT Concat(nombre,' ',primerApellido, ' ',segundoApellido) AS NombreCompleto
FROM Alumnos

--Instrucción SQL CASE
--devuelve un valor cuando se cumple la primera condición
/*Por lo tanto, una vez que una condición es verdadera, dejará de leer y devolverá el
resultado. Si no se cumplen las condiciones, devuelve el valor de la cláusula.ELSE
*Si no hay ningún artículo y no se cumplen las condiciones, devuelve NULL.*/
-------------------------------------------SINTAXIS-------------------------------------
--CASE
--    WHEN condition1 THEN result1
--    WHEN condition2 THEN result2
--    WHEN conditionN THEN resultN
--    ELSE result
--END;
SELECT calificacion,
	CASE
	WHEN calificacion BETWEEN 9 AND 10 THEN 'Excelente'
	WHEN calificacion BETWEEN 7 AND 8 THEN 'Bien'
	WHEN calificacion = 6 THEN 'Suficiente'
	ELSE 'N/A'
	END AS Nivel
  FROM CursosAlumnos

  -----------------------------------FUNCIONES DE FECHA--------------------------------------------
--Función GETDATE()
--Devuelva la fecha y hora del sistema de base de datos actual:
  SELECT GETDATE();

--Función DATEDIFF()
--Devuelve la diferencia entre dos valores de fecha, en años:
SELECT DATEDIFF(year, '2022/05/12', '2010/05/12') AS DateDiff;

--Devuelve la diferencia entre dos valores de fecha, en meses:
SELECT DATEDIFF(month, '2022/05/12', '2022/08/12') AS DateDiff;

--Devuelve la diferencia entre dos valores de fecha, en horas:
SELECT DATEDIFF(hour, '2022/05/12 07:00', '2022/05/12 12:45') AS DateDiff;

--Función DATEADD()
--Añade un año a una fecha y, a continuación, devuelve la fecha:
SELECT DATEADD(year, 1, '2022/05/12') AS DateAdd;

--Agregue dos meses a una fecha y, a continuación, devuelva la fecha:
SELECT DATEADD(month, 2, '2022/05/12') AS DateAdd;

--Reste dos meses de una fecha y, a continuación, devuelva la fecha:
SELECT DATEADD(month, -2, '2022/05/12') AS DateAdd;

