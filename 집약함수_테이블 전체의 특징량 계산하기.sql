
-- 테이블 전체
SELECT 
    COUNT(*) AS total_count
    COUNT(DISTINCT user_id) AS user_count
    COUNT(DISTINCT product_id) AS product_count
    SUM(score)
    AVG(score)
    MAX(score)
    MIN(score)
FROM a

-- 그룹핑한 데이터 특징량 계산하기

SELECT 
    COUNT(*) AS total_count
    COUNT(DISTINCT product_id) AS product_count
    SUM(score)
    AVG(score)
    MAX(score)
    MIN(score)
FROM a
GROUP BY user_id