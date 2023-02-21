with cte as(select product_code,sum(sold_quantity) as total_sold_quantity
from fact_sales_monthly
where fiscal_year=2021
group by product_code
),
 cte2 as(select cte.product_code,cte.total_sold_quantity,dim_product.division,dim_product.product
from dim_product
join cte
on dim_product.product_code=cte.product_code
),
rank_order as(select product_code,total_sold_quantity,division,product,
        RANK() OVER (PARTITION BY division ORDER BY total_sold_quantity DESC)  as rank_order
        from cte2
        )
        select product_code,total_sold_quantity,division,product,rank_order
        from rank_order
        where rank_order<=3;
        

