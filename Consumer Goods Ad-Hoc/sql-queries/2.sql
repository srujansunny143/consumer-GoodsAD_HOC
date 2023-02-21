use gdb023;
with unique_product_2020 as(
select count(distinct product_code) as unique_product_2020
from fact_sales_monthly
where fiscal_year=2020
),
 unique_product_2021 as (
select count(distinct product_code) as unique_product_2021
from fact_sales_monthly
where fiscal_year=2021
)
select unique_product_2020,unique_product_2021,
((unique_product_2021-unique_product_2020)/unique_product_2020*100) as percentage_chg
from unique_product_2020,unique_product_2021
