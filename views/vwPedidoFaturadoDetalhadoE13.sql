USE [DBProDash]
GO

/****** Object:  View [dbo].[vwPedidoFaturadoDetalhadoE13]    Script Date: 12/05/2021 08:25:48 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO


CREATE VIEW [dbo].[vwPedidoFaturadoDetalhadoE13]
AS

SELECT 
	VW_FaturamentoPorProdutoEmp13.Cod_Produto,
	Produtos.Secao,
	Produtos.Grupo,
	Produtos.Subgrupo,
	VW_FaturamentoPorProdutoEmp13.Nr_Nota AS NFe,
	VW_FaturamentoPorProdutoEmp13.Nosso_Pedido AS Pedido,
	VW_FaturamentoPorProdutoEmp13.Cod_Cliente,
	Vw_Cliente_Endereco_SPED.Cob_Estado,
	ISNULL(SUM(VW_FaturamentoPorProdutoEmp13.Metros),0) AS Metros,
	VW_FaturamentoPorProdutoEmp13.Vr_Nota AS ValorTotal,
	ISNULL(SUM(VW_FaturamentoPorProdutoEmp13.Vr_Total_Item),0) AS ValorTotalItens,
	VW_FaturamentoPorProdutoEmp13.Data_Nota AS DataNFe,
	VW_FaturamentoPorProdutoEmp13.Fat_Itens_GrupoNatOP AS GrupoOperacao,
	VW_FaturamentoPorProdutoEmp13.Data_Nota,
	VW_FaturamentoPorProdutoEmp13.NatOperacao
FROM 
	VW_FaturamentoPorProdutoEmp13
	INNER JOIN DBMicrodata_DGB.dbo.Produtos ON Produtos.Codigo = VW_FaturamentoPorProdutoEmp13.Cod_Produto
	INNER JOIN DBMicrodata_DGB.dbo.Vw_Cliente_Endereco_SPED ON Vw_Cliente_Endereco_SPED.Cliente = VW_FaturamentoPorProdutoEmp13.Cod_Cliente
WHERE
	VW_FaturamentoPorProdutoEmp13.NatOperacao NOT IN ('5.551-1','5.553-1','5.556-1','5.901-1','5.901-2','5.902-1','5.903-1','5.905-1','5.906-1')
GROUP BY
	VW_FaturamentoPorProdutoEmp13.NatOperacao, 
	VW_FaturamentoPorProdutoEmp13.Nr_Nota,
	VW_FaturamentoPorProdutoEmp13.Nosso_Pedido,
	VW_FaturamentoPorProdutoEmp13.Cod_Cliente,
	Vw_Cliente_Endereco_SPED.Cob_Estado,
	VW_FaturamentoPorProdutoEmp13.Cod_Produto,
	Produtos.Secao,
	Produtos.Grupo,
	Produtos.Subgrupo,
	VW_FaturamentoPorProdutoEmp13.Vr_Nota,
	VW_FaturamentoPorProdutoEmp13.Data_Nota,
	VW_FaturamentoPorProdutoEmp13.Fat_Itens_GrupoNatOP,
	VW_FaturamentoPorProdutoEmp13.Cod_Produto,
	VW_FaturamentoPorProdutoEmp13.Data_Nota;


GO


