SET SERVEROUTPUT ON;

CREATE TABLE
    pl_test(no number, name varchar2(10));
 
CREATE SEQUENCE
    pl_seq;
 
BEGIN
    INSERT INTO
        pl_test
    VALUES(pl_seq.NEXTVAL,'AAA');
END;
/

SELECT
    *
FROM
    pl_test;
    
CREATE TABLE
    pl_test2(no number, name varchar2(10), addr varchar2(10));
    
SET VERIFY OFF

DECLARE
    v_no number := '&no';
    v_name varchar2(10) := '&name';
    v_addr varchar2(10) := '&addr';
BEGIN
    INSERT INTO
        pl_test2
    VALUES(v_no, v_name, v_addr);
END ;
/

SELECT
    *
FROM
    pl_test2;
    
BEGIN
    UPDATE
        pl_test
    SET
        name = 'BBB'
    WHERE
        no = 2;
END;
/

SELECT
    *
FROM
    pl_test;
    
BEGIN
    DELETE FROM
        pl_test
    WHERE
        no=1;
END;
/

SELECT
    *
FROM
    pl_test;
    
CREATE TABLE
        pl_merge1(no number, name varchar2(10));
        
CREATE TABLE
    pl_merge2 AS
        SELECT
            *
        FROM
            pl_merge1;
            
INSERT INTO
    pl_merge1
VALUES(1, 'AAA');

INSERT INTO
    pl_merge1
VALUES(2, 'BBB');

INSERT INTO
    pl_merge2
VALUES(1, 'CCC');

INSERT INTO
    pl_merge2
VALUES(3, 'DDD');

SELECT
    *
FROM
    pl_merge1;
    
SELECT
    *
FROM
    pl_merge2;
    
BEGIN
    MERGE INTO
        pl_merge2 m2
    USING
        pl_merge1 m1
    ON(m1.no = m2.no)
    WHEN MATCHED THEN
        UPDATE SET
            m2.name = m1.name
    WHEN NOT MATCHED THEN
    INSERT VALUES(m1.no, m1.name);
END;
/

SELECT
    *
FROM
    pl_merge1;
    
SELECT
    *
FROM
    pl_merge2;
    
DECLARE
    v_first VARCHAR2(5) := 'Outer';
BEGIN
    DECLARE
        v_second VARCHAR2(5) := 'Inner';
    BEGIN
        DBMS_OUTPUT.PUT_LINE(v_first);
        DBMS_OUTPUT.PUT_LINE(v_second);
    END;
    DBMS_OUTPUT.PUT_LINE(v_first);
END;
/