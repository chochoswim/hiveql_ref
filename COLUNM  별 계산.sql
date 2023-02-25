
-- 열끼리의 대소 비교
CASE
    WHEN q1 < q2 THEN '+'
    WHEN q1 = q2 THEN ''
    ELSE '-'
END AS judgje

-- 열간 
greatest(q1,q2,q3,q4) AS gratest_sales
least(q1,q2,q3,q4) AS least_sales
