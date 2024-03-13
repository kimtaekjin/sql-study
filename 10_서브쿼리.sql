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



--각 부서의 매니저 이름 조회
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
- 스칼라 서브쿼리가 조인보다 좋은 경우
: 함수처럼 한 레코드당 정확히 하나의 값만을 리턴할 때.

- 조인이 스칼라 서브쿼리보다 좋은 경우
: 조회할 컬럼이나 데이터가 대용량인 경우, 해당 데이터가
수정, 삭제 등이 빈번한 경우 (sql 가독성이 조인이 좀 더 뛰어납니다.)
*/

--각 부서별 사원 수 뽑기(스칼라)
SELECT 
    d.department_name,
    (
    SELECT 
        COUNT(*)
    FROM employees e
    WHERE e.department_id=d.department_id
    GROUP BY department_id
    )AS 사원수
FROM departments d;



--------------------------------------------------------------------------------

-- 인라인 뷰 (FROM 구문에 서브쿼리가 오는 것.)
-- 특정 테이블 전체가 아닌 SELECT를 통해 일부 데이터를 조회한 것을 가상 테이블로 사용하고 싶을 때. 
-- 순번을 정해놓은 조회 자료를 범위를 지정해서 가지고 오는 경우.



-- salary로 정렬을 진행하면서 바로 ROWNUM을 붙이면
-- ROWNUM이 정렬이 되지 않는 상황이 발생합니다.
-- 이유: ROWNUM이 먼저 붙고 정렬이 진행되기 때문. ORDER BY는 항상 마지막에 진행.
-- 해결: 정렬이 미리 진행된 자료에 ROWNUM을 붙여서 다시 조회하는 것이 좋을 것 같아요.
SELECT
    employee_id,first_name,salary , ROWNUM AS rn

FROM employees
ORDER BY salary DESC;


-- ROWNUM을 붙이고 나서 범위를 지정해서 조회하려고 하는데,
-- 범위 지정도 불가능하고, 지목할 수 없는 문제가 발생하더라.
-- 이유: WHERE절부터 먼저 실행하고 나서 ROWNUM이 SELECT 되기 때문에.
-- 해결: ROWNUM까지 붙여 놓고 다시 한 번 자료를 SELECT 해서 범위를 지정해야 되겠구나.
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
가장 안쪽 SELECT 절에서 필요한 테이블 형식(인라인 뷰)을 생성.
바깥쪽 SELECT 절에서 ROWNUM을 붙여서 다시 조회
가장 바깥쪽 SELECT 절에서는 이미 붙어있는 ROWNUM의 범위를 지정해서 조회.

** SQL의 실행 순서
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




















