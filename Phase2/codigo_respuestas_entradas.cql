//Codigo cypher para recomendación individual respecto al ID del artículo
MATCH (ee:EntradaEncabezado)-[:CONTIENE_ENTRADAS]->(ed1:EntradaDetalle)<-[:APARECE_EN_LA_ENTRADA]-(a1:Articulo {clave: 'CFPU87'})
MATCH (ee)-[:CONTIENE_ENTRADAS]->(ed2:EntradaDetalle)<-[:APARECE_EN_LA_ENTRADA]-(a2:Articulo) 
WHERE a1 <> a2
RETURN a1.clave AS Articulo, a2.clave AS Recomendacion, COUNT(DISTINCT ee) AS Coincidencias
ORDER BY Coincidencias DESC, Recomendacion ASC

//Codigo cypher para recomendación individual respecto al ID del artículo pero solamente sobre artículos del mismo tipo
MATCH (ee:EntradaEncabezado)-[:CONTIENE_ENTRADAS]->(ed1:EntradaDetalle)<-[:APARECE_EN_LA_ENTRADA]-(a1:Articulo {clave: 'CFPU87'})
MATCH (ee)-[:CONTIENE_ENTRADAS]->(ed2:EntradaDetalle)<-[:APARECE_EN_LA_ENTRADA]-(a2:Articulo) 
WHERE a1 <> a2 AND a1.ArticuloTipo = a2.ArticuloTipo
RETURN a1.clave AS Articulo, a2.clave AS Recomendacion, COUNT(DISTINCT ee) AS Coincidencias
ORDER BY Coincidencias DESC, Recomendacion ASC


// ENTRADAS
//Tomando los artículos con clave 'CNPU94', 'SPCPU99L' cuales y cuantos son los folios en los que aparecen los dos.
MATCH (ee:EntradaEncabezado)-[:CONTIENE_ENTRADAS]->(ed1:EntradaDetalle)<-[:APARECE_EN_LA_ENTRADA]-(a1:Articulo {clave: 'CNPU94'})
MATCH (ee)-[:CONTIENE_ENTRADAS]->(ed2:EntradaDetalle)<-[:APARECE_EN_LA_ENTRADA]-(a2:Articulo {clave: 'SPCPU99L'}) 
WHERE a1 <> a2
RETURN a1.clave AS Articulo, a2.clave AS Recomendacion, COUNT(DISTINCT ee) AS Coincidencias, ee.Folio AS Folio
ORDER BY Coincidencias DESC, Recomendacion ASC

//Tomando los artículos con clave 'PVJE93' cuales y cuantos son las claves en los que aparece
MATCH (ee:EntradaEncabezado)-[:CONTIENE_ENTRADAS]->(ed1:EntradaDetalle)<-[:APARECE_EN_LA_ENTRADA]-(a1:Articulo {clave: 'PVJE93'})
MATCH (ee)-[:CONTIENE_ENTRADAS]->(ed2:EntradaDetalle)<-[:APARECE_EN_LA_ENTRADA]-(a2:Articulo) 
WHERE a1 <> a2
RETURN a1.clave AS Articulo, a2.clave AS Recomendacion, COUNT(DISTINCT ee) AS Coincidencias
ORDER BY Coincidencias DESC, Recomendacion ASC

//Tomando los artículos con clave 'CNPU94', 'PDSP90' cuales y cuantos son los folios en los que aparecen los dos.
MATCH (ee:EntradaEncabezado)-[:CONTIENE_ENTRADAS]->(ed1:EntradaDetalle)<-[:APARECE_EN_LA_ENTRADA]-(a1:Articulo {clave: 'CNPU94'})
MATCH (ee)-[:CONTIENE_ENTRADAS]->(ed2:EntradaDetalle)<-[:APARECE_EN_LA_ENTRADA]-(a2:Articulo {clave: 'PDSP90'}) 
WHERE a1 <> a2
RETURN a1.clave AS Articulo, a2.clave AS Recomendacion, COUNT(DISTINCT ee) AS Coincidencias, ee.Folio AS Folio
ORDER BY Coincidencias DESC, Recomendacion ASC

//Tomando el artículo con clave 'DTFES96' cuales y cuantos son los artículos recomendados
MATCH (ee:EntradaEncabezado)-[:CONTIENE_ENTRADAS]->(ed1:EntradaDetalle)<-[:APARECE_EN_LA_ENTRADA]-(a1:Articulo {clave: 'DTFES96'})
MATCH (ee)-[:CONTIENE_ENTRADAS]->(ed2:EntradaDetalle)<-[:APARECE_EN_LA_ENTRADA]-(a2:Articulo) 
WHERE a1 <> a2
RETURN a1.clave AS Articulo, a2.clave AS Recomendacion, COUNT(DISTINCT ee) AS Coincidencias
ORDER BY Coincidencias DESC, Recomendacion ASC

//Tomando el artículo con clave 442-1123R cuales y cuantos son los artículos recomendados de la misma clase
MATCH (ee:EntradaEncabezado)-[:CONTIENE_ENTRADAS]->(ed1:EntradaDetalle)<-[:APARECE_EN_LA_ENTRADA]-(a1:Articulo {clave: '442-1123R'})
MATCH (ee)-[:CONTIENE_ENTRADAS]->(ed2:EntradaDetalle)<-[:APARECE_EN_LA_ENTRADA]-(a2:Articulo) 
WHERE a1 <> a2 AND a1.ArticuloClase = a2.ArticuloClase
RETURN a1.clave AS Articulo, a2.clave AS Recomendacion, COUNT(DISTINCT ee) AS Coincidencias
ORDER BY Coincidencias DESC, Recomendacion ASC

//Tomando el artículo con clave 'DDVGO93' cuales y cuantos son los artículos recomendados del mismo tipo
MATCH (ee:EntradaEncabezado)-[:CONTIENE_ENTRADAS]->(ed1:EntradaDetalle)<-[:APARECE_EN_LA_ENTRADA]-(a1:Articulo {clave: 'DDVGO93'})
MATCH (ee)-[:CONTIENE_ENTRADAS]->(ed2:EntradaDetalle)<-[:APARECE_EN_LA_ENTRADA]-(a2:Articulo) 
WHERE a1 <> a2 AND a1.ArticuloTipo = a2.ArticuloTipo
RETURN a1.clave AS Articulo, a2.clave AS Recomendacion, COUNT(DISTINCT ee) AS Coincidencias
ORDER BY Coincidencias DESC, Recomendacion ASC

//Tomando el artículo con clave 'SFCO90L' cuales y cuantos son los artículos recomendados del mismo grupo
MATCH (ee:EntradaEncabezado)-[:CONTIENE_ENTRADAS]->(ed1:EntradaDetalle)<-[:APARECE_EN_LA_ENTRADA]-(a1:Articulo {clave: 'SFCO90L'})
MATCH (ee)-[:CONTIENE_ENTRADAS]->(ed2:EntradaDetalle)<-[:APARECE_EN_LA_ENTRADA]-(a2:Articulo) 
WHERE a1 <> a2 AND a1.ArticuloGrupo = a2.ArticuloGrupo
RETURN a1.clave AS Articulo, a2.clave AS Recomendacion, COUNT(DISTINCT ee) AS Coincidencias
ORDER BY Coincidencias DESC, Recomendacion ASC

//Tomando el artículo con clave '212-1638L' cuales y cuantos son los artículos recomendados del mismo grupo
MATCH (ee:EntradaEncabezado)-[:CONTIENE_ENTRADAS]->(ed1:EntradaDetalle)<-[:APARECE_EN_LA_ENTRADA]-(a1:Articulo {clave: '212-1638L'})
MATCH (ee)-[:CONTIENE_ENTRADAS]->(ed2:EntradaDetalle)<-[:APARECE_EN_LA_ENTRADA]-(a2:Articulo) 
WHERE a1 <> a2
RETURN a1.clave AS Articulo, a2.clave AS Recomendacion, COUNT(DISTINCT ee) AS Coincidencias
ORDER BY Coincidencias DESC, Recomendacion ASC

//Tomando el artículo con clave 'MRFEX95' cuales y cuantos son los artículos recomendados del mismo grupo
MATCH (ee:EntradaEncabezado)-[:CONTIENE_ENTRADAS]->(ed1:EntradaDetalle)<-[:APARECE_EN_LA_ENTRADA]-(a1:Articulo {clave: 'MRFEX95'})
MATCH (ee)-[:CONTIENE_ENTRADAS]->(ed2:EntradaDetalle)<-[:APARECE_EN_LA_ENTRADA]-(a2:Articulo) 
WHERE a1 <> a2 AND a1.ArticuloGrupo = a2.ArticuloGrupo
RETURN a1.clave AS Articulo, a2.clave AS Recomendacion, COUNT(DISTINCT ee) AS Coincidencias
ORDER BY Coincidencias DESC, Recomendacion ASC

//Tomando el artículo con clave 'CDNE94J' cuales y cuantos son los artículos recomendados del mismo Tipo
MATCH (ee:EntradaEncabezado)-[:CONTIENE_ENTRADAS]->(ed1:EntradaDetalle)<-[:APARECE_EN_LA_ENTRADA]-(a1:Articulo {clave: 'CDNE94J'})
MATCH (ee)-[:CONTIENE_ENTRADAS]->(ed2:EntradaDetalle)<-[:APARECE_EN_LA_ENTRADA]-(a2:Articulo) 
WHERE a1 <> a2 AND a1.ArticuloTipo = a2.ArticuloTipo
RETURN a1.clave AS Articulo, a2.clave AS Recomendacion, COUNT(DISTINCT ee) AS Coincidencias
ORDER BY Coincidencias DESC, Recomendacion ASC