
-- EJ (01)
		-- Mostrar la estructura de la tabla Empresas. Seleccionar toda la información de la
		-- misma
SELECT *
FROM empresas; 

-- EJ (02)
		-- Mostrar la estructura de la tabla Personas. Mostrar el apellido y nombre y la fecha de
		-- registro en la agencia.

SELECT  apellido,nombre,fecha_registro_agencia
FROM personas; 


-- EJ (04)
		-- Mostrar de la persona con DNI nro. 28675888. El nombre y apellido, fecha de nacimiento,
		-- teléfono, y su dirección. Las cabeceras de las columnas serán:

select concat(apellido,' ',nombre ) , fecha_nacimiento,telefono, direccion
from personas 
where dni = 28675888;

-- EJ (05)
		--  Mostrar los datos de ej. Anterior, pero para las personas 27890765, 29345777 y 31345778.
		--  Ordenadas por fecha de Nacimiento
        
select concat(apellido,' ',nombre ) , fecha_nacimiento,telefono, direccion, dni
from personas 
where dni in ( 27890765, 29345777 , 31345778)
order by dni ASC ;

-- EJ (06)
		--  Mostrar las personas cuyo apellido empiece con la letra ‘G’.

select dni, concat(apellido,' ',nombre ) , fecha_nacimiento,telefono,fecha_registro_agencia, direccion, Telefono
from personas 
where apellido like 'G%';

-- EJ (07)
		-- Mostrar el nombre, apellido y fecha de nacimiento de las personas nacidas entre 1980 y
		-- 2000

select nombre, apellido, fecha_nacimiento
from personas
where fecha_nacimiento between  "19800101" and  "20000101";

-- EJ (08)
		-- Mostrar las solicitudes que hayan sido hechas alguna vez ordenados en forma ascendente
		-- por fecha de solicitud
        
select *
from solicitudes_empresas
order by fecha_solicitud DESC ;

-- EJ (09)
		-- Mostrar los antecedentes laborales que aún no hayan terminado su relación laboral
		-- ordenados por fecha desde

select *
from antecedentes
where fecha_hasta is null ;

-- EJ (10)
		-- Mostrar aquellos antecedentes laborales que finalizaron y cuya fecha hasta no esté entre
        -- junio del 2013 a diciembre de 2013, ordenados por número de DNI del empleado
        
select dni, cod_cargo, fecha_desde, fecha_hasta
from antecedentes
where   fecha_hasta is not null AND fecha_hasta not between "20130601" and "20131231" ;

-- EJ (11)
		-- Mostrar los contratos cuyo salario sea mayor que 2000 y trabajen en las empresas
		-- 30-10504876-5 o 30-21098732-4.Rotule el encabezado

select nro_contrato AS Nro_contrato , dni as DNI, sueldo AS Salario, cuit as CUIL
from contratos
where sueldo > "2000" AND  cuit in ("30-10504876-5 ","30-21098732-4")
order by nro_contrato ASC;
 
 -- EJ (12)
		--  Mostrar los títulos técnicos.

SELECT cod_titulo, desc_titulo, tipo_titulo
FROM titulos
where desc_titulo like 'Tecnico%';

-- EJ (13)
		--  Seleccionar las solicitudes cuya fecha sea mayor que ‘21/09/2013’ y el código de cargo
		-- sea 6; o hayan solicitado aspirantes de sexo femenino
        
SELECT *
FROM solicitudes_empresas
where fecha_solicitud > "20130921" and cod_cargo = "6" or sexo ="Femenino"
;


-- EJ (14)
		--  Seleccionar los contratos con un salario pactado mayor que 2000 y que no hayan sido
		-- terminado

SELECT *
FROM contratos
where sueldo > 2000 and fecha_caducidad is null ;