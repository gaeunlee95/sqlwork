--- user_test

-- user 계정 : test, 비번 pwtest

-- 계정 생성
CREATE USER c##test IDENTIFIED BY pwtest;
--> 에러 : CREATE 세션 권한을 가지고 있지 않습니다.

-- SESSION 권한(로그인-인증) 부여
GRANT CREATE SESSION TO c##test;
--> 테스트 : 성공
--> 테이블 생성 오류 : 권한이 불충분합니다 / 테이블 생성 권한이 없음

-- DB의 테이블 생성 권한 부여
GRANT CREATE TABLE, RESOURCE TO c##test;
--> 테이블 생성 : 성공
--> INSERT 오류 : 테이블스페이스 'USERS'에 대한 권한이 없습니다.

-- 데이터 조작할 모든 권한 부여 - DML(삽입,조회,수정,삭제)
GRANT CONNECT, DBA TO c##test;
--> INSERT : 성공

