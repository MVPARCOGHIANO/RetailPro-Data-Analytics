-- RETAILPRO -- 
-- MÓDULO 4 --
-- Autora: María Victoria Parco Ghiano--
-- Archivo: m4_consultas_negocio.sql --

USE Ventas_tech_DB;

-- CONSULTA 1 - RESUMEN EJECUTIVO MENSUAL
-- Total facturado, cantidad de pedidos y ticket promedio
-- agrupados por mes--

SELECT
    DATEPART(MONTH, fecha_venta) AS mes,
    SUM(cantidad * precio_unitario) AS total_facturado,
    COUNT(id_venta) AS cantidad_pedidos,
    AVG(cantidad * precio_unitario) AS ticket_promedio
FROM dbo.ventas
GROUP BY DATEPART(MONTH, fecha_venta)
ORDER BY mes;

-- CONSULTA 2 - RANKING DE PRODUCTOS
-- Top 5 productos por total facturado--

SELECT TOP (5)
    id_producto,
    SUM(cantidad) AS unidades_vendidas,
    SUM(cantidad * precio_unitario) AS total_facturado
FROM dbo.ventas
GROUP BY id_producto
ORDER BY total_facturado DESC;

-- CONSULTA 3 - CLIENTES RECURRENTES
-- Clientes que realizaron más de un pedido--

SELECT
    id_cliente,
    COUNT(id_venta) AS cantidad_pedidos,
    SUM(cantidad * precio_unitario) AS total_gastado
FROM dbo.ventas
GROUP BY id_cliente
HAVING COUNT(id_venta) > 1
ORDER BY total_gastado DESC;

-- CONSULTA 4 - MESES POR ENCIMA / POR DEBAJO DEL PROMEDIO
-- Compara la facturación mensual contra el promedio mensual--

SELECT
    mes,
    total_facturado,
    CASE
        WHEN total_facturado > (
            SELECT AVG(total_mensual)
            FROM (
                SELECT
                    DATEPART(MONTH, fecha_venta) AS mes,
                    SUM(cantidad * precio_unitario) AS total_mensual
                FROM dbo.ventas
                GROUP BY DATEPART(MONTH, fecha_venta)
            ) AS resumen_mensual
        )
        THEN 'Por encima'
        ELSE 'Por debajo'
    END AS comparacion_promedio
FROM (
    SELECT
        DATEPART(MONTH, fecha_venta) AS mes,
        SUM(cantidad * precio_unitario) AS total_facturado
    FROM dbo.ventas
    GROUP BY DATEPART(MONTH, fecha_venta)
) AS ventas_mensuales
ORDER BY mes;

-- HALLAZGOS--

-- 1. En marzo se registraron 10 pedidos, con una facturación total
--  de $6.444 y un ticket promedio de $644,40.

-- 2. El producto con ID 1 lidera el ranking de facturación,
--    generando $3.600 mediante la venta de 3 unidades.

-- 3. Todos los clientes analizados son recurrentes, con 2 pedidos
--    cada uno. El cliente con ID 1 registra el mayor gasto total,
--    alcanzando $2.640--