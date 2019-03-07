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