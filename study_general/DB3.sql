* SQL명령의 종류
 - DML(Data Manipulation Language) : 데이터 조작
    SELECT, INSERT, UPDATE, DELETE

 - DDL(Data Definition Language) : 데이터 정의
    데이터베이스 객체(object)를 만들거나 삭제하는 명령어.
    데이터베이스 객체: 테이블, 인덱스, 뷰
    명령어: CREATE, DROP, ALTER

 - DCL(Data Control Language) : 데이터베이스 제어
    TRANSACTION 제어, 데이터 접근권한 제어


* 스키마 - 데이터베이스 객체가 만들어지는 공간, 그릇.
  하나의 스키마 안에서 이름이 중복되는 객체를 생성할수 없음.
  스키마나 테이블은 네임스페이스(이름공간)로써 기능한다.



* 테이블 작성·삭제·변경
  CREATE TABLE 테이블명 (열 정의1, 열 정의2, ...);
  DROP TABLE 테이블명;
  ALTER TABLE 테이블명 하부명령;


* 테이블 작성
  CREATE TABLE 테이블명 (
      열 정의1,
      열 정의2,
      ...
  );

 - 열 정의
   열명 자료형 [DEFAULT 기본값] [NULL|NOT NULL]


 - CREATE TABLE로 테이블 작성하기
   CREATE TABLE sample62 (
       no INTEGER NOT NULL,
       a VARCHAR(30),
       b DATE
   );

   DESC sample62;


* 테이블 삭제
  DROP TABLE sample62;

 - 테이블 정의는 그대로 둔채 데이터 행만 삭제
   DELETE FROM sample62;

 - DDL로 분류되는 TRUNCATE TABLE 명령을 사용하면 삭제속도 향상
   TRUNCATE TABLE 테이블명;



* 테이블 수정
  ALTER TABLE 테이블명 변경명령;
  - 열 추가, 삭제, 변경
  - 제약 추가, 삭제


 - 열 추가
  ALTER TABLE 테이블명 ADD 열 정의;

  ALTER TABLE sample62 ADD newcol INTEGER;

 - NOT NULL 제약이 걸린 열을 추가할 때는 기본값을 지정해야 함!



* 열 속성 변경
  ALTER TABLE 테이블명 MODIFY 열정의;

  ALTER TABLE sample62 MODIFY newcol VARCHAR(20);


* 열 이름 변경
 - MySQL
  ALTER TABLE 테이블명 CHANGE [기존열이름] [신규 열 정의];

 - Oracle
  ALTER TABLE 테이블명 RENAME TO [기존열이름] [신규 열 정의];

 - ALTER TABLE로 열 이름 변경하기
  ALTER TABLE sample62 CHANGE newcol c VARCHAR(20);


* 열 삭제
  ALTER TABLE 테이블명 DROP 열명;

  ALTER TABLE sample62 DROP c;


* ALTER TABLE로 테이블 관리시 주의사항
 - 문자열에서 최대길이 연장
   VARCHAR(4) → VARCHAR(10)    문제없음.
   VARCHAR(10) → VARCHAR(4)    문제발생여지 있음.
   
 - 열 추가 후 변경한 테이블에 행을 추가하는 INSERT 명령은
   확인하는걸 권장함.

   INSERT INTO 테이블명 VALUES (1,2,3,4,5);
      → 열이 추가되면 수행안될가능성 존재!

   INSERT INTO 테이블명 (a,b,c,d,e) VALUES (1,2,3,4,5);
      → 추가된 열이 NOT NULL 제약이 걸리면 수행안될가능성 존재!





* 제약 : NOT NULL, 기본키(Primary Key), Unique Key, Foreign key

 ○ 테이블 작성 시 제약 정의 : 열 제약, 테이블 제약
  - 테이블 열에 제약 정의
    CREATE TABLE sample631 (
        a INTEGER NOT NULL,
        b INTEGER NOT NULL UNIQUE,
        c VARCHAR(30)
    );

  - 테이블에 '테이블 제약' 정의하기
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


 ○ 제약 추가
  - 열 제약 추가
   [c열에 NOT NULL 제약 걸기]
   ALTER TABLE sample631 MODIFY c VARCHAR(30) NOT NULL;

  - 테이블 제약 추가
   [기본키 제약 추가]
   ALTER TABLE sample631 ADD CONSTRAINT pkey_sample631 PRIMARY KEY (a);


 ○ 제약 삭제
  - 열 제약 삭제하기
   [c열의 NOT NULL 제약 없애기]
   ALTER TABLE sample631 MODIFY c VARCHAR(30);


  - 테이블 제약 삭제하기
   [pkey_sample631 제약 삭제하기]
   ALTER TABLE sample631 DROP CONSTRAINT pkey_sample631;

  - 테이블 제약 삭제하기
   [기본키 제약 삭제하기]
   ALTER TABLE sample631 DROP PRIMARY KEY;


* 기본키
  CREATE TABLE sample634 (
      p INTEGER NOT NULL,
      a VARCHAR(30),
      CONSTRAINT pkey_sample634 PRIMARY KEY (p)
  );

  INSERT INTO sample634 VALUES (1, '첫째줄');
  INSERT INTO sample634 VALUES (2, '둘째줄');
  INSERT INTO sample634 VALUES (3, '셋째줄');

 - sample634에 중복하는 행 추가하기
  INSERT INTO sample634 VALUES (2, '넷째줄');

 - sample634를 중복된 값으로 갱신하기
  UPDATE sample634 SET p=2 WHERE p=3;


* 복수의 열로 기본키 구성하기
 - sample635 테이블에서 a열과 b열로 이루어진 기본키
  SELECT a, b FROM sample635;




* 인덱스 - 목차나 색인의 기능. 검색속도 향상.
 - 인덱스가 없으면 '풀 테이블 스캔(full table scan)'으로 검색함
   행이 1000건 있다면 최대 1000번 값을 비교.

 - 인덱스는 '이진탐색(binary search)'으로 검색함.
   검색 대상은 이진트리(binary tree) 구조.


* 이진 탐색
  WHERE no = 30;

  1, 2, 3, 5, 10, 11, 19, 20, 20, 23, 30, 31, 32, 38, 40, 100

  - 가운데 값 20

  - 가운데 값 32

  - 가운데 값 30

  ○ 대량의 데이터를 검색할 때는 이진탐색이 빠르다!
     이진 트리에는 중복하는 값을 등록할 수 없다!


* 인덱스 작성, 삭제
  CREATE INDEX
  DROP INDEX


* 인덱스 작성
  CREATE INDEX 인덱스명 ON 테이블명 (열명1, 열명2, ...);

  CREATE INDEX isample62 ON sample62 (no);


* 인덱스 삭제
 - DROP INDEX(스키마 객체의 경우) - Oracle, DB2
  DROP INDEX 인덱스명;

 - DROP INDEX(테이블 내 객체의 경우) - MySQL, SQL Server
  DROP INDEX 인덱스명 ON 테이블명;

  DROP INDEX isample62 ON sample62;


* 인덱스 생성시 지정한 열(여기서는 no열)만 검색시 사용됨
 SELECT * FROM sample62 WHERE no=2; 인덱스 사용해서 검색
 SELECT * FROM sample62 WHERE a='안녕'; 인덱스 사용안함.


* EXPLAIN
 EXPLAIN SQL명령;

 EXPLAIN SELECT * FROM sample62 WHERE no > 10;

 EXPLAIN SELECT * FROM sample62 WHERE a = '안녕';

 - 인덱스는 한 테이블에 2개 이상 만들수도 있다.
   인덱스를 만드는 기준이 되는 열은 데이터 종류가 다양해야
   검색 효율이 좋아진다.


* 뷰 : FROM 구에 기술된 서브쿼리에 이름을 붙이고
       데이터베이스 객체화하여 쓰기 쉽게 한 것.
 - 뷰는 SELECT 명령을 기록하는 데이터베이스 객체!
   복잡한 SELECT 명령을 간략하게 표현하기 위함.

 - 뷰는 가상 테이블 : 실체(저장공간)가 존재하지 않음.
   SELECT 명령에서만 사용. INSERT, UPDATE, DELETE는 사용불가.

  SELECT * FROM (SELECT * FROM sample54) sq;

  SELECT * FROM sample_view_67;


* 뷰의 작성
  CREATE VIEW 뷰명 AS SELECT명령;

  CREATE VIEW sample_view_67 AS SELECT * FROM sample54;

  SELECT * FROM sample_view_67;


 - 열을 지정해 뷰 작성하기
  CREATE VIEW 뷰명 (열명1, 열명2, ...) AS SELECT명령;

  CREATE VIEW sample_view_672 (n, v, v2) AS
      SELECT no, a, a*2 FROM sample54;

  SELECT * FROM sample_view_672 WHERE n = 1;
  

* 뷰의 삭제
  DROP VIEW 뷰명;

* 테이블이 삭제되면 그와 연관된 인덱스, 뷰도 자동 삭제됨.














