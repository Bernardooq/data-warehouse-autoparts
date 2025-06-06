USE master
GO

CREATE DATABASE Proyecto1
COLLATE Modern_Spanish_100_CI_AI_SC_UTF8;
GO

USE [Proyecto1]
GO
/****** Object:  Table [dbo].[DimArticulo]    Script Date: 3/20/2025 9:41:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimArticulo](
	[ArticuloID] [char](20) NOT NULL,
	[Grupo] [varchar](100) NULL,
	[Tipo] [varchar](100) NULL,
	[Clase] [varchar](100) NULL,
	[Descripcion] [varchar](100) NULL,
	[Precio] [numeric](15, 5) NULL,
 CONSTRAINT [PK_DimArticulo] PRIMARY KEY CLUSTERED 
(
	[ArticuloID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimCliente]    Script Date: 3/20/2025 9:41:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimCliente](
	[ClienteID] [char](20) NOT NULL,
	[Vendedor] [varchar](100) NULL,
	[Pais] [varchar](100) NULL,
 CONSTRAINT [PK_DimCliente] PRIMARY KEY CLUSTERED 
(
	[ClienteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimEntrada]    Script Date: 3/20/2025 9:41:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimEntrada](
	[Folio] [char](10) NOT NULL,
	[MoneDesc] [varchar](100) NULL,
	[MonedaTipo] [varchar](100) NULL,
 CONSTRAINT [PK_DimEntrada] PRIMARY KEY CLUSTERED 
(
	[Folio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimSalida]    Script Date: 3/20/2025 9:41:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimSalida](
	[Folio] [char](20) NOT NULL,
	[CondicionPago] [varchar](100) NULL,
	[MedioEmbarque] [varchar](100) NULL,
	[Moneda] [varchar](100) NULL,
 CONSTRAINT [PK_DimSalida] PRIMARY KEY CLUSTERED 
(
	[Folio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimTime]    Script Date: 3/20/2025 9:41:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimTime](
	[TimeID] [bigint] NOT NULL,
	[Fecha] [datetime] NULL,
	[Anio] [int] NULL,
	[Semestre] [int] NULL,
	[Cuatrimestre] [int] NULL,
	[Trimestre] [int] NULL,
	[Mes] [int] NULL,
	[MesNombre] [nchar](10) NULL,
	[Dia] [int] NULL,
	[DiaNombre] [nchar](10) NULL,
 CONSTRAINT [PK_DimTime] PRIMARY KEY CLUSTERED 
(
	[TimeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimVendedor]    Script Date: 3/20/2025 9:41:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimVendedor](
	[VendedorID] [char](20) NOT NULL,
	[Nombre] [varchar](100) NULL,
 CONSTRAINT [PK_DimVendedor] PRIMARY KEY CLUSTERED 
(
	[VendedorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FactEntradas]    Script Date: 3/20/2025 9:41:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FactEntradas](
	[Folio] [char](10) NOT NULL,
	[Partida] [int] NOT NULL,
	[TimeID] [bigint] NOT NULL,
	[ClienteID] [char](20) NOT NULL,
	[VendedorID] [char](20) NOT NULL,
	[ArticuloID] [char](20) NOT NULL,
	[Cantidad] [int] NULL,
	[TotalImporte] [numeric](15, 5) NULL,
	[Total] [numeric](15, 5) NULL,
	[TotalImpuesto] [numeric](15, 5) NOT NULL,
	[CantidadUMedInv] [numeric](15, 5) NOT NULL,
	[Precio] [numeric](15, 5) NOT NULL,
	[pctDescuento] [numeric](8, 5) NOT NULL,
	[pctImpuesto] [numeric](8, 5) NOT NULL,
	[TotalDescuento] [numeric](15, 5) NOT NULL,
	[Total_d] [numeric](15, 5) NULL,
	[pctDescuentoGlobal_d] [numeric](8, 5) NULL,
	[TotalImporte_d] [numeric](15, 5) NULL,
	[TotalDescuento_d] [numeric](15, 5) NULL,
	[TotalImpuesto_d] [numeric](15, 5) NULL,
	[Cantidad_Entradas] [float] NULL,
 CONSTRAINT [PK_FactEntradas] PRIMARY KEY CLUSTERED 
(
	[Folio] ASC,
	[Partida] ASC,
	[TimeID] ASC,
	[ClienteID] ASC,
	[VendedorID] ASC,
	[ArticuloID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FactSalidas]    Script Date: 3/20/2025 9:41:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FactSalidas](
	[Folio] [char](20) NOT NULL,
	[partida] [int] NOT NULL,
	[ClienteID] [char](20) NOT NULL,
	[VendedorID] [char](20) NOT NULL,
	[ArticuloID] [char](20) NOT NULL,
	[TimeID] [bigint] NOT NULL,
	[Cantidad] [int] NULL,
	[TotalImporte] [numeric](15, 5) NULL,
	[Total] [numeric](15, 5) NULL,
	[TotalImpuesto] [numeric](15, 5) NOT NULL,
	[CantidadUMedInv] [numeric](15, 5) NOT NULL,
	[Precio] [numeric](15, 5) NOT NULL,
	[pctDescuento] [numeric](8, 5) NOT NULL,
	[pctImpuesto] [numeric](8, 5) NOT NULL,
	[TotalDescuento] [numeric](15, 5) NOT NULL,
	[Total_d] [numeric](15, 5) NULL,
	[pctDescuentoGlobal_d] [numeric](8, 5) NULL,
	[TotalImporte_d] [numeric](15, 5) NULL,
	[TotalDescuento_d] [numeric](15, 5) NULL,
	[TotalImpuesto_d] [numeric](15, 5) NULL,
	[Cantidad_Salidas] [float] NULL,
 CONSTRAINT [PK_FactSalidas] PRIMARY KEY CLUSTERED 
(
	[Folio] ASC,
	[partida] ASC,
	[ClienteID] ASC,
	[VendedorID] ASC,
	[ArticuloID] ASC,
	[TimeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[FactEntradas]  WITH CHECK ADD  CONSTRAINT [FK_FactEntradas_DimArticulo] FOREIGN KEY([ArticuloID])
REFERENCES [dbo].[DimArticulo] ([ArticuloID])
GO
ALTER TABLE [dbo].[FactEntradas] CHECK CONSTRAINT [FK_FactEntradas_DimArticulo]
GO
ALTER TABLE [dbo].[FactEntradas]  WITH CHECK ADD  CONSTRAINT [FK_FactEntradas_DimCliente] FOREIGN KEY([ClienteID])
REFERENCES [dbo].[DimCliente] ([ClienteID])
GO
ALTER TABLE [dbo].[FactEntradas] CHECK CONSTRAINT [FK_FactEntradas_DimCliente]
GO
ALTER TABLE [dbo].[FactEntradas]  WITH CHECK ADD  CONSTRAINT [FK_FactEntradas_DimEntrada] FOREIGN KEY([Folio])
REFERENCES [dbo].[DimEntrada] ([Folio])
GO
ALTER TABLE [dbo].[FactEntradas] CHECK CONSTRAINT [FK_FactEntradas_DimEntrada]
GO
ALTER TABLE [dbo].[FactEntradas]  WITH CHECK ADD  CONSTRAINT [FK_FactEntradas_DimTime] FOREIGN KEY([TimeID])
REFERENCES [dbo].[DimTime] ([TimeID])
GO
ALTER TABLE [dbo].[FactEntradas] CHECK CONSTRAINT [FK_FactEntradas_DimTime]
GO
ALTER TABLE [dbo].[FactEntradas]  WITH CHECK ADD  CONSTRAINT [FK_FactEntradas_DimVendedor] FOREIGN KEY([VendedorID])
REFERENCES [dbo].[DimVendedor] ([VendedorID])
GO
ALTER TABLE [dbo].[FactEntradas] CHECK CONSTRAINT [FK_FactEntradas_DimVendedor]
GO
ALTER TABLE [dbo].[FactSalidas]  WITH CHECK ADD  CONSTRAINT [FK_FactSalidas_DimArticulo] FOREIGN KEY([ArticuloID])
REFERENCES [dbo].[DimArticulo] ([ArticuloID])
GO
ALTER TABLE [dbo].[FactSalidas] CHECK CONSTRAINT [FK_FactSalidas_DimArticulo]
GO
ALTER TABLE [dbo].[FactSalidas]  WITH CHECK ADD  CONSTRAINT [FK_FactSalidas_DimCliente] FOREIGN KEY([ClienteID])
REFERENCES [dbo].[DimCliente] ([ClienteID])
GO
ALTER TABLE [dbo].[FactSalidas] CHECK CONSTRAINT [FK_FactSalidas_DimCliente]
GO
ALTER TABLE [dbo].[FactSalidas]  WITH CHECK ADD  CONSTRAINT [FK_FactSalidas_DimSalida] FOREIGN KEY([Folio])
REFERENCES [dbo].[DimSalida] ([Folio])
GO
ALTER TABLE [dbo].[FactSalidas] CHECK CONSTRAINT [FK_FactSalidas_DimSalida]
GO
ALTER TABLE [dbo].[FactSalidas]  WITH CHECK ADD  CONSTRAINT [FK_FactSalidas_DimTime] FOREIGN KEY([TimeID])
REFERENCES [dbo].[DimTime] ([TimeID])
GO
ALTER TABLE [dbo].[FactSalidas] CHECK CONSTRAINT [FK_FactSalidas_DimTime]
GO
ALTER TABLE [dbo].[FactSalidas]  WITH CHECK ADD  CONSTRAINT [FK_FactSalidas_DimVendedor] FOREIGN KEY([VendedorID])
REFERENCES [dbo].[DimVendedor] ([VendedorID])
GO
ALTER TABLE [dbo].[FactSalidas] CHECK CONSTRAINT [FK_FactSalidas_DimVendedor]
GO
