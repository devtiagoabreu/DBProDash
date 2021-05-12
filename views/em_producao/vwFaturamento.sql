USE [DBProDash]
GO

/****** Object:  View [dbo].[vwFaturamento]    Script Date: 12/05/2021 12:06:48 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO




CREATE VIEW [dbo].[vwFaturamento]
AS
SELECT 
	TP.Empresa,
	TP.Pedido,
	TP.Cliente,
	TP.Nosso_Pedido, 
	TIP.Cod_Produto,
	TP.Nr_Nota,
	TP.Data_Nota, 
	TP.Vr_Nota, 
	Case 
		When TIP.Base_Calc='P' 
		Then IsNull(TIP.Metros,0) 
	Else (Case When TIP.Base_Calc='M' 
		Then IsNull(TIP.Metros,0) 
		Else IsNull(TIP.Qtde,0) End) 
	End Metros, 
	TIP.Vr_Unitario,
	TIP.Vr_Total,
	TP.Empresa_Auxiliar,
	TIP.Peso, 
	TIP.Acres_Desc, 
	CP.Razao_Nome_Cliente as Nome_Cliente,
	TIP.Item 
FROM 
	DBMicrodata_DGB.dbo.Fat_Pedido as TP 
	INNER JOIN DBMicrodata_DGB.dbo.Fat_Itens_Pedido TIP ON (TP.Empresa=TIP.Empresa) and (TP.Pedido=TIP.Pedido) 
	INNER JOIN DBMicrodata_DGB.dbo.Clientes_Principal CP ON (CP.Codigo_Cliente=TP.Cliente) 
	INNER JOIN DBMicrodata_DGB.dbo.Fat_Nat_Pedido NP ON (NP.Empresa=TP.Empresa and NP.Pedido=TP.Pedido) 
	left join (Select PS.Empresa,PS.Produto_Servico,Count(*) C From DBMicrodata_DGB.dbo.Produtos_Tecidos PS Where PS.Produto_Servico is NOT NULL Group By PS.Empresa,PS.Produto_Servico) X on (X.Empresa=TP.Empresa and X.Produto_Servico=TIP.Cod_Produto) 
Where 
	(TP.Flag_Emitido=1) and 
	--(TP.Data_Nota BETWEEN '2021-05-01T00:00:00' and '2021-05-12T00:00:00') and 
	(TIP.Base_Calc<>'-') and ( ((NP.NatOp = '1.101') and (NP.Seq = '1' )) Or ((NP.NatOp = '1.124') and 
	(NP.Seq = '1' )) Or ((NP.NatOp = '1.201') and 
	(NP.Seq = '1' )) Or ((NP.NatOp = '1.201') and 
	(NP.Seq = '2' )) Or ((NP.NatOp = '1.202') and 
	(NP.Seq = '1' )) Or ((NP.NatOp = '1.252') and 
	(NP.Seq = '1' )) Or ((NP.NatOp = '1.302') and 
	(NP.Seq = '1' )) Or ((NP.NatOp = '1.352') and 
	(NP.Seq = '1' )) Or ((NP.NatOp = '1.407') and 
	(NP.Seq = '1' )) Or ((NP.NatOp = '1.551') and 
	(NP.Seq = '1' )) Or ((NP.NatOp = '1.556') and 
	(NP.Seq = '1' )) Or ((NP.NatOp = '1.604') and 
	(NP.Seq = '1' )) Or ((NP.NatOp = '1.653') and 
	(NP.Seq = '1' )) Or ((NP.NatOp = '1.901') and 
	(NP.Seq = '1' )) Or ((NP.NatOp = '1.902') and 
	(NP.Seq = '1' )) Or ((NP.NatOp = '1.903') and 
	(NP.Seq = '1' )) Or ((NP.NatOp = '1.906') and 
	(NP.Seq = '1' )) Or ((NP.NatOp = '1.907') and 
	(NP.Seq = '1' )) Or ((NP.NatOp = '1.911') and 
	(NP.Seq = '1' )) Or ((NP.NatOp = '1.924') and 
	(NP.Seq = '1' )) Or ((NP.NatOp = '1.949') and 
	(NP.Seq = '1' )) Or ((NP.NatOp = '2.101') and 
	(NP.Seq = '1' )) Or ((NP.NatOp = '2.102') and 
	(NP.Seq = '1' )) Or ((NP.NatOp = '2.124') and 
	(NP.Seq = '1' )) Or ((NP.NatOp = '2.201') and 
	(NP.Seq = '1' )) Or ((NP.NatOp = '2.201') and 
	(NP.Seq = '2' )) Or ((NP.NatOp = '2.201') and 
	(NP.Seq = '3' )) Or ((NP.NatOp = '2.202') and 
	(NP.Seq = '1' )) Or ((NP.NatOp = '2.352') and 
	(NP.Seq = '1' )) Or ((NP.NatOp = '2.503') and 
	(NP.Seq = '1' )) Or ((NP.NatOp = '2.556') and 
	(NP.Seq = '1' )) Or ((NP.NatOp = '2.901') and 
	(NP.Seq = '1' )) Or ((NP.NatOp = '2.902') and 
	(NP.Seq = '1' )) Or ((NP.NatOp = '2.903') and 
	(NP.Seq = '1' )) Or ((NP.NatOp = '2.911') and 
	(NP.Seq = '1' )) Or ((NP.NatOp = '2.949') and 
	(NP.Seq = '1' )) Or ((NP.NatOp = '2.999') and 
	(NP.Seq = '1' )) Or ((NP.NatOp = '3.101') and 
	(NP.Seq = '1' )) Or ((NP.NatOp = '3.102') and 
	(NP.Seq = '1' )) Or ((NP.NatOp = '3.551') and 
	(NP.Seq = '1' )) Or ((NP.NatOp = '3.556') and 
	(NP.Seq = '1' )) Or ((NP.NatOp = '5.101') and 
	(NP.Seq = '1' )) Or ((NP.NatOp = '5.101') and 
	(NP.Seq = '2' )) Or ((NP.NatOp = '5.101') and 
	(NP.Seq = '3' )) Or ((NP.NatOp = '5.101') and 
	(NP.Seq = '4' )) Or ((NP.NatOp = '5.101') and 
	(NP.Seq = '5' )) Or ((NP.NatOp = '5.102') and 
	(NP.Seq = '1' )) Or ((NP.NatOp = '5.105') and 
	(NP.Seq = '1' )) Or ((NP.NatOp = '5.107') and 
	(NP.Seq = '1' )) Or ((NP.NatOp = '5.116') and 
	(NP.Seq = '1' )) Or ((NP.NatOp = '5.122') and 
	(NP.Seq = '1' )) Or ((NP.NatOp = '5.123') and 
	(NP.Seq = '1' )) Or ((NP.NatOp = '5.124') and 
	(NP.Seq = '1' )) Or ((NP.NatOp = '5.201') and 
	(NP.Seq = '1' )) Or ((NP.NatOp = '5.202') and 
	(NP.Seq = '1' )) Or ((NP.NatOp = '5.911') and 
	(NP.Seq = '1' )) Or ((NP.NatOp = '5.912') and 
	(NP.Seq = '1' )) Or ((NP.NatOp = '5.913') and 
	(NP.Seq = '1' )) Or ((NP.NatOp = '5.915') and 
	(NP.Seq = '2' )) Or ((NP.NatOp = '5.920') and 
	(NP.Seq = '1' )) Or ((NP.NatOp = '5.921') and 
	(NP.Seq = '1' )) Or ((NP.NatOp = '5.922') and 
	(NP.Seq = '1' )) Or ((NP.NatOp = '5.924') and 
	(NP.Seq = '1' )) Or ((NP.NatOp = '5.924') and 
	(NP.Seq = '2' )) Or ((NP.NatOp = '5.949') and 
	(NP.Seq = '1' )) Or ((NP.NatOp = '5.949') and 
	(NP.Seq = '2' )) Or ((NP.NatOp = '6.101') and 
	(NP.Seq = '1' )) Or ((NP.NatOp = '6.101') and 
	(NP.Seq = '2' )) Or ((NP.NatOp = '6.101') and 
	(NP.Seq = '4' )) Or ((NP.NatOp = '6.101') and 
	(NP.Seq = '5' )) Or ((NP.NatOp = '6.102') and 
	(NP.Seq = '1' )) Or ((NP.NatOp = '6.102') and 
	(NP.Seq = '2' )) Or ((NP.NatOp = '6.102') and 
	(NP.Seq = '3' )) Or ((NP.NatOp = '6.107') and 
	(NP.Seq = '1' )) Or ((NP.NatOp = '6.107') and 
	(NP.Seq = '3' )) Or ((NP.NatOp = '6.108') and 
	(NP.Seq = '1' )) Or ((NP.NatOp = '6.110') and 
	(NP.Seq = '1' )) Or ((NP.NatOp = '6.116') and 
	(NP.Seq = '1' )) Or ((NP.NatOp = '6.122') and 
	(NP.Seq = '1' )) Or ((NP.NatOp = '6.122') and 
	(NP.Seq = '2' )) Or ((NP.NatOp = '6.122') and 
	(NP.Seq = '3' )) Or ((NP.NatOp = '6.123') and 
	(NP.Seq = '1' )) Or ((NP.NatOp = '6.124') and 
	(NP.Seq = '1' )) Or ((NP.NatOp = '6.201') and 
	(NP.Seq = '1' )) Or ((NP.NatOp = '6.201') and 
	(NP.Seq = '2' )) Or ((NP.NatOp = '6.202') and 
	(NP.Seq = '1' )) Or ((NP.NatOp = '6.413') and 
	(NP.Seq = '1' )) Or ((NP.NatOp = '6.501') and 
	(NP.Seq = '1' )) Or ((NP.NatOp = '6.551') and 
	(NP.Seq = '1' )) Or ((NP.NatOp = '6.553') and 
	(NP.Seq = '1' )) Or ((NP.NatOp = '6.556') and 
	(NP.Seq = '1' )) Or ((NP.NatOp = '6.901') and 
	(NP.Seq = '1' )) Or ((NP.NatOp = '6.902') and 
	(NP.Seq = '1' )) Or ((NP.NatOp = '6.903') and 
	(NP.Seq = '1' )) Or ((NP.NatOp = '6.905') and 
	(NP.Seq = '1' )) Or ((NP.NatOp = '6.906') and 
	(NP.Seq = '1' )) Or ((NP.NatOp = '6.909') and 
	(NP.Seq = '1' )) Or ((NP.NatOp = '6.910') and 
	(NP.Seq = '1' )) Or ((NP.NatOp = '6.911') and 
	(NP.Seq = '1' )) Or ((NP.NatOp = '6.911') and 
	(NP.Seq = '2' )) Or ((NP.NatOp = '6.911') and 
	(NP.Seq = '3' )) Or ((NP.NatOp = '6.912') and 
	(NP.Seq = '1' )) Or ((NP.NatOp = '6.913') and 
	(NP.Seq = '1' )) Or ((NP.NatOp = '6.914') and 
	(NP.Seq = '1' )) Or ((NP.NatOp = '6.915') and 
	(NP.Seq = '1' )) Or ((NP.NatOp = '6.920') and 
	(NP.Seq = '1' )) Or ((NP.NatOp = '6.921') and 
	(NP.Seq = '1' )) Or ((NP.NatOp = '6.922') and 
	(NP.Seq = '1' )) Or ((NP.NatOp = '6.924') and 
	(NP.Seq = '1' )) Or ((NP.NatOp = '6.924') and 
	(NP.Seq = '2' )) Or ((NP.NatOp = '6.949') and 
	(NP.Seq = '1' )) Or ((NP.NatOp = '7.102') and 
	(NP.Seq = '1' )) Or ((NP.NatOp = '7.201') and 
	(NP.Seq = '1' ))) and ( (TP.Empresa = '13') Or (TP.Empresa = '14') ) and 
	TP.Tipo_Pedido = '1' 
GROUP BY
	TP.Empresa,
	TP.Pedido,
	TP.Cliente,
	TP.Nosso_Pedido,
	TIP.Cod_Produto,
	TP.Nr_Nota,
	TP.Data_Nota,
	TP.Vr_Nota, 
	TIP.Metros,
	TIP.Peso, 
	TIP.Qtde,
	TIP.Base_Calc,
	TIP.Vr_Unitario,
	TIP.Vr_Total,
	TP.Empresa_Auxiliar,
	TIP.Acres_Desc, 
	CP.Razao_Nome_Cliente,
	TIP.Item, 
	TIP.Peso, 
	X.C



GO


