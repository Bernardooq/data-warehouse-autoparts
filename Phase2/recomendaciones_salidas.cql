//LOTE 1
CALL {
    MATCH (:SalidaEncabezado)-[:CONTIENE_SALIDAS]->(:SalidaDetalle)<-[:APARECE_EN_LA_SALIDA]-(a:Articulo)
    RETURN DISTINCT a.clave AS clave
    ORDER BY clave
    SKIP 500 * 0
    LIMIT 500
} 
WITH collect(clave) AS clavesSeleccionadas
CALL apoc.export.csv.query(
    '
        MATCH (ee:SalidaEncabezado)-[:CONTIENE_SALIDAS]->(d1:SalidaDetalle)<-[:APARECE_EN_LA_SALIDA]-(a1:Articulo), 
              (ee)-[:CONTIENE_SALIDAS]->(d2:SalidaDetalle)<-[:APARECE_EN_LA_SALIDA]-(a2:Articulo) 
        WHERE a1 <> a2 AND a1.clave IN $claves
        RETURN a1.clave AS Articulo, a2.clave AS Recomendacion, COUNT(DISTINCT ee) AS Coincidencias
    ',
    "file:///RecomendacionesSalida1.csv",
    {params: {claves: clavesSeleccionadas}}
)
YIELD nodes, relationships, properties, file, source, format, time, rows, batchSize, batches, done, data
RETURN file, rows, time

//LOTE 2
CALL {
    MATCH (:SalidaEncabezado)-[:CONTIENE_SALIDAS]->(:SalidaDetalle)<-[:APARECE_EN_LA_SALIDA]-(a:Articulo)
    RETURN DISTINCT a.clave AS clave
    ORDER BY clave
    SKIP 500 * 1
    LIMIT 500
} 
WITH collect(clave) AS clavesSeleccionadas
CALL apoc.export.csv.query(
    '
        MATCH (ee:SalidaEncabezado)-[:CONTIENE_SALIDAS]->(d1:SalidaDetalle)<-[:APARECE_EN_LA_SALIDA]-(a1:Articulo), 
              (ee)-[:CONTIENE_SALIDAS]->(d2:SalidaDetalle)<-[:APARECE_EN_LA_SALIDA]-(a2:Articulo) 
        WHERE a1 <> a2 AND a1.clave IN $claves
        RETURN a1.clave AS Articulo, a2.clave AS Recomendacion, COUNT(DISTINCT ee) AS Coincidencias
    ',
    "file:///RecomendacionesSalida2.csv",
    {params: {claves: clavesSeleccionadas}}
)
YIELD nodes, relationships, properties, file, source, format, time, rows, batchSize, batches, done, data
RETURN file, rows, time

//LOTE 3
CALL {
    MATCH (:SalidaEncabezado)-[:CONTIENE_SALIDAS]->(:SalidaDetalle)<-[:APARECE_EN_LA_SALIDA]-(a:Articulo)
    RETURN DISTINCT a.clave AS clave
    ORDER BY clave
    SKIP 500 * 2
    LIMIT 500
} 
WITH collect(clave) AS clavesSeleccionadas
CALL apoc.export.csv.query(
    '
        MATCH (ee:SalidaEncabezado)-[:CONTIENE_SALIDAS]->(d1:SalidaDetalle)<-[:APARECE_EN_LA_SALIDA]-(a1:Articulo), 
              (ee)-[:CONTIENE_SALIDAS]->(d2:SalidaDetalle)<-[:APARECE_EN_LA_SALIDA]-(a2:Articulo) 
        WHERE a1 <> a2 AND a1.clave IN $claves
        RETURN a1.clave AS Articulo, a2.clave AS Recomendacion, COUNT(DISTINCT ee) AS Coincidencias
    ',
    "file:///RecomendacionesSalida3.csv",
    {params: {claves: clavesSeleccionadas}}
)
YIELD nodes, relationships, properties, file, source, format, time, rows, batchSize, batches, done, data
RETURN file, rows, time

//LOTE 4
CALL {
    MATCH (:SalidaEncabezado)-[:CONTIENE_SALIDAS]->(:SalidaDetalle)<-[:APARECE_EN_LA_SALIDA]-(a:Articulo)
    RETURN DISTINCT a.clave AS clave
    ORDER BY clave
    SKIP 500 * 3
    LIMIT 500
} 
WITH collect(clave) AS clavesSeleccionadas
CALL apoc.export.csv.query(
    '
        MATCH (ee:SalidaEncabezado)-[:CONTIENE_SALIDAS]->(d1:SalidaDetalle)<-[:APARECE_EN_LA_SALIDA]-(a1:Articulo), 
              (ee)-[:CONTIENE_SALIDAS]->(d2:SalidaDetalle)<-[:APARECE_EN_LA_SALIDA]-(a2:Articulo) 
        WHERE a1 <> a2 AND a1.clave IN $claves
        RETURN a1.clave AS Articulo, a2.clave AS Recomendacion, COUNT(DISTINCT ee) AS Coincidencias
    ',
    "file:///RecomendacionesSalida4.csv",
    {params: {claves: clavesSeleccionadas}}
)
YIELD nodes, relationships, properties, file, source, format, time, rows, batchSize, batches, done, data
RETURN file, rows, time

//LOTE 5
CALL {
    MATCH (:SalidaEncabezado)-[:CONTIENE_SALIDAS]->(:SalidaDetalle)<-[:APARECE_EN_LA_SALIDA]-(a:Articulo)
    RETURN DISTINCT a.clave AS clave
    ORDER BY clave
    SKIP 500 * 4
    LIMIT 500
} 
WITH collect(clave) AS clavesSeleccionadas
CALL apoc.export.csv.query(
    '
        MATCH (ee:SalidaEncabezado)-[:CONTIENE_SALIDAS]->(d1:SalidaDetalle)<-[:APARECE_EN_LA_SALIDA]-(a1:Articulo), 
              (ee)-[:CONTIENE_SALIDAS]->(d2:SalidaDetalle)<-[:APARECE_EN_LA_SALIDA]-(a2:Articulo) 
        WHERE a1 <> a2 AND a1.clave IN $claves
        RETURN a1.clave AS Articulo, a2.clave AS Recomendacion, COUNT(DISTINCT ee) AS Coincidencias
    ',
    "file:///RecomendacionesSalida5.csv",
    {params: {claves: clavesSeleccionadas}}
)
YIELD nodes, relationships, properties, file, source, format, time, rows, batchSize, batches, done, data
RETURN file, rows, time

//LOTE 6
CALL {
    MATCH (:SalidaEncabezado)-[:CONTIENE_SALIDAS]->(:SalidaDetalle)<-[:APARECE_EN_LA_SALIDA]-(a:Articulo)
    RETURN DISTINCT a.clave AS clave
    ORDER BY clave
    SKIP 500 * 5
    LIMIT 500
} 
WITH collect(clave) AS clavesSeleccionadas
CALL apoc.export.csv.query(
    '
        MATCH (ee:SalidaEncabezado)-[:CONTIENE_SALIDAS]->(d1:SalidaDetalle)<-[:APARECE_EN_LA_SALIDA]-(a1:Articulo), 
              (ee)-[:CONTIENE_SALIDAS]->(d2:SalidaDetalle)<-[:APARECE_EN_LA_SALIDA]-(a2:Articulo) 
        WHERE a1 <> a2 AND a1.clave IN $claves
        RETURN a1.clave AS Articulo, a2.clave AS Recomendacion, COUNT(DISTINCT ee) AS Coincidencias
    ',
    "file:///RecomendacionesSalida6.csv",
    {params: {claves: clavesSeleccionadas}}
)
YIELD nodes, relationships, properties, file, source, format, time, rows, batchSize, batches, done, data
RETURN file, rows, time

//LOTE 7
CALL {
    MATCH (:SalidaEncabezado)-[:CONTIENE_SALIDAS]->(:SalidaDetalle)<-[:APARECE_EN_LA_SALIDA]-(a:Articulo)
    RETURN DISTINCT a.clave AS clave
    ORDER BY clave
    SKIP 500 * 6
    LIMIT 500
} 
WITH collect(clave) AS clavesSeleccionadas
CALL apoc.export.csv.query(
    '
        MATCH (ee:SalidaEncabezado)-[:CONTIENE_SALIDAS]->(d1:SalidaDetalle)<-[:APARECE_EN_LA_SALIDA]-(a1:Articulo), 
              (ee)-[:CONTIENE_SALIDAS]->(d2:SalidaDetalle)<-[:APARECE_EN_LA_SALIDA]-(a2:Articulo) 
        WHERE a1 <> a2 AND a1.clave IN $claves
        RETURN a1.clave AS Articulo, a2.clave AS Recomendacion, COUNT(DISTINCT ee) AS Coincidencias
    ',
    "file:///RecomendacionesSalida7.csv",
    {params: {claves: clavesSeleccionadas}}
)
YIELD nodes, relationships, properties, file, source, format, time, rows, batchSize, batches, done, data
RETURN file, rows, time

//LOTE 8
CALL {
    MATCH (:SalidaEncabezado)-[:CONTIENE_SALIDAS]->(:SalidaDetalle)<-[:APARECE_EN_LA_SALIDA]-(a:Articulo)
    RETURN DISTINCT a.clave AS clave
    ORDER BY clave
    SKIP 500 * 7
    LIMIT 500
} 
WITH collect(clave) AS clavesSeleccionadas
CALL apoc.export.csv.query(
    '
        MATCH (ee:SalidaEncabezado)-[:CONTIENE_SALIDAS]->(d1:SalidaDetalle)<-[:APARECE_EN_LA_SALIDA]-(a1:Articulo), 
              (ee)-[:CONTIENE_SALIDAS]->(d2:SalidaDetalle)<-[:APARECE_EN_LA_SALIDA]-(a2:Articulo) 
        WHERE a1 <> a2 AND a1.clave IN $claves
        RETURN a1.clave AS Articulo, a2.clave AS Recomendacion, COUNT(DISTINCT ee) AS Coincidencias
    ',
    "file:///RecomendacionesSalida8.csv",
    {params: {claves: clavesSeleccionadas}}
)
YIELD nodes, relationships, properties, file, source, format, time, rows, batchSize, batches, done, data
RETURN file, rows, time