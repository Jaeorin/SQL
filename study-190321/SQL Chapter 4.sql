-- 절대값 출력 : 15
SELECT ABS(-15) FROM dual;

-- 정수값 올림하여 출력 : 16
SELECT CEIL(15.7) FROM dual;

-- 코사인 값 출력 : -0.9…
SELECT COS(3.14159) FROM dual;

-- 정수값 내림하여 출력 : 15
SELECT FLOOR(15.7) FROM dual;

-- a^x = b일 때, 로그값 x 출력 : 2
SELECT LOG(10,100) FROM dual;

-- a를 b로 나눈 뒤 남은 값 출력 : 3
SELECT MOD(11,4) FROM dual;

-- a의 b제곱 출력 : 9
SELECT POWER(3,2) FROM dual;

-- 정수 a에 가장 가까운 값 출력 : 16
SELECT ROUND(15.7) FROM dual;

-- 인자값의 음수, 양수 여부 출력(음수 -1, 0, 양수 1)
SELECT SIGN(-15) FROM dual;

-- 소수점 잘라서 출력
SELECT TRUNC(15.7) FROM dual;

-- 아스키코드의 67번에 저장된 값 출력
SELECT CHR(67) FROM dual;

-- a문자열을 포함하며 b크기가 될 때까지 c의 문자열을 문자열 왼쪽에 추가하여 출력
SELECT LPAD('Page 1', 15, '*.') FROM dual;

-- a문자열 왼쪽에서 b문자열 제거하여 출력
SELECT LTRIM('Page 1', 'ae') FROM dual;

-- a문자열에서 b문자열을 c문자열로 변환하여 출력
SELECT REPLACE('JACK', 'J', 'BL') FROM dual;

-- a문자열을 포함하며 b크기가 될 때까지 c의 문자열을 문자열 오른쪽에 추가하여 출력
SELECT RPAD('Page 1', 15, '*.') FROM dual;

-- a문자열 오른쪽에서 b문자열 제거하여 출력
SELECT RTRIM('Page 1', 'ae') FROM dual;

-- a문자열 b번째에서 c번째까지 출력
SELECT SUBSTR('ABCDEFG', 3, 4) FROM dual;

-- b문자열에서 a문자열이 아닌 문자열이 나올때까지 모두 제거하여 출력
SELECT TRIM(LEADING 0 FROM '00AA00') FROM dual;

-- 대문자로 출력
SELECT UPPER('Birthday') FROM dual;

-- 문자열의 아스키코드값을 출력
SELECT ASCII('A') FROM dual;

-- a문자열에서 b문자열을 c번째 문자부터 검색해서 d번째에 나오는 문자열의 위치 출력
SELECT INSTR('CORPORATE FLOOR','OR', 3, 2) FROM dual;

-- 문자열의 크기 출력
SELECT LENGTH('Birthday') FROM dual;

-- 날자형 문자열 a의 월을 b만큼 추가
SELECT ADD_MONTHS('14/05/21', 1) FROM dual;

-- 잘못된 예제
-- 두번째 인자를 참조해야 함
-- a날짜 이후에서 b에 해당하는 날짜 출력
SELECT NEXT_DAY(SYSDATE) FROM dual;

-- 날자형 함수를 반올림하여 출력
-- 기본값 : 시간 반올림, 두번째 인자에서 반올림할 범위 지정
SELECT ROUND(SYSDATE) FROM dual;

-- 컴퓨터 시스템의 날짜 출력
SELECT SYSDATE FROM dual;

-- 컴퓨터 시스템의 날짜를 문자열로 출력
SELECT TO_CHAR(SYSDATE) FROM dual;

-- a를 문자열로 출력
SELECT TO_CHAR(123) FROM dual;

-- a문자열을 b형식에 맞게 날짜형으로 출력
SELECT TO_DATE('12 05 2014', 'DD MM YYYY') FROM dual;

-- 문자열 a를 숫자형으로 출력
SELECT TO_NUMBER('12.3') FROM dual;

-- a값이 b와 같으면 c, 다르면 d 출력
SELECT DECODE(1,1,'aa','bb') FROM dual;

-- a와 b가 같으면 null, 다르면 a 출력
SELECT NULLIF(123, 345) FROM dual;

-- 비교대상 a의 값이 null이면 b 출력
SELECT NVL(NULL, 123) FROM dual;