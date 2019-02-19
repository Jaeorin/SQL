* �� �߰��ϱ� - INSERT

* INSERT ���
  INSERT INTO ���̺�� VALUES (��1, ��2, ...);

  SELECT * FROM sample41;
  DESC sample41;

 - sample41 ���̺� �� �߰��ϱ�
  INSERT INTO sample41 VALUES (1, 'ABC', '2014-01-25');


* ���� ������ �� �����Ͽ� INSERT�ϱ�
 - a���� no���� ������ �� �߰��ϱ�
  INSERT INTO sample41 (a, no) VALUES ('XYZ', 2);


* NOT NULL ����
 INSERT INTO sample41 (no, a, b) VALUES (NULL, NULL, NULL);

 - NOT NULL ���� ȸ���ϱ�
 INSERT INTO sample41 (no, a, b) VALUES (3, NULL, NULL);


* DEFAULT ��
  DESC sample411;

 - �Ϲ������� ����Ʈ ����
   ���� �������� ������ ����Ʈ������ ���� �߰���.
  INSERT INTO sample411(no) VALUES(1);

 - ��������� ����Ʈ ����
  INSERT INTO sample411(no, d) VALUES(2, DEFAULT);

 - ���� �������� �ʰ� �� �߰��ϱ�
  INSERT INTO sample411(no, d) VALUES(3, 1);



* �����ϱ� - DELETE
  DELETE FROM ���̺�� WHERE ���ǽ�;

 - sample41 ���̺��� no ���� 3�� �� �����ϱ�
  DELETE FROM sample41 WHERE no = 3;

  SELECT * FROM sample41 WHERE no = 3;

 - DELETE ����� WHERE ���ǿ� ��ġ�ϴ� '�����'�� ������!

 - no �� ���� 1 �̰ų� 2�� ���� �����ϱ�
   DELETE FROM sample41 WHERE no=1 OR no=2;







* ������ �����ϱ� - UPDATE (�� ������ ����!)
  UPDATE ���̺�� SET ���� = �� WHERE ���ǽ�;

 - sample41 ���̺��� no�� ���� 2�� ���� b����
   '2016-09-07'�� �����ϱ�
  UPDATE sample41 SET b = '2016-09-07' WHERE no = 2;


* UPDATE�� ���� �� ���ǻ���
  UPDATE sample41 SET no = no + 1;
  (������ no ���� 1�� ���� ������ no ���� �����϶�)


* ������ ����
  UPDATE ���̺�� SET ����1=��1, ����2=��2, ... WHERE ���ǽ�

 - �� �������� ������ UPDATE ��� ����
  UPDATE sample41 SET a='xxx' WHERE no=2;
  UPDATE sample41 SET b='2017-01-01' WHERE no=2;

 - �ϳ��� ��� UPDATE ��� ����
  UPDATE sample41 SET a='xxx', b='2017-01-01' WHERE no=2;


* SET ���� ���� ����
  UPDATE sample41 SET no=no+1, a=no;   ��
  UPDATE sample41 SET a=no, no=no+1;   ��

  MySQL - SET ���� ������ ������ ������ ������ �޴´�.
  Oracle - SET ���� ������ ������ ������ ������ ���� ����.



* ���������� ������
 - �������� : DELETE�� �� ����
 - ������ : �����÷��� ���� UPDATE�ؼ� ������ ������ ����
  ex) �����ϸ� 1�� ����
    UPDATE SET �����÷���=1 WHERE no=2;

    SELECT FROM xxxx WHERE �����÷��� <> 1; �� �˻�
	

	
	
	
	
	
* �����Լ� - ����(����� ����)�� ����ϴ� �Լ�
  COUNT([ALL|DISTINCT] ����) - �� ���� ���ϱ�. ��� �ڷ��� ����
  SUM([ALL|DISTINCT] ����) - �հ� ���ϱ�. ��ġ���� ����.
  AVG([ALL|DISTINCT] ����) - ��� ���ϱ�. ��ġ���� ����.
  MIN([ALL|DISTINCT] ����) - �ּҰ� ���ϱ�. ��� �ڷ��� ����
  MAX([ALL|DISTINCT] ����) - �ִ밪 ���ϱ�. ��� �ڷ��� ����


* COUNT(����)
  SELECT * FROM sample51;

  SELECT COUNT(*) FROM sample51;

  SELECT COUNT(*) FROM sample51 WHERE name = 'A';


* �����Լ��� NULL��
  SELECT COUNT(no), COUNT(name) FROM sample51;
 - �����Լ��� ���� �ȿ� NULL ���� ���� ��� �����Ѵ�!


* DISTINCT �� �ߺ� �����ϱ�
  SELECT name FROM sample51;
  SELECT ALL name FROM sample51;

  SELECT DISTINCT name FROM sample51;


* �����Լ����� DISTINCT
 - �ߺ��� ������ �� ���� ���ϱ�
  SELECT DISTINCT COUNT(name) FROM sample51;  (X)
  SELECT COUNT(DISTINCT name) FROM sample51;  (O)


* SUM���� �հ� ���ϱ�
  SELECT SUM(quantity) FROM sample51;


* AVG�� ��ճ���
  SELECT AVG(quantity), SUM(quantity)/COUNT(quantity) FROM sample51;


* MIN��MAX�� �ּҰ����ִ밪 ���ϱ�
  SELECT MIN(quantity), MAX(quantity), MIN(name), MAX(name) FROM sample51;
  
  
  
  

  
  
* �׷�ȭ - GROUP BY
  SELECT * FROM ���̺�� GROUP BY ��1, ��2, ...

  SELECT * FROM sample51;

 - name ���� �׷�ȭ�ϱ�
  SELECT name FROM sample51 GROUP BY name;

 - GROUP BY ���� �����Լ��� ����
   (GROUP BY ���� �����ϴ� ��쿡��
    �����Լ��� �Բ� ������� ������ �� �ǹ̰� ����)

  SELECT name, COUNT(name), SUM(quantity)
  FROM sample51 GROUP BY name;


* HAVING ���� ���� ����
  SELECT name, COUNT(name) FROM sample51
  WHERE COUNT(name)=1 GROUP BY name;
 - WHERE �������� �����Լ��� ����� �� ����!


 - ����ó�� ����
  WHERE �� �� GROUP BY �� �� HAVING �� �� SELECT �� �� ORDER BY ��

  SELECT name, COUNT(name) FROM sample51
  GROUP BY name HAVING COUNT(name)=1;	


* GROUP BY ���� ������ �� �̿��� ����
  �����Լ��� ������� ���� ä SELECT ������ ������ �� ����!

  SELECT no, name, quantity FROM sample51 GROUP BY name; (X)
   - name���� GROUP BY���� �����ϹǷ� OK
   - no, quantity�� ������ �� ����.

  SELECT MIN(no), name, SUM(quantity) FROM sample51 GROUP BY name;


* ������ ��� �����ϱ�
  SELECT name, COUNT(name), SUM(quantity)
  FROM sample51 GROUP BY name ORDER BY SUM(quantity) DESC;

  SELECT name, COUNT(name), SUM(quantity) AS sq
  FROM sample51 GROUP BY name ORDER BY sq DESC;


* �������� �׷�ȭ
  SELECT name, quantity FROM sample51 GROUP BY name, quantity;
  
  
  
  
  
  
  
  
  
* �������� ��
  (SELECT ���)

  SELECT * FROM sample54;

 - a���� �ּҰ��� ���� ���� ����
    SELECT MIN(a) FROM sample54;  
                  ��
    DELETE FROM sample54 WHERE a=20;

 - �������� �̿�
  DELETE FROM sample54 WHERE a=(SELECT MIN(a) FROM sample54);


  ���� = (SELECT MIN(a) FROM sample54)
  DELETE FROM sample54 WHERE a = ����;


 - Ŭ���̾�Ʈ ����
  mysql> set @a = (SELECT MIN(a) FROM sample54);
  mysql> DELETE FROM sample54 WHERE a = @a;


* ��Į�� �� (���� ��)
 - ���������� ����
  ���Ϩ� �ϳ��� ���� ��ȯ�ϴ� ���� (��Į�� ��������)
    SELECT MIN(a) FROM sample54;

  ���Ϩ� ������ ���� ��ȯ������ ���� �ϳ��� ����
    SELECT no FROM sample54;

  ���Ϩ� �ϳ��� ���� ��ȯ������ ���� ������ ����
    SELECT MIN(a), MAX(no) FROM sample54;

  ���Ϩ� ������ ��, ������ ���� ��ȯ�Ǵ� ����
    SELECT no, a FROM sample54;


* SELECT ����� �ϳ��� ���� ��ȯ�ϴ� ����
  '��Į�� ���� ��ȯ�Ѵ�'�� �Ѵ�!

* = �����ڸ� ����Ͽ� ���� ��쿡�� ��Į�� ������ ����
  �ʿ䰡 �ִ�.



* �������� ��� ��ġ
  : WHERE ��, SELECT ��, UPDATE�� SET ��, FROM ��, INSERT ��

  - SELECT ��, UPDATE�� SET �������� ��Į�� ���������� ����!



* SELECT ������ �������� ����ϱ�

 MySQL -
  SELECT
    (SELECT COUNT(*) FROM sample51) AS sq1,
    (SELECT COUNT(*) FROM sample54) AS sq2;

 Oracle -
  SELECT
    (SELECT COUNT(*) FROM sample51) AS sq1,
    (SELECT COUNT(*) FROM sample54) AS sq2
  FROM DUAL;


* SET ������ �������� ����ϱ�
  UPDATE sample54 SET a = (SELECT MAX(a) FROM sample54);




* FROM ������ �������� ����ϱ�
 - FROM ���� �⺻������ ���̺� �̸��� �����ϴ� ��.
   ��Į�� ���������� �ƴϾ ��.

 - Oracle������ FROM ������ ���������̸��� AS�� ������ ����
  SELECT * FROM (SELECT * FROM sample54) sq;

 - MySQL
  SELECT * FROM (SELECT * FROM sample54) AS sq;

 - 3�ܰ� ��ø����
  SELECT * FROM (SELECT * FROM (SELECT * FROM sample54) sq1) sq2;


 - ���� �������� FROM���� ���������� �����Ͽ� ����ϴ� ���
   Oracle������ MySQL�� LIMIT���� ���� ROWNUM�� ����.
   Oracle���� WHERE���� ����� ���� ROWNUM ���ȣ�� ����.
   ROWNUM�� 1���� ������.


 - Oracle���� ���� ���� ���� ��� ��������
  SELECT * FROM sample54 WHERE ROWNUM <= 2 ORDER BY a DESC; (X)
  
  SELECT * FROM
  (SELECT * FROM sample54 ORDER BY a DESC) sq
  WHERE ROWNUM <= 2;                                    (O)



* INSERT ��ɰ� ��������
 - VALUES ������ �������� ����ϱ�
  INSERT INTO sample541 VALUES (
      (SELECT COUNT(*) FROM sample51),
      (SELECT COUNT(*) FROM sample54)
  );

 - INSERT SELECT
  INSERT INTO sample541 VALUES (1, 2);
  INSERT INTO sample541 SELECT 1, 2;

 - ���̺��� �� �����ϱ�
  (�� ������ �Ȱ��� ���̺� ���̿��� �� ����)
  INSERT INTO sample542 SELECT * FROM sample543;

  (�� ������ �ٸ� ���̺� ���̿��� �� ����)
  INSERT INTO sample542 (num, bb) SELECT no, b FROM sample543;




* ��� ��������
   SELECT * FROM sample551;
   SELECT * FROM sample552;

  - EXISTS (SELECT ���)
    sample552�� sample551�� no���� ���� ���� ���� �ִٸ�
    sample551�� a���� '����'����,
    no���� ���� ���� ���� ���ٸ� '����'���� ����.

   UPDATE sample551 SET a='����' WHERE ...  ;
   UPDATE sample551 SET a='����' WHERE ...  ;

   UPDATE sample551 SET a='����' WHERE
     EXISTS (SELECT * FROM sample552 WHERE no2 = no);


  - NOT EXISTS (SELECT ���)
   UPDATE sample551 SET a='����' WHERE
     NOT EXISTS (SELECT * FROM sample552 WHERE no2 = no);


  - ���� ���̺�� ���̱�
   UPDATE sample551 SET a='����' WHERE
     EXISTS (SELECT * FROM sample552 WHERE sample552.no2 = sample551.no);


* IN - ���� ���� ���� �����ϴ��� ����
  ���� IN (����)

  SELECT * FROM sample551 WHERE no = 3 OR no = 5;

  SELECT * FROM sample551 WHERE no IN (3, 5);

  SELECT * FROM sample551 WHERE no IN (SELECT no2 FROM sample552);

 - IN�� NULL
  IN �� = ���� ������. NULL = NULL �� ��� �ȵ�.
  NULL�� IS NULL�� ����ؼ� ���ؾ� ��.
  
  
  
  
