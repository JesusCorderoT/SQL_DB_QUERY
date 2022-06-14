-------------------------------------------------------------------------------------------------
----------------------------------------SUBTEMA: SUBCONSULTAS-------------------------------------
/*Una subconsulta también se denomina consulta interna o selección interna, mientras que la instrucción 
que contiene una subconsulta también se denomina consulta externa o selección externa.*/

--La consulta SELECT de una subconsulta siempre se incluye entre paréntesis.

/*Una subconsulta puede anidarse dentro de la cláusula o de una instrucción externa , , , 
o dentro de otra subconsulta. Es posible hasta 32 niveles de anidamiento, aunque el límite 
varía en función de la memoria disponible y la complejidad de otras expresiones en la consulta.*/

--****************************************************************************************************

--Subconsultas con operadores de comparación o subconsulta escalar 
--es una sentencia SELECT dentro de una consulta externa para devolver un valor.

-------------------------------------------SINTAXIS-------------------------------------
/*SELECT listaExpresiones
FROM tabla
WHERE expresión OPERADOR 
			(SELECT listaExpresiones
			FROM tabla);*/

--El operador puede ser >,<,>=,<=,!=, =

SELECT nombre, primerApellido, segundoApellido, cuotaHora
FROM Instructores
WHERE cuotaHora > 
		(SELECT cuotaHora FROM Instructores
		WHERE curp='VACL741011HTCZJS05');

SELECT * FROM Instructores

--****************************************************************************************

--Subconsultas con IN o subconsultas de múltiples filas
-------------------------------------------SINTAXIS-------------------------------------
/*SELECT listaExpresiones
FROM tabla
WHERE expresión OPERADOR ALL|ANY
			(SELECT listaExpresiones
			FROM tabla);*/

/*SELECT listaExpresiones
FROM tabla
WHERE expresión IN
			(SELECT listaExpresiones
			FROM tabla);*/

----------------------------------------------------------------------------------------
/*ANY o SOME:Compara con cualquier registro de la subconsulta. La instrucción es válida 
si hay un registro en la subconsulta que permite que la comparación sea cierta.
Se suele utilizar la palabra ANY (SOME es un sinónimo)*/

/*ALL: Compara con todos los registros de la consulta. La instrucción resulta cierta si 
es cierta toda comparación con los registros de la subconsulta*/

/*IN: No usa comparador, ya que sirve para comprobar si un valor se encuentra en el 
resultado de la subconsulta*/

--NOT IN: Comprueba si un valor no se encuentra en una subconsulta
-----------------------------------------------------------------------------------------
SELECT nombre, cuotaHora
FROM Instructores
WHERE cuotaHora <= ALL (SELECT cuotaHora FROM Instructores);
SELECT * FROM Instructores
-----------------------------------------------------------------------------------------
SELECT nombre, cuotaHora
FROM Instructores
WHERE cuotaHora >= All (SELECT cuotaHora FROM Instructores WHERE cuotaHora>=100);
------------------------------------------------------------------------------------------
SELECT nombre, cuotaHora
FROM Instructores
WHERE cuotaHora >= SOME (SELECT cuotaHora FROM Instructores WHERE cuotaHora>=100);
------------------------------------------------------------------------------------------
SELECT nombre, cuotaHora
FROM Instructores
WHERE cuotaHora IN (SELECT cuotaHora FROM Instructores WHERE cuotaHora<100);

--********************************************************************************************
