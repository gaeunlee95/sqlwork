--- ROWNUM

CREATE TABLE ex_score(
    name  VARCHAR(30),
    score NUMBER(3)
);

INSERT INTO ex_score VALUES('���ϳ�', 94);
INSERT INTO ex_score VALUES('���ϳ�', 85);
INSERT INTO ex_score VALUES('���ϳ�', 100);
INSERT INTO ex_score VALUES('���ϳ�', 97);
INSERT INTO ex_score VALUES('���ϳ�', 87);
INSERT INTO ex_score VALUES('���ϳ�', 91);
INSERT INTO ex_score VALUES('���ϳ�', 91);
INSERT INTO ex_score VALUES('���ϳ�', 77);
INSERT INTO ex_score VALUES('���ϳ�', 80);
INSERT INTO ex_score VALUES('���ϳ�', 95);

-- 5����� ���� ���
SELECT ROWNUM, name, score
FROM ex_score
WHERE ROWNUM <= 5;

-- 2���� 6����� ������ �˻�
-- BETWEEN ~ AND
SELECT ROWNUM, name, score
FROM ex_score
WHERE ROWNUM BETWEEN 2 AND 5;

-- 2���� 6����� ������ �˻�
-- ROWNUM�� 1���� �����ؾ� ��
SELECT ROWNUM, name, score
FROM ex_score
WHERE ROWNUM >= 1 AND ROWNUM <= 5;

-- ������ ���� ��(��������)����  �����Ͽ� �˻��Ͻÿ�
SELECT * FROM ex_score
ORDER BY score DESC;

-- ������ ���� ������ 5���� �˻��Ͻÿ� / ����� ����X
SELECT ROWNUM, a.* FROM ex_score a
WHERE ROWNUM <= 5
ORDER BY score DESC;

-- ������ ������������ ������ �� 5���� �˻�
SELECT ROWNUM, A.name, A.score
FROM (SELECT * FROM ex_score
       ORDER BY score DESC) A
WHERE ROWNUM <=5;

SELECT ROWNUM, name, score
FROM (SELECT * FROM ex_score
      ORDER BY score DESC) 
WHERE ROWNUM <=5;

-- ���� ���� �˻��ϱ�
-- RANK()OVER(ORDER BY Į����)
SELECT name, 
       score,
       RANK() OVER(ORDER BY score DESC) ����1,
       DENSE_RANK() 
       OVER(ORDER BY score DESC) ����2
FROM ex_score;
                                                                                       
TRUNCATE TABLE ex_score;