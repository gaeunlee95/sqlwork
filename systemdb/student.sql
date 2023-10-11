-- 학생 테이블 생성
CREATE TABLE student(
    snumber NUMBER PRIMARY KEY,
    sname   VARCHAR2(20) NOT NULL,
    age     NUMBER(21)NOT NULL,
    gender  VARCHAR2(6)NOT NULL,
    address VARCHAR2(50),
    mname   VARCHAR2(30)NOT NULL,
    FOREIGN KEY(mname) REFERENCES major(mname) --외래키
);

-- 학생 추가
INSERT INTO student (snumber, sname, age, gender, address, mname)
VALUES (1001, '이강', 22, '여자', '서울시 강서구', '소프트웨어학과');
INSERT INTO student (snumber, sname, age, gender, address, mname)
VALUES (1002, '박대양', 34, '남자', '인천시 남구', '전기전자공학과');
INSERT INTO student (snumber, sname, age, gender, address, mname)
VALUES (1003, '우영우', 23, '여자', '', '전기전자공학과');
-- 부모키에 없는 데이터는 삽입 이상 발생
INSERT INTO student (snumber, sname, age, gender, address, mname)
VALUES (1003, '김산', 29, '남자', '서울시 동대문구', '회계학과');

-- 전체 학생 조회
SELECT * FROM student;

-- 이름이 이강인 학생의 학번,이름,나이를 조회하기
SELECT snumber, sname, age FROM student
WHERE sname = '이강';

-- 이름에 '우'가 포함된 학생의 모든 정보를 출력하시오
SELECT * FROM student
WHERE sname LIKE '%우%';

-- 나이가 30세 이상이고, 성별이 남자인 학생의 모든 정보를 출력하시오.
SELECT * FROM student
WHERE age >= 30 AND gender = '남자';

-- 주소가 없는 학생의 정보를 출력(NULL)
SELECT * FROM student
WHERE address IS NULL;

-- 주소가 없는 학생 삭제하기(공백문자)
DELETE FROM student
WHERE address = ' ';

-- 주소가 없는 학생의 정보 삭제
DELETE FROM student
WHERE address IS NULL;

-- 주소가 NULL인 데이터에 '수원시 영통구'로 입력
UPDATE student SET address = '수원시 영통구'
WHERE address IS NULL;

-- 정렬하기(오름차순-ASC, 내림차순-DESC)
-- ASC를 생략하면 오름차순
-- 학생의 나이가 적은 순으로 정렬하여 출력하시오
SELECT * FROM student
ORDER BY age;

-- 학과명이 '전기전자공학과' 학생중에서 나이가 많은 순으로 정렬하여 출력하시오
SELECT * FROM student
WHERE mname = '전기전자공학과'
ORDER BY age DESC;

-- 트랜잭션(롤백은 커밋하기전에 실행하면 취소, 복원이 됨)
ROLLBACK;
COMMIT;

DROP TABLE student;
