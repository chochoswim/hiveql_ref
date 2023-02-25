SELECT 
    user_id
    ,product_id
    -- 개별 리뷰 점수
    ,score
    -- 전체 평균 리뷰 점수
    ,AVG(score) OVER() AS avg_score
    -- 사용자의 평균 리뷰 점수
    ,AVG(score) OVER(PARTITION BY user_id) AS avg_avg_score
FROM a

-- 윈도우 함수 이용하기

SELECT 
    product_id
    ,score
    -- 점수 순서로 유일한 순위를 붙임
    , ROW_NUMBER()          OVER(ORDER BY score DESC) AS row_number 
    -- 같은 순위를 허용
    , RANK()                OVER(ORDER BY score DESC) AS rank
    -- 현재 행보다 앞에 있는 행의 값 추출하기
    , LAG(product_id)       OVER(ORDER BY score DESC) AS LAG
    -- 현재 행보다 위에 있는 행의 값 추출하기
    , LEAD(product_id)       OVER(ORDER BY score DESC) AS LAG
FROM as