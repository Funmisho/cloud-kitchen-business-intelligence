CREATE OR REPLACE VIEW vw_order_sales AS
SELECT
    o.order_id,
    o.order_datetime,
    DATE(o.order_datetime) AS order_date,
    HOUR(o.order_datetime) AS order_hour,
    o.payment_method,
    i.item_id,
    i.item_name,
    i.category,
    oi.quantity,
    oi.unit_price_at_time,
    (oi.quantity * oi.unit_price_at_time) AS line_revenue
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN items i ON oi.item_id = i.item_id;
