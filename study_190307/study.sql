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
    
-- �������� ������ ������ ���ǻ�� ���� ���ǻ翡�� ������ ������ ���� �̸�
SELECT
    DISTINCT customer.name
FROM
    book, customer, orders
WHERE
    customer.custid = orders.custid
AND
    orders.bookid = book.bookid
AND
    customer.name NOT LIKE '%������%'
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
        customer.name LIKE '%������%');

-- �� �� �̻��� ���� �ٸ� ���ǻ翡�� ������ ������ ���� �̸�
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

-- ��ü ���� 30% �̻��� ������ ����
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

-- ���ο� ���� (�������� ���衯, �����ѹ̵�, 10000��)�� ���缭���� �԰�Ǿ���(������ �� �� ��� �ʿ��� �����Ͱ� �� �ִ��� ã�ƺ���)
INSERT INTO
    book(bookid, bookname, publisher, price)
VALUES
    (11, '������ ����', '���ѹ̵��', 10000);
-- 11(bookid)�� �⺻Ű�̹Ƿ� null���� �� �� ����

-- ���Ｚ�硯���� ������ ������ �����ؾ� �Ѵ�.
DELETE FROM
    book
WHERE
    publisher LIKE '�Ｚ��';

-- ���̻�̵����� ������ ������ �����ؾ� �Ѵ�. ������ �� �� ��� ������ �����غ���.
DELETE FROM
    book
WHERE
    publisher LIKE '�̻�̵��';
    
SELECT
    constraint_name, table_name, r_constraint_name
FROM
    user_constraints
WHERE
    constraint_name = 'SYS_C007016';
-- orders ���̺��� bookid ���� �����͸� �ܷ�Ű(��������)�� �����ϰ� �ֱ� ������ ������ �� ����
-- orders�� bookid�� ����ġ �� ������ �õ��ؾ� �Ѵ�

ALTER TABLE
    orders
DROP
    PRIMARY KEY;
    
ALTER TABLE
    orders
DROP CONSTRAINT
    SYS_C007016;

    
-- ���ǻ� �����ѹ̵��� ���������ǻ硯�� �̸��� �ٲپ���.
UPDATE
    book
SET
    publisher = '�������ǻ�'
WHERE
    publisher LIKE '���ѹ̵��'