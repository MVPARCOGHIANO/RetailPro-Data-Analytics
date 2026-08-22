USE Ventas_tech_DB

-- AGREGAR SEGMENTO A CLIENTE--
ALTER TABLE dbo.clientes
ADD segmento VARCHAR(50) NULL;
-- VALORES PARA LOS CLIENTES--
UPDATE dbo.clientes
SET segmento = 'Corporativo'
WHERE id_cliente IN (1, 4);

UPDATE dbo.clientes
SET segmento = 'Minorista'
WHERE id_cliente IN (2, 3, 5);
--CREAR TABLA TERRITORIO--
CREATE TABLE dbo.territorios
(
    id_territorio INT NOT NULL,
    region VARCHAR(50) NOT NULL,
    pais VARCHAR(50) NOT NULL,
    zona VARCHAR(50) NULL,

    CONSTRAINT PK_territorios
        PRIMARY KEY (id_territorio)
);
INSERT INTO dbo.territorios
    (id_territorio, region, pais, zona)
VALUES
    (1, 'Centro', 'Argentina', 'Buenos Aires'),
    (2, 'Centro', 'Argentina', 'Córdoba'),
    (3, 'Litoral', 'Argentina', 'Rosario'),
    (4, 'Cuyo', 'Argentina', 'Mendoza'),
    (5, 'Noroeste', 'Argentina', 'Tucumán');
ALTER TABLE dbo.ventas
ADD
    id_territorio INT NULL,
    canal VARCHAR(20) NULL;

ALTER TABLE dbo.ventas
ADD CONSTRAINT FK_ventas_territorios
FOREIGN KEY (id_territorio)
REFERENCES dbo.territorios(id_territorio);

UPDATE dbo.ventas
SET id_territorio = 1, canal = 'Online'
WHERE id_venta IN (1, 4);

UPDATE dbo.ventas
SET id_territorio = 2, canal = 'Presencial'
WHERE id_venta IN (2, 6);

UPDATE dbo.ventas
SET id_territorio = 3, canal = 'Online'
WHERE id_venta IN (3, 8);

UPDATE dbo.ventas
SET id_territorio = 4, canal = 'Presencial'
WHERE id_venta IN (5, 9);

UPDATE dbo.ventas
SET id_territorio = 5, canal = 'Online'
WHERE id_venta IN (7, 10);
