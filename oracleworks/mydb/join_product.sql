-- ���� ����
-- product, product_review
SELECT * FROM product; --�θ�
SELECT * FROM product_review; --�ڽ�

-- ���䰡 �ִ� ��ǰ�� ������ �˻��Ͻÿ�
-- ���� ���̺� product_name Į���� ����
SELECT a.review_no,
       b.product_code, 
       b.member_id, 
       a.product_name, 
       b.content
FROM product a, product_review b
WHERE a.product_code = b.product_code;

SELECT a.product_name, 
       b.*
FROM product a, product_review b
WHERE a.product_code = b.product_code;

-- ANSI(�̱���ȸ) ���� - STANDARD JOIN(ǥ������)
-- ��������(INNER JOIN ~ ON)
SELECT a.product_name, 
       b.*
FROM product a JOIN product_review b
ON a.product_code = b.product_code;

-- �ܺ�����(LEFT, RIGHT OUTER ����)
-- ������ ������ ������� ��� ��ǰ�� ���� ���
SELECT a.product_name, 
       b.*
FROM product a LEFT JOIN product_review b 
-- product_code�� ��ġ�� �ʾƵ�, ����(product)�� �� ����
  ON a.product_code = b.product_code;

-- ���䰡 ���� ��ǰ�� �˻��Ͻÿ�
SELECT a.product_name "��ǰ�ıⰡ ���� ��ǰ" 
FROM product a LEFT JOIN product_review b 
  ON a.product_code = b.product_code
WHERE b.content is null;

-- ��ǰ �������̺� product_name Į�� �߰�
-- ��Į�� �������� : �� Į���� ��ȯ��, SELECT ������ ���
SELECT A.review_no,
       A.product_code,
       (SELECT B.product_name 
         FROM product B
         WHERE A.product_code = B.product_code)
         product_name,
       A.member_id,
       A.content
FROM product_review A;

