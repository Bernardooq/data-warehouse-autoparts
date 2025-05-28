// Tomando los artículos con clave 'DTNA1081' y 'BFNT185R', ¿cuáles y cuántos son los folios en los que aparecen ambos? 
MATCH (ee:SalidaEncabezado)-[:CONTIENE_SALIDAS]->(d1:SalidaDetalle)<-[:APARECE_EN_LA_SALIDA]-(a1:Articulo {clave:'DTNA1081'}), 
              (ee)-[:CONTIENE_SALIDAS]->(d2:SalidaDetalle)<-[:APARECE_EN_LA_SALIDA]-(a2:Articulo {clave:'BFNT185R'}) 
        WHERE a1 <> a2
        RETURN a1.clave AS Articulo, a2.clave AS Recomendacion, COUNT(DISTINCT ee) AS Coincidencias ORDER BY Coincidencias DESC;


// Tomando los artículos con clave '331-1922R' y 'BTDGC93P', ¿cuáles y cuántos son los folios en los que aparecen ambos?
MATCH (ee:SalidaEncabezado)-[:CONTIENE_SALIDAS]->(d1:SalidaDetalle)<-[:APARECE_EN_LA_SALIDA]-(a1:Articulo {clave:'331-1922R'}), 
              (ee)-[:CONTIENE_SALIDAS]->(d2:SalidaDetalle)<-[:APARECE_EN_LA_SALIDA]-(a2:Articulo {clave:'BTDGC93P'}) 
        WHERE a1 <> a2
        RETURN a1.clave AS Articulo, a2.clave AS Recomendacion, COUNT(DISTINCT ee) AS Coincidencias ORDER BY Coincidencias DESC;


// Tomando los artículos con clave 'CHCNPU94' y '333-1105R', ¿cuáles y cuántos son los folios en los que aparecen ambos?
MATCH (ee:SalidaEncabezado)-[:CONTIENE_SALIDAS]->(d1:SalidaDetalle)<-[:APARECE_EN_LA_SALIDA]-(a1:Articulo {clave:'CHCNPU94'}), 
              (ee)-[:CONTIENE_SALIDAS]->(d2:SalidaDetalle)<-[:APARECE_EN_LA_SALIDA]-(a2:Articulo {clave:'333-1105R'}) 
        WHERE a1 <> a2
        RETURN a1.clave AS Articulo, a2.clave AS Recomendacion, COUNT(DISTINCT ee) AS Coincidencias ORDER BY Coincidencias DESC;


// Tomando los artículos con clave 'DDFTO92', ¿cuáles y cuántos son los artículos recomendados? 
MATCH (ee:SalidaEncabezado)-[:CONTIENE_SALIDAS]->(d1:SalidaDetalle)<-[:APARECE_EN_LA_SALIDA]-(a1:Articulo {clave:'DDFTO92'}), 
              (ee)-[:CONTIENE_SALIDAS]->(d2:SalidaDetalle)<-[:APARECE_EN_LA_SALIDA]-(a2:Articulo ) 
        WHERE a1 <> a2
        RETURN a1.clave AS Articulo, a2.clave AS Recomendacion, COUNT(DISTINCT ee) AS Coincidencias ORDER BY Coincidencias DESC;


// Tomando el artículo con clave 'ELDNE00R', ¿cuáles y cuántos son los artículos recomendados de la misma clase? 
MATCH (ee:SalidaEncabezado)-[:CONTIENE_SALIDAS]->(d1:SalidaDetalle)<-[:APARECE_EN_LA_SALIDA]-(a1:Articulo {clave:'ELDNE00R'}), 
              (ee)-[:CONTIENE_SALIDAS]->(d2:SalidaDetalle)<-[:APARECE_EN_LA_SALIDA]-(a2:Articulo ) 
        WHERE a1 <> a2 AND a1.ArticuloClase=a2.ArticuloClase
        RETURN a1.clave AS Articulo, a2.clave AS Recomendacion, COUNT(DISTINCT ee) AS Coincidencias ORDER BY Coincidencias DESC;


// Tomando el artículo con clave 'TIDTPU84D', ¿cuáles y cuántos son los artículos recomendados del mismo tipo? 
MATCH (ee:SalidaEncabezado)-[:CONTIENE_SALIDAS]->(d1:SalidaDetalle)<-[:APARECE_EN_LA_SALIDA]-(a1:Articulo {clave:'TIDTPU84D'}), 
              (ee)-[:CONTIENE_SALIDAS]->(d2:SalidaDetalle)<-[:APARECE_EN_LA_SALIDA]-(a2:Articulo ) 
        WHERE a1 <> a2 AND a1.ArticuloTipo=a2.ArticuloTipo
        RETURN a1.clave AS Articulo, a2.clave AS Recomendacion, COUNT(DISTINCT ee) AS Coincidencias ORDER BY Coincidencias DESC;


//  Tomando el artículo con clave '62215F4030', ¿cuáles y cuántos son los artículos recomendados del mismo grupo? 
MATCH (ee:SalidaEncabezado)-[:CONTIENE_SALIDAS]->(d1:SalidaDetalle)<-[:APARECE_EN_LA_SALIDA]-(a1:Articulo {clave:'62215F4030'}), 
              (ee)-[:CONTIENE_SALIDAS]->(d2:SalidaDetalle)<-[:APARECE_EN_LA_SALIDA]-(a2:Articulo ) 
        WHERE a1 <> a2 AND a1.ArticuloGrupo=a2.ArticuloGrupo
        RETURN a1.clave AS Articulo, a2.clave AS Recomendacion, COUNT(DISTINCT ee) AS Coincidencias ORDER BY Coincidencias DESC;


// Tomando el artículo con clave '10023', ¿cuáles y cuántos son los artículos recomendados del mismo grupo? 
MATCH (ee:SalidaEncabezado)-[:CONTIENE_SALIDAS]->(d1:SalidaDetalle)<-[:APARECE_EN_LA_SALIDA]-(a1:Articulo {clave:'10023'}), 
              (ee)-[:CONTIENE_SALIDAS]->(d2:SalidaDetalle)<-[:APARECE_EN_LA_SALIDA]-(a2:Articulo ) 
        WHERE a1 <> a2 AND a1.ArticuloGrupo=a2.ArticuloGrupo
        RETURN a1.clave AS Articulo, a2.clave AS Recomendacion, COUNT(DISTINCT ee) AS Coincidencias ORDER BY Coincidencias DESC;


// Tomando el artículo con clave 'F6052DH4', ¿cuáles y cuántos son los artículos recomendados del mismo tipo?
MATCH (ee:SalidaEncabezado)-[:CONTIENE_SALIDAS]->(d1:SalidaDetalle)<-[:APARECE_EN_LA_SALIDA]-(a1:Articulo {clave:'F6052DH4'}), 
              (ee)-[:CONTIENE_SALIDAS]->(d2:SalidaDetalle)<-[:APARECE_EN_LA_SALIDA]-(a2:Articulo ) 
        WHERE a1 <> a2 AND a1.ArticuloTipo=a2.ArticuloTipo
        RETURN a1.clave AS Articulo, a2.clave AS Recomendacion, COUNT(DISTINCT ee) AS Coincidencias ORDER BY Coincidencias DESC;


// Tomando el artículo con clave '100-1931Y', ¿cuáles y cuántos son los artículos recomendados de la misma clase? 
MATCH (ee:SalidaEncabezado)-[:CONTIENE_SALIDAS]->(d1:SalidaDetalle)<-[:APARECE_EN_LA_SALIDA]-(a1:Articulo {clave:'100-1931Y'}), 
              (ee)-[:CONTIENE_SALIDAS]->(d2:SalidaDetalle)<-[:APARECE_EN_LA_SALIDA]-(a2:Articulo ) 
        WHERE a1 <> a2 AND a1.ArticuloClase=a2.ArticuloClase
        RETURN a1.clave AS Articulo, a2.clave AS Recomendacion, COUNT(DISTINCT ee) AS Coincidencias ORDER BY Coincidencias DESC;
