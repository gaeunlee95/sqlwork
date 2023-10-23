//test2_231020

-- �� ���� ���̺��� ���� EMPNO, EMPNAME, DEPTNO, DEPTNAME �÷��� ANSI ����

-- 1. ������ ����
-- ��������

-- 2. ������ �߻��� ����
-- �� ���̺��� �μ���ȣ�� ��Ÿ���� Į������(EMPLOYEE ���̺� : DEPTNO,DEPARTMENT ���̺� : DEPTCODE)
-- �����ϱ� ������ USING ���� ��� �Ұ�

-- 3. �ذ��� �� �ִ� ��ġ����
-- ANSI����(JOIN ~ ON) Ȥ�� ����Ŭ ����(WHERE ~ = ) ������ ���

-- 4. ��ġ������ ����� ANSI(ǥ��) ����
SELECT a.EMPNO, 
       a.EMPNAME, 
       a.DEPTNO, 
       b.DEPTNAME
FROM EMPLOYEE1 a JOIN DEPARTMENT1 b
 ON a.DEPTNO = b.DEPTCODE;

-- 5. ����Ŭ ���� ����
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

INSERT INTO DEPARTMENT1 VALUES(11, '�λ���'); 
INSERT INTO EMPLOYEE1 VALUES(001, '�̾�', 11); 

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

