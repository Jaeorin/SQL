-- ������ȣ�� 1�� ������ �̸�
SELECT
    book.bookname
FROM
    book
WHERE
    bookid = 1;

-- ������ 20,000�� �̻��� ������ �̸�
SELECT
    book.bookname
FROM
    book
WHERE
    price >= 20000;

-- �������� �� ���ž�
SELECT
    SUM(orders.saleprice) 
FROM
    customer, orders 
WHERE
    customer.custid = orders.custid AND
    customer.name LIKE '������';

-- �������� ������ ������ ��
SELECT
    COUNT(*)
FROM
    customer, orders 
WHERE
    customer.custid = orders.custid AND
    customer.name LIKE '������';

-- ���缭�� ������ �� ����
SELECT
    count(*)
FROM
    book;

-- ���缭���� ������ ����ϴ� ���ǻ��� �� ����
SELECT
    COUNT(Distinct book.publisher)
FROM
    book;

-- ��� ���� �̸�, �ּ�
SELECT
    customer.name, customer.address
FROM
    customer;

-- 2014�� 7�� 4��~7�� 7�� ���̿� �ֹ����� ������ �ֹ���ȣ
SELECT
    orders.orderid
FROM
    orders
WHERE
    orders.orderdate BETWEEN '20140704' AND '20140707';

-- 2014�� 7�� 4��~7�� 7�� ���̿� �ֹ����� ������ ������ ������ �ֹ���ȣ
SELECT
    orders.orderid
FROM
    orders
WHERE
    orders.orderdate NOT BETWEEN '20140704' AND '20140707';

-- ���� '��' ���� ���� �̸��� �ּ�
SELECT
    customer.name, customer.address
FROM
    customer
WHERE
    name LIKE '��%';

-- ���� ���衯 ���̰� �̸��� ���ơ��� ������ ���� �̸��� �ּ�
SELECT
    customer.name, customer.address
FROM
    customer
WHERE
    name LIKE '��%��';
    
-- �������� ������ ������ ���ǻ� ��
SELECT
    COUNT(DISTINCT book.publisher) 
FROM
    customer, orders, book 
WHERE
    customer.custid = orders.custid AND
    orders.bookid = book.bookid AND
    customer.name LIKE '������';

-- �������� ������ ������ �̸�, ����, ������ �ǸŰ����� ����
SELECT
    bookname, price, (price-saleprice)
FROM
    customer, orders, book 
WHERE
    customer.custid = orders.custid AND
    orders.bookid = book.bookid AND
    customer.name LIKE '������';

-- �������� �������� ���� ������ �̸�
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
        customer.name LIKE '������');

-- �ֹ����� ���� ���� �̸�(���� ���)
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

-- �ֹ� �ݾ��� �Ѿװ� �ֹ��� ��� �ݾ�
SELECT
    SUM(orders.saleprice), AVG(orders.saleprice)
FROM
    orders;

-- ���� �̸��� ���� ���ž�
SELECT
    customer.name, SUM(orders.saleprice)
FROM
    orders, customer
WHERE
    orders.custid = customer.custid
GROUP BY
    name;

-- ���� �̸��� ���� ������ ���� ���
SELECT
    customer.name, book.bookname
FROM
    book, orders, customer
WHERE
    book.bookid = orders.bookid AND
    orders.custid = customer.custid;

-- ������ ����(Book ���̺�)�� �ǸŰ���(Orders ���̺�)�� ���̰� ���� ���� �ֹ�
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

-- ������ �Ǹž� ��պ��� �ڽ��� ���ž� ����� �� ���� ���� �̸�
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