use gdb023;
WITH cte AS (
SELECT dim_product.segment, COUNT(DISTINCT dim_product.product_code) AS product_count_2020
    FROM dim_product
    inner join fact_sales_monthly
    on dim_product.product_code=fact_sales_monthly.product_code
    WHERE  date >= '2020-01-01' AND date <= '2020-12-31' 
    group by segment
    ),cte2 AS (
    SELECT dim_product.segment, COUNT(DISTINCT dim_product.product_code) AS product_count_2021
    FROM dim_product
    inner join fact_sales_monthly
    on dim_product.product_code=fact_sales_monthly.product_code
    WHERE  date >= '2021-01-01' AND date <= '2021-12-31' 
    group by segment
    )
SELECT cte.segment, cte.product_count_2020, cte2.product_count_2021, cte2.product_count_2021 - cte.product_count_2020 AS difference
FROM cte
JOIN cte2 ON cte.segment = cte2.segment
ORDER BY difference DESC
    
    
    
    
    
    
    
    
    
    
    
    
    

    