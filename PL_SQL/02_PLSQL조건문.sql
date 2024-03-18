
DECLARE
v_salary NUMBER :=0;
v_department_id NUMBER :=0;

BEGIN
v_department_id :=ROUND(DBMS_RANDOM.VALUE(10,110),-1);
  dbms_output.put_line('생성된 난수: ' || v_department_id);

SELECT
    salary
    INTO v_salary

FROM employees

WHERE department_id = v_department_id
AND ROWNUM=1; --첫째 값만 구해서 변수에 저장.

IF
        v_salary<=5000
        THEN  --그렇다면~
        dbms_output.put_line('급여가 낮습니다.');
        
    ELSIF --else if
    v_salary <=9000
    THEN
     dbms_output.put_line('급여가 애매하네요.');
     
    ELSE --else
  dbms_output.put_line('급여가 높습니다.');
  END IF; --END IF를 붙여서 if문을 종료시켜야 합니다.
  
  
END;










--CASE문



DECLARE
v_salary NUMBER :=0;
v_department_id NUMBER :=0;

BEGIN
v_department_id :=ROUND(DBMS_RANDOM.VALUE(10,110),-1);


SELECT
    salary
    INTO v_salary

FROM employees

WHERE department_id = v_department_id
AND ROWNUM=1; --첫째 값만 구해서 변수에 저장.

CASE
    WHEN v_salary <=5000 THEN
    dbms_output.put_line('급여가 낮네');
    WHEN v_salary <=9000 THEN
      dbms_output.put_line('급여가 중간');
    ELSE
          dbms_output.put_line('급여가 높음');
      END CASE;    
  
END;


--중첩IF문


DECLARE
    v_salary NUMBER := 0;
    v_department_id NUMBER := 0;
    v_commission NUMBER := 0; 
BEGIN
    v_department_id := ROUND(DBMS_RANDOM.VALUE(10,110), -1);

    SELECT
        salary,
        commission_pct
    INTO
        v_salary,
        v_commission
    FROM
        employees
    WHERE
        department_id = v_department_id
        AND ROWNUM = 1; -- 첫 번째 값만 가져와 변수에 저장.

    IF v_commission > 0 THEN
        IF v_commission > 0.15 THEN
            dbms_output.put_line('커미션이 15% 이상');
            dbms_output.put_line(v_salary * v_commission); -- v_salary와 v_commission을 곱하여 출력
        END IF;
    ELSE
        dbms_output.put_line('커미션이 없음');
    END IF;
END;









