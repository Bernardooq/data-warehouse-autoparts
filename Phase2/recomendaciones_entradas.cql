//LOTE 1
CALL {
    MATCH (:EntradaEncabezado)-[:CONTIENE_ENTRADAS]->(:EntradaDetalle)<-[:APARECE_EN_LA_ENTRADA]-(a:Articulo)
    RETURN DISTINCT a.clave AS clave
    ORDER BY clave
    SKIP 500 * 0
    LIMIT 500
} 
WITH collect(clave) AS clavesSeleccionadas
CALL apoc.export.csv.query(
    '
        MATCH (ee:EntradaEncabezado)-[:CONTIENE_ENTRADAS]->(d1:EntradaDetalle)<-[:APARECE_EN_LA_ENTRADA]-(a1:Articulo), 
              (ee)-[:CONTIENE_ENTRADAS]->(d2:EntradaDetalle)<-[:APARECE_EN_LA_ENTRADA]-(a2:Articulo) 
        WHERE a1 <> a2 AND a1.clave IN $claves
        RETURN a1.clave AS Articulo, a2.clave AS Recomendacion, COUNT(DISTINCT ee) AS Coincidencias
    ',
    "file:///RecomendacionesEntrada1.csv",
    {params: {claves: clavesSeleccionadas}}
)
YIELD nodes, relationships, properties, file, source, format, time, rows, batchSize, batches, done, data
RETURN file, rows, time

//LOTE 2
CALL {
    MATCH (:EntradaEncabezado)-[:CONTIENE_ENTRADAS]->(:EntradaDetalle)<-[:APARECE_EN_LA_ENTRADA]-(a:Articulo)
    RETURN DISTINCT a.clave AS clave
    ORDER BY clave
    SKIP 500 * 1
    LIMIT 500
} 
WITH collect(clave) AS clavesSeleccionadas
CALL apoc.export.csv.query(
    '
        MATCH (ee:EntradaEncabezado)-[:CONTIENE_ENTRADAS]->(d1:EntradaDetalle)<-[:APARECE_EN_LA_ENTRADA]-(a1:Articulo), 
              (ee)-[:CONTIENE_ENTRADAS]->(d2:EntradaDetalle)<-[:APARECE_EN_LA_ENTRADA]-(a2:Articulo) 
        WHERE a1 <> a2 AND a1.clave IN $claves
        RETURN a1.clave AS Articulo, a2.clave AS Recomendacion, COUNT(DISTINCT ee) AS Coincidencias
    ',
    "file:///RecomendacionesEntrada2.csv",
    {params: {claves: clavesSeleccionadas}}
)
YIELD nodes, relationships, properties, file, source, format, time, rows, batchSize, batches, done, data
RETURN file, rows, time

//LOTE 3
CALL {
    MATCH (:EntradaEncabezado)-[:CONTIENE_ENTRADAS]->(:EntradaDetalle)<-[:APARECE_EN_LA_ENTRADA]-(a:Articulo)
    RETURN DISTINCT a.clave AS clave
    ORDER BY clave
    SKIP 500 * 2
    LIMIT 500
} 
WITH collect(clave) AS clavesSeleccionadas
CALL apoc.export.csv.query(
    '
        MATCH (ee:EntradaEncabezado)-[:CONTIENE_ENTRADAS]->(d1:EntradaDetalle)<-[:APARECE_EN_LA_ENTRADA]-(a1:Articulo), 
              (ee)-[:CONTIENE_ENTRADAS]->(d2:EntradaDetalle)<-[:APARECE_EN_LA_ENTRADA]-(a2:Articulo) 
        WHERE a1 <> a2 AND a1.clave IN $claves
        RETURN a1.clave AS Articulo, a2.clave AS Recomendacion, COUNT(DISTINCT ee) AS Coincidencias
    ',
    "file:///RecomendacionesEntrada3.csv",
    {params: {claves: clavesSeleccionadas}}
)
YIELD nodes, relationships, properties, file, source, format, time, rows, batchSize, batches, done, data
RETURN file, rows, time

//LOTE 4_1
CALL {
    MATCH (:EntradaEncabezado)-[:CONTIENE_ENTRADAS]->(:EntradaDetalle)<-[:APARECE_EN_LA_ENTRADA]-(a:Articulo)
    RETURN DISTINCT a.clave AS clave
    ORDER BY clave
    SKIP 500 * 3
    LIMIT 250
} 
WITH collect(clave) AS clavesSeleccionadas
CALL apoc.export.csv.query(
    '
        MATCH (ee:EntradaEncabezado)-[:CONTIENE_ENTRADAS]->(d1:EntradaDetalle)<-[:APARECE_EN_LA_ENTRADA]-(a1:Articulo), 
              (ee)-[:CONTIENE_ENTRADAS]->(d2:EntradaDetalle)<-[:APARECE_EN_LA_ENTRADA]-(a2:Articulo) 
        WHERE a1 <> a2 AND a1.clave IN $claves
        RETURN a1.clave AS Articulo, a2.clave AS Recomendacion, COUNT(DISTINCT ee) AS Coincidencias
    ',
    "file:///RecomendacionesEntrada4_1.csv",
    {params: {claves: clavesSeleccionadas}}
)
YIELD nodes, relationships, properties, file, source, format, time, rows, batchSize, batches, done, data
RETURN file, rows, time

//LOTE 4_2
CALL {
    MATCH (:EntradaEncabezado)-[:CONTIENE_ENTRADAS]->(:EntradaDetalle)<-[:APARECE_EN_LA_ENTRADA]-(a:Articulo)
    RETURN DISTINCT a.clave AS clave
    ORDER BY clave
    SKIP (500 * 3) + 250
    LIMIT 250
} 
WITH collect(clave) AS clavesSeleccionadas
CALL apoc.export.csv.query(
    '
        MATCH (ee:EntradaEncabezado)-[:CONTIENE_ENTRADAS]->(d1:EntradaDetalle)<-[:APARECE_EN_LA_ENTRADA]-(a1:Articulo), 
              (ee)-[:CONTIENE_ENTRADAS]->(d2:EntradaDetalle)<-[:APARECE_EN_LA_ENTRADA]-(a2:Articulo) 
        WHERE a1 <> a2 AND a1.clave IN $claves
        RETURN a1.clave AS Articulo, a2.clave AS Recomendacion, COUNT(DISTINCT ee) AS Coincidencias
    ',
    "file:///RecomendacionesEntrada4_2.csv",
    {params: {claves: clavesSeleccionadas}}
)
YIELD nodes, relationships, properties, file, source, format, time, rows, batchSize, batches, done, data
RETURN file, rows, time

//LOTE 5
CALL {
    MATCH (:EntradaEncabezado)-[:CONTIENE_ENTRADAS]->(:EntradaDetalle)<-[:APARECE_EN_LA_ENTRADA]-(a:Articulo)
    RETURN DISTINCT a.clave AS clave
    ORDER BY clave
    SKIP 500 * 4
    LIMIT 500
} 
WITH collect(clave) AS clavesSeleccionadas
CALL apoc.export.csv.query(
    '
        MATCH (ee:EntradaEncabezado)-[:CONTIENE_ENTRADAS]->(d1:EntradaDetalle)<-[:APARECE_EN_LA_ENTRADA]-(a1:Articulo), 
              (ee)-[:CONTIENE_ENTRADAS]->(d2:EntradaDetalle)<-[:APARECE_EN_LA_ENTRADA]-(a2:Articulo) 
        WHERE a1 <> a2 AND a1.clave IN $claves
        RETURN a1.clave AS Articulo, a2.clave AS Recomendacion, COUNT(DISTINCT ee) AS Coincidencias
    ',
    "file:///RecomendacionesEntrada5.csv",
    {params: {claves: clavesSeleccionadas}}
)
YIELD nodes, relationships, properties, file, source, format, time, rows, batchSize, batches, done, data
RETURN file, rows, time

//LOTE 6_1
CALL {
    MATCH (:EntradaEncabezado)-[:CONTIENE_ENTRADAS]->(:EntradaDetalle)<-[:APARECE_EN_LA_ENTRADA]-(a:Articulo)
    RETURN DISTINCT a.clave AS clave
    ORDER BY clave
    SKIP 500 * 5
    LIMIT 250
} 
WITH collect(clave) AS clavesSeleccionadas
CALL apoc.export.csv.query(
    '
        MATCH (ee:EntradaEncabezado)-[:CONTIENE_ENTRADAS]->(d1:EntradaDetalle)<-[:APARECE_EN_LA_ENTRADA]-(a1:Articulo), 
              (ee)-[:CONTIENE_ENTRADAS]->(d2:EntradaDetalle)<-[:APARECE_EN_LA_ENTRADA]-(a2:Articulo) 
        WHERE a1 <> a2 AND a1.clave IN $claves
        RETURN a1.clave AS Articulo, a2.clave AS Recomendacion, COUNT(DISTINCT ee) AS Coincidencias
    ',
    "file:///RecomendacionesEntrada6_1.csv",
    {params: {claves: clavesSeleccionadas}}
)
YIELD nodes, relationships, properties, file, source, format, time, rows, batchSize, batches, done, data
RETURN file, rows, time

//LOTE 6_2
CALL {
    MATCH (:EntradaEncabezado)-[:CONTIENE_ENTRADAS]->(:EntradaDetalle)<-[:APARECE_EN_LA_ENTRADA]-(a:Articulo)
    RETURN DISTINCT a.clave AS clave
    ORDER BY clave
    SKIP (500 * 5) + 250
    LIMIT 250
} 
WITH collect(clave) AS clavesSeleccionadas
CALL apoc.export.csv.query(
    '
        MATCH (ee:EntradaEncabezado)-[:CONTIENE_ENTRADAS]->(d1:EntradaDetalle)<-[:APARECE_EN_LA_ENTRADA]-(a1:Articulo), 
              (ee)-[:CONTIENE_ENTRADAS]->(d2:EntradaDetalle)<-[:APARECE_EN_LA_ENTRADA]-(a2:Articulo) 
        WHERE a1 <> a2 AND a1.clave IN $claves
        RETURN a1.clave AS Articulo, a2.clave AS Recomendacion, COUNT(DISTINCT ee) AS Coincidencias
    ',
    "file:///RecomendacionesEntrada6_2.csv",
    {params: {claves: clavesSeleccionadas}}
)
YIELD nodes, relationships, properties, file, source, format, time, rows, batchSize, batches, done, data
RETURN file, rows, time

//LOTE 7_1
CALL {
    MATCH (:EntradaEncabezado)-[:CONTIENE_ENTRADAS]->(:EntradaDetalle)<-[:APARECE_EN_LA_ENTRADA]-(a:Articulo)
    RETURN DISTINCT a.clave AS clave
    ORDER BY clave
    SKIP 500 * 6
    LIMIT 250
} 
WITH collect(clave) AS clavesSeleccionadas
CALL apoc.export.csv.query(
    '
        MATCH (ee:EntradaEncabezado)-[:CONTIENE_ENTRADAS]->(d1:EntradaDetalle)<-[:APARECE_EN_LA_ENTRADA]-(a1:Articulo), 
              (ee)-[:CONTIENE_ENTRADAS]->(d2:EntradaDetalle)<-[:APARECE_EN_LA_ENTRADA]-(a2:Articulo) 
        WHERE a1 <> a2 AND a1.clave IN $claves
        RETURN a1.clave AS Articulo, a2.clave AS Recomendacion, COUNT(DISTINCT ee) AS Coincidencias
    ',
    "file:///RecomendacionesEntrada7_1.csv",
    {params: {claves: clavesSeleccionadas}}
)
YIELD nodes, relationships, properties, file, source, format, time, rows, batchSize, batches, done, data
RETURN file, rows, time

//LOTE 7_2
CALL {
    MATCH (:EntradaEncabezado)-[:CONTIENE_ENTRADAS]->(:EntradaDetalle)<-[:APARECE_EN_LA_ENTRADA]-(a:Articulo)
    RETURN DISTINCT a.clave AS clave
    ORDER BY clave
    SKIP (500 * 6) + 250
    LIMIT 250
} 
WITH collect(clave) AS clavesSeleccionadas
CALL apoc.export.csv.query(
    '
        MATCH (ee:EntradaEncabezado)-[:CONTIENE_ENTRADAS]->(d1:EntradaDetalle)<-[:APARECE_EN_LA_ENTRADA]-(a1:Articulo), 
              (ee)-[:CONTIENE_ENTRADAS]->(d2:EntradaDetalle)<-[:APARECE_EN_LA_ENTRADA]-(a2:Articulo) 
        WHERE a1 <> a2 AND a1.clave IN $claves
        RETURN a1.clave AS Articulo, a2.clave AS Recomendacion, COUNT(DISTINCT ee) AS Coincidencias
    ',
    "file:///RecomendacionesEntrada7_2.csv",
    {params: {claves: clavesSeleccionadas}}
)
YIELD nodes, relationships, properties, file, source, format, time, rows, batchSize, batches, done, data
RETURN file, rows, time

//LOTE 8
CALL {
    MATCH (:EntradaEncabezado)-[:CONTIENE_ENTRADAS]->(:EntradaDetalle)<-[:APARECE_EN_LA_ENTRADA]-(a:Articulo)
    RETURN DISTINCT a.clave AS clave
    ORDER BY clave
    SKIP 500 * 7
    LIMIT 500
} 
WITH collect(clave) AS clavesSeleccionadas
CALL apoc.export.csv.query(
    '
        MATCH (ee:EntradaEncabezado)-[:CONTIENE_ENTRADAS]->(d1:EntradaDetalle)<-[:APARECE_EN_LA_ENTRADA]-(a1:Articulo), 
              (ee)-[:CONTIENE_ENTRADAS]->(d2:EntradaDetalle)<-[:APARECE_EN_LA_ENTRADA]-(a2:Articulo) 
        WHERE a1 <> a2 AND a1.clave IN $claves
        RETURN a1.clave AS Articulo, a2.clave AS Recomendacion, COUNT(DISTINCT ee) AS Coincidencias
    ',
    "file:///RecomendacionesEntrada8.csv",
    {params: {claves: clavesSeleccionadas}}
)
YIELD nodes, relationships, properties, file, source, format, time, rows, batchSize, batches, done, data
RETURN file, rows, time