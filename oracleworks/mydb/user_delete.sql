
-- ���� �ȿ� ������ ������ ���� �Ұ�
DROP USER c##test1;

-- CASCADE �ִ� �����͸� ������, ���� ����
DROP USER c##test1 CASCADE;

-- ��й�ȣ ����
-- ��� 1) USER ������ Ŭ�� -> ��й�ȣ �缳��
-- ��� 2)
ALTER USER c##test1 IDENTIFIED BY pw12345;

