-- test1

-- 1. 구문에
-- 비밀번호를 설정하는 구문이 없음 / 아래와 같이 IDENTIFIED BY 1234 를 추가해줌
CREATE USER c##sample IDENTIFIED BY 1234;

-- 로그인 권한 부여
GRANT CREATE SESSION TO sample;

-- 2. 테이블 생성 권한이 부여되지 않음 / 아래의 구문으로 권한을 줌
GRANT CREATE TABLE, RESOURCE TO sample;

-- 3. 데이터를 수정하는 권한이 없음 / 아래의 구문으로 권한을 줌
GRANT CONNECT, DBA TO sample;

-- DEPT_CODE가 D9 OR D6 이고 SALARY >= 3000000 인 사원의
-- EMP_NAME, EMP_NO, DEPT_CODE, SALARY 를 조회
SELECT EMP_NAME,
       EMP_NO, 
       DEPT_CODE, 
       SALARY
FROM EMPLOYEE
WHERE (DEPT_CODE = 'D9' OR DEPT_CODE = 'D6') 
  AND SALARY >= 3000000;
-- 4. 구문을 끝내는 세미콜론 없음 / 세미콜론 ';' 추가
-- 4. 문자(D9,D6) 인식 불가 / 쌍따옴표 대신 홑따옴표 사용
-- 4. || 라는 연산자 인식 불가 / '또는'이라는 뜻의 'OR' 사용
-- 4. SALARY 가 300만원 이상인 조건이 없음 / 아래의 조건구문 추가
-- WHERE (DEPT_CODE = 'D9' OR DEPT_CODE = 'D6') AND SALARY >= 3000000;

CREATE TABLE EMPLOYEE (
    EMP_NAME  VARCHAR(20),
    EMP_NO    NUMBER(3), 
    DEPT_CODE VARCHAR(5), 
    SALARY    NUMBER(20)
);

INSERT INTO EMPLOYEE VALUES ('이' ,001 ,'D9', 1000000);
INSERT INTO EMPLOYEE VALUES ('김' ,002 ,'D6', 5000000);
INSERT INTO EMPLOYEE VALUES ('정' ,003 ,'D3', 6000000);
INSERT INTO EMPLOYEE VALUES ('박' ,004 ,'D4', 2000000);

SELECT * FROM EMPLOYEE;