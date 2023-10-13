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

-- 시쿼스 생성
CREATE SEQUENCE seq_bno NOCACHE;

-- 게시글 추가
INSERT INTO boards (bno, btitle, bcontent, bwriter)
VALUES (seq_bno.NEXTVAL, 'smartPhone', '삼성 갤럭시 S21입니다', 'today');

INSERT INTO boards (bno, btitle, bcontent, bwriter, bdate, bfilename, bfiledata)
VALUES (seq_bno.NEXTVAL, 'smartPhone', '삼성 갤럭시 S21입니다', 'today', 
            SYSDATE, null, null);

COMMIT;

SELECT * FROM boards WHERE bwriter = 'sky123'
ORDER BY bno DESC;



