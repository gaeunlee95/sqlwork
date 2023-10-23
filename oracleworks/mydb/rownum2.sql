// rownum2

SELECT * FROM drink;

-- ���̺� ����
CREATE TABLE drink2 AS
SELECT * FROM drink;

SELECT * FROM drink2;

-- ��ͺ���(INSERT INTO ~ SELECT) : VALUES ������
INSERT INTO drink2
(SELECT * FROM drink2);

-- xx
INSERT INTO drink
(SELECT * FROM drink2);

-- ROWNUM (SUDO COLUMN - ������ ������ Į��)
SELECT ROWNUM, drink_code, drink_name
FROM drink2
WHERE ROWNUM <= 10;
-- == WHERE ROWNUM >= 1 AND ROWNUM <= 10;
-- WHERE ROWNUM >=2 AND ROWNUM <= 10; -- 1�� ���ԵǾ�� �˻��� �� / ����X

-- FROM �� �������� ��� - �ζ��κ�
-- �� rn�� ����ϴ°�? rownum�� 1�� �־�� �˻��̵ǹǷ� rn�̶�� ����(��Ī) ���
SELECT rn, drink_code, drink_name
FROM (SELECT ROWNUM rn, drink_code, drink_name FROM drink2) drink2
WHERE rn >= 11 AND rn <= 20; -- ��Ī(����) ��� �˻���
-- Į������ ROWNUM�� Į���� 1~�� �־�� �˻��� �ǹǷ�,
-- ROWNUM�� ��Ī�� �ְ�, �־��� ��Ī�� �̿��Ͽ� �˻��� ���

SELECT *
FROM (SELECT ROWNUM rn, drink_code, drink_name FROM drink2) drink2
WHERE rn >= 11 AND rn <= 20; -- ��Ī(����) ��� �˻���

-- ���� �Ұ���.��
SELECT ROWNUM rn, drink_code, drink_name 
FROM drink2
WHERE rn >= 11 AND rn <= 20;


