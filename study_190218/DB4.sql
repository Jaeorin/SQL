<������ ���̺� �ٷ��>

* ������ �����ͺ��̽�(RDBMS)�� ������ ���� ���.
  ���� ���շ��� ������ �̷п��� ����.


* UNION ���� ������ ���ϱ�
 �� ������: A��B   UNION

  SELECT * FROM sample71_a;
  SELECT * FROM sample71_b;

  SELECT * FROM sample71_a
  UNION
  SELECT * FROM sample71_b;
  - �ΰ��� SELECT ����� �ϳ��� ������� ��ħ.

    �̶� ������ SELECT ����� �� �̸��� ���� �޶� ������
    �� ������ �ڷ����� ���� ��ġ������� ��.

  SELECT * FROM sample71_a
  UNION
  SELECT * FROM sample71_b
  UNION
  SELECT * FROM sample31;

  SELECT a FROM sample71_a
  UNION
  SELECT b FROM sample71_b
  UNION
  SELECT age FROM sample31;

 - UNION���� ������ SELECT���� ���� ������ ������ �����
   ������ ���� ����. ������ ���� ���������� �޶��� �� ����.


* UNION�� ����� ���� ORDER BY
 - ���� �������� SELECT ��ɿ� ORDER BY �� ������!
  SELECT a FROM sample71_a
  UNION
  SELECT b FROM sample71_b ORDER BY b;   (X)

  SELECT a AS c FROM sample71_a
  UNION
  SELECT b AS c FROM sample71_b ORDER BY c;  (O)
 - ORDER BY ���� �����ϴ� ���� ������ �ٿ� �̸��� ��ġ��Ų��!



* UNION ALL - �ߺ���Ҹ� �������� �ʰ� �׳� ��ħ.
  SELECT a FROM sample71_a
  UNION ALL
  SELECT b FROM sample71_b;




* ������: A��B   INTERSECT
* ������: A-B    EXCEPT (Oracle�� MINUS)





* ���̺� ����
 - ���� ����: ����(��) �������� �����Ͱ�
              �þ�ų� �پ��� ���.
 - ���� ����: ����(��) �������� �����Ͱ� �þ�� ���.



* �����հ� ��������
 - ��������(Cross Join)
  SELECT * FROM ���̺��1, ���̺��2;

  SELECT * FROM sample72_x;
  SELECT * FROM sample72_y;

  SELECT * FROM sample72_x, sample72_y;
 - FROM ���� ������ ���̺��� �����ϸ� ��������(���������� ���)
   �� �Ѵ�!

  �� ���� 6ȭ���� �ִ� ��󸶰� 3������� �濵�Ǵ� ���
  {1,2,3}  {1,2,3,4,5,6}
  [��� ������]
  ����1 : 1-1ȭ, 1-2ȭ, 1-3ȭ, 1-4ȭ, 1-5ȭ, 1-6ȭ
  ����2 : 2-1ȭ, 2-2ȭ, 2-3ȭ, 2-4ȭ, 2-5ȭ, 2-6ȭ
  ����3 : 3-1ȭ, 3-2ȭ, 3-3ȭ, 3-4ȭ, 3-5ȭ, 3-6ȭ



* ���ΰ���
  SELECT * FROM ��ǰ;
  SELECT * FROM ����;

  SELECT * FROM ��ǰ, ����;

 - ��ǰ�ڵ尡 ���� ���� �˻��ϱ�
  SELECT * FROM ��ǰ, ����
  WHERE ��ǰ.��ǰ�ڵ� = ����.��ǰ�ڵ�;


 - ��ǰ�з��� �ķ�ǰ�� �͵��� ��ǰ��� ������ �˻�
  SELECT ��ǰ.��ǰ��, ����.���� FROM ��ǰ, ����
  WHERE ��ǰ.��ǰ�ڵ� = ����.��ǰ�ڵ�   -- �� ��������
  AND ��ǰ.��ǰ�з� = '�ķ�ǰ';           -- �� �˻�����


* INNER JOIN ���� ���ΰ����ϱ�
  SELECT * FROM ���̺��1 INNER JOIN ���̺��2 ON ��������;

  SELECT  ��ǰ.��ǰ��, ����.����
  FROM ��ǰ INNER JOIN ����
  ON ��ǰ.��ǰ�ڵ� = ����.��ǰ�ڵ�
  WHERE ��ǰ.��ǰ�з� = '�ķ�ǰ';


* ��ǰ2 ���̺�� ����Ŀ ���̺��� ���ΰ����ؼ�
  ��ǰ��, ����Ŀ���� ��������
   SELECT *
   FROM ��ǰ2, ����Ŀ;

   SELECT s.��ǰ��, m.����Ŀ��
   FROM ��ǰ2 s INNER JOIN ����Ŀ m
   ON s.����Ŀ�ڵ� = m.����Ŀ�ڵ�;



* �ܺ�Ű : �ٸ� ���̺��� �⺻Ű�� �����ϴ� ����
           �ܺ�Ű�� �ɼ� ����.
  SELECT * FROM ��ǰ2;
  SELECT * FROM ����Ŀ;

  - ����Ŀ ���̺��� ����Ŀ�ڵ� ����
    ��ǰ2 ���̺��� ����Ŀ�ڵ� ��(�⺻Ű)�� �����ϹǷ�
    �ܺ�Ű ����� �� �� ����.



* �ܺΰ���
  : ������ ���̺� �� ��� ���ʿ��� �����ϴ� ����������
    ��� �ٷ����� ������ �� �ִ� ���� ���

  SELECT * FROM ��ǰ3;
  SELECT * FROM ����;

  SELECT * FROM ��ǰ3, ����;

  SELECT ��ǰ3.��ǰ��, ����.����
  FROM ��ǰ3 INNER JOIN ����
  ON ��ǰ3.��ǰ�ڵ� = ����.��ǰ�ڵ�
  WHERE ��ǰ3.��ǰ�з� = '�ķ�ǰ';


 - �ܺΰ���(OUTER JOIN)�� LEFT JOIN �Ǵ� RIGHT JOIN���� ǥ��

  SELECT ��ǰ3.��ǰ��, ����.����
  FROM ��ǰ3 LEFT JOIN ����
  ON ��ǰ3.��ǰ�ڵ� = ����.��ǰ�ڵ�
  WHERE ��ǰ3.��ǰ�з� = '�ķ�ǰ';


* ���Ĺ�������� �ܺΰ��� (Oracle)
 - ����Ŭ������ �����Ͱ� �������� �������� �ִ�(������ �ƴ�)
   ���̺��� ���� (+)��� Ư���� ��ȣ�� �ٿ��� ���ǽ��� ������.

  SELECT ��ǰ3.��ǰ��, ����.����
  FROM ��ǰ3, ����
  WHERE ��ǰ3.��ǰ�ڵ� = ����.��ǰ�ڵ� (+)
  AND ��ǰ3.��ǰ�з� = '�ķ�ǰ';


* Ʈ����� : �ΰ� �̻��� ��ɹ��� �� ��Ʈ�� ó���ϴ� ���
  INSERT INTO ��ǰ VALUES (...);
  INSERT INTO ���� VALUES (...);
  INSERT INTO ���� VALUES (...);

 - Ʈ����� ����
   START TRANSACTION;  (MySQL)
   BEGIN TRANSACTION;  (MySQL, Oracle)

 - Ʈ����� ������ ������ ����� ������ �� ����
   COMMIT;

 - Ʈ����� ������ ������ ����� �ı��� �� ����
   ROLLBACK;   (�ѹ��ϸ� ������ ������ ������� ����!)

 - Ʈ����� ������ ó��
  START TRANSACTION;
  INSERT INTO ��ǰ VALUES (...);
  INSERT INTO ���� VALUES (...);
  INSERT INTO ���� VALUES (...);
  COMMIT; (�Ǵ� ROLLBACK;)


* �����ͺ��̽� ����� ���� �߰�
  GRANT SELECT,INSERT,UPDATE,DELETE,CREATE,ALTER,DROP
  ON sample.* TO test_user@localhost
  IDENTIFIED BY '1234';

  GRANT ALL PRIVILEGES
  ON sample.* TO test_user@localhost
  IDENTIFIED BY '1234' WITH GRANT OPTION;


* MySQL���� ���ν��� �����ϴ� SQL����
  DELIMITER ;;
  create procedure usp_2 (a int, b int)
  begin
  select a+b;
  end;;
  DELIMITER ;









