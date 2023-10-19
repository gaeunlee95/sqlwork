-- 게시판 테이블 생성
CREATE TABLE boards(
    bno       NUMBER PRIMARY KEY,
    btitle    VARCHAR2(100) NOT NULL, -- 최대크기 2000BYTE
    bcontent  CLOB NOT NULL, --CLOB(Character Large Of Byte) /4000BYTE 
    bwriter   VARCHAR2(50) NOT NULL,
    bdate     DATE DEFAULT SYSDATE,
    bfilename VARCHAR2(50),
    bfiledata BLOB -- BOLB(Binary Large Of Byte)/4000BYTE
);

-- 시퀀스 생성(NOCACHE - 저장하지 않음, 초기화되면 1부터 시작함)
CREATE SEQUENCE seq_bno NOCACHE;

-- 게시글 추가
INSERT INTO boards (bno, btitle, bcontent, bwriter)
VALUES (seq_bno.NEXTVAL, 'smartPhone', '삼성 갤럭시 S21입니다', 'today');

INSERT INTO boards (bno, btitle, bcontent, bwriter, bdate, bfilename, bfiledata)
VALUES (seq_bno.NEXTVAL, 'smartPhone', '삼성 갤럭시 S21입니다', 'today', 
            SYSDATE, null, null);

COMMIT;

-- 전체 검색
SELECT * FROM boards 
ORDER BY bno DESC;

SELECT * FROM boards WHERE bwriter = 'cloud'
ORDER BY bno DESC;

-- 글번호 5번의 제목을 '아이폰 15'으로 변경
UPDATE boards 
SET btitle = '아이폰 15',
    bcontent = '아이폰15 제품입니다.'    
WHERE bno = 5;

-- 1번 게시글 삭제
DELETE FROM boards
WHERE bno = 1;

ROLLBACK;

