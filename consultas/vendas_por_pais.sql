CREATE VIEW vendas_por_pais AS (
	SELECT
		"ship-country" AS pais,
		SUM("Qty") AS vendas_por_pais
	FROM vendas
	WHERE "Courier Status" != 'Cancelled'
	GROUP BY 1
	ORDER BY 1 DESC
);