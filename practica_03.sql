-- EJ (01)
		--  Para aquellos contratos que no hayan terminado calcular la fecha de caducidad como
		--  la fecha de solicitud más 30 días (no actualizar la base de datos). Función ADDDATE
SELECT nro_contrato, fecha_incorporacion, fecha_finalizacion_contrato,ADDDATE(fecha_solicitud, INTERVAL 30 DAY) as fecha_caducidad
FROM contratos
where fecha_caducidad is null ;

-- EJ (02)
		-- Mostrar los contratos. Indicar nombre y apellido de la persona, razón social de la
		-- empresa fecha de inicio del contrato y fecha de caducidad del contrato. Si la fecha no ha
	    -- terminado mostrar “Contrato Vigente”. Función IFNULl
        
SELECT c.nro_contrato , 
	   e.razon_social,
       p.apellido,
       p.nombre,
       c.fecha_incorporacion,
       IFNULL(c.fecha_finalizacion_contrato, "Contrato Vigente") as finContrato
from contratos     as c
inner join empresas as e  on e.cuit = c.cuit 
inner join personas as p  on p.dni = c.dni ;

