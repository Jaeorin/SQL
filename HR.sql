

CREATE TABLE maker (
  maker_code char(4) NOT NULL,
  maker_name varchar(30) DEFAULT NULL,
  PRIMARY KEY (maker_code)
);


INSERT INTO maker VALUES ('M001','����Ŀ1');
INSERT INTO maker VALUES ('M002','����Ŀ2');






CREATE TABLE product (
  product_code char(4) NOT NULL,
  product_name varchar(30) DEFAULT NULL,
  maker_name varchar(30) DEFAULT NULL,
  price number DEFAULT NULL,
  product_category varchar(30) DEFAULT NULL,
  PRIMARY KEY (product_code)
);




INSERT INTO product VALUES ('0001','��ǰ1','����Ŀ1',100,'�ķ�ǰ');
INSERT INTO product VALUES ('0002','��ǰ2','����Ŀ2',200,'�ķ�ǰ');
INSERT INTO product VALUES ('0003','��ǰ3','����Ŀ3',1980,'��Ȱ��ǰ');







CREATE TABLE product2 (
  product_code char(4) NOT NULL,
  product_name varchar(30) DEFAULT NULL,
  maker_code char(4) DEFAULT NULL,
  price number DEFAULT NULL,
  product_category varchar(30) DEFAULT NULL,
  PRIMARY KEY (product_code)
);





INSERT INTO product2 VALUES ('0001','��ǰ1','M001',100,'�ķ�ǰ');
INSERT INTO product2 VALUES ('0002','��ǰ2','M001',200,'�ķ�ǰ');
INSERT INTO product2 VALUES ('0003','��ǰ3','M002',1980,'��Ȱ��ǰ');






CREATE TABLE product3 (
  product_code char(4) NOT NULL,
  product_name varchar(30) DEFAULT NULL,
  maker_code char(4) DEFAULT NULL,
  price number DEFAULT NULL,
  product_category varchar(30) DEFAULT NULL,
  PRIMARY KEY (product_code)
);




INSERT INTO product3 VALUES ('0001','��ǰ1','M001',100,'�ķ�ǰ');
INSERT INTO product3 VALUES ('0002','��ǰ2','M001',200,'�ķ�ǰ');
INSERT INTO product3 VALUES ('0003','��ǰ3','M002',1980,'��Ȱ��ǰ');
INSERT INTO product3 VALUES ('0009','�߰���ǰ','M001',300,'�ķ�ǰ');






CREATE TABLE stock_count (
  product_code char(4) DEFAULT NULL,
  warehouse_date date DEFAULT NULL,
  stock_count number DEFAULT NULL
);



INSERT INTO stock_count VALUES ('0001','2014-01-03',200);
INSERT INTO stock_count VALUES ('0002','2014-02-10',500);
INSERT INTO stock_count VALUES ('0003','2014-02-14',10);






CREATE TABLE sample21 (
  no number DEFAULT NULL,
  name varchar(20) DEFAULT NULL,
  birthday date DEFAULT NULL,
  address varchar(40) DEFAULT NULL
);



INSERT INTO sample21 VALUES (1,'���ؿ�','1976-10-18','�뱸������ ������');
INSERT INTO sample21 VALUES (2,'������',NULL,'�뱸������ ����');
INSERT INTO sample21 VALUES (3,'ȫ�浿',NULL,'����Ư���� ������');






CREATE TABLE sample24 (
  no number DEFAULT NULL,
  a number DEFAULT NULL,
  b number DEFAULT NULL,
  c number DEFAULT NULL
);




INSERT INTO sample24 VALUES (1,1,0,0);
INSERT INTO sample24 VALUES (2,0,1,0);
INSERT INTO sample24 VALUES (3,0,0,1);
INSERT INTO sample24 VALUES (4,2,2,0);
INSERT INTO sample24 VALUES (5,0,2,2);






CREATE TABLE sample25 (
  no number DEFAULT NULL,
  text varchar(100) DEFAULT NULL
);





INSERT INTO sample25 VALUES (1,'SQL�� RDBMS�� �����ϱ� ���� ����̴�.');
INSERT INTO sample25 VALUES (2,'LIKE������ ��Ÿ���� %�� _�� ����� �� �ִ�.');
INSERT INTO sample25 VALUES (3,'LIKE�� SQL���� ����� �� �ִ� ���� �� �ϳ��̴�.');






CREATE TABLE sample31 (
  name varchar(20) DEFAULT NULL,
  age number DEFAULT NULL,
  address varchar(40) DEFAULT NULL
);




INSERT INTO sample31 VALUES ('A��',36,'�뱸������ �߱�');
INSERT INTO sample31 VALUES ('B��',18,'�λ걤���� ������');
INSERT INTO sample31 VALUES ('C��',25,'����Ư���� �߱�');






CREATE TABLE sample311 (
  a varchar(2) DEFAULT NULL,
  b number DEFAULT NULL
);





INSERT INTO sample311 VALUES ('1',1);
INSERT INTO sample311 VALUES ('2',2);
INSERT INTO sample311 VALUES ('10',10);
INSERT INTO sample311 VALUES ('11',11);






CREATE TABLE sample32 (
  a number DEFAULT NULL,
  b number DEFAULT NULL
);





INSERT INTO sample32 VALUES (1,1);
INSERT INTO sample32 VALUES (2,1);
INSERT INTO sample32 VALUES (2,2);
INSERT INTO sample32 VALUES (1,3);
INSERT INTO sample32 VALUES (1,2);






CREATE TABLE sample33 (
  no number DEFAULT NULL
);





INSERT INTO sample33 VALUES (1);
INSERT INTO sample33 VALUES (2);
INSERT INTO sample33 VALUES (3);
INSERT INTO sample33 VALUES (4);
INSERT INTO sample33 VALUES (5);
INSERT INTO sample33 VALUES (6);
INSERT INTO sample33 VALUES (7);






CREATE TABLE sample34 (
  no number DEFAULT NULL,
  price number DEFAULT NULL,
  quantity number DEFAULT NULL
);





INSERT INTO sample34 VALUES (1,100,10);
INSERT INTO sample34 VALUES (2,230,24);
INSERT INTO sample34 VALUES (3,1980,1);






CREATE TABLE sample341 (
  amount number(10,2) DEFAULT NULL
);





INSERT INTO sample341 VALUES (5961.60);
INSERT INTO sample341 VALUES (2138.40);
INSERT INTO sample341 VALUES (1080.00);






CREATE TABLE sample35 (
  no number DEFAULT NULL,
  price number DEFAULT NULL,
  quantity number DEFAULT NULL,
  unit varchar(10) DEFAULT NULL
);





INSERT INTO sample35 VALUES (1,100,10,'��');
INSERT INTO sample35 VALUES (2,230,24,'��');
INSERT INTO sample35 VALUES (3,1980,1,'��');






CREATE TABLE sample37 (
  a number DEFAULT NULL
);





INSERT INTO sample37 VALUES (1);
INSERT INTO sample37 VALUES (2);
INSERT INTO sample37 VALUES (NULL);






CREATE TABLE sample41 (
  no number NOT NULL,
  a varchar(30) DEFAULT NULL,
  b date DEFAULT NULL
);










CREATE TABLE sample411 (
  no number NOT NULL,
  d number DEFAULT '0'
);










CREATE TABLE sample51 (
  no number DEFAULT NULL,
  name varchar(20) DEFAULT NULL,
  quantity number DEFAULT NULL
);





INSERT INTO sample51 VALUES (1,'A',1);
INSERT INTO sample51 VALUES (2,'A',2);
INSERT INTO sample51 VALUES (3,'B',10);
INSERT INTO sample51 VALUES (4,'C',3);
INSERT INTO sample51 VALUES (5,NULL,NULL);






CREATE TABLE sample54 (
  no number DEFAULT NULL,
  a number DEFAULT NULL
);





INSERT INTO sample54 VALUES (1,100);
INSERT INTO sample54 VALUES (2,900);
INSERT INTO sample54 VALUES (3,20);
INSERT INTO sample54 VALUES (4,80);






CREATE TABLE sample541 (
  a number DEFAULT NULL,
  b number DEFAULT NULL
);










CREATE TABLE sample551 (
  no number DEFAULT NULL,
  a varchar(20) DEFAULT NULL
);





INSERT INTO sample551 VALUES (1,NULL);
INSERT INTO sample551 VALUES (2,NULL);
INSERT INTO sample551 VALUES (3,NULL);
INSERT INTO sample551 VALUES (4,NULL);
INSERT INTO sample551 VALUES (5,NULL);






CREATE TABLE sample552 (
  no2 number DEFAULT NULL
);





INSERT INTO sample552 VALUES (3);
INSERT INTO sample552 VALUES (5);






CREATE TABLE sample635 (
  a number NOT NULL,
  b number NOT NULL,
  PRIMARY KEY (a,b)
);





INSERT INTO sample635 VALUES (1,1);
INSERT INTO sample635 VALUES (1,2);
INSERT INTO sample635 VALUES (1,3);
INSERT INTO sample635 VALUES (2,1);
INSERT INTO sample635 VALUES (2,2);






CREATE TABLE sample71_a (
  a number DEFAULT NULL
);





INSERT INTO sample71_a VALUES (1);
INSERT INTO sample71_a VALUES (2);
INSERT INTO sample71_a VALUES (3);






CREATE TABLE sample71_b (
  b number DEFAULT NULL
);





INSERT INTO sample71_b VALUES (2);
INSERT INTO sample71_b VALUES (10);
INSERT INTO sample71_b VALUES (11);






CREATE TABLE sample72_x (
  x varchar(2) DEFAULT NULL
);





INSERT INTO sample72_x VALUES ('A');
INSERT INTO sample72_x VALUES ('B');
INSERT INTO sample72_x VALUES ('C');






CREATE TABLE sample72_y (
  y number DEFAULT NULL
);





INSERT INTO sample72_y VALUES (1);
INSERT INTO sample72_y VALUES (2);
INSERT INTO sample72_y VALUES (3);



