SELECT 
    -- FacturaDetalle (2)
    (SELECT COUNT(*) FROM FacturaDetalle WHERE Folio IS NOT NULL) + 
    (SELECT COUNT(*) FROM FacturaDetalle WHERE Articulo IS NOT NULL) + 
    
    -- Articulo (3)
    (SELECT COUNT(*) FROM Articulo WHERE ArticuloTipo IS NOT NULL) + 
    (SELECT COUNT(*) FROM Articulo WHERE ArticuloGrupo IS NOT NULL) + 
    (SELECT COUNT(*) FROM Articulo WHERE ArticuloClase IS NOT NULL) + 
    
    -- FacturaEncabezado (5)
    (SELECT COUNT(*) FROM FacturaEncabezado WHERE Cliente IS NOT NULL) + 
    (SELECT COUNT(*) FROM FacturaEncabezado WHERE Vendedor IS NOT NULL) + 
    (SELECT COUNT(*) FROM FacturaEncabezado WHERE CondicionPago IS NOT NULL) + 
    (SELECT COUNT(*) FROM FacturaEncabezado WHERE MedioEmbarque IS NOT NULL) + 
    (SELECT COUNT(*) FROM FacturaEncabezado WHERE Moneda IS NOT NULL) + 
    
    -- Cliente (3)
    (SELECT COUNT(*) FROM Cliente WHERE Vendedor IS NOT NULL) + 
    (SELECT COUNT(*) FROM Cliente WHERE Moneda IS NOT NULL) + 
    (SELECT COUNT(*) FROM Cliente WHERE CondicionPago IS NOT NULL) + 
	(SELECT COUNT(*) FROM Cliente WHERE ClienteTipo IS NOT NULL) + 
    
    -- SalidaDetalle (2)
    (SELECT COUNT(*) FROM SalidaDetalle WHERE Articulo IS NOT NULL) + 
    (SELECT COUNT(*) FROM SalidaDetalle WHERE Folio IS NOT NULL) + 
    
    -- SalidaEncabezado (5)
    (SELECT COUNT(*) FROM SalidaEncabezado WHERE Cliente IS NOT NULL) + 
    (SELECT COUNT(*) FROM SalidaEncabezado WHERE Moneda IS NOT NULL) + 
    (SELECT COUNT(*) FROM SalidaEncabezado WHERE CondicionPago IS NOT NULL) + 
    (SELECT COUNT(*) FROM SalidaEncabezado WHERE MedioEmbarque IS NOT NULL) + 
    (SELECT COUNT(*) FROM SalidaEncabezado WHERE Vendedor IS NOT NULL) + 
    
    -- EntradaDetalle (2)
    (SELECT COUNT(*) FROM EntradaDetalle WHERE Folio IS NOT NULL) + 
    (SELECT COUNT(*) FROM EntradaDetalle WHERE Articulo IS NOT NULL) + 
    
    -- EntradaEncabezado (2)
    (SELECT COUNT(*) FROM EntradaEncabezado WHERE Moneda IS NOT NULL) + 
    (SELECT COUNT(*) FROM EntradaEncabezado WHERE Cliente IS NOT NULL)     
AS TotalCount;