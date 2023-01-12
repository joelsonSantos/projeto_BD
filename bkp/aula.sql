
-- WITH prod AS (SELECT * FROM produtos p) SELECT * FROM prod;

SELECT * FROM vendas v LIMIT 10;

SELECT 
	"ship-country" , 
	count(*) AS n_vendas,
	stddev("Qty") AS desvio_quantidade_de_vendas,
	avg("Qty") AS media_quantidade_de_vendas
FROM vendas v 
GROUP BY 1
ORDER BY n_vendas DESC;


SELECT 
	"ship-country" , 
	count(*) AS n_vendas,
	-- stddev() AS desvio_quantidade_de_vendas,
	avg("Qty") AS media_quantidade_de_vendas
FROM vendas v
WHERE v."Codigo" IN (SELECT "Codigo" FROM produtos p)
GROUP BY 1
ORDER BY n_vendas DESC;


-- (SELECT string_agg(files.filename, ',')
--        FROM files 
--        WHERE files.folder_id = folders.id) as files

SELECT
(SELECT "Produto" FROM produtos p WHERE v."Codigo" = p."Codigo") AS nome_produto,
*
FROM vendas v;


SELECT 
	"ship-country", 
	(SELECT string_agg("Codigo", ',') FROM produtos p) AS codigos_concatenados
FROM vendas v;




-- isso não funciona
SELECT 
	"ship-country" , 
	count(*) AS n_vendas,
	stddev(count(*)) AS desvio_quantidade_de_vendas,
	avg("Qty") AS media_quantidade_de_vendas
FROM vendas v 
GROUP BY 1
ORDER BY n_vendas DESC;


WITH 

sumario_vendas_por_pais AS (
	SELECT 
		"ship-country" , 
		count(*) AS n_vendas
	FROM vendas v 
	GROUP BY 1
	ORDER BY n_vendas DESC
),

media_devio_vendas AS (
	SELECT
		avg(n_vendas) AS media,
		stddev(n_vendas) AS devio
	FROM sumario_vendas_por_pais
) 

SELECT * FROM media_devio_vendas;













-- JOIN (inner, left, right...)

SELECT count(*) FROM vendas;


SELECT 
	v."Order ID",
	v."Date",
	p."Produto",
	v."Codigo",
	v."Courier Status",
	v."Qty"
FROM vendas v
INNER JOIN produtos p
	ON v."Codigo" = p."Codigo" 
	
	
	
SELECT 
	v."Order ID",
	v."Date",
	p."Produto",
	v."Codigo",
	v."Courier Status",
	v."Qty"
FROM vendas v
LEFT JOIN produtos p
	ON v."Codigo" = p."Codigo";
	
SELECT * FROM produtos;
	
SELECT 
	count(*)
FROM vendas v
INNER JOIN produtos p
	ON v."Codigo" = p."Codigo" 	
	
-- INSERT INTO produtos ("Codigo", "Produto", "Preco") VALUES ('B0', 'AULA', '$1.00');
	
SELECT * FROM produtos p WHERE "Codigo" = 'B0'

SELECT 
	v."Order ID",
	v."Date",
	p."Produto",
	p."Preco",
	v."Codigo",
	v."Courier Status",
	v."ship-country",
	v."Qty"
FROM vendas v
INNER JOIN produtos p
	ON v."Codigo" = p."Codigo" 
ORDER BY p."Codigo" ASC
;

SELECT 
	v."Order ID",
	v."Date",
	p."Produto",
	v."Codigo",
	v."Courier Status",
	v."Qty"
FROM vendas v
LEFT JOIN produtos p
	ON v."Codigo" = p."Codigo" 
WHERE p."Codigo" = 'B0'
ORDER BY p."Codigo" ASC
;

SELECT 
	v."Order ID",
	v."Date",
	p."Produto",
	v."Codigo",
	v."Courier Status",
	v."Qty"
FROM vendas v
RIGHT JOIN produtos p
	ON v."Codigo" = p."Codigo" 
-- WHERE p."Codigo" = 'B0'
ORDER BY p."Codigo" ASC
;

WITH 

sumario_vendas_por_pais AS (
	SELECT 
		"ship-country" , 
		count(*) AS n_vendas
	FROM vendas v 
	GROUP BY 1
	ORDER BY n_vendas DESC
)

SELECT sumario_vendas_por_pais;


CREATE VIEW view_sumario_vendas_por_pais AS (
	SELECT 
		"ship-country" , 
		count(*) AS n_vendas
	FROM vendas v 
	GROUP BY 1
	ORDER BY n_vendas DESC
)


CREATE TABLE t_sumario_vendas_por_pais AS (
	SELECT 
		"ship-country" , 
		count(*) AS n_vendas
	FROM vendas v 
	GROUP BY 1
	ORDER BY n_vendas DESC
)







	
	
	
