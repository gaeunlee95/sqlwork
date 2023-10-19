-- ���� ���� ���̺� ����
CREATE TABLE account(
    ano     VARCHAR2(20) PRIMARY KEY,
    owner   VARCHAR2(20) NOT NULL,
    balance NUMBER NOT NULL
);

INSERT INTO account VALUES ('11-11-111', '�̰���', 10000);

COMMIT;

SELECT * FROM account;

UPDATE account 
SET balance = 50000,
    owner = '�̰�'
WHERE ano = '11-11-111';

DELETE FROM account
WHERE ano = '11-11-111';

SELECT * FROM account
WHERE ano = '33-33-333';

ROLLBACK;

SELECT * FROM account
ORDER BY SYSDATE;