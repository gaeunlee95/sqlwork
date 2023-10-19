-- �����б� ������, ��� ���̺�
SELECT * FROM summer_price;
SELECT * FROM summer_register;

-- �л��� ��� ���������� �˻��Ͻÿ�
SELECT b.sid,
       a.*
FROM summer_price a, summer_register b
WHERE a.subject = b.subject;

-- �л��� ��� ���������� �˻��Ͻÿ�
-- JOIN ~ USING(Į����) : ���� Į�� �̸��� ���� ��� -- ����!!
                      -- ��Ī�� ����� �� ����
SELECT b.sid,
       subject,
       a.price
FROM summer_price a JOIN summer_register b
 USING (subject);

-- ���� ������ �հ�
SELECT SUM(price) FROM summer_price;

-- ���� ������ �հ�
SELECT b.subject,
       SUM(price) 
FROM summer_price a JOIN summer_register b
  ON a.subject = b.subject
GROUP BY b.subject;

-- ���� ������ �հ� �� ��ü �Ѱ踦 ���Ͻÿ�
-- ROLLUP(), CUBE()
-- NVL(����, '�Ѱ�')
-- ������ NULL�� �ƴϸ� ���� ���, NULL�̸� '�Ѱ�' ���
SELECT NVL(b.subject, '�Ѱ�') ��������,
       SUM(a.price) �������հ�
FROM summer_price a, summer_register b
WHERE a.subject = b.subject
GROUP BY ROLLUP(b.subject);

-- Java ������ ������ �հ踦 ���Ͻÿ�
SELECT b.subject,
       SUM(price) 
FROM summer_price a JOIN summer_register b
  ON a.subject = b.subject
  AND b.subject = 'Java'
GROUP BY b.subject;


