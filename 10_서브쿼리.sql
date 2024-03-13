SELECT
    e.first_name,
    d.department_name
FROM employees e 
LEFT JOIN departments d
ON e.department_id=d.department_id
ORDER BY e.first_name;

SELECT 
    e.first_name,
    (
    SELECT
        department_name
    FROM departments d
    WHERE d.department_id=e.department_id
    ) AS department_name
FROM employees e
ORDER BY e.first_name;



--�� �μ��� �Ŵ��� �̸� ��ȸ
SELECT 
    d.*,
    e.first_name AS manager_name
FROM departments d
LEFT JOIN employees e
ON d.manager_id=e.employee_id
ORDER BY d.manager_id; --LEFT JOIN

SELECT 
    d.*,
    (
    SELECT
    first_name
    FROM employees e
    WHERE e.employee_id=d.manager_id
    )AS manager_name
FROM departments d
ORDER BY d.manager_id;


/*
- ��Į�� ���������� ���κ��� ���� ���
: �Լ�ó�� �� ���ڵ�� ��Ȯ�� �ϳ��� ������ ������ ��.

- ������ ��Į�� ������������ ���� ���
: ��ȸ�� �÷��̳� �����Ͱ� ��뷮�� ���, �ش� �����Ͱ�
����, ���� ���� ����� ��� (sql �������� ������ �� �� �پ�ϴ�.)
*/

--�� �μ��� ��� �� �̱�(��Į��)
SELECT 
    d.department_name,
    (
    SELECT 
        COUNT(*)
    FROM employees e
    WHERE e.department_id=d.department_id
    GROUP BY department_id
    )AS �����
FROM departments d;



--------------------------------------------------------------------------------

-- �ζ��� �� (FROM ������ ���������� ���� ��.)
-- Ư�� ���̺� ��ü�� �ƴ� SELECT�� ���� �Ϻ� �����͸� ��ȸ�� ���� ���� ���̺�� ����ϰ� ���� ��. 
-- ������ ���س��� ��ȸ �ڷḦ ������ �����ؼ� ������ ���� ���.



-- salary�� ������ �����ϸ鼭 �ٷ� ROWNUM�� ���̸�
-- ROWNUM�� ������ ���� �ʴ� ��Ȳ�� �߻��մϴ�.
-- ����: ROWNUM�� ���� �ٰ� ������ ����Ǳ� ����. ORDER BY�� �׻� �������� ����.
-- �ذ�: ������ �̸� ����� �ڷῡ ROWNUM�� �ٿ��� �ٽ� ��ȸ�ϴ� ���� ���� �� ���ƿ�.
SELECT
    employee_id,first_name,salary , ROWNUM AS rn

FROM employees
ORDER BY salary DESC;


-- ROWNUM�� ���̰� ���� ������ �����ؼ� ��ȸ�Ϸ��� �ϴµ�,
-- ���� ������ �Ұ����ϰ�, ������ �� ���� ������ �߻��ϴ���.
-- ����: WHERE������ ���� �����ϰ� ���� ROWNUM�� SELECT �Ǳ� ������.
-- �ذ�: ROWNUM���� �ٿ� ���� �ٽ� �� �� �ڷḦ SELECT �ؼ� ������ �����ؾ� �ǰڱ���.
SELECT
    ROWNUM AS rn,tbl.*
    FROM
    (
    SELECT
        employee_id,first_name,salary
    
    FROM employees
    ORDER BY salary DESC
    ) tbl
    WHERE rn>10 AND rn<=20;



/*
���� ���� SELECT ������ �ʿ��� ���̺� ����(�ζ��� ��)�� ����.
�ٱ��� SELECT ������ ROWNUM�� �ٿ��� �ٽ� ��ȸ
���� �ٱ��� SELECT �������� �̹� �پ��ִ� ROWNUM�� ������ �����ؼ� ��ȸ.

** SQL�� ���� ����
FROM -> WHERE -> GROUP BY -> HAVING -> SELECT -> ORDER BY
*/
SELECT *
FROM
    (
    SELECT
        ROWNUM AS rn,tbl.*
        FROM
        (
        SELECT
            employee_id,first_name,salary
        
        FROM employees
        ORDER BY salary DESC
        ) tbl
    )
    WHERE rn>10 and rn<=20;




















