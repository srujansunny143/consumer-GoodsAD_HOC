 SELECT 
     CASE 
       WHEN MONTH(date) BETWEEN 1 AND 3 THEN 'Q1'
       WHEN MONTH(date) BETWEEN 4 AND 6 THEN 'Q2'
       WHEN MONTH(date) BETWEEN 7 AND 9 THEN 'Q3'
       ELSE 'Q4'
     END AS Quarter,
     SUM(sold_quantity) AS total_sold_quantity
   FROM fact_sales_monthly
   WHERE YEAR(date) = 2020
   GROUP BY Quarter