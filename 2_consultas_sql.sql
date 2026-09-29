-- ----------------------------------
-- Uso de base de datos
-- ----------------------------------

USE blockbusterReborn;

-- ----------------------------------
-- CONSULTAS DE NEGOCIO (DQL)
-- ----------------------------------

-- Reporte 1: El ticket de compra completo.
SELECT r.fechaRenta AS Fecha , c.nombreCompleto AS Cliente, p.titulo as Pelicula, g.nombreGenero AS Género
FROM detalleRenta dr
INNER JOIN renta r ON dr.idRenta = r.idRenta
INNER JOIN cliente c ON r.idCliente = c.idCliente
INNER JOIN pelicula p ON dr.idPelicula = p.idPelicula
INNER JOIN genero g ON p.idGenero = g.idGenero;

-- Reporte 2: Seguimiento de Clientes.
SELECT c.nombreCompleto AS Cliente, r.idRenta AS Renta#
FROM cliente c
LEFT JOIN renta r ON c.idCliente = r.idCliente;

-- Reporte 3: Auditoría del Catálogo.
SELECT p.titulo AS Película , dr.idDetalle AS 'Detalle id Renta'
FROM detalleRenta dr
RIGHT JOIN pelicula p ON dr.idPelicula = p.idPelicula;

-- Reporte 4: Rendimiento total.
SELECT e.nombreEmpleado AS Empleado , r.idRenta AS 'ID Renta' 
FROM empleado e
LEFT JOIN renta r ON e.idEmpleado = r.idEmpleado

UNION

SELECT e.nombreEmpleado as Empleado, r.idRenta 'ID Renta'
FROM empleado e
RIGHT JOIN renta r ON e.idEmpleado = r.idEmpleado;