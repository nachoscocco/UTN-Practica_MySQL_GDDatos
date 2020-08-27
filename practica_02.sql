-- EJ (01)
SELECT personas.nombre, personas.apellido, contratos.sueldo, personas.dni
FROM personas 
INNER JOIN contratos ON contratos.nro_contrato = 5  
WHERE personas.nombre like 'Raul' ;

-- EJ (02)
         -- revisar
				SELECT  c.dni, c.nro_contrato , c.fecha_incorporacion, c.fecha_solicitud,   ifnull( c.fecha_caducidad , "Sin Fecha" )
				FROM empresas as e
				inner join contratos  as c
					on  c.cuit = e.cuit
				where empresas.razon_social = 'Viejos Amigos' or  empresas.razon_social = 'Tráigame Eso' ;

select c.dni,c.nro_contrato,c.fecha_incorporacion,c.fecha_solicitud,ifnull(c.fecha_caducidad,'Sin fecha') as Fecha from empresas as e 
inner join contratos as c
on c.cuit=e.cuit
where e.razon_social='Viejos Amigos' or e.razon_social='Traigame Eso'
order by e.razon_social,c.fecha_solicitud;


-- EJ (03)
SELECT e.razon_social ,
	   e.direccion ,
       e.e_mail ,
       c.desc_cargo,
       ifnull(anios_experiencia,"Sin años")
FROM empresas as e
inner join solicitudes_empresas as se 
	on  e.cuit=se.cuit 
inner join cargos as c 
	on se.cod_cargo=c.cod_cargo  ;
    
-- EJ (04)

SELECT p.dni as Dni, p.nombre as Nombre, p.apellido as Apellido, t.desc_titulo
FROM personas as p 
INNER JOIN personas_titulos as pt 
	on pt.dni = p.dni
INNER JOIN titulos as t 
	on t.cod_titulo = pt.cod_titulo
where t.desc_titulo like '%bachiller' or t.tipo_titulo like 'Educacion no formal'
order by p.dni ASC, t.desc_titulo DESC;


-- EJ (05)
SELECT  p.nombre as Nombre, p.apellido as Apellido, t.desc_titulo
FROM personas as p 
INNER JOIN personas_titulos as pt 
	on pt.dni = p.dni
INNER JOIN titulos as t 
	on t.cod_titulo = pt.cod_titulo

order by p.dni ASC, t.desc_titulo DESC;

-- EJ (06)

select DISTINCT CONCAT(apellido,',',nombre,' tiene como referencia a ',IFNULL(persona_contacto,'nadie'),' cuando trabajó en ',razon_social) ' ' 
from (select p.nombre,p.apellido,an.persona_contacto,e.razon_social from personas as p
inner join antecedentes as an
	on an.dni=p.dni
inner join empresas as e
	on an.cuit=e.cuit 
where an.persona_contacto = "Armando Esteban Quito"or an.persona_contacto="Felipe Rojas"or isnull(an.persona_contacto)) as peew;

-- EJ(07)
	
    
    SELECT razon_social Empresas , fecha_solicitud FechaSolicitud, c.desc_cargo Cargo,IFNULL(se.edad_minima  , "Sin Especificar") as EdadMinima, IFNULL(se.edad_maxima,"Sin Especificar" ) as EdadMaX
    FROM solicitudes_empresas as se  
    inner join empresas as e
		on  se.cuit=e.cuit 
	inner join cargos as c
		on se.cod_cargo = c.cod_cargo 
	where e.razon_social  = "Viejos Amigos";
    
    
-- EJ(08)
select concat(p.apellido ," ", p.nombre) as NombreYApellido, c.desc_cargo as DescripcionCargo
from antecedentes as an
inner join personas as p
	on an.dni = p.dni
inner join cargos as c
  on an.cod_cargo = c.cod_cargo	 ;
 
 
 -- EJ(09)
 --  Mostrar todas las evaluaciones realizadas para cada solicitud ordenar en forma
--    ascendente por empresa y descendente por cargo:

SELECT  razon_social as Empresa, c.desc_cargo as Cargo , ev.desc_evaluacion as Desc_Evaluacion ,en_ev.resultado as Resultado
FROM empresas AS e
inner join solicitudes_empresas as se
	on e.cuit = se.cuit
inner join cargos as c
	on se.cod_cargo = c.cod_cargo
inner join entrevistas as en
	on se.fecha_solicitud = en.fecha_solicitud
inner join entrevistas_evaluaciones as en_ev
	on  en.nro_entrevista = en_ev.nro_entrevista
 inner join evaluaciones as ev
	on en_ev.cod_evaluacion = ev.cod_evaluacion 

ORDER BY  e.razon_social ASC , c.desc_cargo DESC   ;

 -- EJERCICIO
 -- EJ(10)
 select  e.cuit as Cuit, e.razon_social as RazonSocial, ifnull(se.fecha_solicitud, "Sin Solicitud") as FechaSolicitud, ifnull(c.desc_cargo, "Sin Solicitud") as Cargo
 from empresas as e
 left join	solicitudes_empresas as se
	on e.cuit = se.cuit	
 left join cargos as c
	on se.cod_cargo = c.cod_cargo ; 
    
    
 -- EJ(11)
 SELECT  e.cuit as Cuit,e.razon_social as RazonSocial, c.desc_cargo as Cargo , ifnull(p.dni, "sin registro") as Dni , p.apellido as Apellido, p.nombre as Nombre
 from empresas as e
  inner join solicitudes_empresas as se
  on  e.cuit = se.cuit
  inner join cargos as c 
  on se.cod_cargo = c.cod_cargo
  left  join contratos as co
  on  se.fecha_solicitud = co.fecha_solicitud
  left join personas as p
  on co.dni = p.dni ;
 
 -- EJ(12)
 
SELECT  e.cuit Cuit, e.razon_social RazonSocial, c.desc_cargo
FROM solicitudes_empresas as se
inner join empresas as e
  on se.cuit = e.cuit  
inner join cargos as c
  on se.cod_cargo = c.cod_cargo
left join contratos as co
	on se.cuit = co.cuit and se.fecha_solicitud = co.fecha_solicitud and se.cod_cargo = co.cod_cargo
     where co.nro_contrato is null
 ;
 
 -- EJ (13)
 --  Listar todos los cargos y para aquellos que hayan sido realizados (como antecedente)
 --  por alguna persona indicar nombre y apellido de la persona y empresa donde lo ocupó.
 
 select distinct c.desc_cargo , iFnull(p.dni, "Sin antecedentes") AS DNI, iFnull( p.apellido, "Sin antecedentes") AS Apellido ,iFnull(e.razon_social, "NULL") as Razon_Social
 from cargos as c
 left join antecedentes as an on c.cod_cargo = an.cod_cargo 
 left join personas as p on an.dni = p.dni
 left join empresas as e on e.cuit = an.cuit;
 
 -- EJ (14) AFATSE
 -- Indicar todos los instructores que tengan un supervisor. Mostrar:
 --
 SELECT i.cuil as CuilInstructor ,
		i.nombre as NombreInstruc, 
        i.apellido as ApellidoInstuct , 
        IFnull(   i2.cuil, " ") as SupervisorCuil ,  
        IFnull(   i2.nombre, " ")   as SupervisorName,
        IFnull(   i2.apellido, " ")  as SupervisorApellido
 FROM instructores as i 
 left join instructores as i2 on i2.cuil = i.cuil_supervisor
 
 order by i.cuil asc ;
 
 -- EJ (15) AFATSE
 -- MISMO Q 14 PERO CON ESPACIOS EN BLANCO\

 --
 SELECT i.cuil as CuilInstructor ,
		i.nombre as NombreInstruc, 
        i.apellido as ApellidoInstuct , 
        i2.cuil as SupervisorCuil , 
        i2.nombre as SupervisorName,
        i2.apellido as SupervisorApellido
 FROM instructores as i 
 inner join instructores as i2 on i2.cuil = i.cuil_supervisor
 where i.cuil_supervisor is not null
 order by i.cuil asc ;
 
 
 
 -- EJ (15) AFATSE
	-- Ranking de Notas por Supervisor e Instructor. El ranking deberá indicar para cada
	-- supervisor los instructores a su cargo y las notas de los exámenes que el instructor haya
	-- corregido en el 2014. Indicando los datos del supervisor , nombre y apellido del instructor,
	-- plan de capacitación, curso, nombre y apellido del alumno, examen, fecha de evaluación y
	-- nota. En caso de que no tenga supervisor a cargo indicar espacios en blanco. Ordenado
	-- ascendente por nombre y apellido de supervisor y descendente por fecha.
 --
 
 
 select distinct  -- SUPERVISOR ( C INSTRUCT PUEDE O NO TENER SUPERVISOR)
		ifnull(i2.cuil, "NULL") as CuilSupervisor,
		ifnull(i2.nombre, "NULL") as NombreSupervisor,
        ifnull(i2.apellido, "NULL") as ApellidoSupervisor,
        -- INSTRUCTORES
        i.nombre as NombreInstructor,
        i.apellido as ApellidoInstructor,
        -- CURSOS INSTRUCTORES
        ci.nom_plan,
        ci.nro_curso,
        -- ALUMNO
        a.apellido as ApellidoAlumn,
        a.nombre as NombreAlumn,
        -- EVALUACIONES 
        e.nro_examen, 
        e.fecha_evaluacion,
        e.nota

FROM instructores as i
left JOIN instructores         as i2   on i2.cuil = i.cuil_supervisor
inner join cursos_instructores as ci   on ci.cuil = i.cuil
inner join cursos              as c    on c.nro_curso = ci.nro_curso
inner join inscripciones       as ins    on ins.nro_curso = c.nro_curso
inner join alumnos             as a    on a.dni       = ins.dni
inner join evaluaciones        as e    on e.dni       = a.dni
where e.fecha_evaluacion between '2014-01-01' and '2014-12-31'
order by i2.nombre asc , i2.apellido asc , e.fecha_evaluacion desc
;


        
	
	
