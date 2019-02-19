<복수의 테이블 다루기>

* 관계형 데이터베이스(RDBMS)는 관계형 모델을 사용.
  수학 집합론의 관계형 이론에서 유래.


* UNION 으로 합집합 구하기
 ○ 합집합: A∪B   UNION

  SELECT * FROM sample71_a;
  SELECT * FROM sample71_b;

  SELECT * FROM sample71_a
  UNION
  SELECT * FROM sample71_b;
  - 두개의 SELECT 명령을 하나의 명령으로 합침.

    이때 각각의 SELECT 명령의 열 이름은 서로 달라도 되지만
    열 개수와 자료형은 서로 일치시켜줘야 함.

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

 - UNION으로 묶을때 SELECT문의 나열 순서는 합집합 결과에
   영향을 주지 않음. 하지만 행의 나열순서는 달라질 수 있음.


* UNION을 사용할 때의 ORDER BY
 - 가장 마지막의 SELECT 명령에 ORDER BY 를 지정함!
  SELECT a FROM sample71_a
  UNION
  SELECT b FROM sample71_b ORDER BY b;   (X)

  SELECT a AS c FROM sample71_a
  UNION
  SELECT b AS c FROM sample71_b ORDER BY c;  (O)
 - ORDER BY 구에 지정하는 열은 별명을 붙여 이름을 일치시킨다!



* UNION ALL - 중복요소를 제거하지 않고 그냥 합침.
  SELECT a FROM sample71_a
  UNION ALL
  SELECT b FROM sample71_b;




* 교집합: A∩B   INTERSECT
* 차집합: A-B    EXCEPT (Oracle은 MINUS)





* 테이블 결합
 - 집합 연산: 세로(행) 방향으로 데이터가
              늘어나거나 줄어드는 계산.
 - 결합 연산: 가로(열) 방향으로 데이터가 늘어나는 계산.



* 곱집합과 교차결합
 - 교차결합(Cross Join)
  SELECT * FROM 테이블명1, 테이블명2;

  SELECT * FROM sample72_x;
  SELECT * FROM sample72_y;

  SELECT * FROM sample72_x, sample72_y;
 - FROM 구에 복수의 테이블을 지정하면 교차결합(곱집합으로 계산)
   을 한다!

  한 시즌에 6화까지 있는 드라마가 3시즌까지 방영되는 경우
  {1,2,3}  {1,2,3,4,5,6}
  [드라마 곱집합]
  시즌1 : 1-1화, 1-2화, 1-3화, 1-4화, 1-5화, 1-6화
  시즌2 : 2-1화, 2-2화, 2-3화, 2-4화, 2-5화, 2-6화
  시즌3 : 3-1화, 3-2화, 3-3화, 3-4화, 3-5화, 3-6화



* 내부결합
  SELECT * FROM 상품;
  SELECT * FROM 재고수;

  SELECT * FROM 상품, 재고수;

 - 상품코드가 같은 행을 검색하기
  SELECT * FROM 상품, 재고수
  WHERE 상품.상품코드 = 재고수.상품코드;


 - 상품분류가 식료품인 것들의 상품명과 재고수를 검색
  SELECT 상품.상품명, 재고수.재고수 FROM 상품, 재고수
  WHERE 상품.상품코드 = 재고수.상품코드   -- ① 결합조건
  AND 상품.상품분류 = '식료품';           -- ② 검색조건


* INNER JOIN 으로 내부결합하기
  SELECT * FROM 테이블명1 INNER JOIN 테이블명2 ON 결합조건;

  SELECT  상품.상품명, 재고수.재고수
  FROM 상품 INNER JOIN 재고수
  ON 상품.상품코드 = 재고수.상품코드
  WHERE 상품.상품분류 = '식료품';


* 상품2 테이블과 메이커 테이블을 내부결합해서
  상품명, 메이커명을 가져오기
   SELECT *
   FROM 상품2, 메이커;

   SELECT s.상품명, m.메이커명
   FROM 상품2 s INNER JOIN 메이커 m
   ON s.메이커코드 = m.메이커코드;



* 외부키 : 다른 테이블의 기본키를 참조하는 열은
           외부키가 될수 있음.
  SELECT * FROM 상품2;
  SELECT * FROM 메이커;

  - 메이커 테이블의 메이커코드 열은
    상품2 테이블의 메이커코드 열(기본키)을 참조하므로
    외부키 대상이 될 수 있음.



* 외부결합
  : 복수의 테이블 중 어느 한쪽에만 존재하는 데이터행을
    어떻게 다룰지를 변경할 수 있는 결합 방법

  SELECT * FROM 상품3;
  SELECT * FROM 재고수;

  SELECT * FROM 상품3, 재고수;

  SELECT 상품3.상품명, 재고수.재고수
  FROM 상품3 INNER JOIN 재고수
  ON 상품3.상품코드 = 재고수.상품코드
  WHERE 상품3.상품분류 = '식료품';


 - 외부결합(OUTER JOIN)은 LEFT JOIN 또는 RIGHT JOIN으로 표현

  SELECT 상품3.상품명, 재고수.재고수
  FROM 상품3 LEFT JOIN 재고수
  ON 상품3.상품코드 = 재고수.상품코드
  WHERE 상품3.상품분류 = '식료품';


* 구식방법에서의 외부결합 (Oracle)
 - 오라클에서는 데이터가 존재하지 않을수도 있는(기준이 아닌)
   테이블의 열에 (+)라는 특수한 기호를 붙여서 조건식을 지정함.

  SELECT 상품3.상품명, 재고수.재고수
  FROM 상품3, 재고수
  WHERE 상품3.상품코드 = 재고수.상품코드 (+)
  AND 상품3.상품분류 = '식료품';


* 트랜잭션 : 두개 이상의 명령문을 한 셋트로 처리하는 경우
  INSERT INTO 상품 VALUES (...);
  INSERT INTO 재고수 VALUES (...);
  INSERT INTO 재고수 VALUES (...);

 - 트랜잭션 시작
   START TRANSACTION;  (MySQL)
   BEGIN TRANSACTION;  (MySQL, Oracle)

 - 트랜잭션 내에서 실행한 명령을 적용한 후 종료
   COMMIT;

 - 트랜잭션 내에서 실행한 명령을 파기한 후 종료
   ROLLBACK;   (롤백하면 변경한 내용이 적용되지 않음!)

 - 트랜잭션 내에서 처리
  START TRANSACTION;
  INSERT INTO 상품 VALUES (...);
  INSERT INTO 재고수 VALUES (...);
  INSERT INTO 재고수 VALUES (...);
  COMMIT; (또는 ROLLBACK;)


* 데이터베이스 사용자 계정 추가
  GRANT SELECT,INSERT,UPDATE,DELETE,CREATE,ALTER,DROP
  ON sample.* TO test_user@localhost
  IDENTIFIED BY '1234';

  GRANT ALL PRIVILEGES
  ON sample.* TO test_user@localhost
  IDENTIFIED BY '1234' WITH GRANT OPTION;


* MySQL에서 프로시저 생성하는 SQL구문
  DELIMITER ;;
  create procedure usp_2 (a int, b int)
  begin
  select a+b;
  end;;
  DELIMITER ;









