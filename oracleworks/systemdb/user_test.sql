--- user_test

-- user ���� : test, ��� pwtest

-- ���� ����
CREATE USER c##test IDENTIFIED BY pwtest;
--> ���� : CREATE ���� ������ ������ ���� �ʽ��ϴ�.

-- SESSION ����(�α���-����) �ο�
GRANT CREATE SESSION TO c##test;
--> �׽�Ʈ : ����
--> ���̺� ���� ���� : ������ ������մϴ� / ���̺� ���� ������ ����

-- DB�� ���̺� ���� ���� �ο�
GRANT CREATE TABLE, RESOURCE TO c##test;
--> ���̺� ���� : ����
--> INSERT ���� : ���̺����̽� 'USERS'�� ���� ������ �����ϴ�.

-- ������ ������ ��� ���� �ο� - DML(����,��ȸ,����,����)
GRANT CONNECT, DBA TO c##test;
--> INSERT : ����

