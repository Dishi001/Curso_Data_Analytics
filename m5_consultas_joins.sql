-- Consulta 1 — Vista base del proyecto (INNER JOIN)
SELECT Main.fecha_venta,
CLI.nombre AS Nombre_Cliente,
PROD.nombre_producto, 
PAIS.nombre_pais,
Main.cantidad, 
Main.precio_unitario,
Main.cantidad * Main.precio_unitario AS Total_Venta
FROM dbo.Ventas Main
INNER JOIN dbo.Productos PROD ON Main.id_producto = PROD.id_producto
INNER JOIN dbo.Clientes CLI ON Main.id_cliente = CLI.id_clientes
INNER JOIN dbo.Pais PAIS ON CLI.id_pais = PAIS.id_pais
GROUP BY Main.fecha_venta,CLI.nombre,PROD.nombre_producto, 
Main.cantidad, Main.precio_unitario,PAIS.nombre_pais

--Consulta 2 — Clientes sin ventas (LEFT JOIN) 
SELECT MAIN.nombre,
MAIN.apellido,
MAIN.email,
MAIN.fecha_registro
FROM dbo.Clientes Main
LEFT OUTER JOIN dbo.Ventas VEN ON Main.id_clientes = VEN.id_cliente
WHERE VEN.id_venta IS NULL

SELECT Main.nombre_producto,
CAT.nombre_categoria,
Main.precio
FROM dbo.Productos Main
LEFT OUTER JOIN dbo.Categorias CAT ON Main.id_categoria = CAT.id_categoria
LEFT OUTER JOIN dbo.Ventas VEN ON Main.id_producto = VEN.id_producto
WHERE VEN.id_venta IS NULL

--Consulta 4 — Consolidado por canal (UNION ALL)
SELECT Main.fecha_venta, 
Main.cantidad * Main.precio_unitario AS Total, 
'Ventas Marzo' AS Canal
FROM dbo.Ventas Main
WHERE Main.fecha_venta BETWEEN '2024-03-01' AND '2024-03-31'
UNION ALL
SELECT Main.fecha_venta, 
Main.cantidad * Main.precio_unitario AS total, 
'Ventas Abril' AS Canal
FROM dbo.Ventas Main
WHERE fecha_venta >= '2024-04-01'