-- 현재 시간 불러오기
CURRENT_DATE AS dt

-- 지정한 값의 날짜/시각 데이터 추출하기
CAST('2023-01-30' AS date) AS dt
CAST('2023-01-30 12:00:00' AS timestamp) AS stamp

-- 날짜/시각에서 특정 필드 추출하기
YEAR(stamp) AS year
MONTH(stamp) AS month
DAY(stamp) AS day
HOUR(stamp) AS hour 

-- substr 함수 사용해서 추출하기
substr(stamp, 1, 4) AS year
substr(stamp, 6, 2) AS month
substr(stamp, 9, 2) AS day
substr(stamp, 12, 2) AS hour
substr(stamp, 1, 7) AS year_month

-- 날짜 더하기 빼기
CAST(register_stamp AS timestamp) AS register_stamp
from_unixtime(unix_timestmap(register_stamp) + 60 * 60 ) AS after_1hour
from_unixtime(unix_timestmap(register_stamp) - 30 * 60 ) AS before_30min
        --second로 변환하여 생각

-- 두 날짜 데이터의 차이
datediff(CURRENT_DATE(), to_date(register_stamp)) AS diff_days