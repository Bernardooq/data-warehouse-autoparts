CREATE OR ALTER PROCEDURE Poblar
AS
BEGIN

--BORRAR DATOS (SE HACE DE LA FACT HACIA AFUERA)
	DELETE Proyecto1.dbo.FactEntradas
	DELETE Proyecto1.dbo.FactSalidas
	DELETE Proyecto1.dbo.DimArticulo
	DELETE Proyecto1.dbo.DimCliente
	DELETE Proyecto1.dbo.DimSalida
	DELETE Proyecto1.dbo.DimEntrada
	DELETE Proyecto1.dbo.DimTime
	DELETE Proyecto1.dbo.DimVendedor



--POBLAR DIM_ENTRADA
INSERT INTO Proyecto1.dbo.DimEntrada
SELECT 
    TRIM(folio), --Se eliminan espacios en la clave
	M.Descripcion,
	M.Tipo
FROM AutopartesP2025.dbo.EntradaEncabezado AS E
LEFT JOIN AutopartesP2025.dbo.Moneda AS M 
ON E.Moneda = M.Clave



--POBLAR DIM_SALIDA
INSERT INTO Proyecto1.dbo.DimSalida
SELECT 
    TRIM(folio), --Se eliminan espacios en la clave
	C.Descripcion,
	ME.Descripcion,
	M.Descripcion
FROM AutopartesP2025.dbo.SalidaEncabezado AS S
LEFT JOIN AutopartesP2025.dbo.Moneda AS M 
ON S.Moneda = M.Clave
LEFT JOIN AutopartesP2025.dbo.MedioEmbarque AS ME ON ME.Clave=S.MedioEmbarque
LEFT JOIN AutopartesP2025.dbo.CondicionPago AS C ON C.Clave=S.CondicionPago


--POBLAR DIM_VENDEDOR
INSERT INTO Proyecto1.dbo.DimVendedor
SELECT
	TRIM(Clave), --Quitar espacios
	Nombre
FROM AutopartesP2025.dbo.Vendedor
INSERT INTO Proyecto1.dbo.DimVendedor (VendedorID, Nombre)
VALUES('999', 'Sin Vendedor')



--POBLAR DIM_TIME
INSERT INTO Proyecto1.dbo.DimTime
SELECT DISTINCT
    CAST(CONVERT(NVARCHAR(8), Fecha, 112) AS BIGINT), -- Fecha en formato 'YYYYMMDD'
    Fecha, -- Fecha normal
    YEAR(Fecha), -- A�o
    CEILING(MONTH(Fecha) / 6.0), -- N�mero de semestre
    CEILING(MONTH(Fecha) / 3.0), -- N�mero de cuatrimestre
    CEILING(MONTH(Fecha) / 4.0), -- N�mero de trimestre
    MONTH(Fecha), -- Mes
    DATENAME(MONTH, Fecha), -- Nombre del mes
    DAY(Fecha), -- D�a
    DATENAME(WEEKDAY, Fecha) -- D�a de la semana
FROM (
    SELECT Fecha FROM AutopartesP2025.dbo.EntradaEncabezado
    UNION
    SELECT Fecha FROM AutopartesP2025.dbo.SalidaEncabezado
) AS FechasUnificadas


--POBLAR DIM_CLIENTE
INSERT INTO Proyecto1.dbo.DimCliente
SELECT
	TRIM(c.Clave), -- Se quitan espacios
	c.Vendedor, -- El vendedor del cliente
	p.Descripcion
FROM AutopartesP2025.dbo.Cliente AS c
LEFT JOIN AutopartesP2025.dbo.Pais AS p ON p.Clave=c.Clave
INSERT INTO Proyecto1.dbo.DimCliente(ClienteID)
VALUES('999')


--POBLAR DIM_ARTICULO
INSERT INTO Proyecto1.dbo.DimArticulo
SELECT
	TRIM(A.clave), --Quitar los espacios
	G.Descripcion, --El grupo al que pertenece
	T.Descripcion, -- El tipo de art�culo
	C.Descripcion, -- La clase de articulo
	A.Descripcion, -- La descripci�n del art�culo
	Precio
FROM AutopartesP2025.dbo.Articulo AS A --JOINS correspondientes
LEFT JOIN AutopartesP2025.dbo.ArticuloClase AS C 
ON A.ArticuloClase = C.Clave
LEFT JOIN AutopartesP2025.dbo.ArticuloTipo AS T
ON A.ArticuloTipo = T.Clave
LEFT JOIN AutopartesP2025.dbo.ArticuloGrupo AS G
ON A.ArticuloGrupo = G.Clave


--POBLAR FACT_ENTRADAS
INSERT INTO Proyecto1.dbo.FactEntradas
SELECT
	TRIM(ED.Folio), --Quitamos loos espacios de todas las claves
	ED.Partida, -- Numero de partida
	CAST(CONVERT(NVARCHAR(8), EE.Fecha, 112) as BIGINT), --Se obtiene fecha en formato '20250223'
	ISNULL(TRIM(Cliente), '999'),
	ISNULL(NULLIF(TRIM(EE.Vendedor), ''), '999'), -- Convierte '' en NULL y luego en '999'
	TRIM(ED.Articulo),
	ED.Cantidad,
	ED.TotalImporte,
	ED.Total,
	ED.TotalImpuesto,
	ED.CantidadUMedInv,
	ED.Precio,
	ED.pctDescuento,
	ED.pctImpuesto,
	ED.TotalDescuento,
	EE.Total,
	EE.pctDescuentoGlobal,
	EE.TotalImporte,
	EE.TotalDescuento,
	EE.TotalImpuesto,
	1.0 / MAX(ED.Partida) OVER (PARTITION BY EE.Folio) --La cantidad de entradas se divide 1.0 sobre el maximo de partidas
FROM AutopartesP2025.dbo.EntradaDetalle AS ED
JOIN AutopartesP2025.dbo.EntradaEncabezado AS EE
	ON ED.Folio = EE.Folio


--POBLAR FACT_SALIDAS
INSERT INTO Proyecto1.dbo.FactSalidas
SELECT
	TRIM(ED.Folio), --Quitamos loos espacios de todas las claves
	ED.Partida, -- Numero de partida
	ISNULL(TRIM(Cliente), '999'),
	ISNULL(NULLIF(TRIM(EE.Vendedor), ''), '999'), -- Convierte '' en NULL y luego en '999'
	TRIM(ED.Articulo),
	CAST(CONVERT(NVARCHAR(8), EE.Fecha, 112) as BIGINT), --Se obtiene fecha en formato '20250223'
	ED.Cantidad,
	ED.TotalImporte,
	ED.Total,
	ED.TotalImpuesto,
	ED.CantidadUMedInv,
	ED.Precio,
	ED.pctDescuento,
	ED.pctImpuesto,
	ED.TotalDescuento,
	EE.Total,
	EE.pctDescuentoGlobal,
	EE.TotalImporte,
	EE.TotalDescuento,
	EE.TotalImpuesto,
	1.0 / MAX(ED.Partida) OVER (PARTITION BY EE.Folio) --La cantidad de entradas se divide 1.0 sobre el maximo de partidas
FROM AutopartesP2025.dbo.SalidaDetalle AS ED
JOIN AutopartesP2025.dbo.SalidaEncabezado AS EE
	ON ED.Folio = EE.Folio

END;

EXECUTE Poblar;
