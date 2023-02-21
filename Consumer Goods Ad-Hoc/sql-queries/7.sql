select 
 month(fact_sales_monthly.date) as Month,
 year(fact_sales_monthly.date) as year,
 dim_customer.customer,
sum(fact_sales_monthly.sold_quantity*fact_gross_price.gross_price) as "Gross Sales Amount"
from fact_sales_monthly
inner join fact_gross_price
on fact_gross_price.product_code=fact_sales_monthly.product_code
inner join dim_customer
on dim_customer.customer_code=fact_sales_monthly.customer_code
where customer= "Atliq Exclusive"


GROUP BY MONTH(date), YEAR(date)
ORDER BY Year, Month
