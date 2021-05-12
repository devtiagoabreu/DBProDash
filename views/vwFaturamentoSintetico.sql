USE [DBProDash]
GO

/****** Object:  View [dbo].[vwFaturamentoPorGrupoSintetico]    Script Date: 05/11/2021 16:42:09 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

CREATE VIEW [dbo].[vwFaturamentoSintetico]
AS

SELECT
	'13' AS Empresa,
	vwPedidoFaturadoDetalhadoE13.NFe,
	vwPedidoFaturadoDetalhadoE13.NatOperacao, 
	SUM(vwPedidoFaturadoDetalhadoE13.Metros) AS Metros,	
	(SUM(vwPedidoFaturadoDetalhadoE13.ValorTotalItens) - SUM(vwFaturamentoDecontoGeral.VALOR_DECONTO_GERAL)) AS ValorTotalItens,
	vwPedidoFaturadoDetalhadoE13.Data_Nota
FROM 
	vwPedidoFaturadoDetalhadoE13
	INNER JOIN vwFaturamentoDecontoGeral ON vwFaturamentoDecontoGeral.Nr_Nota = vwPedidoFaturadoDetalhadoE13.NFe
GROUP BY
	vwPedidoFaturadoDetalhadoE13.NatOperacao,
	vwPedidoFaturadoDetalhadoE13.NFe,
	vwPedidoFaturadoDetalhadoE13.Data_Nota
	
UNION	

SELECT
	'14' AS Empresa,
	vwPedidoFaturadoDetalhadoE14.NFe,
	vwPedidoFaturadoDetalhadoE14.NatOperacao, 
	SUM(vwPedidoFaturadoDetalhadoE14.Metros) AS Metros,	
	(SUM(vwPedidoFaturadoDetalhadoE14.ValorTotalItens) - SUM(vwFaturamentoDecontoGeral.VALOR_DECONTO_GERAL)) AS ValorTotalItens,
	vwPedidoFaturadoDetalhadoE14.Data_Nota
FROM 
	vwPedidoFaturadoDetalhadoE14
	INNER JOIN vwFaturamentoDecontoGeral ON vwFaturamentoDecontoGeral.Nr_Nota = vwPedidoFaturadoDetalhadoE14.NFe
GROUP BY
	vwPedidoFaturadoDetalhadoE14.NatOperacao, 
	vwPedidoFaturadoDetalhadoE14.NFe,
	vwPedidoFaturadoDetalhadoE14.Data_Nota




GO


