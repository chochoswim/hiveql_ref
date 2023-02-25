SELECT 
    COUNT(*) AS total_count
    COUNT(DISTINCT user_id) AS user_count
    SUM(score)
    AVG(score)
    MAX(score)
    MIN(score)
FROM a