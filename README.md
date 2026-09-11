# RetailPro - Análisis de Datos

## Descripción del proyecto

RetailPro es un proyecto de análisis de datos orientado al estudio de la información comercial de una empresa distribuidora de tecnología.

El proyecto integra distintas etapas del proceso analítico, desde la creación y consulta de la base de datos hasta la transformación, modelado y análisis de la información.

## Objetivo

Analizar las ventas de RetailPro para identificar diferencias en el rendimiento comercial según productos, categorías, clientes, regiones, períodos y canales de venta, generando información útil para la toma de decisiones.

## Herramientas utilizadas

- SQL Server: creación y administración de la base de datos.
- SQL: consultas de negocio, agregaciones, JOINs y análisis de ventas.
- Power Query: limpieza, transformación e integración de datos.
- Power BI: modelado de datos y visualización.
- DAX: creación de medidas e inteligencia de tiempo.
- GitHub: almacenamiento, documentación y control de versiones.

## Evolución del proyecto

El proyecto fue desarrollado progresivamente a través de diferentes módulos:

- Módulo 3: creación de la base de datos, tablas, restricciones y relaciones mediante SQL Server.
- Módulo 4: desarrollo de consultas SQL orientadas al análisis de negocio.
- Módulo 5: integración de tablas mediante INNER JOIN y LEFT JOIN y ampliación de la base.
- Módulo 6: desarrollo del proceso ETL mediante Power Query, incluyendo limpieza, transformación e integración de los datos.
- Módulo 8: construcción del modelo analítico en Power BI, tabla calendario, relaciones y medidas DAX.

## Modelo de datos

El modelo analítico está compuesto principalmente por:

- Fact_Ventas
- Dim_Clientes
- Dim_Productos
- Dim_Categorias
- Dim_Fechas
- _Medidas

Las relaciones permiten analizar las ventas desde las distintas dimensiones del modelo.

## Estructura del repositorio

Entre los principales archivos actualmente incluidos en el repositorio se encuentran:

- `ventas_tech_db.sql`: creación y configuración de la base de datos.
- `m4_consultas_negocio.sql`: consultas SQL orientadas al análisis comercial.
- `m5_consultas_joins.sql`: consultas mediante JOIN entre las tablas.
- `m5_ampliacion_base.sql`: ampliación de la estructura utilizada en el proyecto.
- `Tubería_ETL_Parco_Victoria.pbix`: proceso ETL desarrollado con Power Query.
- `Módulo_8/`: carpeta correspondiente al modelo de datos y medidas DAX desarrollado en Power BI.

## Ejecución de los scripts SQL

Para ejecutar los scripts se requiere Microsoft SQL Server y una herramienta compatible para la ejecución de consultas SQL.

Los archivos deben utilizarse respetando el orden de evolución del proyecto:

1. Ejecutar `ventas_tech_db.sql` para crear y configurar la base de datos y sus tablas.
2. Verificar que las tablas y los datos hayan sido creados correctamente.
3. Ejecutar `m4_consultas_negocio.sql` para realizar las consultas de análisis comercial.
4. Ejecutar `m5_consultas_joins.sql` para analizar información integrada mediante JOINs.
5. Ejecutar `m5_ampliacion_base.sql` según la ampliación desarrollada en el Módulo 5.
6. Validar los resultados obtenidos antes de utilizarlos para realizar conclusiones comerciales.

## Medidas DAX

En Power BI se desarrollaron las siguientes medidas:

- Total Ventas
- Ventas Online
- Ventas YTD
- Ventas LY
- % Crecimiento Anual

También se creó la tabla Dim_Fechas para permitir análisis de inteligencia temporal.

## Autora

**María Victoria Parco Ghiano**

Carrera de Analista de Datos  
Proyecto RetailPro
