
--이너(내부)조인
SELECT *
FROM info i
INNER JOIN auth a
ON i.auth_id=a.auth_id;

--오라클 문법(오라클 전용 문법)
SELECT *
FROM info i,auth a
WHERE i.auth_id=a.auth_id;


--auth.id 컬럽을 그냥 쓰며 모호하다 라고 뜬다
--그 이유는 양쪽에 모두 존재하는 컬럼이기 때문이다.
--컬럼에 테이블 이름을 붙이던지, 별칭을 써서
--확실하게 지목해야 한다.
SELECT
    a.auth_id,i.title,i.content,a.name
FROM info i
JOIN auth a --JOIN 이라고만 쓰면 기본 INNER JOIN 으로 인식
ON i.auth_id = a.auth_id;


--필요한 데이터만 조회(일반조건) ->
--WHERE 구문을 통해 조건 걸기
SELECT
    a.auth_id,i.title,i.content,a.name
FROM info i
JOIN auth a 
ON i.auth_id = a.auth_id
WHERE a.name='이순신';


--아우터(외부) 조인

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


--좌측 테이블과 우측 테이블 데이터를 모두 읽어 표현하는 외부 조인 (FULL OUTER JOIN)
SELECT *
FROM info i
FULL JOIN auth a
ON i.auth_id=a.auth_id;



--CROSS JOIN은 JOIC조건을 설정하지 않기 때문에
--단순히 모든 컬럼에 대한 JOIC을 진행합니다.
--실제로는 거의 사용하지 않습니다.
SELECT * FROM info
CROSS JOIN auth;

SELECT * FROM info,auth;

--여러 개 테이블 조인 ->키 값을 찾아 구문을 연결해서 쓰면 됩니다.
SELECT *
FROM employees e
LEFT JOIN departments d ON e.department_id=d.department_id
LEFT JOIN locations loc ON d.location_id=loc.location_id;



/*
- 테이블 별칭 a, i를 이용하여 LEFT OUTER JOIN 사용.
- info, auth 테이블 사용
- job 컬럼이 scientist인 사람의 id, title, content, job을 출력.
*/

SELECT 
i.id,i.title,i.content,a.job
FROM info i
RIGHT JOIN auth a
ON i.auth_id=a.auth_id
WHERE a.job='scientist';


--셀프 조인이랑 동일 테이블 사이의 조인을 말합니다.
--동일 테이블 컬럼을 통해 기존의 존재하는 값을 매칭시켜 가져올 때 사용합니다.
SELECT
e1.employee_id,e1.first_name,e1.manager_id,
e2.first_name,e2.employee_id
FROM employees e1
JOIN employees e2
ON e1.manager_id = e2.employee_id
ORDER BY e1.employee_id;


/*
문제 1.
-EMPLOYEES 테이블과, DEPARTMENTS 테이블은 DEPARTMENT_ID로 연결되어 있습니다.
-EMPLOYEES, DEPARTMENTS 테이블을 엘리어스를 이용해서
각각 INNER , LEFT OUTER, RIGHT OUTER, FULL OUTER 조인 하세요. (달라지는 행의 개수 주석으로 작성)
*/
SELECT *
FROM employees e
JOIN departments d 
ON e.department_id=d.department_id; --inner 106개

SELECT *
FROM employees e
LEFT JOIN departments d 
ON e.department_id=d.department_id; --LEFT 107개

SELECT *
FROM employees e
RIGHT JOIN departments d 
ON e.department_id=d.department_id; --RIGHT 122개

SELECT *
FROM employees e
FULL JOIN departments d 
ON e.department_id=d.department_id; --LEFT 123개

/*
문제 2.
-EMPLOYEES, DEPARTMENTS 테이블을 INNER JOIN하세요
조건)employee_id가 200인 사람의 이름, department_name를 출력하세요
조건)이름 컬럼은 first_name과 last_name을 합쳐서 출력합니다
*/
SELECT concat(e.first_name ,e.last_name) AS 이름,
d.department_name
FROM employees e
JOIN departments d
ON e.department_id=d.department_id
WHERE e.employee_id = 200;
/*
문제 3.
-EMPLOYEES, JOBS테이블을 INNER JOIN하세요
조건) 모든 사원의 이름과 직무아이디, 직무 타이틀을 출력하고, 이름 기준으로 오름차순 정렬
HINT) 어떤 컬럼으로 서로 연결되어 있는지 확인
*/
SELECT 
concat(e.first_name,e.last_name)AS 이름,
e.job_id, j.job_title
FROM employees e
JOIN jobs j ON e.job_id = j.job_id
ORDER BY 이름;


/*
문제 4.
--JOBS테이블과 JOB_HISTORY테이블을 LEFT_OUTER JOIN 하세요.
*/
SELECT * FROM jobs;
SELECT * FROM job_history;

SELECT *
FROM jobs j
LEFT JOIN job_history jh ON j.job_id=jh.job_id;
/*
문제 5.
--Steven King의 부서명을 출력하세요.
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
문제 6.
--EMPLOYEES 테이블과 DEPARTMENTS 테이블을 Cartesian Product(Cross join)처리하세요
*/
SELECT *
FROM employees e
CROSS JOIN departments d;

SELECT * FROM employees,departments;























