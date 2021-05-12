USE [DBProDash]
GO

/****** Object:  View [dbo].[vwFaturamentoDecontoGeral]    Script Date: 05/11/2021 16:49:29 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

CREATE VIEW [dbo].[vwFaturamentoDecontoGeral]
AS

SELECT
	Fat_Pedido.Nr_Nota,
	Fat_Pedido.Pedido,
	SUM(ISNULL(Vr_DescontoGeral,0)) AS VALOR_DECONTO_GERAL,
	Fat_Pedido.Data_Nota
FROM 
	DBMicrodata_DGB.dbo.Fat_Pedido
GROUP BY
	Fat_Pedido.Nr_Nota,
	Fat_Pedido.Pedido,
	Fat_Pedido.Data_Nota;

GO


