-------------------------------------------------------------------------------------------------
----------------------------------------SUBTEMA: SUBCONSULTAS-------------------------------------
/*Una subconsulta tambi�n se denomina consulta interna o selecci�n interna, mientras que la instrucci�n 
que contiene una subconsulta tambi�n se denomina consulta externa o selecci�n externa.*/

--La consulta SELECT de una subconsulta siempre se incluye entre par�ntesis.

/*Una subconsulta puede anidarse dentro de la cl�usula o de una instrucci�n externa , , , 
o dentro de otra subconsulta. Es posible hasta 32 niveles de anidamiento, aunque el l�mite 
var�a en funci�n de la memoria disponible y la complejidad de otras expresiones en la consulta.*/

--****************************************************************************************************

--Subconsultas con operadores de comparaci�n o subconsulta escalar 
--es una sentencia SELECT dentro de una consulta externa para devolver un valor.

-------------------------------------------SINTAXIS-------------------------------------
/*SELECT listaExpresiones
FROM tabla
WHERE expresi�n OPERADOR 
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

--Subconsultas con IN o subconsultas de m�ltiples filas
-------------------------------------------SINTAXIS-------------------------------------
/*SELECT listaExpresiones
FROM tabla
WHERE expresi�n OPERADOR ALL|ANY
			(SELECT listaExpresiones
			FROM tabla);*/

/*SELECT listaExpresiones
FROM tabla
WHERE expresi�n IN
			(SELECT listaExpresiones
			FROM tabla);*/

----------------------------------------------------------------------------------------
/*ANY o SOME:Compara con cualquier registro de la subconsulta. La instrucci�n es v�lida 
si hay un registro en la subconsulta que permite que la comparaci�n sea cierta.
Se suele utilizar la palabra ANY (SOME es un sin�nimo)*/

/*ALL: Compara con todos los registros de la consulta. La instrucci�n resulta cierta si 
es cierta toda comparaci�n con los registros de la subconsulta*/

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
