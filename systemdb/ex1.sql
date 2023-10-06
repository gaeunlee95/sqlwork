-- 스키마:system
-- 테이블 생성
CREATE TABLE ex1(
    column1 CHAR(10),     -- 고정길이 문자(10Byte)
    column2 VARCHAR2(10)  -- 가변길이 문자(10Byte)
);

-- 데이터 추가
INSERT INTO ex1(column1, column2) VALUES ('abc', 'abc'); 
INSERT INTO ex1 VALUES ('당산', '당산');
-- 홑따옴표 사용!!
-- 실행한 후, 수정 시 명령어 사용 필요

-- 데이터 조회
SELECT column1, LENGTH(column1), column2, LENGTH(column2) FROM ex1;

-- 트랜잭션 : COMMIT, ROLLBACK
COMMIT;