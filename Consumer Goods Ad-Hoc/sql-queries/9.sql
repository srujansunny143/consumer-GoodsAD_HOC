with cte as(
select dim_customer.channel,sum(fact_gross_price.gross_price*fact_sales_monthly.sold_quantity) as Gross_sales_mln
from dim_customer
join fact_sales_monthly
on dim_customer.customer_code=fact_sales_monthly.customer_code
join fact_gross_price
on fact_gross_price.product_code=fact_sales_monthly.product_code
where fact_sales_monthly.fiscal_year=2021
group by dim_customer.channel
)
select cte.channel,cte.Gross_sales_mln,(cte.Gross_sales_mln/(select sum(Gross_sales_mln) from cte)*100) as pecentage_Total
from cte;