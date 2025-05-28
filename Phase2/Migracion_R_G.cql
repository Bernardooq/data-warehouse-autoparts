// ======================
// CARGA DE NODOS
// ======================

// ---------- FACTURA ----------
LOAD CSV WITH HEADERS FROM 'file:///FacturaEncabezado.csv' AS row
CREATE (n:Factura)
SET n = row;

CREATE INDEX index_Factura FOR (n:Factura) ON (n.Folio);

// ---------- FACTURA DETALLE ----------
CALL apoc.periodic.iterate(
  'LOAD CSV WITH HEADERS FROM "file:///FacturaDetalle.csv" AS row RETURN row',
  'CREATE (n:FacturaDetalle) SET n = row',
  { batchSize: 10000, parallel: true }
);

CREATE INDEX index_FacturaDetalle FOR (n:FacturaDetalle) ON (n.Folio, n.Partida);

// ---------- ARTICULO ----------
CALL apoc.periodic.iterate(
  'LOAD CSV WITH HEADERS FROM "file:///Articulo.csv" AS row RETURN row',
  'CREATE (n:Articulo) SET n = row',
  { batchSize: 10000, parallel: false }
);

CREATE INDEX index_Articulo FOR (n:Articulo) ON (n.clave);

// ---------- ARTICULO TIPO ----------
CALL apoc.periodic.iterate(
  'LOAD CSV WITH HEADERS FROM "file:///ArticuloTipo.csv" AS row RETURN row',
  'CREATE (n:ArticuloTipo) SET n = row',
  { batchSize: 10000, parallel: false }
);

CREATE INDEX index_ArticuloTipo FOR (n:ArticuloTipo) ON (n.Clave);

// ---------- ARTICULO GRUPO ----------
CALL apoc.periodic.iterate(
  'LOAD CSV WITH HEADERS FROM "file:///ArticuloGrupo.csv" AS row RETURN row',
  'CREATE (n:ArticuloGrupo) SET n = row',
  { batchSize: 10000, parallel: false }
);

// ---------- ARTICULO CLASE ----------
CALL apoc.periodic.iterate(
  'LOAD CSV WITH HEADERS FROM "file:///ArticuloClase.csv" AS row RETURN row',
  'CREATE (n:ArticuloClase) SET n = row',
  { batchSize: 10000, parallel: false }
);

// ---------- CLIENTE ----------
LOAD CSV WITH HEADERS FROM 'file:///Cliente.csv' AS row
CREATE (n:Cliente)
SET n = row;

CREATE INDEX index_Cliente FOR (n:Cliente) ON (n.Clave);

// ---------- VENDEDOR ----------
LOAD CSV WITH HEADERS FROM 'file:///Vendedor.csv' AS row
CREATE (n:Vendedor)
SET n = row;

// ---------- MONEDA ----------
LOAD CSV WITH HEADERS FROM 'file:///Moneda.csv' AS row
CREATE (n:Moneda)
SET n = row;

// ---------- MEDIO EMBARQUE ----------
LOAD CSV WITH HEADERS FROM 'file:///MedioEmbarque.csv' AS row
CREATE (n:MedioEmbarque)
SET n = row;

// ---------- CONDICIÓN DE PAGO ----------
LOAD CSV WITH HEADERS FROM 'file:///CondicionPago.csv' AS row
CREATE (n:CondicionPago)
SET n = row;



// ======================
// CREACIÓN DE RELACIONES
// ======================

// ---------- FACTURA - FACTURA DETALLE ----------
CALL apoc.periodic.iterate(
  'MATCH (f:Factura), (fd:FacturaDetalle)
   WHERE TRIM(f.Folio) = TRIM(fd.Folio)
   RETURN f, fd',
  'MERGE (f)-[:CONTIENE]->(fd)',
  { batchSize: 10000, parallel: false }
);

// ---------- FACTURA DETALLE - ARTÍCULO ----------
CALL apoc.periodic.iterate(
  'MATCH (fd:FacturaDetalle), (a:Articulo)
   WHERE TRIM(fd.Articulo) = TRIM(a.clave)
   RETURN fd, a',
  'MERGE (a)-[:APARECE_EN_LA]->(fd)',
  { batchSize: 10000, parallel: false }
);

// ---------- ARTÍCULO TIPO - ARTÍCULO ----------
MATCH (at:ArticuloTipo), (a:Articulo)
WHERE TRIM(at.Clave) = TRIM(a.ArticuloTipo)
MERGE (at)-[:CONTIENE_TIPOS_DE]->(a);

// ---------- ARTÍCULO GRUPO - ARTÍCULO ----------
MATCH (ag:ArticuloGrupo), (a:Articulo)
WHERE TRIM(ag.Clave) = TRIM(a.ArticuloGrupo)
MERGE (ag)-[:CONTIENE_GRUPOS_DE]->(a);

// ---------- ARTÍCULO CLASE - ARTÍCULO ----------
MATCH (ac:ArticuloClase), (a:Articulo)
WHERE TRIM(ac.Clave) = TRIM(a.ArticuloClase)
MERGE (ac)-[:CONTIENE_CLASES_DE]->(a);

// ---------- CLIENTE - FACTURA ----------
MATCH (c:Cliente), (f:Factura)
WHERE TRIM(c.Clave) = TRIM(f.Cliente)
MERGE (c)-[:ES_PARTE_DE]->(f);

// ---------- VENDEDOR - FACTURA ----------
MATCH (v:Vendedor), (f:Factura)
WHERE TRIM(v.Clave) = TRIM(f.Vendedor)
MERGE (v)-[:APARECE_EN]->(f);

// ---------- VENDEDOR - CLIENTE ----------
MATCH (v:Vendedor), (c:Cliente)
WHERE TRIM(v.Clave) = TRIM(c.Vendedor)
MERGE (v)-[:ATIENDE_A]->(c);

// ---------- MONEDA - FACTURA ----------
MATCH (m:Moneda), (f:Factura)
WHERE TRIM(m.Clave) = TRIM(f.Moneda)
MERGE (m)-[:USADA_EN_LA]->(f);

// ---------- MONEDA - CLIENTE ----------
MATCH (m:Moneda), (c:Cliente)
WHERE TRIM(m.Clave) = TRIM(c.Moneda)
MERGE (m)-[:USADA_POR_EL]->(c);

// ---------- MEDIO EMBARQUE - FACTURA ----------
MATCH (f:Factura)
WITH f, toUpper(TRIM(f.MedioEmbarque)) AS clave
MATCH (me:MedioEmbarque)
WHERE toUpper(TRIM(me.Clave)) = clave
MERGE (me)-[:DESTINADO_A]->(f);


// ---------- CONDICIÓN DE PAGO - FACTURA ----------
MATCH (cp:CondicionPago), (f:Factura)
WHERE TRIM(cp.Clave) = TRIM(f.CondicionPago)
MERGE (cp)-[:ASOCIADA_A]->(f);

// ---------- CONDICIÓN DE PAGO - CLIENTE ----------
MATCH (cp:CondicionPago), (c:Cliente)
WHERE TRIM(cp.Clave) = TRIM(c.CondicionPago)
MERGE (cp)-[:DESTINADA_AL]->(c);


//-- ENTRADAS --
CALL apoc.periodic.iterate(
  'LOAD CSV WITH HEADERS FROM "file:///EntradaEncabezado.csv" AS row RETURN row',
  'CREATE (n:EntradaEncabezado) SET n = row',
  { batchSize: 10000, parallel: false }
);
CREATE INDEX index_EntradaEncabezado FOR (n:EntradaEncabezado) ON (n.Folio);

CALL apoc.periodic.iterate(
  'LOAD CSV WITH HEADERS FROM "file:///EntradaDetalle.csv" AS row RETURN row',
  'CREATE (n:EntradaDetalle) SET n = row',
  { batchSize: 10000, parallel: false }
);

//-- Salidas --
CALL apoc.periodic.iterate(
  'LOAD CSV WITH HEADERS FROM "file:///SalidaEncabezado.csv" AS row RETURN row',
  'CREATE (n:SalidaEncabezado) SET n = row',
  { batchSize: 10000, parallel: false }
);
CREATE INDEX index_SalidaEncabezado FOR (n:SalidaEncabezado) ON (n.Folio);

CALL apoc.periodic.iterate(
  'LOAD CSV WITH HEADERS FROM "file:///SalidaDetalle.csv" AS row RETURN row',
  'CREATE (n:SalidaDetalle) SET n = row',
  { batchSize: 10000, parallel: false }
);

LOAD CSV WITH HEADERS FROM 'file:///ClienteTipo.csv' AS row
CREATE (n:ClienteTipo)
SET n = row;


//-- Relaciones Entrada --
CALL apoc.periodic.iterate(
  'MATCH (ed:EntradaDetalle), (a:Articulo)
   WHERE ed.Articulo IS NOT NULL AND a.clave IS NOT NULL
     AND toUpper(TRIM(ed.Articulo)) = toUpper(TRIM(a.clave))
   RETURN ed, a',
  'MERGE (a)-[:APARECE_EN_LA_ENTRADA]->(ed)',
  { batchSize: 10000, parallel: false }
);
CALL apoc.periodic.iterate(
  'MATCH (ec:EntradaEncabezado), (ed:EntradaDetalle)
   WHERE toUpper(TRIM(ec.Folio)) = toUpper(TRIM(ed.Folio))
   RETURN ec, ed',
  'MERGE (ec)-[:CONTIENE_ENTRADAS]->(ed)',
  { batchSize: 10000, parallel: false }
);

MATCH (m:Moneda), (ee:EntradaEncabezado)
WHERE TRIM(m.Clave) = TRIM(ee.Moneda)
MERGE (m)-[:USADA_EN_LA_ENTRADA]->(ee);

MATCH (c:Cliente), (ee:EntradaEncabezado)
WHERE TRIM(c.Clave) = TRIM(ee.Cliente)
MERGE (c)-[:ES_PARTE_DE_LA_ENTRADA]->(ee);


//-- CLIENTE A CLIENTETIPO --
MATCH (ct:ClienteTipo), (c:Cliente)
WHERE TRIM(ct.Clave)=Trim(c.ClienteTipo)
MERGE (ct)-[:CLIENTE_DE_TIPO]->(c);

// -- RELACIONES SALIDA --
CALL apoc.periodic.iterate(
  'MATCH (sd:SalidaDetalle), (a:Articulo)
   WHERE sd.Articulo IS NOT NULL AND a.clave IS NOT NULL
     AND toUpper(TRIM(sd.Articulo)) = toUpper(TRIM(a.clave))
   RETURN sd, a',
  'MERGE (a)-[:APARECE_EN_LA_SALIDA]->(sd)',
  { batchSize: 10000, parallel: false }
);
CALL apoc.periodic.iterate(
  'MATCH (se:SalidaEncabezado), (sd:SalidaDetalle)
   WHERE toUpper(TRIM(se.Folio)) = toUpper(TRIM(sd.Folio))
   RETURN se, sd',
  'MERGE (se)-[:CONTIENE_SALIDAS]->(sd)',
  { batchSize: 10000, parallel: false }
);

MATCH (c:Cliente), (se:SalidaEncabezado)
WHERE TRIM(c.Clave) = TRIM(se.Cliente)
MERGE (c)-[:ES_PARTE_DE_LA_SALIDA]->(se);

MATCH (cp:CondicionPago), (se:SalidaEncabezado)
WHERE TRIM(cp.Clave) = TRIM(se.CondicionPago)
MERGE (cp)-[:ASOCIADA_A_SALIDA]->(se);

MATCH (me:MedioEmbarque), (se:SalidaEncabezado)
WHERE toUpper(TRIM(me.Clave)) = toUpper(TRIM(se.MedioEmbarque))
MERGE (me)-[:ES_PARTE_DE_LA_SALIDA]->(se);

MATCH (m:Moneda), (se:SalidaEncabezado)
WHERE toUpper(TRIM(m.Clave)) = toUpper(TRIM(se.Moneda))
MERGE (m)-[:USADA_EN_LA_SALIDA]->(se);

MATCH (v:Vendedor), (se:SalidaEncabezado)
WHERE toUpper(TRIM(v.Clave)) = toUpper(TRIM(se.Vendedor))
MERGE (v)-[:APARECE_EN_SALIDA]->(se);