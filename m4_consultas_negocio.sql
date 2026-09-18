--Consulta 1 — Resumen ejecutivo mensual 
SELECT 
MONTH(fecha_venta) AS Mes,
SUM(cantidad * precio_unitario) AS Total_Facturado,
COUNT(*) AS Cantidad_Pedidos,
AVG(cantidad * precio_unitario) AS Ticket_Promedio
FROM Ventas
GROUP BY MONTH(fecha_venta)
ORDER BY Mes

--Consulta 2 — Ranking de productos
SELECT TOP 5
id_producto,
SUM(cantidad * precio_unitario) AS Total_Facturado,
SUM(cantidad) AS Unidades_Vendidas
FROM Ventas
GROUP BY id_producto
ORDER BY Total_Facturado DESC

--Consulta 3 — Clientes recurrentes
SELECT 
id_cliente,
SUM(cantidad * precio_unitario) AS Total_Facturado,
SUM(cantidad) AS Unidades_Vendidas
FROM Ventas
GROUP BY id_cliente
HAVING COUNT(*) > 1

--Consulta 4 — Meses por encima/por debajo del promedio
SELECT 
MONTH(fecha_venta) AS mes,
SUM(cantidad * precio_unitario) AS Total_Facturado,
CASE WHEN SUM(cantidad * precio_unitario) > (SELECT AVG(cantidad * precio_unitario) FROM Ventas)  
THEN 'Por encima'
ELSE 'Por debajo'
END AS Observacion
FROM Ventas
GROUP BY MONTH(fecha_venta)
ORDER BY mes;

--En la consulta 2 podemos ver como el producto 1 es el 59% de la facturacion total
--En la consulta 3 podemos ver como los clientes 1 y 5 son los que mas gastaron, representando el 74% de la facturacion total juntos 
--En la consulta 2 podemos ver como el producto 2 es el mas vendido 