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
    
    