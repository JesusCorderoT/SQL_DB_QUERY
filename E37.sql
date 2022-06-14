/*E37*/

/*1. Alumnos cuyo apellido sea “Mendoza”*/
select * from ALUMNOS where primerApellido = 'Mendoza' or segundoApellido = 'Mendoza';
select * from ALUMNOS where primerApellido LIKE 'Mendoza';

/*2. Alumnos cuyo estatus sea “En Capacitación*/
select  EST.nombre as Estado , ALU.nombre
from ALUMNOS alu 
INNER JOIN EstatusAlumno EST ON alu.idestadoorigen = EST.id where est.nombre = 'En capacitación'
	group by EST.nombre,alu.nombre; 
	
/*3. Instructores que sean mayores de 30 años*/
SELECT nombre,
DATEDIFF(YEAR,fechaNacimiento,GETDATE()) as Edad from instructores
where DATEDIFF(YEAR,fechaNacimiento,GETDATE()) > 30;

/*4. Alumnos que estén entre 20 y 25 años*/
select nombre, DATEDIFF(YEAR,fechaNacimiento,GETDATE()) as Edad  from ALUMNOS
where DATEDIFF(YEAR,fechaNacimiento,GETDATE())  BETWEEN 20 and 25;


/*5. Alumnos que sea del Estado de “Oaxaca” y su estatus sea “En 
Capacitación”, o que sean de “Campeche” y que estén en estatus 
“Prospecto”*/
select ALU.nombre, EST.nombre as Estado , ES.nombre
from ALUMNOS alu
	INNER JOIN Estados Es ON alu.idestadoorigen = ES.id 
	INNER JOIN EstatusAlumno EST ON alu.idEstatus= EST.id
	where est.nombre = 'En capacitación' AND ES.nombre = 'Oaxaca'
	   or est.nombre = 'Prospecto' AND ES.nombre = 'Campeche'
	group by EST.nombre,alu.nombre,Es.nombre; 


/*6. Alumnos cuyo correo sea de gmail*/
select nombre,correo from ALUMNOS where correo like '%gmail.com%';

/*7. Alumnos que cumplen años en el mes de marzo*/
SELECT nombre,MONTH(fechaNacimiento) [Mes] from ALUMNOS
where MONTH(fechaNacimiento) = 3;

/*8. Alumnos que cumplen 30 años dentro de 5 años en relación con la fecha actua*/





/*9. Alumnos cuyo nombre exceda de 10 caracteres*/
select nombre,LEN(nombre) AS Cantidad
from  ALUMNOS where LEN(nombre)>=6;

/*10.Alumnos cuyo último carácter del curp sea numérico*/
select nombre,SUBSTRING(curp, 17, 1) as curp from ALUMNOS
where SUBSTRING(curp, 17, 1) not like '%[^0-9]%';


/*11.Alumnos cuya calificación sea mayor que 8*/
select ALU.nombre,calificacion as Total from ALUMNOS alU 
INNER JOIN CursosAlumnos CA ON  alu.id = CA.id  WHERE CALIFICACION > 8
group by ALU.nombre,calificacion;


/*12.Alumnos que se encuentren en estatus laborando o liberado con un 
sueldo superior a 15,000*/
	SELECT ALU.nombre,EA.nombre AS Estatus,ALU.sueldo
	FROM ALUMNOS ALU
	INNER JOIN EstatusAlumno EA ON alu.idEstatus = EA.id
	WHERE ea.nombre = 'Laborando' OR ea.nombre ='Liberado' 
	and ALU.sueldo > 15000;
	
/*13.Alumnos cuyo año de nacimiento esté entre 1990 y 1995 y que su 
primer apellido empiece con B, C ó Z*/
SELECT nombre,primerApellido,fechaNacimiento 
FROM ALUMNOS
where primerApellido Like '[BCZ]%' AND fechaNacimiento 
BETWEEN  '1990-01-01' AND '1995-01-01';


/*14. Alumnos cuyo fecha de Nacimiento no coincide con la fecha de nacimiento del 
curp
• Nombre del alumno
• Curp
• Fecha de Nacimiento*/
SELECT nombre,curp,fechaNacimiento, 
CONVERT(date,fechaNacimiento),SUBSTRING(curp,5,6),CONVERT(date,SUBSTRING(curp,5,6)) from ALUMNOS
where CONVERT(date,SUBSTRING(curp,5,6)) <> CONVERT(date,fechaNacimiento);


/*15. Alumnos cuyo primer apellido inicie con ‘A’ y el mes de nacimiento sea abril y 
que tengan entre 21 y 30 años*/
SELECT  nombre,primerApellido,fechaNacimiento, 
DATEDIFF(YEAR,fechaNacimiento,GETDATE()) as Edad 
FROM ALUMNOS
where primerApellido LIKE 'A%' 
AND DATEDIFF(YEAR,fechaNacimiento,GETDATE()) between 21 and 30;


/*16. Obtener una lista de alumnos que se llaman Luis aunque sea compuesto*/
select nombre from ALUMNOS
 where	nombre LIKE '%L%' AND 
		nombre LIKE '%U%' AND
		nombre LIKE '%I%' AND
		nombre LIKE '%S%' ;


/*17. Obtener una consulta de los cursos que se han impartido en el año de 2021, 
o nombre del curso
o fecha de inicio
o fecha final
o cantidad de alumnos
o promedio de calificaciones.*/
select 
	   CC.nombre AS CURSO,
	   CS.fechainicio,cs.fechatermino,
	   count(ca.idalumno) as Alumnos,
	   AVG(calificacion) as Promedio

from ALUMNOS alu 
				 INNER JOIN CursosAlumnos CA ON  alu.id = CA.idalumno
				 INNER JOIN Cursos CS ON CA.IdCurso = CS.ID
				 INNER JOIN CatCursos CC ON CS.idcatcurso = CC.id

where fechainicio between '2021-01-01' and  '2022-12-12'
group by CC.nombre,cs.fechainicio,cs.fechatermino;


/*18. Realizar la siguiente consulta Resumen de Calificaciones por Estado, 
considerando únicamente a los alumnos que tienen calificación mayor a 6
mostrando únicamente a los estados cuyo total de alumnos (con promedio 
mayor a 6) sea mayor a 1*/
select EST.nombre as Estado, 
				   COUNT(CC.calificacion) as total,
				   AVG(CC.calificacion) AS Promedio_Cali,
				   AVG(alu.sueldo) AS Prom_Sueldo
from ALUMNOS alu 
INNER JOIN Estados EST ON alu.idestadoorigen = EST.id
INNER JOIN CursosAlumnos CC ON ALU.idestadoorigen = CC.id
group by EST.nombre having	AVG(CC.calificacion)>6; 

