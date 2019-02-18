데이터베이스

http://www.mysql.com/

MySQL Community Server(커뮤니티) 5.6 다운로드


데이터: 컴퓨터 안에 기록되어 있는 숫자
데이터베이스: 이러한 데이터의 집합
              컴퓨터 안에 기록된 모든 것.
   특정 데이터를 확인하고 싶을때
   쉽게 찾을수 있도록 정리된 형태.


* 일상생활에서의 웹 쇼핑, 표예매 사이트 등등.
           마트에서의 POS 시스템.

     휴대전화에서의 전화번호부 데이터베이스.



* DB와 DBMS

* SQL언어는 RDBMS에서만 사용함.

* RDBMS: Oracle, DB2, SQL Server, PostgreSQL, MySQL, SQLite


* RDBMS는 클라이언트/서버 모델


* 표준SQL

* 샘플 DB데이터 다운로드
  http://download.hanbit.co.kr/exam/2231/

* 샘플 DB데이터 임포트
D:\> mysql -uroot -p < sample.dump
Enter password: 1234

* 환경변수 path 에 추가. 세미콜론(;) 구분자 조심!
C:\Program Files\MySQL\MySQL Server 5.6\bin

* root 계정으로 DB에 로그인
  mysql -uroot -p
  1234

* exit 로 종료

* 데이터베이스(스키마) 목록 출력
  SHOW DATABASES;

* 데이터베이스(스키마) 선택
  USE 스키마명;  (USE sample;)
  
* 스키마 안의 테이블 목록 확인
  SHOW TABLES;


* set names euckr;


* SELECT 명령
  SELECT * FROM 테이블명;

   - SELECT : 명령의 종류
   - * : 애스터리스크(*)는 '모든 열'

* 테이블 구조 참조
  DESC 테이블명;

* 자료형
 - INTEGER형 : 수치형. 정수값 저장할 수 있는 자료형.
 - DECIMAL형 : 수치형. 소수점 저장할 수 있는 실수 자료형.
 - CHAR형 : '고정길이 문자열' 자료형.
             CHAR(10)에  7개 문자를 저장하면
             빈문자 3개 추가되서 10개로 만들어져서 저장
 - VARCHAR형 : '가변길이 문자열' 자료형
             VARCHAR(10)에 7개 문자 저장하면 7개 저장.
 - DATE형 : 날짜값 저장하는 자료형. 연월일.
 - TIME형 : 시간을 저장하는 자료형. 시분초.



<검색 조건 지정하기>

* SELECT 구와 WHERE 구
SELECT 열1, 열2 FROM 테이블명 WHERE 조건식;

* SELECT 구에서 열 지정하기
* WHERE 구에서 행 지정하기


* WHERE 구로 no 열 값이 2인 행만 추출
  SELECT * FROM sample21 WHERE no = 2;

* 조건식  no = 2
   - no : 열이름
   - = : 연산자
   - 2 : 상수

* 비교연산자
  같다(=), 다르다(<>), 크다(>), 작다(<),
  크거나 같다(>=), 작거나 같다(<=)

* name 열 값이 '박준용'인 행만 추출
  SELECT * FROM sample21 WHERE name = '박준용';

* NULL 값 검색
  SELECT * FROM sample21 WHERE birthday = NULL; (X)
  SELECT * FROM sample21 WHERE birthday IS NULL; (O)


* 조건 조합 (AND, OR, NOT)

* AND 조합
  조건식1 AND 조건식2
  모든 조건이 만족하는 경우 조건식은 참이 됨. (그리고)

 - a열과 b열이 모두 0이 아닌 행 검색
   SELECT * 
   FROM sample24 
   WHERE a<>0 
   AND b<>0;


* OR 조합
  조건식1 OR 조건식2
  어느 쪽이든 하나만 참이 되면 조건식은 참이 됨. (또는)

  - a열이 0이 아니거나 b열이 0이 아닌 행을 검색
    SELECT * FROM sample24 WHERE a<>0 OR b<>0;


* AND와 OR를 사용할때 주의점
 SELECT * FROM sample24 WHERE a<>0;
 SELECT * FROM sample24 WHERE a=1 OR a=2;
 SELECT * FROM sample24 WHERE a=1 OR 2;  (X)

* AND와 OR를 조합해서 사용할때 연산자 우선순위 주의!
 - a열이 0이 아니고 b열이 0이 아닌 행을 검색
  SELECT * FROM sample24 WHERE a<>0 AND b<>0;

 - a열이 1 또는 2이고, b열이 1 또는 2인 행을 검색
  SELECT * FROM sample24 
  WHERE a=1 OR a=2 AND b=1 OR b=2;

  AND연산이 OR연산보다 우선순위가 높음!

  SELECT * FROM sample24
  WHERE (a=1 OR a=2) AND (b=1 OR b=2);


* NOT 연산자로 조건식 조합(~아닌, ~외에, ~를 제외한 나머지)
 - a열이 0이 아니거나 b열이 0이 아닌 행을 제외한
   나머지 행을 검색
  SELECT * FROM sample24 WHERE NOT (a<>0 OR b<>0);


* 패턴 매칭에 의한 검색
  열명 LIKE '패턴'
  
  LIKE에서 사용할 수 있는 메타문자: % _
    % : 임의의 문자열 (문자가 0개 이상)
    _ : 임의의 문자 한개

 SELECT * FROM sample25;

 SELECT * FROM sample25 WHERE text LIKE 'SQL%'; (전방일치)
 SELECT * FROM sample25 WHERE text LIKE '%SQL%';(중간일치)
 SELECT * FROM sample25 WHERE text LIKE '%SQL'; (후방일치)


* 검색패턴 메타문자를 값으로써 검색시:  \%   \_
 SELECT * FROM sample25 WHERE text LIKE '%\%%';
 SELECT * FROM sample25 WHERE text LIKE '%\_%';


* 문자열 상수 안에 ' 기술하기
  표준SQL에서는 '를 2개 연속해서 기술함.

   'It's'  ->  'It''s'

      '    ->   ''''         'a'


 - sample25 테이블의 text 열 값에 '에서'라는 문자열이
   포함된 행을 검색
  SELECT * FROM sample25 WHERE text LIKE '%에서%';


* 정렬 - ORDER BY
  SELECT 열명 FROM 테이블명 WHERE 조건식 ORDER BY 열명;
  SELECT 열명 FROM 테이블명 ORDER BY 열명;

  SELECT * FROM sample31;

  - age열의 값을 오름차순으로 정렬하기
  SELECT * FROM sample31 ORDER BY age;

  - address열로 정렬하기
  SELECT * FROM sample31 ORDER BY address;

* 오름차순(ASC)과 내림차순(DESC)
  - age열의 값을 오름차순으로 정렬하기
  SELECT * FROM sample31 ORDER BY age ASC;

  - age열의 값을 내림차순으로 정렬하기
  SELECT * FROM sample31 ORDER BY age DESC;


* 복수 열을 지정해 정렬하기
  SELECT * FROM sample32;

 - a열만으로 정렬하기
  SELECT * FROM sample32 ORDER BY a;

 - a열과 b열로 정렬하기
  SELECT * FROM sample32 ORDER BY a, b;
  (값이 같아 순서를 결정할수 없는 경우에는
   다음으로 지정한 열명을 기준으로 정렬하는 식으로 처리)
  
 - b열과 a열로 정렬하기
  SELECT b, a FROM sample32 ORDER BY b, a;

 - a열을 ASC로 b열을 DESC로 정렬하기
  SELECT * FROM sample32 ORDER BY a ASC, b DESC;


* NULL 값의 정렬순서
  오라클에서는 가장 큰값으로 취급.
  MySQL에서는 가장 작은값으로 취급.


* 결과 행 제한하기 - LIMIT
  SELECT 열명 FROM 테이블명 WHERE 조건식 ORDER BY 열명
  LIMIT 행수;

  SELECT * FROM sample33;

 - sample33에 LIMIT 3으로 상위 3건만 취득하기
  SELECT * FROM sample33 LIMIT 3;

 - sample33을 정렬 후 LIMIT 3으로 상위 3건만 취득하기
  SELECT * FROM sample33 ORDER BY no DESC LIMIT 3;

 - MS SQL Server에서는 LIMIT 대신 TOP을 사용
  SELECT TOP 3 * FROM sample33;


* 오프셋 지정
  SELECT 열명 FROM 테이블명 LIMIT 행수 OFFSET 위치;

 - sample33에서 LIMIT 3 OFFSET 0으로 첫번째 페이지 표시
  SELECT * FROM sample33 LIMIT 3 OFFSET 0;
   (OFFSET은 생략가능하며 기본값은 0)

 - sample33에서 LIMIT 3 OFFSET 3으로 두번째 페이지 표시
  SELECT * FROM sample33 LIMIT 3 OFFSET 3;



* 수치 연산
 - 산술 연산자 : + - * / %

   우선순위가 같은 경우
    1 - 2 + 3

   우선순위가 다른 경우
    1 + 2 * 3


* SELECT 구로 연산하기
  SELECT * FROM sample34;

  SELECT *, price * quantity FROM sample34;


* 열의 별명
  SELECT *, price * quantity AS amount FROM sample34;
  SELECT *, price * quantity AS "금액" FROM sample34;
  - 이름에 ASCII 문자 이외의 것을 포함할 경우는
    더블쿼트(쌍따옴표)로 둘러싸서 지정한다!

  SELECT *, price * quantity AS "select" FROM sample34;

  - 이름을 지정하는 경우 숫자로 시작되지 않도록 한다!


* WHERE 구에서 연산하기
  SELECT *, price * quantity AS amount FROM sample34;

 - WHERE 구에서 금액을 계산하고 2000원 이상인 행 검색하기
  SELECT *, price * quantity AS amount FROM sample34
  WHERE amount >= 2000;  (X)

  SELECT *, price * quantity AS amount FROM sample34
  WHERE price * quantity >= 2000;  (O)

  (데이터베이스 서버 내부에서 WHERE 구 -> SELECT 구의
   순서로 처리됨)


* NULL 값의 연산
  NULL + 1
  1 + 2 * NULL
  1 / NULL
 - NULL로 연산하면 결과는 NULL이 된다!


* ORDER BY 구에서 금액을 계산하고 내림차순 정렬하기
  SELECT *, price * quantity AS amount FROM sample34
  ORDER BY price * quantity DESC;

              여기서 별명을 지정
                 ↓
  WHERE 구 → SELECT 구 → ORDER BY 구

  SELECT *, price * quantity AS amount FROM sample34
  ORDER BY amount DESC;



* 함수

* ROUND 함수 : 반올림

* ROUND로 반올림하기
  SELECT * FROM sample341;

 - 기본 동작은 소수점 첫째자리에서 반올림
  SELECT amount, ROUND(amount) FROM sample341;


* 소수점 첫째자리가 0, 둘째자리는 1.
  정수부 일의자리는 -1, 10의자리는 -2, 100의 자리는 -3.

 - 소수점 둘째자리에서 반올림하기
  SELECT amount, ROUND(amount, 1) FROM sample341;

 - 10단위를 반올림하기
  SELECT amount, ROUND(amount, -2) FROM sample341;


* FLOOR 함수 : 버림
  SELECT amount, FLOOR(amount) FROM sample341;

* CEIL 함수 : 올림
  SELECT amount, CEIL(amount) FROM sample341;




* 문자열 연산

* 문자열 결합
  + 연산자 : MS SQL Server
  || 연산자 : Oracle, DB2, PostgreSQL
  CONCAT 함수 : MySQL

* 문자열 결합 연습
  SELECT * FROM sample35;

 - 문자열 결합으로 단위를 연결해 결과 얻기
  SELECT CONCAT(quantity, unit) FROM sample35;



* SUBSTRING 함수 - 부분문자열 가져오기
 - 앞 4자리(년도) 추출
  SUBSTRING('20170125', 1, 4) → '2017'

 - 5째 자리부터 2자리(월) 추출
  SUBSTRING('20170125', 5, 2) → '01'

  SELECT SUBSTRING(text, 1, 4) FROM sample25;


* TRIM 함수 - 문자열 값의 좌우 공백 제거.
  TRIM('ABC   ') → 'ABC'


* CHARACTER_LENGTH 함수
  CHAR_LENTH 함수
  : 문자열 길이 구하기
  SELECT CHAR_LENGTH(text) FROM sample25;



* 날짜 연산
  CURRENT_TIMESTAMP 함수
  CURRENT_DATE 함수
  CURRENT_TIME 함수
  INTERVAL

  SELECT CURRENT_TIMESTAMP;  - MySQL
  SELECT CURRENT_TIMESTAMP FROM dual;  - Oracle

  SELECT CURRENT_DATE;
  SELECT CURRENT_TIME;


* 날짜의 덧셈과 뺄셈
 - 시스템 날짜의 1일 후를 계산하기
  SELECT CURRENT_DATE + INTERVAL 1 DAY;

 - 시스템 날짜의 1일 이전을 계산하기
  SELECT CURRENT_DATE - INTERVAL 1 DAY;


* 날짜형 간의 뺄셈
  날짜형 간의 덧셈도 가능하지만 별 의미있는 자료가 아님.

  SELECT DATEDIFF('2017-01-19', '2016-12-25');  - MySQL
  SELECT '2017-01-19' - '2016-12-25' FROM dual; - Oracle



* CASE 문으로 데이터 변환하기
  CASE
    WHEN 조건식1 THEN 식1
    WHEN 조건식2 THEN 식2
    ELSE 식3
  END

  SELECT * FROM sample37;
 - CASE로 NULL 값을 0으로 변환하기
  SELECT a, 
         CASE
           WHEN a IS NULL THEN 0 
           ELSE a
         END AS a2
  FROM sample37;

 - COALESCE 함수 (NULL 값을 변환하는 용도)
  SELECT a, COALESCE(a, 0) FROM sample37;


 - 검색 CASE 문 (자바의 if 문이랑 비슷)
  CASE
    WHEN gender=1 THEN '남자'
    WHEN gender=2 THEN '여자'
  END

* 1이면 '남자', 2이면 '여자', 그외는 '미지정'
  SELECT a AS "코드",
         CASE
           WHEN a=1 THEN '남자'
           WHEN a=2 THEN '여자'
           ELSE '미지정'
         END AS "성별"
  FROM sample37;


 - 단순 CASE 문 (자바의 switch 문이랑 비슷)
  CASE gender
    WHEN 1 THEN '남자'
    WHEN 2 THEN '여자'
  END

  SELECT a AS "코드",
         CASE a
           WHEN 1 THEN '남자'
           WHEN 2 THEN '여자'
           ELSE '미지정'
         END AS "성별"
  FROM sample37;



* CASE를 사용할 경우 주의사항
 - ELSE를 생략하면 ELSE NULL이 되므로 주의!
   ELSE 생략하지 않고 지정하는 편이 좋음.

 - 단순 CASE 문에서 WHEN 절에 NULL 지정하기
  CASE a
    WHEN 1 THEN '남자'
    WHEN 2 THEN '여자'
    WHEN NULL THEN '데이터 없음'  (a = NULL 비교 불가능!)
    ELSE '미지정'
  END   (NULL 비교가 잘못됨)

  CASE
    WHEN a=1 THEN '남자'
    WHEN a=2 THEN '여자'
    WHEN a IS NULL THEN '데이터 없음'
    ELSE '미지정'
  END   (NULL 확인 올바름)




