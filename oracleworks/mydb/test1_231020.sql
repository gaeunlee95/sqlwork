-- test1

-- 1. ������
-- ��й�ȣ�� �����ϴ� ������ ���� / �Ʒ��� ���� IDENTIFIED BY 1234 �� �߰�����
CREATE USER c##sample IDENTIFIED BY 1234;

-- �α��� ���� �ο�
GRANT CREATE SESSION TO sample;

-- 2. ���̺� ���� ������ �ο����� ���� / �Ʒ��� �������� ������ ��
GRANT CREATE TABLE, RESOURCE TO sample;

-- 3. �����͸� �����ϴ� ������ ���� / �Ʒ��� �������� ������ ��
GRANT CONNECT, DBA TO sample;

-- DEPT_CODE�� D9 OR D6 �̰� SALARY >= 3000000 �� �����
-- EMP_NAME, EMP_NO, DEPT_CODE, SALARY �� ��ȸ
SELECT EMP_NAME,
       EMP_NO, 
       DEPT_CODE, 
       SALARY
FROM EMPLOYEE
WHERE (DEPT_CODE = 'D9' OR DEPT_CODE = 'D6') 
  AND SALARY >= 3000000;
-- 4. ������ ������ �����ݷ� ���� / �����ݷ� ';' �߰�
-- 4. ����(D9,D6) �ν� �Ұ� / �ֵ���ǥ ��� Ȭ����ǥ ���
-- 4. || ��� ������ �ν� �Ұ� / '�Ǵ�'�̶�� ���� 'OR' ���
-- 4. SALARY �� 300���� �̻��� ������ ���� / �Ʒ��� ���Ǳ��� �߰�
-- WHERE (DEPT_CODE = 'D9' OR DEPT_CODE = 'D6') AND SALARY >= 3000000;

CREATE TABLE EMPLOYEE (
    EMP_NAME  VARCHAR(20),
    EMP_NO    NUMBER(3), 
    DEPT_CODE VARCHAR(5), 
    SALARY    NUMBER(20)
);

INSERT INTO EMPLOYEE VALUES ('��' ,001 ,'D9', 1000000);
INSERT INTO EMPLOYEE VALUES ('��' ,002 ,'D6', 5000000);
INSERT INTO EMPLOYEE VALUES ('��' ,003 ,'D3', 6000000);
INSERT INTO EMPLOYEE VALUES ('��' ,004 ,'D4', 2000000);

SELECT * FROM EMPLOYEE;