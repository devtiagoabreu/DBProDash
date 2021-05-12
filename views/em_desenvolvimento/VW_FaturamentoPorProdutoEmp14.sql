USE [DBProDash]
GO

/****** Object:  View [dbo].[VW_FaturamentoPorProdutoEmp14]    Script Date: 05/11/2021 16:25:12 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO


CREATE VIEW [dbo].[VW_FaturamentoPorProdutoEmp14]
AS
SELECT 
  a.Tipo_Pedido, 
  CASE When a.Tipo_Pedido = '1' Then (SELECT IsNull(Tipo_Pedido_1, 'Vazio') FROM DBMicrodata_DGB.dbo.Fat_Parametros)
       When a.Tipo_Pedido = '2' Then (SELECT IsNull(Tipo_Pedido_2, 'Vazio') FROM DBMicrodata_DGB.dbo.Fat_Parametros)
       When a.Tipo_Pedido = '3' Then (SELECT IsNull(Tipo_Pedido_3, 'Vazio') FROM DBMicrodata_DGB.dbo.Fat_Parametros)
       When a.Tipo_Pedido = '4' Then (SELECT IsNull(Tipo_Pedido_4, 'Vazio') FROM DBMicrodata_DGB.dbo.Fat_Parametros)
                                Else (SELECT IsNull(Tipo_Pedido_5, 'Vazio') FROM DBMicrodata_DGB.dbo.Fat_Parametros)
  END as Tipo_Pedido_Desc,    
  a.Empresa, 
  a.Empresa_Auxiliar, 
  a.Pedido, 
  a.Seu_Pedido, 
  a.Nosso_Pedido, 
  a.Cliente Cod_Cliente, 
  c.Razao_Nome_Cliente,    
  DatePart(yyyy,a.Data_Emissao) Data_Emissao_Ano, 
  DatePart(mm,a.Data_Emissao)   Data_Emissao_Mes, 
  a.Data_Emissao, a.Data_Nota, a.Data_Saida, 
  a.Nr_Nota, a.Vr_Nota, a.Soma_Itens, 
  a.Porc_Complem, a.Vr_Complem, 
  a.Porc_Desconto, a.Vr_Desconto, 
  a.Vr_Frete, 
  a.Vr_Seguro,   
  a.Vr_ICMS, a.Fator_ICMS, a.Aliq_ICMS, a.Base_ICMS, 
  a.Base_IPI, 
  b.Item, b.Cod_Produto, b.Des_Produto, b.Unidade, b.Metros, b.Qtde, b.Peso, b.Base_Calc, 
  QMP_Quantidade = ((Case When b.Base_Calc = 'Q' Then b.Qtde   Else
                    (Case When b.Base_Calc = 'M' Then b.Metros Else b.Peso End) End)),
  b.Vr_Unitario, b.Vr_Unitario2, b.Vr_Total Vr_Total_Item,  
  b.Acres_Desc,   
  b.Situacao, 
  b.Cor, 
  b.Desenho, 
  b.Categoria, 
  b.Aliq_Reducao, 
  IsNull(b.NatOp, '') +'-'+ IsNull(b.Seq, '') NatOperacao,
  i.Descricao Fat_Itens_GrupoNatOP,
  d.Vendedor_NF_Vendedores, 
  e.Nome_Vendedores, 
  d.Tipo_Comissao_NF_Vend,
  d.Valor_Comissao_NF_Vend,
  f.Porcentagem_Comissoes,
  f.Porcentagem_Comissoes_S,
  g.Descricao_Pagto,
  a.Cond_Pagto_Extenso, a.Serie
FROM DBMicrodata_DGB.dbo.Fat_Pedido A
  Inner Join DBMicrodata_DGB.dbo.Fat_Itens_Pedido B on (a.Empresa = b.Empresa and a.Pedido = b.Pedido)
  Inner Join DBMicrodata_DGB.dbo.Clientes_Principal C on (a.Cliente = c.Codigo_Cliente)
  Left Join DBMicrodata_DGB.dbo.Fat_Vend_Pedido D on (a.Empresa = d.Empresa_NF_Vendedores and a.Pedido = d.Doc_NF_Vendedores)
  Left Join DBMicrodata_DGB.dbo.Rec_Vendedores E on (d.Vendedor_NF_Vendedores = e.Codigo_Vendedores)
  Left Join DBMicrodata_DGB.dbo.Rec_Comissoes F on (d.Vendedor_NF_Vendedores = f. Vendedor_Comissoes and d.Tipo_Comissao_NF_Vend = f.Tipo_Comissoes)
  Left Join DBMicrodata_DGB.dbo.Condicoes_Pagto G on (a.Cod_Parcela = g.Codigo_Pagto)
  Left Join DBMicrodata_DGB.dbo.Fat_Itens_GrupoNatOP H on ((IsNull(b.NatOp, '') +'-'+ IsNull(b.Seq, '')) = (IsNull(h.NatOp, '') +'-'+ IsNull(h.Seq, '')))
  Left Join DBMicrodata_DGB.dbo.Fat_GrupoNatOP I on (h.codigo = i.codigo)

WHERE a.Empresa IN ('14') 
  and a.Ent_Sai = 'S' 
  and a.Flag_Emitido = '1' 
  and IsNull(a.Nr_Nota, '') <> ''



GO


