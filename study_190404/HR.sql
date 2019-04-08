CREATE TABLE
    pl_employees3 AS
    SELECT
        employee_id, first_name , salary
    FROM
        employees;
        
SET serveroutput ON
DECLARE
    vno pl_employees3.employee_id%TYPE;
    vname pl_employees3.first_name%TYPE;
    vsal pl_employees3.salary%TYPE;
BEGIN
    SELECT
        employee_id, first_name, salary INTO vno, vname, vsal
    FROM
        pl_employees3
    WHERE
        employee_id=180;
    DBMS_OUTPUT.PUT_LINE(vno||'---'||vname||'---'||vsal);
END;
/

SET serveroutput ON
DECLARE
    v_row pl_employees3%ROWTYPE;
BEGIN
    SELECT
        *
    INTO
        v_row
    FROM
        pl_employees3
    WHERE
        employee_id=180;
    DBMS_OUTPUT.PUT_LINE(v_row.employee_id||'==='||v_row.first_name||'==='||v_row.salary);
END;
/

SET serveroutput ON
DECLARE
    v_empid employees.employee_id%TYPE;
    v_ename employees.first_name%TYPE;
    v_deptno departments.department_id%TYPE;
    v_dname departments.department_name%TYPE; 
BEGIN
    SELECT
        e.employee_id, e.first_name, d.department_id, d.department_name
    INTO
        v_empid, v_ename, v_deptno, v_dname
    FROM
        employees e, departments d
    WHERE
        e.employee_id=180
    AND
        e.department_id = d.department_id;
    DBMS_OUTPUT.PUT_LINE(v_empid||'---'||v_ename||'---'||v_deptno||'---'||v_dname);
END;
/

SET verify OFF
SET serveroutput ON
DECLARE
    v_no1 NUMBER := &no1;
    v_no2 NUMBER := &no2;
    v_sum NUMBER;
BEGIN
    v_sum := v_no1 + v_no2;
    DBMS_OUTPUT.PUT_LINE('첫번째 수'||v_no1||', 두번째 수'||v_no2||' , 합은 : '||v_sum||' 입니다');
END;
/

SET serveroutput ON
DECLARE
    TYPE
        emp_record_type
    IS RECORD(
        emp_id employees.employee_id%TYPE,
        f_name employees.first_name%TYPE,
        e_sal employees.salary%TYPE);
    v_rec1 emp_record_type;
BEGIN
    SELECT
        employee_id, first_name, salary
    INTO
        v_rec1
    FROM
        employees
    WHERE
        employee_id = 180;
    DBMS_OUTPUT.PUT_LINE(v_rec1.emp_id||'--'||v_rec1.f_name||'--'||v_rec1.e_sal);
END;
/

SET serveroutput ON
DECLARE
    t_name VARCHAR2(20);
    TYPE
        tb1_emp_name
    IS TABLE OF
        employees.first_name%TYPE
    INDEX BY BINARY_INTEGER;
    v_name tb1_emp_name;
BEGIN
    SELECT
        first_name
    INTO
        t_name
    FROM
        employees
    WHERE
        employee_id = 180;
    v_name(0) := t_name;
    DBMS_OUTPUT.PUT_LINE(v_name(0));
END;
/

SET serveroutput ON
DECLARE
    TYPE
        e_table_type
    IS TABLE OF
        employees.first_name%TYPE
    INDEX BY BINARY_INTEGER;
    tab_type e_table_type;
    a BINARY_INTEGER := 0;
BEGIN
    FOR i IN(
        SELECT
            first_name
        FROM
            employees) LOOP
        a := a+1;
        tab_type(a) := i.first_name;
    END LOOP;
    FOR j IN 1..a LOOP
        DBMS_OUTPUT.PUT_LINE(tab_type(j));
    END LOOP;
END;
/

VARIABLE v_bind NUMBER;
BEGIN
    SELECT
        (salary*12)
    INTO
        :v_bind
    FROM
        employees
    WHERE
        employee_id = 180;
END;
/

PRINT v_bind;

DECLARE
    vempid employees.emplooyee_id%TYPE;
    vfname employees.first_name%TYPE;
    vdeptid employees.department_id%TYPE;
    vdname VARCHAR2(20);
BEGIN
    SELECT
        employee_id, first_name, department_id
    INTO
        vempid, vfname, vdeptid
    FROM
        employees
    WHERE
        employee_id = 203;
    IF (vdeptid = 10) THEN
        vdname := 'Administration';
    END IF;
    IF (vdeptid = 20) THEN
        vdname := 'Marketing';
    END IF;
    IF (vdeptid = 30) THEN
        vdname := 'Purchasing';
    END IF;
    IF (vdeptid = 40) THEN
        vdname := 'Human Resources';
    END IF;
    DBMS_OUTPUT.PUT_LINE(vempid||'--'||vfname||'--'||vdeptid||'--'||vdname);  
END;
/ --이소스 안됨, 해결할 것(14장 52페이지)