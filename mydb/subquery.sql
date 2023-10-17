-- ���� ���� (Sub Query): �μ�����(��ø ����)
-- SELECT�� ���ο� �� SELECT���� ������

-- ������ ������ ���� ���� ������ �˻��Ͻÿ�
-- MAX(price) : 35000
SELECT MAX(price) FROM book;


-- �����߿��� ���� ��� ������ �̸��� �˻��Ͻÿ�
-- ������ ��������
SELECT bookname
FROM book
WHERE price = 
    (SELECT MAX(price) FROM book);
    
-- ������ ������ ���� �ִ� ���� �̸��� �˻��Ͻÿ�
-- ������ ��������
SELECT name
FROM customer
WHERE custid IN(SELECT custid FROM orders);
-- WHERE custid = (SELECT custid FROM orders); //����Ұ�

-- ���� ��� : customer, orders
-- ������ ������ ���� �ִ� ���� �̸��� �˻��Ͻÿ�
SELECT DISTINCT cus.name
FROM customer cus, orders ord
WHERE cus.custid = ord.custid;

-- FROM ���� �ִ� �������� - �ζ��κ��� ��
-- ���� �̸��� ���� �Ǹž� �˻�
-- �׷캰 : Group by
SELECT cs.name, SUM(od.saleprice)
FROM customer cs, orders od
WHERE cs.custid = od.custid
GROUP BY cs.name; -- �׷�ȭ

-- ���� ����
SELECT cs.name, SUM(od.saleprice)
FROM (SELECT * FROM customer) cs, 
     orders od
WHERE cs.custid = od.custid
GROUP BY cs.name;

-- ��, �� ��ȣ�� 2 ������ 
-- ���� ����
SELECT cs.name, SUM(od.saleprice) 
FROM (SELECT * FROM customer
        WHERE custid <= 2) cs,
        orders od
WHERE cs.custid = od.custid
GROUP BY cs.name;

SELECT * FROM product;
SELECT * FROM product_review;

-- ��Į�� �������� : SELECT ���� �ִ� SELECT ���� ����
-- ��ǰ ���� ���̺� �ִ� ��ǰ �̸� �˻�
SELECT a.product_code,
       (SELECT b.product_name
         FROM product b
         WHERE a.product_code = b.product_code) product_name,
         a.member_id,
         a.content
FROM product_review a;

-- ���� ����
SELECT cs.name, SUM(od.saleprice) total
FROM customer cs, orders od
WHERE cs.custid  = od.custid
        
WHERE cs.custid = od.custid
GROUP BY cs.name
    HAVING SUM(od.saleprice) >= 30000;
    
    
/*
    ���� ����
    1. FROM�� ���̺��
    2. WHERE, GROUP BY
    3. SELECT ��
    4. ORDER ��
*/