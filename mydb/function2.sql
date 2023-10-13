-- ��¥ �ð� �Լ�
-- ���� ��¥ ��� : SYSDATE
SELECT SYSDATE FROM dual;

-- ���� ��¥ ���� ��ȯ : TO_CHAR()
-- TO_CHAR(��¥, ���� ����)
SELECT TO_CHAR(SYSDATE, 'yyyy') �⵵,
       TO_CHAR(SYSDATE, 'mm') ��,
       TO_CHAR(SYSDATE, 'dd') ��,
       TO_CHAR(SYSDATE, 'yyyy-mm-dd') ��¥
FROM dual;

-- ���� ��¥�� �ð� : SYSTIMESTAMP
SELECT SYSTIMESTAMP FROM dual;
-- �ð� ���� ��ȯ
SELECT TO_CHAR(SYSDATE, 'hh:mi:ss') �ð�����,
       TO_CHAR(SYSDATE, 'yyyy/mm/dd hh:mi:ss') ��¥�ͽð�
FROM dual;

-- ���� ���ϰ� ����
-- ���� ��¥���� 10����, ���� ��¥ ���
SELECT SYSDATE - 10 FROM dual;
SELECT SYSDATE + 10 FROM dual;

-- Ư�� ��¥���� 10�� ��,�� ���
-- TO_DATE(���ڿ�[��¥])
SELECT TO_DATE('2023-09-01') + 10 FROM DUAL;

-- ���� ���ϰ� ����
-- ADD_MONTHS()
SELECT ADD_MONTHS(SYSDATE, 3) ��� FROM DUAL;
SELECT ADD_MONTHS(SYSDATE, -3) ��� FROM DUAL;
SELECT ADD_MONTHS(TO_DATE('2023/5/1'), 3) ��� FROM DUAL;

-- ������ ����ϱ�
-- MONTHS_BETWEEN(������, ������)
-- �Ѱ����� �ݿø� - ROUND() ���
SELECT 
    ROUND (MONTHS_BETWEEN(TO_DATE('2023-12-31'), 
            TO_DATE('2023-1-1')), 0) �Ѱ�����
FROM DUAL;

-- orders ���̺����� ��¥ �ð��Լ� ����ϱ�
-- ������ �ֹ��Ϸκ��� 10���� ������ Ȯ���Ѵ�.
-- �� �ֹ��� Ȯ�����ڸ� ���Ͻÿ�
SELECT orderid �ֹ���ȣ,
       orderdate �ֹ���,
       TO_DATE(orderdate) + 10 Ȯ������
FROM orders;

-- �ֹ��Ͽ� 3���� ���ϰ�, ����
-- �ֹ���ȣ�� 6���� 10������ ����Ͻÿ�
SELECT orderid �ֹ���ȣ,
       orderdate �ֹ���,
       ADD_MONTHS(orderdate, 3) ���ϱ���,
       ADD_MONTHS(orderdate, -3) ������
FROM orders
--WHERE orderid >=6 AND orderid <=10;
WHERE orderid BETWEEN 6 AND 10;

-- �ֹ���ȣ�� 10�� ������ �ֹ��Ϸκ��� ���ñ��� �� ������
SELECT orderid �ֹ���ȣ,
       orderdate �ֹ���,
       ROUND(MONTHS_BETWEEN(SYSDATE, orders.orderdate), 0) �Ѱ�����
FROM orders
WHERE orderid = 10;  

-- ��ȯ �Լ� : TO_NUMBER() : ���ڸ� ���ڷ� ��ȯ����
SELECT TO_NUMBER('320') FROM DUAL;


