/*E33*/


/*1. Realizar la siguiente Consulta con el nombre y apellidos en 
Mayúsculas*/
select UPPER(nombre),UPPER(primerApellido),UPPER(segundoApellido),fechaNacimiento, 
GETDATE() AS HOY, 
DATEDIFF(YEAR,fechaNacimiento,GETDATE()) as Edad ,
DATEDIFF(YEAR,DATEADD(month, -10, fechaNacimiento),GETDATE()) as Edad5Meses
From ALUMNOS;


/*2. Realizar la consulta Anterior agregando columna con la fecha de 
nacimiento extraída del CURP*/


	SELECT ID,NOMBRE,primerApellido,segundoApellido,fechaNacimiento,curp,
CONVERT(DATE, SUBSTRING(curp, 5, 6)) as FechaCurp
FROM ALUMNOS;



/*3. Realizar una consulta con los datos del alumnos y una columna 
adicional indicando el género con la palabra ‘Hombre’ o ‘Mujer’ según 
corresponda de acuerdo con lo indicado en la columna 11 del curp*/
SELECT 
	 NOMBRE,
	   CASE
	WHEN SUBSTRING(curp, 11, 1) = 'H' THEN 'HOMBRE'
	WHEN SUBSTRING(curp, 11, 1) = 'M' THEN 'MUJER'
	ELSE 'N/A'
	END AS Nivel
FROM ALUMNOS as alu;



/*4. Realizar la siguiente consulta de Alumnos, cambiando el correo de 
Gmail por hotmail*/

SELECT id,nombre,primerApellido,segundoApellido,fechaNacimiento,correo,REPLACE(correo, 'gmail', 'hotmail') as CorreoHot FROM ALUMNOS;








