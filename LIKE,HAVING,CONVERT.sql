------------------------------------------FUNCIÓN CONVERT()--------------------------
--función CONVERT convierte una expresión de un tipo de datos a otro tipo de datos.
-------------------------------------------SINTAXIS-------------------------------------
--CONVERT( tipo [(longitud)],expresión[,estilo])
--tipo: El tipo de datos al que desea convertir la expresión. Puede ser uno de los siguientes:
--------bigint, int, smallint, tinyint, bit, decimal, numérico, dinero, smallmoney, float, real, 
--------datetime, smalldatetime, char, varchar, text, nchar, nvarchar, ntext, binary, varbinary o image.
--longitud: Opcional. La longitud del tipo de datos resultante para char, varchar, nchar, nvarchar, binario y varbinario.
--expresión: Valor que se va a convertir en otro tipo de datos.
--estilo: Opcional. El formato utilizado para convertir entre tipos de datos, como un formato de fecha o 
--un formato de cadena.

SELECT CONVERT(DATE, SUBSTRING(rfc, 5, 6)) [Dia Nacimiento rfc]
FROM Instructores

---------------------------------------La cláusula SQL HAVING----------------------------------
--La cláusula HAVING:Se usa en combinación con la cláusula GROUP BY para restringir los grupos de 
--filas devueltas solo a aquellos cuya condición es TRUE.
-------------------------------------------SINTAXIS-------------------------------------
/*
SELECT expresión1, expresión2, ... expresión_n, 
       función_agregado (expresión)
FROM tables
[WHERE condiciones]
GROUP BY expresión1, expresión2, ... expresión_n
HAVING condición_having;
ORDER BY expresión(n);
*/
--función_agregado: Puede ser una función como las funciones SUM, COUNT, MIN, MAX o AVG.
--expresión1, expresión2, ... expresión_n: Las expresiones que no están encapsuladas dentro de una función agregada y deben incluirse en la cláusula GROUP BY.
--WHERE condiciones: Opcional. Estas son las condiciones para seleccionar los registros.
--condición_having: Esta es una condición adicional que se aplica solo a los resultados agregados para restringir los grupos de filas devueltas. Solo aquellos grupos cuya condición se evalúe a TRUE se incluirán en el conjunto de resultados.

 SELECT Est.nombre as Estado, count(CurAlu.calificacion) as Total
  FROM Alumnos Alu INNER JOIN 
				Estados Est ON Alu.idEstadoOrigen = Est.id INNER JOIN
				CursosAlumnos CurAlu ON Alu.id = CurAlu.idAlumno 
GROUP BY Est.nombre
HAVING AVG (CurAlu.calificacion) > 8
ORDER BY Estado

-------------------------------------LA CONDICIÓN LIKE-------------------------------
--LA CONDICIÓN LIKE permite usar comodines en la cláusula WHERE de una instrucción SELECT, INSERT, UPDATE o DELETE. 
--para determina si una cadena de caracteres coincide con un patrón especificado.

-------------------------------------------SINTAXIS-------------------------------------
--expresión LIKE patrón [ESCAPE'character_escape']
----------------------------------------------------------------------------------------
--expresión: Una expresión de carácter como una columna o un campo.

--patrón: Expresión de carácter que contiene coincidencia de patrones. 
--Los patrones entre los que puedes elegir son:
--%:permite hacer coincidir cualquier cadena de cualquier longitud (incluida la longitud cero)
--_:Permite que coincida en un solo carácter
--[ ]:Permite hacer coincidir cualquier carácter de los corchetes [] (por ejemplo, [abc] coincidiría con caracteres a, b o c)
--[^]:Permite hacer coincidir en cualquier carácter que no esté entre corchetes [^] (por ejemplo, [^abc] coincidiría en cualquier carácter que no sea a, b o c caracteres)

--character_escape:Opcional. Le permite probar instancias literales de un carácter comodín como % o _.
-------------------------------------------comodín %----------------------------------------
SELECT *
FROM Alumnos
WHERE segundoApellido LIKE 'B%';

SELECT *
FROM Alumnos
WHERE segundoApellido LIKE '%o%';
-----------------------------------------comodín _ -----------------------------------------
--Recuerda que _ comodín está buscando un solo carácter.
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
