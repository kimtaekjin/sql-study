/*
- NUMBER(2) -> ������ 2�ڸ����� ������ �� �ִ� ������ Ÿ��.
- NUMBER(5, 2) -> ������, �Ǽ��θ� ��ģ �� �ڸ��� 5�ڸ�, �Ҽ��� 2�ڸ�
- NUMBER -> ��ȣ�� ������ �� (38, 0)���� �ڵ� �����˴ϴ�.
- VARCHAR2(byte) -> ��ȣ �ȿ� ���� ���ڿ��� �ִ� ���̸� ����. (4000byte����)
- CLOB -> ��뷮 �ؽ�Ʈ ������ Ÿ�� (�ִ� 4Gbyte)
- BLOB -> ������ ��뷮 ��ü (�̹���, ���� ���� �� ���)
- DATE -> BC 4712�� 1�� 1�� ~ AD 9999�� 12�� 31�ϱ��� ���� ����
- ��, ��, �� ���� ����.
*/
CREATE TABLE dept2 (
  dept_no NUMBER(3),
  dept_name VARCHAR2(14),
  loca VARCHAR2(15),
  dept_date DATE,
  dept_bonus NUMBER(10)
);



SELECT * FROM dept2;

--NUMBER�� VARCHAR2 Ÿ���� ���̸� Ȯ��
INSERT INTO dept2
VALUES(30,'�濵����','��⵵',SYSDATE,200000000);

--�÷� �߰�

ALTER TABLE dept2
ADD dept_count NUMBER(3);

--�÷��� ����
ALTER TABLE dept2
RENAME COLUMN dept_count TO emp_count;


DESC dept3;

--�÷� �Ӽ� ����
--���� �����ϰ��� �ϴ� �÷��� �����Ͱ� �̹� �����Ѵٸ�, �׿� �´� Ÿ������
--�����ؾ� �Ѵ�. ���� �ʴ� Ÿ�����δ� ������ �Ұ���

ALTER TABLE dept2
MODIFY emp_count VARCHAR2(10);


--DDL(CREATE,ALTER,TRUNCATE,DROP)�� Ʈ������� ����� �ƴմϴ�.
--��������� �����ϴ�,
--ROLLBACK�� ����ϴ��� ���� ALTER�� ������ ������ �ѹ���� �ʽ��ϴ�.

--�÷� ����
ALTER TABLE dept2
DROP COLUMN DEPT_BONUS; --�÷��� �����Ͱ� �־ �������ϴ�.

--���̺� �̸� ����
ALTER TABLE dept2
RENAME to dept3;

--���̺� ����(������ ���ܵΰ� ���� �����͸� ��� ����)
TRUNCATE TABLE dept3;

--���̺� ����(���̺� ���� ��ü�� ����)
DROP TABLE dept3;

--���̺� ���� �� �ѹ����ε� ������ �Ұ����ϴ�.
ROLLBACK;

