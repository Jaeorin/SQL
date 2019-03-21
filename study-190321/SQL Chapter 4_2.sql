SELECT
    *
FROM
    mybook;

SELECT
    bookid, NVL(price, 0)
FROM
    mybook;

SELECT
    *
FROM
    mybook
WHERE
    price IS NULL;
    
SELECT
    *
FROM
    mybook
WHERE
    price = '';
    
SELECT
    bookid, price + 100
FROM
    mybook;
    
SELECT
    SUM(price), AVG(price), COUNT(*)
FROM
    mybook
WHERE
    bookid >= 4;
    
SELECT
    COUNT(*), COUNT(price)
FROM
    mybook;
    
SELECT
    SUM(price), AVG(price)
FROM
    mybook;
    
SELECT
    custid, (
    SELECT
        address
    FROM
        customer cs
    WHERE
        cs.custid = od.custid) "address",
    SUM(saleprice) "total"
FROM
    Orders od
GROUP BY
    od.custid, custid;
    
SELECT
    cs.name, s
FROM
    (SELECT
        custid, AVG(saleprice) s
    FROM
        orders
    GROUP BY
        custid) od, customer cs
WHERE cs.custid = od.custid;

SELECT
    SUM(saleprice) "total"
FROM
    orders od
WHERE
    EXISTS(
        SELECT
            *
        FROM
            customer cs
        WHERE
            custid <= 3 AND cs.custid = od.custid);