
/*PROJETO INTEGRAÇÃO SQL SERVER e EXCEL

	1) Definindo Indicadores do Projeto:

		a) Total de Vendas Internet por Categoria
		b) Receita Total Internet por mês do Pedido
		c) Receita e Custo Total Internet por país
		d) Total de vendas Internet por sexo
		
	-- OBS : O ano de análise será apenas 2013 

	2) Definindo tabelas a serem analizadas: 
		
		Tabela 1: FactInternetSales
		Tabela 2: DimCustomer
		Tabela 3: DimSalesTerritory
		Tabela 4: DimProductCategory 

*/

USE AdventureWorksDW2014

SELECT 
	FactInternetSales.SalesOrderNumber AS 'NÚMERO DO PEDIDO',
	FactInternetSales.OrderDate AS 'DATA PEDIDO',
	DimCustomer.FirstName + ' ' + LastName AS 'NOME CLIENTE',
	DimProductCategory.EnglishProductCategoryName AS 'CATEGORIA DO PRODUTO',
	FactInternetSales.OrderQuantity AS 'QTD. VENDIDA',
	FactInternetSales.TotalProductCost AS 'CUSTO VENDA',
	FactInternetSales.SalesAmount AS 'RECEITA VENDA'
	
FROM 
	FactInternetSales
INNER JOIN DimProduct
	ON	FactInternetSales.ProductKey = DimProduct.ProductKey
		INNER JOIN DimProductSubcategory
			ON DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey
				INNER JOIN DimProductCategory
					ON DimProductSubcategory.ProductCategoryKey = DimProductCategory.ProductCategoryKey
INNER JOIN DimCustomer
	ON FactInternetSales.CustomerKey = DimCustomer.CustomerKey
INNER JOIN DimSalesTerritory
	ON FactInternetSales.SalesTerritoryKey = DimSalesTerritory.SalesTerritoryKey
WHERE YEAR(OrderDate) = 2013
