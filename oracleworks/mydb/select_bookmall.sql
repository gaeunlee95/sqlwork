
SELECT * FROM orders;
-- �ֹ� ���̺��� Į��, �ڷ��� (describe)
DESC orders;

-- ��� �Լ� - ����(COUNT), �հ�(SUM), ���(AVG), �ִ밪(MAX), �ּҰ�(MIN)
-- COUNT(*) : '*' - ��ü
-- COUNT(Į����) :  
SELECT COUNT(orderid) AS ���ǸŰǼ�
FROM orders;

SELECT SUM(saleprice) AS ���Ǹž�,
       AVG(saleprice) AS ����վ�
FROM orders;

-- ���� �ֹ��� ������ ���Ǹž� ���
SELECT SUM(saleprice) AS ���Ǹž�
FROM orders;

-- ������ �ֹ��� ������ ���Ǿ��� ���
-- �׷����� ������ ��� - GROUP BY Į���� 
SELECT custid, 
    COUNT(*) AS ��������,
    SUM(saleprice) AS ���Ǹž�
FROM orders
GROUP BY custid;

-- ������ �ֹ��� ������ ���Ǹžװ� ���������� ���
-- ���������� 3�� �̻��� �ڷ� �˻�
-- HAVING �� ��� - GROUP BY������ ������ ������, GROUP �ؿ� ���
SELECT custid, 
    COUNT(*) AS ��������,
    SUM(saleprice) AS ���Ǹž�
FROM orders
GROUP BY custid
HAVING COUNT(*) >=3;
    --AND SUM(salepricde) > 35000;

SELECT COUNT(*) AS �Ѱ���, COUNT(phone) AS ��ȭ��ȣ�� 
FROM customer;

-- �����߿��� �ִ밡��, �������� �˱�
SELECT MAX(price) �ְ���, MIN(prcie) ��������
FROM book;

SELECT * FROM customer;

-- '3�� ��(�Ȼ�)'�� �ֹ��� ������ �� �Ǹž� ���ϱ�
SELECT SUM(saleprice) AS ���Ǹž�
FROM orders
WHERE custid = 3;

-- ����(Join)
-- ��������(EQUI JOINT): equal(=)�� ����ϴ� ����
-- ���̺�A.Į���� = ���̺�B.Į���� (Į�� - �ܷ�Ű)
-- ���� �̸��� ���� �ֹ��� ������ �ǸŰ����� �˻��Ͻÿ�(customer, orders ����)
SELECT customer.name, orders.saleprice
from customer, orders
WHERE customer.custid = orders.custid;

-- ��Ī ��� ����
-- �� �̸��� ����(��������), �ֹ� ���ݺ� �������� 2�� ����
SELECT cus.name, ord.saleprice
from customer cus, orders ord
WHERE cus.custid = ord.custid
order by cus.name, ord.saleprice desc;

-- 3�� ���� ���̵�� �����̸��� �ֹ� ������ �˻�
SELECT custid, bookname, saleprice
FROM orders, book
WHERE orders.bookid = book.bookid
    AND orders.custid = 3;

SELECT customer.custid, book.bookname, orders.saleprice
FROM orders, customer, book
WHERE orders.custid = customer.custid
    and orders.bookid = book.bookid
    and customer.name = '�Ȼ�';
