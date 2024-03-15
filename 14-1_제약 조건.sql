-- ���̺� ������ ��������
-- : ���̺� �������� �����Ͱ� �ԷµǴ� ���� �����ϱ� ���� ��Ģ�� �����ϴ� ��.

-- ���̺� ������ �������� (PRIMARY KEY, UNIQUE, NOT NULL, FOREIGN KEY, CHECK)
-- PRIMARY KEY: ���̺��� ���� �ĺ� �÷��Դϴ�. (�ֿ� Ű)
-- UNIQUE: ������ ���� ���� �ϴ� �÷� (�ߺ��� ����)
-- NOT NULL: null�� ������� ����. (�ʼ���)
-- FOREIGN KEY: �����ϴ� ���̺��� PRIMARY KEY�� �����ϴ� �÷�
-- CHECK: ���ǵ� ���ĸ� ����ǵ��� ���.

--�÷� ���� ���� ����(�÷� ���𸶴� �������� ����)
CREATE TABLE dept2(
  dept_no NUMBER(2) CONSTRAINT dept2_deptno_pk PRIMARY KEY,--�������� �ĺ��ڴ� ������ ����(����Ŭ�� �˾Ƽ� �̸� ����)
  dept_name VARCHAR2(14) NOT NULL CONSTRAINT dept2_deptname_uk UNIQUE,
  loca NUMBER(4) CONSTRAINT dept2_loca_locid_fk REFERENCES locations(location_id),
  dept_bonus NUMBER(10) CONSTRAINT dept2_bonus_ck CHECK (dept_bonus>10000),
  dept_gender VARCHAR(1) CONSTRAINT dept2_gender_ck CHECK (dept_gender IN('M','F'))
);

--���̺� ���� ���� ����(��� �� ���� �� ���� ������ ���ϴ� ���)
CREATE TABLE dept2(
  dept_no NUMBER(2) NOT NULL ,
  dept_name VARCHAR2(14),
  loca NUMBER(4) ,
  dept_bonus NUMBER(10) ,
  dept_gender VARCHAR(1) ,
  
  CONSTRAINT dept2_deptno_pk PRIMARY KEY(dept_no),
 CONSTRAINT dept2_deptname_uk UNIQUE(dept_name),
  CONSTRAINT dept2_loca_locid_fk FOREIGN KEY(loca) REFERENCES locations(location_id),
  CONSTRAINT dept2_bonus_ck CHECK (dept_bonus>10000),
  CONSTRAINT dept2_gender_ck CHECK (dept_gender IN('M','F'))
);

--�ܷ� Ű(foreign key)�� �θ����̺�(�������̺�)�� ���ٸ� INSERT �Ұ���
INSERT INTO dept2
VALUES(10,'gg',6542,90000,'M'); --����


INSERT INTO dept2
VALUES(20,'HH',1900,90000,'M');

UPDATE dept2
SET loca=4000
WHERE dept_no=10; --����(�ܷ�Ű �������� ����)


UPDATE dept2
SET dept_no=20
WHERE dept_no=10; --����(�ֿ�Ű �������� ����)

UPDATE dept2
SET dept_bonus=900
WHERE dept_no=10; --����(check �������� ����)

--���̺� ���� ���� �������� �߰� �� ����,����
--���� ������ �߰�, ������ �����մϴ�. ������ �ȵ˴ϴ�.
--�����Ϸ��� �����ϰ� ���ο� �������� �߰��ؾ� �մϴ�.
CREATE TABLE dept2(
  dept_no NUMBER(2) ,
  dept_name VARCHAR2(14)  NOT NULL,
  loca NUMBER(4) ,
  dept_bonus NUMBER(10) ,
  dept_gender VARCHAR2(1)
  );


--pk �߰�
ALTER TABLE dept2 ADD CONSTRAINT dept2_deptno_pk PRIMARY KEY(dept_no);
--fk �߰�
ALTER TABLE dept2 ADD CONSTRAINT dept2_loca_locid_fk REFERENCES locations(location_id);
--check �߰�
ALTER TABLE dept2 ADD CONSTRINT dept2_bouns_ck CHECK(dept_bonus>10000);
--unique �߰�
ALTER TABLE dept2 ADD CONSTRINT dept2_deptname_uk UNIQUE(dept_name);
--NOT NULL�� �� �������·� �����մϴ�.
ALTER TABLE dept2 MODIFY dept_bonus NUMBER(10) NOT NULL;

--���� ���� Ȯ��
SELECT * FROM user_constraints
WHERE table_name='DEPT2';

--���� ���� ����(���� ������ �̸�����->�̸��� ���� ���� �ʾҴٸ� ����Ŭ�� �ο��� �̸��� ����)
ALTER TABLE dept2 DROP CONSTRAINT dept2_deptno_pk;

--����
CREATE TABLE MEMBERS(
m_name VARCHAR2(20)NOT NULL,
m_num NUMBER(3) CONSTRAINT m_num_pk PRIMARY KEY,
REG_DATE date NOT NULL CONSTRAINT reg_date_uk UNIQUE,
GENDER VARCHAR2(1) CONSTRAINT gender_ck CHECK (GENDER IN('M','F')),
LOCA NUMBER(4) CONSTRAINT LOCK_FK REFERENCES locations(location_id)
);

INSERT INTO MEMBERS
VALUES('AAA',1,'2018-07-01','M',1800);
INSERT INTO MEMBERS
VALUES('BBB',2,'2018-07-02','F',1900);
INSERT INTO MEMBERS
VALUES('CCC',3,'2018-07-03','M',2000);
INSERT INTO MEMBERS
VALUES('DDD',4,SYSDATE,'M',2000);

SELECT * FROM MEMBERS;

SELECT  m.m_name,m.m_num ,loc.street_address,loc.location_id
FROM MEMBERS m
JOIN locations loc ON m.LOCA=loc.location_id
ORDER BY m.m_num;










