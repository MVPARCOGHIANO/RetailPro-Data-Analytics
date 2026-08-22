-- CONSIGNA 1 Vista base del proyecto (INNER JOIN)--
SELECT
    v.fecha_venta AS fecha,
    c.nombre AS cliente,
    c.segmento,
    t.region,
    p.nombre_producto AS producto,
    cat.nombre_categoria AS categoria,
    v.cantidad,
    v.precio_unitario,
    (v.cantidad * v.precio_unitario) AS total_venta,
    v.canal
FROM dbo.ventas AS v
INNER JOIN dbo.clientes AS c
    ON v.id_cliente = c.id_cliente
INNER JOIN dbo.productos AS p
    ON v.id_producto = p.id_producto
INNER JOIN dbo.categorias AS cat
    ON p.id_categoria = cat.id_categoria
INNER JOIN dbo.territorios AS t
    ON v.id_territorio = t.id_territorio;

-- Consulta 2 — Clientes sin ventas (LEFT JOIN)--
SELECT
    c.nombre,
    c.email,
    c.fecha_registro
FROM dbo.clientes AS c
LEFT JOIN dbo.ventas AS v
    ON c.id_cliente = v.id_cliente
WHERE v.id_venta IS NULL;

-- CONSULTA 3 - PRODUCTOS SIN VENTAS--

SELECT
    p.nombre_producto,
    c.nombre_categoria AS categoria,
    p.precio
FROM dbo.productos AS p
LEFT JOIN dbo.ventas AS v
    ON p.id_producto = v.id_producto
INNER JOIN dbo.categorias AS c
    ON p.id_categoria = c.id_categoria
WHERE v.id_venta IS NULL;

-- CONSULTA 4 - unir ventas Online y Presencial y calcula el total por canal--

SELECT
    canal,
    SUM(total_venta) AS total_facturado
FROM
(
    SELECT
        'Online' AS canal,
        cantidad * precio_unitario AS total_venta
    FROM dbo.ventas
    WHERE canal = 'Online'

    UNION ALL

    SELECT
        'Presencial' AS canal,
        cantidad * precio_unitario AS total_venta
    FROM dbo.ventas
    WHERE canal = 'Presencial'
) AS ventas_por_canal
GROUP BY canal
ORDER BY total_facturado DESC;