
-- 유저 안에 데이터 있을시 삭제 불가
DROP USER c##test1;

-- CASCADE 있던 데이터를 날리고, 유저 삭제
DROP USER c##test1 CASCADE;

-- 비밀번호 변경
-- 방법 1) USER 오른쪽 클릭 -> 비밀번호 재설정
-- 방법 2)
ALTER USER c##test1 IDENTIFIED BY pw12345;

