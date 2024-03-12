
--�̳�(����)����
SELECT *
FROM info i
INNER JOIN auth a
ON i.auth_id=a.auth_id;

--����Ŭ ����(����Ŭ ���� ����)
SELECT *
FROM info i,auth a
WHERE i.auth_id=a.auth_id;


--auth.id �÷��� �׳� ���� ��ȣ�ϴ� ��� ���
--�� ������ ���ʿ� ��� �����ϴ� �÷��̱� �����̴�.
--�÷��� ���̺� �̸��� ���̴���, ��Ī�� �Ἥ
--Ȯ���ϰ� �����ؾ� �Ѵ�.
SELECT
    a.auth_id,i.title,i.content,a.name
FROM info i
JOIN auth a --JOIN �̶�� ���� �⺻ INNER JOIN ���� �ν�
ON i.auth_id = a.auth_id;


--�ʿ��� �����͸� ��ȸ(�Ϲ�����) ->
--WHERE ������ ���� ���� �ɱ�
SELECT
    a.auth_id,i.title,i.content,a.name
FROM info i
JOIN auth a 
ON i.auth_id = a.auth_id
WHERE a.name='�̼���';


--�ƿ���(�ܺ�) ����

SELECT *
FROM info i
LEFT JOIN auth a
ON i.auth_id=a.auth_id;

SELECT *
FROM info i,auth a
WHERE i.auth_id=a.auth_id(+);


SELECT *
FROM info i
RIGHT OUTER JOIN auth a
ON i.auth_id=a.auth_id;

SELECT *
FROM info i,auth a
WHERE i.auth_id(+)=a.auth_id;


--���� ���̺�� ���� ���̺� �����͸� ��� �о� ǥ���ϴ� �ܺ� ���� (FULL OUTER JOIN)
SELECT *
FROM info i
FULL JOIN auth a
ON i.auth_id=a.auth_id;



--CROSS JOIN�� JOIC������ �������� �ʱ� ������
--�ܼ��� ��� �÷��� ���� JOIC�� �����մϴ�.
--�����δ� ���� ������� �ʽ��ϴ�.
SELECT * FROM info
CROSS JOIN auth;

SELECT * FROM info,auth;

--���� �� ���̺� ���� ->Ű ���� ã�� ������ �����ؼ� ���� �˴ϴ�.
SELECT *
FROM employees e
LEFT JOIN departments d ON e.department_id=d.department_id
LEFT JOIN locations loc ON d.location_id=loc.location_id;



/*
- ���̺� ��Ī a, i�� �̿��Ͽ� LEFT OUTER JOIN ���.
- info, auth ���̺� ���
- job �÷��� scientist�� ����� id, title, content, job�� ���.
*/

SELECT 
i.id,i.title,i.content,a.job
FROM info i
RIGHT JOIN auth a
ON i.auth_id=a.auth_id
WHERE a.job='scientist';


--���� �����̶� ���� ���̺� ������ ������ ���մϴ�.
--���� ���̺� �÷��� ���� ������ �����ϴ� ���� ��Ī���� ������ �� ����մϴ�.
SELECT
e1.employee_id,e1.first_name,e1.manager_id,
e2.first_name,e2.employee_id
FROM employees e1
JOIN employees e2
ON e1.manager_id = e2.employee_id
ORDER BY e1.employee_id;


/*
���� 1.
-EMPLOYEES ���̺��, DEPARTMENTS ���̺��� DEPARTMENT_ID�� ����Ǿ� �ֽ��ϴ�.
-EMPLOYEES, DEPARTMENTS ���̺��� ������� �̿��ؼ�
���� INNER , LEFT OUTER, RIGHT OUTER, FULL OUTER ���� �ϼ���. (�޶����� ���� ���� �ּ����� �ۼ�)
*/
SELECT *
FROM employees e
JOIN departments d 
ON e.department_id=d.department_id; --inner 106��

SELECT *
FROM employees e
LEFT JOIN departments d 
ON e.department_id=d.department_id; --LEFT 107��

SELECT *
FROM employees e
RIGHT JOIN departments d 
ON e.department_id=d.department_id; --RIGHT 122��

SELECT *
FROM employees e
FULL JOIN departments d 
ON e.department_id=d.department_id; --LEFT 123��

/*
���� 2.
-EMPLOYEES, DEPARTMENTS ���̺��� INNER JOIN�ϼ���
����)employee_id�� 200�� ����� �̸�, department_name�� ����ϼ���
����)�̸� �÷��� first_name�� last_name�� ���ļ� ����մϴ�
*/
SELECT concat(e.first_name ,e.last_name) AS �̸�,
d.department_name
FROM employees e
JOIN departments d
ON e.department_id=d.department_id
WHERE e.employee_id = 200;
/*
���� 3.
-EMPLOYEES, JOBS���̺��� INNER JOIN�ϼ���
����) ��� ����� �̸��� �������̵�, ���� Ÿ��Ʋ�� ����ϰ�, �̸� �������� �������� ����
HINT) � �÷����� ���� ����Ǿ� �ִ��� Ȯ��
*/
SELECT 
concat(e.first_name,e.last_name)AS �̸�,
e.job_id, j.job_title
FROM employees e
JOIN jobs j ON e.job_id = j.job_id
ORDER BY �̸�;


/*
���� 4.
--JOBS���̺�� JOB_HISTORY���̺��� LEFT_OUTER JOIN �ϼ���.
*/
SELECT * FROM jobs;
SELECT * FROM job_history;

SELECT *
FROM jobs j
LEFT JOIN job_history jh ON j.job_id=jh.job_id;
/*
���� 5.
--Steven King�� �μ����� ����ϼ���.
*/
SELECT
    e.first_name || ' ' || e.last_name AS Full_name,
    d.department_name
FROM
    employees e
LEFT JOIN
    departments d ON e.department_id = d.department_id
WHERE
    e.first_name = 'Steven'
    AND e.last_name = 'King';



/*
���� 6.
--EMPLOYEES ���̺�� DEPARTMENTS ���̺��� Cartesian Product(Cross join)ó���ϼ���
*/
SELECT *
FROM employees e
CROSS JOIN departments d;

SELECT * FROM employees,departments;























