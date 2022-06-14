/*E33*/
select nombre,primerApellido,segundoApellido,fechaNacimiento, 
GETDATE() AS HOY, 
DATEDIFF(YEAR,fechaNacimiento,GETDATE()) as Edad ,
/*DATEADD(month, 5, fechaNacimiento) AS FechaMas5  ,*/
DATEDIFF(YEAR,DATEADD(month, -10, fechaNacimiento),GETDATE()) as Edad5Meses
From ALUMNOS;
