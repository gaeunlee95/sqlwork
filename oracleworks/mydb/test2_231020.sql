//test2_231020

-- 두 개의 테이블을 조인 EMPNO, EMPNAME, DEPTNO, DEPTNAME 컬럼을 ANSI 구문

-- 1. 조인의 종류
-- 내부조인

-- 2. 문제가 발생한 원인
-- 각 테이블의 부서번호를 나타내는 칼럼명이(EMPLOYEE 테이블 : DEPTNO,DEPARTMENT 테이블 : DEPTCODE)
-- 상이하기 때문에 USING 구문 사용 불가

-- 3. 해결할 수 있는 조치사항
-- ANSI구문(JOIN ~ ON) 혹은 오라클 전용(WHERE ~ = ) 구문을 사용

-- 4. 조치사항이 적용된 ANSI(표준) 구문
SELECT a.EMPNO, 
       a.EMPNAME, 
       a.DEPTNO, 
       b.DEPTNAME
FROM EMPLOYEE1 a JOIN DEPARTMENT1 b
 ON a.DEPTNO = b.DEPTCODE;

-- 5. 오라클 전용 구문
SELECT a.EMPNO, 
       a.EMPNAME, 
       a.DEPTNO, 
       b.DEPTNAME
FROM EMPLOYEE1 a, DEPARTMENT1 b
WHERE a.DEPTNO = b.DEPTCODE;


CREATE TABLE DEPARTMENT1(
  DEPTCODE NUMBER,
  DEPTNAME VARCHAR2(10)
  -- DEPTNO NUMBER
);
 
DROP TABLE DEPARTMENT1;

CREATE TABLE EMPLOYEE1(
  EMPNO NUMBER,
  EMPNAME VARCHAR2(10),
  DEPTNO NUMBER
);
SELECT * FROM DEPARTMENT1;
SELECT * FROM EMPLOYEE1;

INSERT INTO DEPARTMENT1 VALUES(11, '인사팀'); 
INSERT INTO EMPLOYEE1 VALUES(001, '이씨', 11); 

SELECT a.EMPNO, 
       a.EMPNAME, 
       a.DEPTNO, 
       b.DEPTNAME
FROM EMPLOYEE1 a, DEPARTMENT1 b
WHERE a.DEPTNO = b.DEPTCODE;


SELECT EMPNO, 
       EMPNAME, 
       DEPTNO, 
       DEPTNAME
FROM EMPLOYEE1 JOIN DEPARTMENT1 
USING (DEPTNO);

