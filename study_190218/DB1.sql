�����ͺ��̽�

http://www.mysql.com/

MySQL Community Server(Ŀ�´�Ƽ) 5.6 �ٿ�ε�


������: ��ǻ�� �ȿ� ��ϵǾ� �ִ� ����
�����ͺ��̽�: �̷��� �������� ����
              ��ǻ�� �ȿ� ��ϵ� ��� ��.
   Ư�� �����͸� Ȯ���ϰ� ������
   ���� ã���� �ֵ��� ������ ����.


* �ϻ��Ȱ������ �� ����, ǥ���� ����Ʈ ���.
           ��Ʈ������ POS �ý���.

     �޴���ȭ������ ��ȭ��ȣ�� �����ͺ��̽�.



* DB�� DBMS

* SQL���� RDBMS������ �����.

* RDBMS: Oracle, DB2, SQL Server, PostgreSQL, MySQL, SQLite


* RDBMS�� Ŭ���̾�Ʈ/���� ��


* ǥ��SQL

* ���� DB������ �ٿ�ε�
  http://download.hanbit.co.kr/exam/2231/

* ���� DB������ ����Ʈ
D:\> mysql -uroot -p < sample.dump
Enter password: 1234

* ȯ�溯�� path �� �߰�. �����ݷ�(;) ������ ����!
C:\Program Files\MySQL\MySQL Server 5.6\bin

* root �������� DB�� �α���
  mysql -uroot -p
  1234

* exit �� ����

* �����ͺ��̽�(��Ű��) ��� ���
  SHOW DATABASES;

* �����ͺ��̽�(��Ű��) ����
  USE ��Ű����;  (USE sample;)
  
* ��Ű�� ���� ���̺� ��� Ȯ��
  SHOW TABLES;


* set names euckr;


* SELECT ���
  SELECT * FROM ���̺��;

   - SELECT : ����� ����
   - * : �ֽ��͸���ũ(*)�� '��� ��'

* ���̺� ���� ����
  DESC ���̺��;

* �ڷ���
 - INTEGER�� : ��ġ��. ������ ������ �� �ִ� �ڷ���.
 - DECIMAL�� : ��ġ��. �Ҽ��� ������ �� �ִ� �Ǽ� �ڷ���.
 - CHAR�� : '�������� ���ڿ�' �ڷ���.
             CHAR(10)��  7�� ���ڸ� �����ϸ�
             ���� 3�� �߰��Ǽ� 10���� ��������� ����
 - VARCHAR�� : '�������� ���ڿ�' �ڷ���
             VARCHAR(10)�� 7�� ���� �����ϸ� 7�� ����.
 - DATE�� : ��¥�� �����ϴ� �ڷ���. ������.
 - TIME�� : �ð��� �����ϴ� �ڷ���. �ú���.



<�˻� ���� �����ϱ�>

* SELECT ���� WHERE ��
SELECT ��1, ��2 FROM ���̺�� WHERE ���ǽ�;

* SELECT ������ �� �����ϱ�
* WHERE ������ �� �����ϱ�


* WHERE ���� no �� ���� 2�� �ุ ����
  SELECT * FROM sample21 WHERE no = 2;

* ���ǽ�  no = 2
   - no : ���̸�
   - = : ������
   - 2 : ���

* �񱳿�����
  ����(=), �ٸ���(<>), ũ��(>), �۴�(<),
  ũ�ų� ����(>=), �۰ų� ����(<=)

* name �� ���� '���ؿ�'�� �ุ ����
  SELECT * FROM sample21 WHERE name = '���ؿ�';

* NULL �� �˻�
  SELECT * FROM sample21 WHERE birthday = NULL; (X)
  SELECT * FROM sample21 WHERE birthday IS NULL; (O)


* ���� ���� (AND, OR, NOT)

* AND ����
  ���ǽ�1 AND ���ǽ�2
  ��� ������ �����ϴ� ��� ���ǽ��� ���� ��. (�׸���)

 - a���� b���� ��� 0�� �ƴ� �� �˻�
   SELECT * 
   FROM sample24 
   WHERE a<>0 
   AND b<>0;


* OR ����
  ���ǽ�1 OR ���ǽ�2
  ��� ���̵� �ϳ��� ���� �Ǹ� ���ǽ��� ���� ��. (�Ǵ�)

  - a���� 0�� �ƴϰų� b���� 0�� �ƴ� ���� �˻�
    SELECT * FROM sample24 WHERE a<>0 OR b<>0;


* AND�� OR�� ����Ҷ� ������
 SELECT * FROM sample24 WHERE a<>0;
 SELECT * FROM sample24 WHERE a=1 OR a=2;
 SELECT * FROM sample24 WHERE a=1 OR 2;  (X)

* AND�� OR�� �����ؼ� ����Ҷ� ������ �켱���� ����!
 - a���� 0�� �ƴϰ� b���� 0�� �ƴ� ���� �˻�
  SELECT * FROM sample24 WHERE a<>0 AND b<>0;

 - a���� 1 �Ǵ� 2�̰�, b���� 1 �Ǵ� 2�� ���� �˻�
  SELECT * FROM sample24 
  WHERE a=1 OR a=2 AND b=1 OR b=2;

  AND������ OR���꺸�� �켱������ ����!

  SELECT * FROM sample24
  WHERE (a=1 OR a=2) AND (b=1 OR b=2);


* NOT �����ڷ� ���ǽ� ����(~�ƴ�, ~�ܿ�, ~�� ������ ������)
 - a���� 0�� �ƴϰų� b���� 0�� �ƴ� ���� ������
   ������ ���� �˻�
  SELECT * FROM sample24 WHERE NOT (a<>0 OR b<>0);


* ���� ��Ī�� ���� �˻�
  ���� LIKE '����'
  
  LIKE���� ����� �� �ִ� ��Ÿ����: % _
    % : ������ ���ڿ� (���ڰ� 0�� �̻�)
    _ : ������ ���� �Ѱ�

 SELECT * FROM sample25;

 SELECT * FROM sample25 WHERE text LIKE 'SQL%'; (������ġ)
 SELECT * FROM sample25 WHERE text LIKE '%SQL%';(�߰���ġ)
 SELECT * FROM sample25 WHERE text LIKE '%SQL'; (�Ĺ���ġ)


* �˻����� ��Ÿ���ڸ� �����ν� �˻���:  \%   \_
 SELECT * FROM sample25 WHERE text LIKE '%\%%';
 SELECT * FROM sample25 WHERE text LIKE '%\_%';


* ���ڿ� ��� �ȿ� ' ����ϱ�
  ǥ��SQL������ '�� 2�� �����ؼ� �����.

   'It's'  ->  'It''s'

      '    ->   ''''         'a'


 - sample25 ���̺��� text �� ���� '����'��� ���ڿ���
   ���Ե� ���� �˻�
  SELECT * FROM sample25 WHERE text LIKE '%����%';


* ���� - ORDER BY
  SELECT ���� FROM ���̺�� WHERE ���ǽ� ORDER BY ����;
  SELECT ���� FROM ���̺�� ORDER BY ����;

  SELECT * FROM sample31;

  - age���� ���� ������������ �����ϱ�
  SELECT * FROM sample31 ORDER BY age;

  - address���� �����ϱ�
  SELECT * FROM sample31 ORDER BY address;

* ��������(ASC)�� ��������(DESC)
  - age���� ���� ������������ �����ϱ�
  SELECT * FROM sample31 ORDER BY age ASC;

  - age���� ���� ������������ �����ϱ�
  SELECT * FROM sample31 ORDER BY age DESC;


* ���� ���� ������ �����ϱ�
  SELECT * FROM sample32;

 - a�������� �����ϱ�
  SELECT * FROM sample32 ORDER BY a;

 - a���� b���� �����ϱ�
  SELECT * FROM sample32 ORDER BY a, b;
  (���� ���� ������ �����Ҽ� ���� ��쿡��
   �������� ������ ������ �������� �����ϴ� ������ ó��)
  
 - b���� a���� �����ϱ�
  SELECT b, a FROM sample32 ORDER BY b, a;

 - a���� ASC�� b���� DESC�� �����ϱ�
  SELECT * FROM sample32 ORDER BY a ASC, b DESC;


* NULL ���� ���ļ���
  ����Ŭ������ ���� ū������ ���.
  MySQL������ ���� ���������� ���.


* ��� �� �����ϱ� - LIMIT
  SELECT ���� FROM ���̺�� WHERE ���ǽ� ORDER BY ����
  LIMIT ���;

  SELECT * FROM sample33;

 - sample33�� LIMIT 3���� ���� 3�Ǹ� ����ϱ�
  SELECT * FROM sample33 LIMIT 3;

 - sample33�� ���� �� LIMIT 3���� ���� 3�Ǹ� ����ϱ�
  SELECT * FROM sample33 ORDER BY no DESC LIMIT 3;

 - MS SQL Server������ LIMIT ��� TOP�� ���
  SELECT TOP 3 * FROM sample33;


* ������ ����
  SELECT ���� FROM ���̺�� LIMIT ��� OFFSET ��ġ;

 - sample33���� LIMIT 3 OFFSET 0���� ù��° ������ ǥ��
  SELECT * FROM sample33 LIMIT 3 OFFSET 0;
   (OFFSET�� ���������ϸ� �⺻���� 0)

 - sample33���� LIMIT 3 OFFSET 3���� �ι�° ������ ǥ��
  SELECT * FROM sample33 LIMIT 3 OFFSET 3;



* ��ġ ����
 - ��� ������ : + - * / %

   �켱������ ���� ���
    1 - 2 + 3

   �켱������ �ٸ� ���
    1 + 2 * 3


* SELECT ���� �����ϱ�
  SELECT * FROM sample34;

  SELECT *, price * quantity FROM sample34;


* ���� ����
  SELECT *, price * quantity AS amount FROM sample34;
  SELECT *, price * quantity AS "�ݾ�" FROM sample34;
  - �̸��� ASCII ���� �̿��� ���� ������ ����
    ������Ʈ(�ֵ���ǥ)�� �ѷ��μ� �����Ѵ�!

  SELECT *, price * quantity AS "select" FROM sample34;

  - �̸��� �����ϴ� ��� ���ڷ� ���۵��� �ʵ��� �Ѵ�!


* WHERE ������ �����ϱ�
  SELECT *, price * quantity AS amount FROM sample34;

 - WHERE ������ �ݾ��� ����ϰ� 2000�� �̻��� �� �˻��ϱ�
  SELECT *, price * quantity AS amount FROM sample34
  WHERE amount >= 2000;  (X)

  SELECT *, price * quantity AS amount FROM sample34
  WHERE price * quantity >= 2000;  (O)

  (�����ͺ��̽� ���� ���ο��� WHERE �� -> SELECT ����
   ������ ó����)


* NULL ���� ����
  NULL + 1
  1 + 2 * NULL
  1 / NULL
 - NULL�� �����ϸ� ����� NULL�� �ȴ�!


* ORDER BY ������ �ݾ��� ����ϰ� �������� �����ϱ�
  SELECT *, price * quantity AS amount FROM sample34
  ORDER BY price * quantity DESC;

              ���⼭ ������ ����
                 ��
  WHERE �� �� SELECT �� �� ORDER BY ��

  SELECT *, price * quantity AS amount FROM sample34
  ORDER BY amount DESC;



* �Լ�

* ROUND �Լ� : �ݿø�

* ROUND�� �ݿø��ϱ�
  SELECT * FROM sample341;

 - �⺻ ������ �Ҽ��� ù°�ڸ����� �ݿø�
  SELECT amount, ROUND(amount) FROM sample341;


* �Ҽ��� ù°�ڸ��� 0, ��°�ڸ��� 1.
  ������ �����ڸ��� -1, 10���ڸ��� -2, 100�� �ڸ��� -3.

 - �Ҽ��� ��°�ڸ����� �ݿø��ϱ�
  SELECT amount, ROUND(amount, 1) FROM sample341;

 - 10������ �ݿø��ϱ�
  SELECT amount, ROUND(amount, -2) FROM sample341;


* FLOOR �Լ� : ����
  SELECT amount, FLOOR(amount) FROM sample341;

* CEIL �Լ� : �ø�
  SELECT amount, CEIL(amount) FROM sample341;




* ���ڿ� ����

* ���ڿ� ����
  + ������ : MS SQL Server
  || ������ : Oracle, DB2, PostgreSQL
  CONCAT �Լ� : MySQL

* ���ڿ� ���� ����
  SELECT * FROM sample35;

 - ���ڿ� �������� ������ ������ ��� ���
  SELECT CONCAT(quantity, unit) FROM sample35;



* SUBSTRING �Լ� - �κй��ڿ� ��������
 - �� 4�ڸ�(�⵵) ����
  SUBSTRING('20170125', 1, 4) �� '2017'

 - 5° �ڸ����� 2�ڸ�(��) ����
  SUBSTRING('20170125', 5, 2) �� '01'

  SELECT SUBSTRING(text, 1, 4) FROM sample25;


* TRIM �Լ� - ���ڿ� ���� �¿� ���� ����.
  TRIM('ABC   ') �� 'ABC'


* CHARACTER_LENGTH �Լ�
  CHAR_LENTH �Լ�
  : ���ڿ� ���� ���ϱ�
  SELECT CHAR_LENGTH(text) FROM sample25;



* ��¥ ����
  CURRENT_TIMESTAMP �Լ�
  CURRENT_DATE �Լ�
  CURRENT_TIME �Լ�
  INTERVAL

  SELECT CURRENT_TIMESTAMP;  - MySQL
  SELECT CURRENT_TIMESTAMP FROM dual;  - Oracle

  SELECT CURRENT_DATE;
  SELECT CURRENT_TIME;


* ��¥�� ������ ����
 - �ý��� ��¥�� 1�� �ĸ� ����ϱ�
  SELECT CURRENT_DATE + INTERVAL 1 DAY;

 - �ý��� ��¥�� 1�� ������ ����ϱ�
  SELECT CURRENT_DATE - INTERVAL 1 DAY;


* ��¥�� ���� ����
  ��¥�� ���� ������ ���������� �� �ǹ��ִ� �ڷᰡ �ƴ�.

  SELECT DATEDIFF('2017-01-19', '2016-12-25');  - MySQL
  SELECT '2017-01-19' - '2016-12-25' FROM dual; - Oracle



* CASE ������ ������ ��ȯ�ϱ�
  CASE
    WHEN ���ǽ�1 THEN ��1
    WHEN ���ǽ�2 THEN ��2
    ELSE ��3
  END

  SELECT * FROM sample37;
 - CASE�� NULL ���� 0���� ��ȯ�ϱ�
  SELECT a, 
         CASE
           WHEN a IS NULL THEN 0 
           ELSE a
         END AS a2
  FROM sample37;

 - COALESCE �Լ� (NULL ���� ��ȯ�ϴ� �뵵)
  SELECT a, COALESCE(a, 0) FROM sample37;


 - �˻� CASE �� (�ڹ��� if ���̶� ���)
  CASE
    WHEN gender=1 THEN '����'
    WHEN gender=2 THEN '����'
  END

* 1�̸� '����', 2�̸� '����', �׿ܴ� '������'
  SELECT a AS "�ڵ�",
         CASE
           WHEN a=1 THEN '����'
           WHEN a=2 THEN '����'
           ELSE '������'
         END AS "����"
  FROM sample37;


 - �ܼ� CASE �� (�ڹ��� switch ���̶� ���)
  CASE gender
    WHEN 1 THEN '����'
    WHEN 2 THEN '����'
  END

  SELECT a AS "�ڵ�",
         CASE a
           WHEN 1 THEN '����'
           WHEN 2 THEN '����'
           ELSE '������'
         END AS "����"
  FROM sample37;



* CASE�� ����� ��� ���ǻ���
 - ELSE�� �����ϸ� ELSE NULL�� �ǹǷ� ����!
   ELSE �������� �ʰ� �����ϴ� ���� ����.

 - �ܼ� CASE ������ WHEN ���� NULL �����ϱ�
  CASE a
    WHEN 1 THEN '����'
    WHEN 2 THEN '����'
    WHEN NULL THEN '������ ����'  (a = NULL �� �Ұ���!)
    ELSE '������'
  END   (NULL �񱳰� �߸���)

  CASE
    WHEN a=1 THEN '����'
    WHEN a=2 THEN '����'
    WHEN a IS NULL THEN '������ ����'
    ELSE '������'
  END   (NULL Ȯ�� �ùٸ�)




