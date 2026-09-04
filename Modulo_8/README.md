# Módulo 8 - Modelo de Datos y Medidas DAX

## Proyecto RetailPro

En este módulo se continuó trabajando sobre el archivo desarrollado en el Módulo 6, incorporando el modelo analítico necesario para el posterior desarrollo de reportes y dashboards en Power BI.

## Objetivo

Construir un modelo de datos funcional mediante relaciones entre las tablas de dimensiones y la tabla de hechos, incorporar una tabla calendario y desarrollar las medidas DAX fundamentales para el análisis de ventas.

## Modelo de datos

El modelo está compuesto por las siguientes tablas:

- Fact_Ventas
- Dim_Clientes
- Dim_Productos
- Dim_Categorias
- Dim_Fechas
- _Medidas

Se configuraron las siguientes relaciones:

- Dim_Clientes[id_cliente] → Fact_Ventas[id_cliente]
- Dim_Productos[id_producto] → Fact_Ventas[id_producto]
- Dim_Categorias[id_categoria] → Dim_Productos[id_categoria]
- Dim_Fechas[Date] → Fact_Ventas[fecha_venta]

Las relaciones se encuentran activas, con cardinalidad 1:N y dirección de filtro única desde las dimensiones hacia la tabla correspondiente.

## Tabla calendario

Se creó la tabla Dim_Fechas utilizando DAX a partir del rango de fechas existente en Fact_Ventas.

La tabla contiene:

- Año
- Mes Número
- Mes Nombre
- Trimestre
- Semana

Dim_Fechas fue marcada como tabla de fechas utilizando la columna Date.

## Medidas DAX

Se creó una tabla exclusiva denominada _Medidas para centralizar las medidas utilizadas en el análisis.

Las cinco medidas desarrolladas fueron:

1. Total Ventas
2. Ventas Online
3. Ventas YTD
4. Ventas LY
5. % Crecimiento Anual

Estas medidas permiten aplicar agregaciones, filtros mediante CALCULATE, inteligencia de tiempo mediante TOTALYTD y SAMEPERIODLASTYEAR, y optimización de cálculos mediante VAR y DIVIDE.

## Validación

Se creó una página denominada Validación con una matriz que permite analizar los resultados por mes y año.

Se verificó:

- El acumulado de ventas mediante Ventas YTD.
- La comparación con el mismo período del año anterior mediante Ventas LY.
- El porcentaje de crecimiento anual.
- El correcto funcionamiento de la tabla calendario y sus relaciones con el modelo.

## Archivo entregable

`Parco_Victoria_Checkpoint2.pbix`

El archivo contiene el modelo de datos, la tabla calendario, las relaciones, las medidas DAX y la página de validación correspondientes al Checkpoint 2.

---

**Autora:** María Victoria Parco Ghiano  
**Proyecto:** RetailPro - Análisis de Datos
