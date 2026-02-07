CREATE OR REPLACE VIEW vw_inventory_status AS
SELECT
    inv.ingredient_id,
    ing.ingredient_name,
    inv.starting_stock,
    u.total_used,
    (inv.starting_stock - u.total_used) AS stock_remaining,
    inv.reorder_level,
    CASE
        WHEN (inv.starting_stock - u.total_used) <= inv.reorder_level
        THEN 'REORDER'
        ELSE 'OK'
    END AS stock_status
FROM inventory inv
JOIN ingredients ing ON inv.ingredient_id = ing.ingredient_id
LEFT JOIN vw_ingredient_usage u ON inv.ingredient_id = u.ingredient_id;
