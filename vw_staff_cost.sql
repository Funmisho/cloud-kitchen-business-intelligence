CREATE OR REPLACE VIEW vw_staff_cost AS
SELECT
    r.shift_date,
    s.staff_id,
    s.first_name,
    s.last_name,
    s.role,
    sh.shift_id,
    sh.start_time,
    sh.end_time,
    TIMESTAMPDIFF(HOUR, sh.start_time, sh.end_time) AS shift_hours,
    s.hourly_rate,
    TIMESTAMPDIFF(HOUR, sh.start_time, sh.end_time) * s.hourly_rate AS shift_cost
FROM rota r
JOIN staff s ON r.staff_id = s.staff_id
JOIN shifts sh ON r.shift_id = sh.shift_id;
