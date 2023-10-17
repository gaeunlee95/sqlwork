-- 여름 학기 테이블
CREATE TABLE summer_class(
    sid      NUMBER,       -- 학번
    subject  VARCHAR2(20), -- 수강과목
    price    NUMBER        -- 수강료
);

INSERT INTO summer_class VALUES (100, 'C', 30000);
INSERT INTO summer_class VALUES (101, 'Java', 45000);
INSERT INTO summer_class VALUES (200, 'Python', 40000);
INSERT INTO summer_class VALUES (201, 'Java', 45000);

-- 계절학기를 수강하는 학생의 학번과 수강하는 과목은?
SELECT sid 학번, subject 과목 FROM summer_class;

--'Python' 강좌의 수강료는?
SELECT price 수강료 FROM summer_class
WHERE subject = 'Python';

-- 삽입 이상
-- C++ 강좌 개설 : 신청한 학생이 없음
INSERT INTO summer_class VALUES (NULL, 'C++', 35000);

-- 여름학기를 듣는 학생수와 수강료 총액은?
SELECT COUNT(*) 학생수, SUM(price) 수강료총액 FROM summer_class;

-- 200번 학생이 수강취소(삭제)
DELETE FROM summer_class
WHERE sid = 200;

-- 삭제 이상
--'Python' 강좌의 수강료는?
SELECT price 수강료 FROM summer_class
WHERE subject = 'Python';

-- 학생 3명, 튜플 4개 불일치 발생
SELECT COUNT(*) 수강인원
FROM summer_class;

SELECT COUNT(sid) 수강인원
FROM summer_class;

-- 수정 이상
-- Java 수강료를 45,000원에서 40,000원으로 변경
UPDATE summer_class SET price = 40000
WHERE subject = 'Java';

-- 만약 UPDATE문을 다음처럼 이상 현상 발생
-- 1건만 수정
UPDATE summer_class SET price = 40000
WHERE subject = 'Java'
    AND sid = 101;
    
-- Java 수강료는?
SELECT price FROM summer_class
WHERE subject = 'Java';

SELECT * FROM summer_class;

COMMIT;
ROLLBACK;
