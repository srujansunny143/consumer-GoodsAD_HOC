with cutsomer_discount as (
  SELECT dim_customer.customer_code, dim_customer.customer, AVG(fact_pre_invoice_deductions.pre_invoice_discount_pct) as average_discount_percentage
    FROM dim_customer
    inner join fact_pre_invoice_deductions
    on dim_customer.customer_code=fact_pre_invoice_deductions.customer_code
     
    WHERE fact_pre_invoice_deductions.fiscal_year = 2021 AND dim_customer.market = 'India'
    GROUP BY dim_customer.customer_code, dim_customer.customer
    ORDER BY average_discount_percentage DESC
    )
    SELECT customer_code, customer, average_discount_percentage
FROM cutsomer_discount
LIMIT 5
