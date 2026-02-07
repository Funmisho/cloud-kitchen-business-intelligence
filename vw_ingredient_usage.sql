CREATE OR REPLACE VIEW vw_ingredient_usage AS
SELECT
    ing.ingredient_id,
    ing.ingredient_name,
    SUM(r.quantity * oi.quantity) AS total_used
FROM order_items oi
JOIN items i ON oi.item_id = i.item_id
JOIN recipe r ON i.sku = r.recipe_id
JOIN ingredients ing ON r.ingredient_id = ing.ingredient_id
GROUP BY ing.ingredient_id, ing.ingredient_name;