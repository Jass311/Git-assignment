<?xml version="1.0" encoding="UTF-8"?><sqlb_project><db path="/Users/shikshaadhikari/Documents/Practice Assignment.db" readonly="0" foreign_keys="1" case_sensitive_like="0" temp_store="0" wal_autocheckpoint="1000" synchronous="2"/><attached/><window><main_tabs open="structure browser pragmas query" current="3"/></window><tab_structure><column_width id="0" width="300"/><column_width id="1" width="0"/><column_width id="2" width="100"/><column_width id="3" width="974"/><column_width id="4" width="0"/><expanded_item id="0" parent="1"/><expanded_item id="1" parent="1"/><expanded_item id="2" parent="1"/><expanded_item id="3" parent="1"/></tab_structure><tab_browse><current_table name="4,6:mainaisles"/><default_encoding codec=""/><browse_table_settings><table schema="main" name="aisles" show_row_id="0" encoding="" plot_x_axis="" unlock_view_pk="_rowid_"><sort/><column_widths><column index="1" value="48"/><column index="2" value="155"/></column_widths><filter_values/><conditional_formats/><row_id_formats/><display_formats/><hidden_columns/><plot_y_axes/><global_filter/></table></browse_table_settings></tab_browse><tab_sql><sql name="SQL 1">--When combined
WITH frozen_dept AS
(
SELECT department_id FROM departments WHERE department = 'frozen'
),
bakery_dept AS
(
SELECT department_id FROM departments WHERE department = 'bakery'
),
frozen_orders AS
(
SELECT DISTINCT op.order_id FROM order_products op JOIN products p
ON op.product_id = p.product_id WHERE p.department_id =
(SELECT department_id FROM frozen_dept)
),
bakery_orders AS
(
SELECT DISTINCT op.order_id FROM order_products op JOIN products p
ON op.product_id = p.product_id WHERE p.department_id =
(SELECT department_id FROM bakery_dept)
)
SELECT COUNT(*) AS total_orders_with_both FROM frozen_orders fo JOIN
bakery_orders bo
ON fo.order_id = bo.order_id;

--When kept separate

WITH frozen_dept AS
(
SELECT department_id FROM departments WHERE department = 'frozen'
),
bakery_dept AS
(
SELECT department_id FROM departments WHERE department = 'bakery'
),
frozen_orders AS
(
SELECT DISTINCT op.order_id FROM order_products op JOIN products p
ON op.product_id = p.product_id WHERE p.department_id =
(SELECT department_id FROM frozen_dept)
),
bakery_orders AS
(
SELECT DISTINCT op.order_id FROM order_products op JOIN products p
ON op.product_id = p.product_id WHERE p.department_id =
(SELECT department_id FROM bakery_dept)
)
SELECT
(SELECT COUNT(*) order_id FROM frozen_orders) AS orders_with_frozen,
(SELECT COUNT(*) order_id FROM bakery_orders) AS orders_with_bakery;</sql><current_tab id="0"/></tab_sql></sqlb_project>
