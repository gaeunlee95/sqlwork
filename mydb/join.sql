-- ���� : �� ���̺��� ���� �����Ͽ� ����ϴ� ���
-- ��������(equi join) : ���� ������ ��Ȯ�� ��ġ�ϴ� ���
-- �ܺ�����(outer join) : ���� ������ ��Ȯ�� ��ġ���� �ʾƵ� ��� ����� ��� 

-- ��(customer)�� ���� �ֹ�(order)�� ���� �����͸� ��� �˻��Ͻÿ�
-- ���̸����� ����(�ڵ����� �׷�ȭ ��)
SELECT cus.name, ord.saleprice
FROM customer cus, orders ord
WHERE cus.custid = ord.custid
ORDER BY cus.name;

-- ��(customer)�� ���� �ֹ�(order)�� ���� �����͸� ��� �˻��Ͻÿ�
-- ���� : '������' ���� �ֹ������� �˻��Ͻÿ�
-- �ֹ� �ݾ��� �Ѿ��� ���
SELECT cus.name, ord.saleprice
FROM customer cus, orders ord
WHERE cus.custid = ord.custid 
    AND cus.name = '������'
ORDER BY ord.saleprice;

-- ��(customer)�� ���� �ֹ�(order)�� ���� �����͸� ��� �˻��Ͻÿ�
-- ���� �ֹ� �ݾ��� �Ѿ��� ���(Group by ���)
-- �迬�� ���� �ֹ� �ѱݾ��� ���
SELECT cus.name, SUM(ord.saleprice) -- SUM �׷��Լ��̹Ƿ�, cus.name�� �׷�ȭ?���������
FROM customer cus, orders ord
WHERE cus.custid = ord.custid
GROUP BY cus.name
 HAVING cus.name = '�迬��'
ORDER BY cus.name;

-- �ֹ����� ���� �����͵� ��� �˻�
-- ������ ��ġ���� ���� ���̺� +�� �־���
SELECT cus.name, ord.saleprice
FROM customer cus, orders ord
WHERE cus.custid = ord.custid(+)
ORDER BY cus.name;

-- ���� �̸�, �ֹ��� ���� �̸�, �ֹ���, �ֹ��ݾ�
SELECT cus.name, bk.bookname, ord.orderdate, ord.saleprice
FROM customer cus, book bk, orders ord
WHERE cus.custid = ord.custid --�⺻Ű = �ܷ�Ű
    AND bk.bookid = ord.bookid;
    
-- ǥ�� ����(ANSI SQL)
-- ���� ����(INNER JOIN)
-- ��(customer)�� ���� �ֹ�(order)�� ���� �������� ���� �̸���
-- ���� �ֹ��� ������ �ǸŰ����� �˻��Ͻÿ�
SELECT cus.name, ord.saleprice
FROM customer cus INNER JOIN orders ord
 ON cus.custid = ord.custid
ORDER BY cus.name;

-- �ܺ� ����(OUTER JOIN)
-- JOIN ���ǿ� �����ϴ� �����Ͱ� �ƴϾ ����ϴ� ���
-- ��(customer)�� ���� �ֹ�(order)�� ���� ��������
-- �ֹ����� ���� �����͸� �����Ͽ� ���� �̸��� ���� �ֹ��� 
-- ������ �ǸŰ����� �˻��Ͻÿ�

SELECT cus.name, ord.saleprice
FROM customer cus LEFT OUTER JOIN orders ord
    ON cus.custid = ord.custid
ORDER BY cus.name;




