describe empresas;

select TABLE_SCHEMA, TABLE_NAME
from TABLES
where TABLE_NAME like "%empresas%";

-- ejercicio 1
-- SELECT Y FROM
SELECT  nro_contrato, fecha_incorporacion,sueldo          -- esto es un select y admite repeticion 
FROM contratos;

-- DISTINCT
SELECT distinct nro_contrato, fecha_incorporacion,sueldo   -- este select es una proyeccion y no admite repeticion
FROM contratos
WHERE nro_contrato >5 ;	          -- where es la condicion 
-- WHERE ,like 
SELECT*
FROM empresas
WHERE telefono  like "%45%";            -- like es que tenga incluido en si misma


-- or ,and, in
SELECT nro_contrato, dni, fecha_solicitud
FROM contratos
-- WHERE nro_contrato= 1 or nro_contrato= 3 or nro_contrato= 5;      -- numero contrato 1 o 3 o 5 , traeresos
WHERE nro_contrato in (1,3,6,7) and fecha_solicitud between "20140920" and "20140921" ;       -- es lo mismo q arriba , no trae el 6  xq tiene dia  23 