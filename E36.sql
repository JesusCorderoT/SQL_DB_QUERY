/*36*/

/*1. Realizar la siguiente consulta Alumnos por Estado*/
select EST.nombre, COUNT(alu.idestadoorigen) as total
from ALUMNOS alu 
INNER JOIN Estados EST ON alu.idestadoorigen = EST.id
	group by EST.nombre; 
/*2. Realizar la siguiente consulta Alumnos por Estatus*/
select  EST.nombre as Estado, COUNT(EST.nombre)
from ALUMNOS alu 
INNER JOIN EstatusAlumno EST ON alu.idestadoorigen = EST.id
	group by EST.nombre; 
/*3. Realizar la siguiente consulta Resumen de Calificaciones */

SELECT 'Cali' AS [Resumen],
COUNT(calificacion) as tot,
Max(calificacion) as Maxima,
Min(calificacion) as Minima,
AVG(calificacion) as Promedio
from CursosAlumnos;

/*4. Realizar la siguiente consulta Resumen de Calificaciones por Curso*/
select 
	   CC.nombre AS CURSO,
	   CS.fechainicio,cs.fechatermino,
	   count(calificacion) as Total,
	   MAX(calificacion) as Maxima,
	   MIN(calificacion) as Minima,
	   AVG(calificacion) as Promedio

from ALUMNOS alu 
				 INNER JOIN CursosAlumnos CA ON  alu.id = CA.id
				 INNER JOIN Cursos CS ON CA.IdCurso = CS.ID
				 INNER JOIN CatCursos CC ON CS.idcatcurso = CC.id
group by CC.nombre,cs.fechainicio,cs.fechatermino;

/*. Realizar la siguiente consulta Resumen de Calificaciones por Estado, 
considerando únicamente a los Estados que tienen promedio mayor a 6*/


select EST.nombre, COUNT(CC.calificacion) as total,
			       MAX(CC.calificacion) AS Maxima,
				   MIN(CC.calificacion) AS Minima,
				   AVG(CC.calificacion) AS Promedio

from ALUMNOS alu 
INNER JOIN Estados EST ON alu.idestadoorigen = EST.id
INNER JOIN CursosAlumnos CC ON ALU.idestadoorigen = CC.id
group by EST.nombre having	AVG(CC.calificacion)>6; 