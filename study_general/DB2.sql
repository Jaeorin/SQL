* 행 추가하기 - INSERT

* INSERT 명령
  INSERT INTO 테이블명 VALUES (값1, 값2, ...);

  SELECT * FROM sample41;
  DESC sample41;

 - sample41 테이블에 행 추가하기
  INSERT INTO sample41 VALUES (1, 'ABC', '2014-01-25');


* 값을 저장할 열 지정하여 INSERT하기
 - a열과 no열만 지정해 행 추가하기
  INSERT INTO sample41 (a, no) VALUES ('XYZ', 2);


* NOT NULL 제약
 INSERT INTO sample41 (no, a, b) VALUES (NULL, NULL, NULL);

 - NOT NULL 제약 회피하기
 INSERT INTO sample41 (no, a, b) VALUES (3, NULL, NULL);


* DEFAULT 값
  DESC sample411;

 - 암묵적으로 디폴트 지정
   열을 지정하지 않으면 디폴트값으로 행이 추가됨.
  INSERT INTO sample411(no) VALUES(1);

 - 명시적으로 디폴트 지정
  INSERT INTO sample411(no, d) VALUES(2, DEFAULT);

 - 값을 생략하지 않고 행 추가하기
  INSERT INTO sample411(no, d) VALUES(3, 1);



* 삭제하기 - DELETE
  DELETE FROM 테이블명 WHERE 조건식;

 - sample41 테이블에서 no 열이 3인 행 삭제하기
  DELETE FROM sample41 WHERE no = 3;

  SELECT * FROM sample41 WHERE no = 3;

 - DELETE 명령은 WHERE 조건에 일치하는 '모든행'을 삭제함!

 - no 열 값이 1 이거나 2인 행을 삭제하기
   DELETE FROM sample41 WHERE no=1 OR no=2;







* 데이터 갱신하기 - UPDATE (셀 단위로 수정!)
  UPDATE 테이블명 SET 열명 = 값 WHERE 조건식;

 - sample41 테이블의 no열 값이 2인 행의 b열을
   '2016-09-07'로 갱신하기
  UPDATE sample41 SET b = '2016-09-07' WHERE no = 2;


* UPDATE로 갱신 시 주의사항
  UPDATE sample41 SET no = no + 1;
  (현재의 no 값에 1을 더한 값으로 no 열을 갱신하라)


* 복수열 갱신
  UPDATE 테이블명 SET 열명1=값1, 열명2=값2, ... WHERE 조건식

 - 두 구문으로 나누어 UPDATE 명령 실행
  UPDATE sample41 SET a='xxx' WHERE no=2;
  UPDATE sample41 SET b='2017-01-01' WHERE no=2;

 - 하나로 묶어서 UPDATE 명령 실행
  UPDATE sample41 SET a='xxx', b='2017-01-01' WHERE no=2;


* SET 구의 실행 순서
  UPDATE sample41 SET no=no+1, a=no;   ①
  UPDATE sample41 SET a=no, no=no+1;   ②

  MySQL - SET 구로 나열된 수식의 순서에 영향을 받는다.
  Oracle - SET 구로 나열된 수식의 순서에 영향을 받지 않음.



* 물리삭제와 논리삭제
 - 물리삭제 : DELETE로 행 삭제
 - 논리삭제 : 삭제플래그 열로 UPDATE해서 삭제한 것으로 가장
  ex) 삭제하면 1로 갱신
    UPDATE SET 삭제플래그=1 WHERE no=2;

    SELECT FROM xxxx WHERE 삭제플래그 <> 1; 로 검색
	

	
	
	
	
	
* 집계함수 - 집합(행단위 집합)을 계산하는 함수
  COUNT([ALL|DISTINCT] 집합) - 행 개수 구하기. 모든 자료형 가능
  SUM([ALL|DISTINCT] 집합) - 합계 구하기. 수치형만 가능.
  AVG([ALL|DISTINCT] 집합) - 평균 구하기. 수치형만 가능.
  MIN([ALL|DISTINCT] 집합) - 최소값 구하기. 모든 자료형 가능
  MAX([ALL|DISTINCT] 집합) - 최대값 구하기. 모든 자료형 가능


* COUNT(집합)
  SELECT * FROM sample51;

  SELECT COUNT(*) FROM sample51;

  SELECT COUNT(*) FROM sample51 WHERE name = 'A';


* 집계함수와 NULL값
  SELECT COUNT(no), COUNT(name) FROM sample51;
 - 집계함수는 집함 안에 NULL 값이 있을 경우 무시한다!


* DISTINCT 로 중복 제거하기
  SELECT name FROM sample51;
  SELECT ALL name FROM sample51;

  SELECT DISTINCT name FROM sample51;


* 집계함수에서 DISTINCT
 - 중복을 제거한 뒤 개수 구하기
  SELECT DISTINCT COUNT(name) FROM sample51;  (X)
  SELECT COUNT(DISTINCT name) FROM sample51;  (O)


* SUM으로 합계 구하기
  SELECT SUM(quantity) FROM sample51;


* AVG로 평균내기
  SELECT AVG(quantity), SUM(quantity)/COUNT(quantity) FROM sample51;


* MIN·MAX로 최소값·최대값 구하기
  SELECT MIN(quantity), MAX(quantity), MIN(name), MAX(name) FROM sample51;
  
  
  
  

  
  
* 그룹화 - GROUP BY
  SELECT * FROM 테이블명 GROUP BY 열1, 열2, ...

  SELECT * FROM sample51;

 - name 열로 그룹화하기
  SELECT name FROM sample51 GROUP BY name;

 - GROUP BY 구와 집계함수를 조합
   (GROUP BY 구를 지정하는 경우에는
    집계함수와 함께 사용하지 않으면 별 의미가 없음)

  SELECT name, COUNT(name), SUM(quantity)
  FROM sample51 GROUP BY name;


* HAVING 구로 조건 지정
  SELECT name, COUNT(name) FROM sample51
  WHERE COUNT(name)=1 GROUP BY name;
 - WHERE 구에서는 집계함수를 사용할 수 없다!


 - 내부처리 순서
  WHERE 구 → GROUP BY 구 → HAVING 구 → SELECT 구 → ORDER BY 구

  SELECT name, COUNT(name) FROM sample51
  GROUP BY name HAVING COUNT(name)=1;	


* GROUP BY 에서 지정할 열 이외의 열은
  집계함수를 사용하지 않은 채 SELECT 구에서 지정할 수 없다!

  SELECT no, name, quantity FROM sample51 GROUP BY name; (X)
   - name열은 GROUP BY에서 지정하므로 OK
   - no, quantity는 지정할 수 없다.

  SELECT MIN(no), name, SUM(quantity) FROM sample51 GROUP BY name;


* 집계한 결과 정렬하기
  SELECT name, COUNT(name), SUM(quantity)
  FROM sample51 GROUP BY name ORDER BY SUM(quantity) DESC;

  SELECT name, COUNT(name), SUM(quantity) AS sq
  FROM sample51 GROUP BY name ORDER BY sq DESC;


* 복수열의 그룹화
  SELECT name, quantity FROM sample51 GROUP BY name, quantity;
  
  
  
  
  
  
  
  
  
* 서브쿼리 ★
  (SELECT 명령)

  SELECT * FROM sample54;

 - a열에 최소값을 가진 행을 삭제
    SELECT MIN(a) FROM sample54;  
                  ↓
    DELETE FROM sample54 WHERE a=20;

 - 서브쿼리 이용
  DELETE FROM sample54 WHERE a=(SELECT MIN(a) FROM sample54);


  변수 = (SELECT MIN(a) FROM sample54)
  DELETE FROM sample54 WHERE a = 변수;


 - 클라이언트 변수
  mysql> set @a = (SELECT MIN(a) FROM sample54);
  mysql> DELETE FROM sample54 WHERE a = @a;


* 스칼라 값 (단일 값)
 - 서브쿼리의 패턴
  패턴① 하나의 값을 반환하는 패턴 (스칼라 서브쿼리)
    SELECT MIN(a) FROM sample54;

  패턴② 복수의 행이 반환되지만 열은 하나인 패턴
    SELECT no FROM sample54;

  패턴③ 하나의 행이 반환되지만 열이 복수인 패턴
    SELECT MIN(a), MAX(no) FROM sample54;

  패턴④ 복수의 행, 복수의 열이 반환되는 패턴
    SELECT no, a FROM sample54;


* SELECT 명령이 하나의 값만 반환하는 것을
  '스칼라 값을 반환한다'고 한다!

* = 연산자를 사용하여 비교할 경우에는 스칼라 값끼리 비교할
  필요가 있다.



* 서브쿼리 사용 위치
  : WHERE 구, SELECT 구, UPDATE의 SET 구, FROM 구, INSERT 등

  - SELECT 구, UPDATE의 SET 구에서는 스칼라 서브쿼리로 지정!



* SELECT 구에서 서브쿼리 사용하기

 MySQL -
  SELECT
    (SELECT COUNT(*) FROM sample51) AS sq1,
    (SELECT COUNT(*) FROM sample54) AS sq2;

 Oracle -
  SELECT
    (SELECT COUNT(*) FROM sample51) AS sq1,
    (SELECT COUNT(*) FROM sample54) AS sq2
  FROM DUAL;


* SET 구에서 서브쿼리 사용하기
  UPDATE sample54 SET a = (SELECT MAX(a) FROM sample54);




* FROM 구에서 서브쿼리 사용하기
 - FROM 구는 기본적으로 테이블 이름을 지정하는 곳.
   스칼라 서브쿼리가 아니어도 됨.

 - Oracle에서는 FROM 구에서 서브쿼리이름에 AS를 붙이지 않음
  SELECT * FROM (SELECT * FROM sample54) sq;

 - MySQL
  SELECT * FROM (SELECT * FROM sample54) AS sq;

 - 3단계 중첩구조
  SELECT * FROM (SELECT * FROM (SELECT * FROM sample54) sq1) sq2;


 - 실제 업무에서 FROM구에 서브쿼리를 지정하여 사용하는 경우
   Oracle에서는 MySQL의 LIMIT구가 없고 ROWNUM이 있음.
   Oracle에서 WHERE구가 수행된 직후 ROWNUM 행번호가 붙음.
   ROWNUM은 1부터 시작함.


 - Oracle에서 정렬 이후 상위 몇건 가져오기
  SELECT * FROM sample54 WHERE ROWNUM <= 2 ORDER BY a DESC; (X)
  
  SELECT * FROM
  (SELECT * FROM sample54 ORDER BY a DESC) sq
  WHERE ROWNUM <= 2;                                    (O)



* INSERT 명령과 서브쿼리
 - VALUES 구에서 서브쿼리 사용하기
  INSERT INTO sample541 VALUES (
      (SELECT COUNT(*) FROM sample51),
      (SELECT COUNT(*) FROM sample54)
  );

 - INSERT SELECT
  INSERT INTO sample541 VALUES (1, 2);
  INSERT INTO sample541 SELECT 1, 2;

 - 테이블의 행 복사하기
  (열 구성이 똑같은 테이블 사이에서 행 복사)
  INSERT INTO sample542 SELECT * FROM sample543;

  (열 구성이 다른 테이블 사이에서 행 복사)
  INSERT INTO sample542 (num, bb) SELECT no, b FROM sample543;




* 상관 서브쿼리
   SELECT * FROM sample551;
   SELECT * FROM sample552;

  - EXISTS (SELECT 명령)
    sample552에 sample551의 no열의 값과 같은 행이 있다면
    sample551의 a열을 '있음'으로,
    no열의 값과 같은 행이 없다면 '없음'으로 갱신.

   UPDATE sample551 SET a='있음' WHERE ...  ;
   UPDATE sample551 SET a='없음' WHERE ...  ;

   UPDATE sample551 SET a='있음' WHERE
     EXISTS (SELECT * FROM sample552 WHERE no2 = no);


  - NOT EXISTS (SELECT 명령)
   UPDATE sample551 SET a='없음' WHERE
     NOT EXISTS (SELECT * FROM sample552 WHERE no2 = no);


  - 열에 테이블명 붙이기
   UPDATE sample551 SET a='있음' WHERE
     EXISTS (SELECT * FROM sample552 WHERE sample552.no2 = sample551.no);


* IN - 집합 안의 값이 존재하는지 조사
  열명 IN (집합)

  SELECT * FROM sample551 WHERE no = 3 OR no = 5;

  SELECT * FROM sample551 WHERE no IN (3, 5);

  SELECT * FROM sample551 WHERE no IN (SELECT no2 FROM sample552);

 - IN과 NULL
  IN 은 = 으로 동작함. NULL = NULL 로 계산 안됨.
  NULL은 IS NULL을 사용해서 비교해야 함.
  
  
  
  
