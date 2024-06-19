/*query1*/
SELECT 
  a.aisle, 
  COUNT(op.product_id) AS total_products_ordered
FROM 
  aisles AS a
JOIN 
  products AS p ON a.aisle_id = p.aisle_id
JOIN 
  order_products AS op ON p.product_id = op.product_id
GROUP BY 
  a.aisle
ORDER BY 
  total_products_ordered DESC
LIMIT 3;

/*query2*/
SELECT AVG(product_count) AS average_products_per_order, MAX(product_count) AS max_products_per_order
FROM (
    SELECT order_id, COUNT(product_id) AS product_count
    FROM order_products
    GROUP BY order_id
) AS order_product_counts;
