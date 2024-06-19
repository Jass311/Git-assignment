/*query1*/
SELECT 
COUNT (*) AS Reorder_Count, p.product_name
FROM Reorder_Count, p. product_name
order_ products op
JOIN products p ON op. product_ id = p.product_id
WHERE
op. reordered = TRUE
GROUP BY
op. product_id, p. product_ name
ORDER BY
Reorder_Count DESC
LIMIT 5

/*query2*/
SELECT COUNT FROM
(*) AS Reorder_Count, p. product_name
order_products 0p
JOIN products p ON op. product_ id = p.product_id
op. reordered = TRUE
GROUP BY
op. product_id, p.product_name
ORDER BY
Reorder_ Count DESC
LIMIT 3
