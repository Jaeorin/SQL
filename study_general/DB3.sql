* SQL����� ����
 - DML(Data Manipulation Language) : ������ ����
    SELECT, INSERT, UPDATE, DELETE

 - DDL(Data Definition Language) : ������ ����
    �����ͺ��̽� ��ü(object)�� ����ų� �����ϴ� ��ɾ�.
    �����ͺ��̽� ��ü: ���̺�, �ε���, ��
    ��ɾ�: CREATE, DROP, ALTER

 - DCL(Data Control Language) : �����ͺ��̽� ����
    TRANSACTION ����, ������ ���ٱ��� ����


* ��Ű�� - �����ͺ��̽� ��ü�� ��������� ����, �׸�.
  �ϳ��� ��Ű�� �ȿ��� �̸��� �ߺ��Ǵ� ��ü�� �����Ҽ� ����.
  ��Ű���� ���̺��� ���ӽ����̽�(�̸�����)�ν� ����Ѵ�.



* ���̺� �ۼ�������������
  CREATE TABLE ���̺�� (�� ����1, �� ����2, ...);
  DROP TABLE ���̺��;
  ALTER TABLE ���̺�� �Ϻθ��;


* ���̺� �ۼ�
  CREATE TABLE ���̺�� (
      �� ����1,
      �� ����2,
      ...
  );

 - �� ����
   ���� �ڷ��� [DEFAULT �⺻��] [NULL|NOT NULL]


 - CREATE TABLE�� ���̺� �ۼ��ϱ�
   CREATE TABLE sample62 (
       no INTEGER NOT NULL,
       a VARCHAR(30),
       b DATE
   );

   DESC sample62;


* ���̺� ����
  DROP TABLE sample62;

 - ���̺� ���Ǵ� �״�� ��ä ������ �ุ ����
   DELETE FROM sample62;

 - DDL�� �з��Ǵ� TRUNCATE TABLE ����� ����ϸ� �����ӵ� ���
   TRUNCATE TABLE ���̺��;



* ���̺� ����
  ALTER TABLE ���̺�� ������;
  - �� �߰�, ����, ����
  - ���� �߰�, ����


 - �� �߰�
  ALTER TABLE ���̺�� ADD �� ����;

  ALTER TABLE sample62 ADD newcol INTEGER;

 - NOT NULL ������ �ɸ� ���� �߰��� ���� �⺻���� �����ؾ� ��!



* �� �Ӽ� ����
  ALTER TABLE ���̺�� MODIFY ������;

  ALTER TABLE sample62 MODIFY newcol VARCHAR(20);


* �� �̸� ����
 - MySQL
  ALTER TABLE ���̺�� CHANGE [�������̸�] [�ű� �� ����];

 - Oracle
  ALTER TABLE ���̺�� RENAME TO [�������̸�] [�ű� �� ����];

 - ALTER TABLE�� �� �̸� �����ϱ�
  ALTER TABLE sample62 CHANGE newcol c VARCHAR(20);


* �� ����
  ALTER TABLE ���̺�� DROP ����;

  ALTER TABLE sample62 DROP c;


* ALTER TABLE�� ���̺� ������ ���ǻ���
 - ���ڿ����� �ִ���� ����
   VARCHAR(4) �� VARCHAR(10)    ��������.
   VARCHAR(10) �� VARCHAR(4)    �����߻����� ����.
   
 - �� �߰� �� ������ ���̺� ���� �߰��ϴ� INSERT �����
   Ȯ���ϴ°� ������.

   INSERT INTO ���̺�� VALUES (1,2,3,4,5);
      �� ���� �߰��Ǹ� ����ȵɰ��ɼ� ����!

   INSERT INTO ���̺�� (a,b,c,d,e) VALUES (1,2,3,4,5);
      �� �߰��� ���� NOT NULL ������ �ɸ��� ����ȵɰ��ɼ� ����!





* ���� : NOT NULL, �⺻Ű(Primary Key), Unique Key, Foreign key

 �� ���̺� �ۼ� �� ���� ���� : �� ����, ���̺� ����
  - ���̺� ���� ���� ����
    CREATE TABLE sample631 (
        a INTEGER NOT NULL,
        b INTEGER NOT NULL UNIQUE,
        c VARCHAR(30)
    );

  - ���̺� '���̺� ����' �����ϱ�
    CREATE TABLE sample632 (
        no INTEGER NOT NULL,
        sub_no INTEGER NOT NULL,
        name VARCHAR(30),
        PRIMARY KEY (no, sub_no)
    );

    CREATE TABLE sample632 (
        no INTEGER NOT NULL,
        sub_no INTEGER NOT NULL,
        name VARCHAR(30),
        CONSTRAINT pkey_sample632 PRIMARY KEY (no, sub_no)
    );


 �� ���� �߰�
  - �� ���� �߰�
   [c���� NOT NULL ���� �ɱ�]
   ALTER TABLE sample631 MODIFY c VARCHAR(30) NOT NULL;

  - ���̺� ���� �߰�
   [�⺻Ű ���� �߰�]
   ALTER TABLE sample631 ADD CONSTRAINT pkey_sample631 PRIMARY KEY (a);


 �� ���� ����
  - �� ���� �����ϱ�
   [c���� NOT NULL ���� ���ֱ�]
   ALTER TABLE sample631 MODIFY c VARCHAR(30);


  - ���̺� ���� �����ϱ�
   [pkey_sample631 ���� �����ϱ�]
   ALTER TABLE sample631 DROP CONSTRAINT pkey_sample631;

  - ���̺� ���� �����ϱ�
   [�⺻Ű ���� �����ϱ�]
   ALTER TABLE sample631 DROP PRIMARY KEY;


* �⺻Ű
  CREATE TABLE sample634 (
      p INTEGER NOT NULL,
      a VARCHAR(30),
      CONSTRAINT pkey_sample634 PRIMARY KEY (p)
  );

  INSERT INTO sample634 VALUES (1, 'ù°��');
  INSERT INTO sample634 VALUES (2, '��°��');
  INSERT INTO sample634 VALUES (3, '��°��');

 - sample634�� �ߺ��ϴ� �� �߰��ϱ�
  INSERT INTO sample634 VALUES (2, '��°��');

 - sample634�� �ߺ��� ������ �����ϱ�
  UPDATE sample634 SET p=2 WHERE p=3;


* ������ ���� �⺻Ű �����ϱ�
 - sample635 ���̺��� a���� b���� �̷���� �⺻Ű
  SELECT a, b FROM sample635;




* �ε��� - ������ ������ ���. �˻��ӵ� ���.
 - �ε����� ������ 'Ǯ ���̺� ��ĵ(full table scan)'���� �˻���
   ���� 1000�� �ִٸ� �ִ� 1000�� ���� ��.

 - �ε����� '����Ž��(binary search)'���� �˻���.
   �˻� ����� ����Ʈ��(binary tree) ����.


* ���� Ž��
  WHERE no = 30;

  1, 2, 3, 5, 10, 11, 19, 20, 20, 23, 30, 31, 32, 38, 40, 100

  - ��� �� 20

  - ��� �� 32

  - ��� �� 30

  �� �뷮�� �����͸� �˻��� ���� ����Ž���� ������!
     ���� Ʈ������ �ߺ��ϴ� ���� ����� �� ����!


* �ε��� �ۼ�, ����
  CREATE INDEX
  DROP INDEX


* �ε��� �ۼ�
  CREATE INDEX �ε����� ON ���̺�� (����1, ����2, ...);

  CREATE INDEX isample62 ON sample62 (no);


* �ε��� ����
 - DROP INDEX(��Ű�� ��ü�� ���) - Oracle, DB2
  DROP INDEX �ε�����;

 - DROP INDEX(���̺� �� ��ü�� ���) - MySQL, SQL Server
  DROP INDEX �ε����� ON ���̺��;

  DROP INDEX isample62 ON sample62;


* �ε��� ������ ������ ��(���⼭�� no��)�� �˻��� ����
 SELECT * FROM sample62 WHERE no=2; �ε��� ����ؼ� �˻�
 SELECT * FROM sample62 WHERE a='�ȳ�'; �ε��� ������.


* EXPLAIN
 EXPLAIN SQL���;

 EXPLAIN SELECT * FROM sample62 WHERE no > 10;

 EXPLAIN SELECT * FROM sample62 WHERE a = '�ȳ�';

 - �ε����� �� ���̺� 2�� �̻� ������� �ִ�.
   �ε����� ����� ������ �Ǵ� ���� ������ ������ �پ��ؾ�
   �˻� ȿ���� ��������.


* �� : FROM ���� ����� ���������� �̸��� ���̰�
       �����ͺ��̽� ��üȭ�Ͽ� ���� ���� �� ��.
 - ��� SELECT ����� ����ϴ� �����ͺ��̽� ��ü!
   ������ SELECT ����� �����ϰ� ǥ���ϱ� ����.

 - ��� ���� ���̺� : ��ü(�������)�� �������� ����.
   SELECT ��ɿ����� ���. INSERT, UPDATE, DELETE�� ���Ұ�.

  SELECT * FROM (SELECT * FROM sample54) sq;

  SELECT * FROM sample_view_67;


* ���� �ۼ�
  CREATE VIEW ��� AS SELECT���;

  CREATE VIEW sample_view_67 AS SELECT * FROM sample54;

  SELECT * FROM sample_view_67;


 - ���� ������ �� �ۼ��ϱ�
  CREATE VIEW ��� (����1, ����2, ...) AS SELECT���;

  CREATE VIEW sample_view_672 (n, v, v2) AS
      SELECT no, a, a*2 FROM sample54;

  SELECT * FROM sample_view_672 WHERE n = 1;
  

* ���� ����
  DROP VIEW ���;

* ���̺��� �����Ǹ� �׿� ������ �ε���, �䵵 �ڵ� ������.














