/*query1*/
SELECT AVG(field2) AS mean_products_per_aisle
FROM aisles;
SELECT
  AVG( (field2 - (SELECT AVG(field2) FROM aisles)) * (field2 - (SELECT AVG(field2) FROM aisles)) )
  / (COUNT(field2) - 1) 
  AS sample_variance
FROM aisles;

/*query2*/
SELECT
 d.department,
 SUM(CASE WHEN o.order_hour_of_day BETWEEN 5 AND 11 THEN 1 ELSE 0 END) AS 
morning_orders,
 SUM(CASE WHEN o.order_hour_of_day BETWEEN 17 AND 23 THEN 1 ELSE 0 END) 
AS evening_orders
FROM
 orders o
JOIN
 order_products op ON o.order_id = op.order_id
JOIN
 products p ON op.product_id = p.product_id
JOIN
 departments d ON p.department_id = d.department_id
GROUP BY
 d.department
ORDER BY
 d.department