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

-- ORDER BY 구문과 집약 함수 조합하기(-101p)
SELECT
      product_id 
    , score
    -- 점수 순일한 순위를 붙임
    , ROW_NUMBER() OVER(ORDER BY score DESC) AS row
    -- 순위 상위부터의 누계점수 계산하기
    , SUM(score) OVER(ORDER BY score DESC ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
    -- 현재 행과 앞 뒤의 행이 가진 값을 기반으로 평균 점수 계산하기
    , AVG(score) OVER(ORDER BY score DESC ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING)
    -- 순위가 높은 상품 ID 추출하기
    , FIRST_VALUE(product_id) OVER(ORDER BY score DESC ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING)
    -- 순위가 낮은 상품 ID 추출하기
    , LAST_VALUE(product_id) OVER(ORDER BY score DESC ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING)
    
    
    -- ROWS BETWEEN %start% AND %end%  가 프레임 지정의 가장 기본적인 형태
    -- start 와 end 에 들어갈 수 있는 것들
    -- CURRENT ROW 현재의 행
    -- n PRECEDING // n FOLLOWING >> n행 앞//뒤
    -- UNBOUNDED PRECEDING // UNBOUNDED PRECEDING >> 이전//이후 행 전부
