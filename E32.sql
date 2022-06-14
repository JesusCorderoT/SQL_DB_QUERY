/*E32*/

/*1. Realizar la siguiente consulta de Instructores*/
select nombre,
primerApellido as [Apellido Paterno],
segundoApellido as [Apellido Materno],RFC,
cuotaHora as [Cuota por Hora], activo
from instructores;

/*2. Realizar la siguiente consulta de Cursos*/
	SELECT Nombre as Curso, Horas as Horas, fechaInicio,fechaTermino
	FROM Cursos INNER JOIN  CatCursos 
	ON Cursos.idCatCurso = CatCursos.id;
	
/*3. Realizar la siguiente consulta de alumnos*/	
select alu.nombre,alu.primerApellido,alu.segundoApellido,alu.curp, EST.nombre as Estado,ea.nombre as Estatus
from ALUMNOS alu INNER JOIN Estados EST ON alu.idestadoorigen = EST.id
				 INNER JOIN EstatusAlumno ea on ea.id = alu.idEstatus; 


/*4. Realizar la siguiente consulta de Instructores, en que cursos ha 
participado*/
SELECT Concat(ins.nombre,' ',ins.primerApellido, ' ',ins.segundoApellido) AS Instructor,
cuotaHora, CU.nombre AS Nombre, cs.fechainicio as Inicio, cs.fechatermino as Fin
FROM instructores ins 
INNER JOIN CursosInstructores CC ON ins.id = CC.IdIstructor
INNER JOIN Cursos cs ON cs.id = CC.IdCurso
INNER JOIN CatCursos CU ON CU.id = cc.Id;


/*5. Realizar la siguiente consulta de Alumnos, mostrando los cursos ha 
tomado*/
select alu.nombre,alu.primerApellido,alu.segundoApellido,
       EST.nombre as Estado,
	   CC.nombre AS CURSO,
	   ca.fechaInscripcion,
	   CS.fechainicio,cs.fechatermino,
	   ca.calificacion
from ALUMNOS alu INNER JOIN Estados EST ON alu.idestadoorigen = EST.id
				 INNER JOIN CursosAlumnos CA ON  alu.id = CA.id
				 INNER JOIN Cursos CS ON CA.IdCurso = CS.ID
				 INNER JOIN CatCursos CC ON CS.idcatcurso = CC.id;

/*6. Consulta de alumnos: Nombre y apellidos, curso, fecha inicial, fecha 
final, calificación. Ordenado de la calificación más alta a la más baja*/

select alu.nombre,alu.primerApellido,alu.segundoApellido,
      
	   CC.nombre AS CURSO,
	   CS.fechainicio,cs.fechatermino,
	   ca.calificacion
from ALUMNOS alu 
				 INNER JOIN CursosAlumnos CA ON  alu.id = CA.id
				 INNER JOIN Cursos CS ON CA.IdCurso = CS.ID
				 INNER JOIN CatCursos CC ON CS.idcatcurso = CC.id 
				 ORDER BY CA.calificacion 
				 ;
				 
/*7. Realizar la siguiente consulta de los Cursos con su correspondiente 
curso de prerrequisito*/


SELECT CC.clave,CC.nombre,CC.horas,CT.nombre AS Prerequisito
	FROM Cursos CU INNER JOIN CatCursos CC ON CC.id = CU.idCatCurso  
				   INNER JOIN CatCursos CT ON CC.id = CT.idprerequisito; 
	
	;
	
	