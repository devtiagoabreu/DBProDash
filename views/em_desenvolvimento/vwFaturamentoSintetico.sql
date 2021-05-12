USE [DBProDash]
GO

/****** Object:  View [dbo].[vwFaturamentoSintetico]    Script Date: 12/05/2021 09:36:07 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO


ALTER VIEW [dbo].[vwFaturamentoSintetico]
AS

SELECT
	vwFaturamentoSinteticoSemDesconto.Empresa,
	vwFaturamentoSinteticoSemDesconto.NFe,
	vwFaturamentoSinteticoSemDesconto.NatOperacao, 
	vwFaturamentoSinteticoSemDesconto.Metros,
	(vwFaturamentoSinteticoSemDesconto.ValorTotalItens - vwFaturamentoDecontoGeral.VALOR_DECONTO_GERAL) AS Valor,	
	vwFaturamentoSinteticoSemDesconto.Data_Nota
FROM
	vwFaturamentoSinteticoSemDesconto
	INNER JOIN vwFaturamentoDecontoGeral ON vwFaturamentoDecontoGeral.Nr_Nota= vwFaturamentoSinteticoSemDesconto.NFe;


GO


