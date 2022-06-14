------------------------------------------FUNCI�N CONVERT()--------------------------
--funci�n CONVERT convierte una expresi�n de un tipo de datos a otro tipo de datos.
-------------------------------------------SINTAXIS-------------------------------------
--CONVERT( tipo [(longitud)],expresi�n[,estilo])
--tipo: El tipo de datos al que desea convertir la expresi�n. Puede ser uno de los siguientes:
--------bigint, int, smallint, tinyint, bit, decimal, num�rico, dinero, smallmoney, float, real, 
--------datetime, smalldatetime, char, varchar, text, nchar, nvarchar, ntext, binary, varbinary o image.
--longitud: Opcional. La longitud del tipo de datos resultante para char, varchar, nchar, nvarchar, binario y varbinario.
--expresi�n: Valor que se va a convertir en otro tipo de datos.
--estilo: Opcional. El formato utilizado para convertir entre tipos de datos, como un formato de fecha o 
--un formato de cadena.

SELECT CONVERT(DATE, SUBSTRING(rfc, 5, 6)) [Dia Nacimiento rfc]
FROM Instructores

---------------------------------------La cl�usula SQL HAVING----------------------------------
--La cl�usula HAVING:Se usa en combinaci�n con la cl�usula GROUP BY para restringir los grupos de 
--filas devueltas solo a aquellos cuya condici�n es TRUE.
-------------------------------------------SINTAXIS-------------------------------------
/*
SELECT expresi�n1, expresi�n2, ... expresi�n_n, 
       funci�n_agregado (expresi�n)
FROM tables
[WHERE condiciones]
GROUP BY expresi�n1, expresi�n2, ... expresi�n_n
HAVING condici�n_having;
ORDER BY expresi�n(n);
*/
--funci�n_agregado: Puede ser una funci�n como las funciones SUM, COUNT, MIN, MAX o AVG.
--expresi�n1, expresi�n2, ... expresi�n_n: Las expresiones que no est�n encapsuladas dentro de una funci�n agregada y deben incluirse en la cl�usula GROUP BY.
--WHERE condiciones: Opcional. Estas son las condiciones para seleccionar los registros.
--condici�n_having: Esta es una condici�n adicional que se aplica solo a los resultados agregados para restringir los grupos de filas devueltas. Solo aquellos grupos cuya condici�n se eval�e a TRUE se incluir�n en el conjunto de resultados.

 SELECT Est.nombre as Estado, count(CurAlu.calificacion) as Total
  FROM Alumnos Alu INNER JOIN 
				Estados Est ON Alu.idEstadoOrigen = Est.id INNER JOIN
				CursosAlumnos CurAlu ON Alu.id = CurAlu.idAlumno 
GROUP BY Est.nombre
HAVING AVG (CurAlu.calificacion) > 8
ORDER BY Estado

-------------------------------------LA CONDICI�N LIKE-------------------------------
--LA CONDICI�N LIKE permite usar comodines en la cl�usula WHERE de una instrucci�n SELECT, INSERT, UPDATE o DELETE. 
--para determina si una cadena de caracteres coincide con un patr�n especificado.

-------------------------------------------SINTAXIS-------------------------------------
--expresi�n LIKE patr�n [ESCAPE'character_escape']
----------------------------------------------------------------------------------------
--expresi�n: Una expresi�n de car�cter como una columna o un campo.

--patr�n: Expresi�n de car�cter que contiene coincidencia de patrones. 
--Los patrones entre los que puedes elegir son:
--%:permite hacer coincidir cualquier cadena de cualquier longitud (incluida la longitud cero)
--_:Permite que coincida en un solo car�cter
--[ ]:Permite hacer coincidir cualquier car�cter de los corchetes [] (por ejemplo, [abc] coincidir�a con caracteres a, b o c)
--[^]:Permite hacer coincidir en cualquier car�cter que no est� entre corchetes [^] (por ejemplo, [^abc] coincidir�a en cualquier car�cter que no sea a, b o c caracteres)

--character_escape:Opcional. Le permite probar instancias literales de un car�cter comod�n como % o _.
-------------------------------------------comod�n %----------------------------------------
SELECT *
FROM Alumnos
WHERE segundoApellido LIKE 'B%';

SELECT *
FROM Alumnos
WHERE segundoApellido LIKE '%o%';
-----------------------------------------comod�n _ -----------------------------------------
--Recuerda que _ comod�n est� buscando un solo car�cter.
SELECT *
FROM Alumnos
WHERE primerApellido LIKE 'Garc_a';

SELECT *
FROM Alumnos
WHERE primerApellido LIKE '_____';
--------------------------------------------------------------------------------------------
SELECT *
FROM Alumnos 
WHERE primerApellido LIKE 'A%'

SELECT *
FROM Alumnos 
WHERE primerApellido LIKE '[A-D]%'

SELECT *
FROM Alumnos 
WHERE primerApellido LIKE '[^a]%'
