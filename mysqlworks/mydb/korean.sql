use mydb;

-- 주문테이블
CREATE TABLE 주문테이블 (
    주문번호 VARCHAR(16),
    고객번호 VARCHAR(16),
    주문일  VARCHAR(16),
    주문가격 INT(15)
);

ALTER TABLE 주문테이블 ADD 배송완료일 VARCHAR(16);

-- 테이블 복사
CREATE TABLE 신규테이블 AS SELECT * FROM 주문테이블;

SELECT * FROM 주문테이블;
SELECT * FROM 신규테이블;

DROP TABLE 주문테이블;