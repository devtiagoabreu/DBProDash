USE [DBProDash]
GO

/****** Object:  StoredProcedure [dbo].[uspFaturamento]    Script Date: 12/05/2021 12:07:13 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[uspFaturamento]
    
    @dataInicial varchar(15) -- '02/05/2021' EXEMPLO  DE ENTRADA DE PARAMETRO
      
AS   

SELECT 
	(SUM(ISNULL(Vr_Total,0)) + SUM(ISNULL(Acres_Desc,0))) AS Faturamento
FROM 
	vwFaturamento
WHERE
	Data_Nota BETWEEN CAST(DATEADD(DAY,1,EOMONTH(CONVERT(DATETIME, @dataInicial, 103),-1)) AS DATETIME) AND  CAST(EOMONTH(CONVERT(DATETIME, @dataInicial, 103)) AS DATETIME)



GO


