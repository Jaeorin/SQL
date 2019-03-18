-- 도서번호가 1인 도서의 이름
SELECT
    book.bookname
FROM
    book
WHERE
    bookid = 1;

-- 가격이 20,000원 이상인 도서의 이름
SELECT
    book.bookname
FROM
    book
WHERE
    price >= 20000;

-- 박지성의 총 구매액
SELECT
    SUM(orders.saleprice) 
FROM
    customer, orders 
WHERE
    customer.custid = orders.custid AND
    customer.name LIKE '박지성';

-- 박지성이 구매한 도서의 수
SELECT
    COUNT(*)
FROM
    customer, orders 
WHERE
    customer.custid = orders.custid AND
    customer.name LIKE '박지성';

-- 마당서점 도서의 총 개수
SELECT
    count(*)
FROM
    book;

-- 마당서점에 도서를 출고하는 출판사의 총 개수
SELECT
    COUNT(Distinct book.publisher)
FROM
    book;

-- 모든 고객의 이름, 주소
SELECT
    customer.name, customer.address
FROM
    customer;

-- 2014년 7월 4일~7월 7일 사이에 주문받은 도서의 주문번호
SELECT
    orders.orderid
FROM
    orders
WHERE
    orders.orderdate BETWEEN '20140704' AND '20140707';

-- 2014년 7월 4일~7월 7일 사이에 주문받은 도서를 제외한 도서의 주문번호
SELECT
    orders.orderid
FROM
    orders
WHERE
    orders.orderdate NOT BETWEEN '20140704' AND '20140707';

-- 성이 '김' 씨인 고객의 이름과 주소
SELECT
    customer.name, customer.address
FROM
    customer
WHERE
    name LIKE '김%';

-- 성이 ‘김’ 씨이고 이름이 ‘아’로 끝나는 고객의 이름과 주소
SELECT
    customer.name, customer.address
FROM
    customer
WHERE
    name LIKE '김%아';
    
-- 박지성이 구매한 도서의 출판사 수
SELECT
    COUNT(DISTINCT book.publisher) 
FROM
    customer, orders, book 
WHERE
    customer.custid = orders.custid AND
    orders.bookid = book.bookid AND
    customer.name LIKE '박지성';

-- 박지성이 구매한 도서의 이름, 가격, 정가와 판매가격의 차이
SELECT
    bookname, price, (price-saleprice)
FROM
    customer, orders, book 
WHERE
    customer.custid = orders.custid AND
    orders.bookid = book.bookid AND
    customer.name LIKE '박지성';

-- 박지성이 구매하지 않은 도서의 이름
SELECT
    book.bookname
FROM
    book
WHERE
    NOT EXISTS(
    SELECT
        bookname
    FROM
        customer, orders
	WHERE
        customer.custid = orders.custid AND
        orders.bookid = book.bookid AND
        customer.name LIKE '박지성');

-- 주문하지 않은 고객의 이름(조인 사용)
SELECT
    customer.name
FROM
    customer
WHERE
    customer.name NOT IN(
    SELECT
        customer.name
    FROM
        orders, customer
    WHERE
    orders.custid = customer.custid);

-- 주문 금액의 총액과 주문의 평균 금액
SELECT
    SUM(orders.saleprice), AVG(orders.saleprice)
FROM
    orders;

-- 고객의 이름과 고객별 구매액
SELECT
    customer.name, SUM(orders.saleprice)
FROM
    orders, customer
WHERE
    orders.custid = customer.custid
GROUP BY
    name;

-- 고객의 이름과 고객이 구매한 도서 목록
SELECT
    customer.name, book.bookname
FROM
    book, orders, customer
WHERE
    book.bookid = orders.bookid AND
    orders.custid = customer.custid;

-- 도서의 가격(Book 테이블)과 판매가격(Orders 테이블)의 차이가 가장 많은 주문
SELECT
    book.bookname
FROM
    book, orders
WHERE
    book.bookid = orders.bookid AND
    (book.price - orders.saleprice) = (
    SELECT
        MAX(book.price - orders.saleprice) 
    FROM
        book, orders
	WHERE
        book.bookid = orders.bookid);

-- 도서의 판매액 평균보다 자신의 구매액 평균이 더 높은 고객의 이름
SELECT
    customer.name
FROM
    customer, orders
WHERE
    customer.custid = orders.custid
GROUP BY
    customer.name 
HAVING
    AVG(orders.saleprice) > (
    SELECT
        AVG(orders.saleprice)
    FROM
        orders);

SELECT
    customer.name, AVG(orders.saleprice)
FROM
    customer, orders
WHERE
    customer.custid = orders.custid
GROUP BY
    customer.name;
    
SELECT
    AVG(orders.saleprice)
FROM
    orders; 
    
-- 박지성이 구매한 도서의 출판사와 같은 출판사에서 도서를 구매한 고객의 이름
SELECT
    DISTINCT customer.name
FROM
    book, customer, orders
WHERE
    customer.custid = orders.custid
AND
    orders.bookid = book.bookid
AND
    customer.name NOT LIKE '%박지성%'
AND
    book.publisher IN(
    SELECT
        book.publisher
    FROM
        book, customer, orders
    WHERE
        customer.custid = orders.custid
    AND
        orders.bookid = book.bookid
    AND
        customer.name LIKE '%박지성%');

-- 두 개 이상의 서로 다른 출판사에서 도서를 구매한 고객의 이름
SELECT
    c1.name
FROM
    customer c1
WHERE
    2 >= (
    SELECT
        COUNT(DISTINCT publisher)
    FROM
        customer, orders, book
    WHERE
        customer.custid = orders.custid
    AND
        orders.bookid = book. bookid
    AND
        (name LIKE c1.name));

-- 전체 고객의 30% 이상이 구매한 도서
SELECT
    bookname
FROM
    book b1
WHERE
    ((
    SELECT
        COUNT(book.bookid)
    FROM
        book, orders
    WHERE
        book.bookid = orders.bookid
    AND
        book.bookid = b1.bookid)
    >= 0.3 * (
    SELECT
        COUNT(*)
    FROM
        customer));

-- 새로운 도서 (‘스포츠 세계’, ‘대한미디어’, 10000원)이 마당서점에 입고되었다(삽입이 안 될 경우 필요한 데이터가 더 있는지 찾아보자)
INSERT INTO
    book(bookid, bookname, publisher, price)
VALUES
    (11, '스포츠 세계', '대한미디어', 10000);
-- 11(bookid)는 기본키이므로 null값을 줄 수 없다

-- ‘삼성당’에서 출판한 도서를 삭제해야 한다.
DELETE FROM
    book
WHERE
    publisher LIKE '삼성당';

-- ‘이상미디어’에서 출판한 도서를 삭제해야 한다. 삭제가 안 될 경우 원인을 생각해보자.
DELETE FROM
    book
WHERE
    publisher LIKE '이상미디어';
    
SELECT
    constraint_name, table_name, r_constraint_name
FROM
    user_constraints
WHERE
    constraint_name = 'SYS_C007016';
-- orders 테이블에서 bookid 열의 데이터를 외래키(제약조건)로 참조하고 있기 때문에 삭제할 수 없다
-- orders의 bookid를 선조치 후 삭제를 시도해야 한다

ALTER TABLE
    orders
DROP
    PRIMARY KEY;
    
ALTER TABLE
    orders
DROP CONSTRAINT
    SYS_C007016;

    
-- 출판사 ‘대한미디어’가 ‘대한출판사’로 이름을 바꾸었다.
UPDATE
    book
SET
    publisher = '대한출판사'
WHERE
    publisher LIKE '대한미디어'