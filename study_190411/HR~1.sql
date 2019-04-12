CREATE OR REPLACE PROCEDURE
    up_sal
    (vempid  employees.employee_id%TYPE)
IS
    BEGIN
        UPDATE 
            employees
        SET
            salary=5000
        WHERE
            employee_id = vempid;
    END;
/


EXEC up_sal(206);


SELECT
    employee_id, salary
FROM
    employees
WHERE
    employee_id = 206;


SELECT
    text
FROM
    user_source
WHERE
    name = 'UP_SAL';


CREATE OR REPLACE FUNCTION
    max_sal
    ( s_deptno  employees.department_id%TYPE )
    RETURN NUMBER
IS
    max_sal  employees.salary%TYPE;
BEGIN
    SELECT
        max(salary)
    INTO
        max_sal
    FROM
        employees
    WHERE
        department_id = s_deptno;
    RETURN
        max_sal;
END;
/


SELECT
    max_sal(10)
FROM
    dual;

    
SELECT
    text
FROM
    user_source
WHERE
    type='FUNCTION'
AND
    name='MAX_SAL';


CREATE OR REPLACE PACKAGE emp_total AS
    PROCEDURE emp_sum;
    PROCEDURE emp_avg;
END emp_total;
/


CREATE OR REPLACE PACKAGE BODY emp_total AS
    PROCEDURE emp_sum IS
        CURSOR emp_total_sum IS
            SELECT
                COUNT(*), SUM(NVL(salary,0))
            FROM employees;
        total_num NUMBER;
        total_sum NUMBER;
    BEGIN
        OPEN emp_total_sum;
        FETCH
            emp_total_sum
        INTO
            total_num , total_sum;
            DBMS_OUTPUT.PUT_LINE('총인원수: '||total_num||' , 급여합계: '||total_sum);
        CLOSE emp_total_sum;
    END emp_sum;     
    PROCEDURE emp_avg IS
        CURSOR emp_total_avg IS
            SELECT
                COUNT(*), AVG(NVL(salary,0))
            FROM employees;
        total_num NUMBER;
        total_avg NUMBER;
    BEGIN
        OPEN emp_total_avg;
        FETCH
            emp_total_avg
        INTO
            total_num , total_avg;
            DBMS_OUTPUT.PUT_LINE('총인원수: '||total_num||' , 급여평균: '||total_avg);
        CLOSE emp_total_avg ;
    END emp_avg;
END emp_total;
/


CREATE TABLE t_order
    (no NUMBER, ord_code VARCHAR2(10), ord_date DATE);
    
DROP TABLE t_order;


CREATE OR REPLACE TRIGGER t_order
    BEFORE INSERT ON t_order
    BEGIN
        IF(TO_CHAR(SYSDATE, 'HH24:MI') NOT BETWEEN '11:00' AND '18:50') THEN
            RAISE_APPLICATION_ERROR(-20100, '허용시간이 아닙니다');
        END IF;
    END;
/


SELECT TO_CHAR(SYSDATE, 'YYYY.MM.DD HH:MI:SS') time FROM DUAL;
SELECT * FROM t_order;


INSERT INTO t_order VALUES(1, 'C100', SYSDATE);


CREATE OR REPLACE TRIGGER t_order2
    BEFORE INSERT ON t_order
    FOR EACH ROW
    BEGIN
        IF(:NEW.ord_code) NOT IN ('C100') THEN
            RAISE_APPLICATION_ERROR(-20200, '제품코드가 틀립니다');
        END IF;
    END;
/


INSERT INTO t_order VALUES(1, 'C100', SYSDATE);
INSERT INTO t_order VALUES(2, 'C200', SYSDATE);


CREATE OR REPLACE TRIGGER t_order3
    BEFORE INSERT ON t_order
    FOR EACH ROW
    WHEN(NEW.ord_code = 'C500')
    BEGIN
        IF(TO_CHAR(SYSDATE, 'HH24:MI') NOT BETWEEN '18:50' AND '19:00') THEN
            RAISE_APPLICATION_ERROR(-20300, 'C500 제품의 입력허용시간이 아닙니다');
    END IF;
END;
/

INSERT INTO t_order VALUES(1, 'C100', SYSDATE);
INSERT INTO t_order VALUES(2, 'C200', SYSDATE);
INSERT INTO t_order VALUES(5, 'C500', SYSDATE);





ROLLBACK;