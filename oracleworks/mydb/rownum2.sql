// rownum2

SELECT * FROM drink;

-- 테이블 복사
CREATE TABLE drink2 AS
SELECT * FROM drink;

SELECT * FROM drink2;

-- 재귀복사(INSERT INTO ~ SELECT) : VALUES 사용안함
INSERT INTO drink2
(SELECT * FROM drink2);

-- xx
INSERT INTO drink
(SELECT * FROM drink2);

-- ROWNUM (SUDO COLUMN - 제공된 관리자 칼럼)
SELECT ROWNUM, drink_code, drink_name
FROM drink2
WHERE ROWNUM <= 10;
-- == WHERE ROWNUM >= 1 AND ROWNUM <= 10;
-- WHERE ROWNUM >=2 AND ROWNUM <= 10; -- 1이 포함되어야 검색이 됨 / 실행X

-- FROM 절 서브쿼리 사용 - 인라인뷰
-- 왜 rn을 사용하는가? rownum은 1이 있어야 검색이되므로 rn이라는 변수(별칭) 사용
SELECT rn, drink_code, drink_name
FROM (SELECT ROWNUM rn, drink_code, drink_name FROM drink2) drink2
WHERE rn >= 11 AND rn <= 20; -- 별칭(변수) 사용 검색됨
-- 칼럼명이 ROWNUM인 칼럼은 1~이 있어야 검색이 되므로,
-- ROWNUM에 별칭을 주고, 주어진 별칭을 이용하여 검색에 사용

SELECT *
FROM (SELECT ROWNUM rn, drink_code, drink_name FROM drink2) drink2
WHERE rn >= 11 AND rn <= 20; -- 별칭(변수) 사용 검색됨

-- 실행 불가ㅠ.ㅠ
SELECT ROWNUM rn, drink_code, drink_name 
FROM drink2
WHERE rn >= 11 AND rn <= 20;


