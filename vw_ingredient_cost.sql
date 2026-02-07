CREATE OR REPLACE VIEW vw_ingredient_cost AS
SELECT
    u.ingredient_id,
    u.ingredient_name,
    u.total_used,
    ing.unit_cost,
    (u.total_used * ing.unit_cost) AS total_cost
FROM vw_ingredient_usage u
JOIN ingredients ing ON u.ingredient_id = ing.ingredient_id;
