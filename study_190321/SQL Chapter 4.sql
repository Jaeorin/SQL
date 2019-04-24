-- ���밪 ��� : 15
SELECT ABS(-15) FROM dual;

-- ������ �ø��Ͽ� ��� : 16
SELECT CEIL(15.7) FROM dual;

-- �ڻ��� �� ��� : -0.9��
SELECT COS(3.14159) FROM dual;

-- ������ �����Ͽ� ��� : 15
SELECT FLOOR(15.7) FROM dual;

-- a^x = b�� ��, �αװ� x ��� : 2
SELECT LOG(10,100) FROM dual;

-- a�� b�� ���� �� ���� �� ��� : 3
SELECT MOD(11,4) FROM dual;

-- a�� b���� ��� : 9
SELECT POWER(3,2) FROM dual;

-- ���� a�� ���� ����� �� ��� : 16
SELECT ROUND(15.7) FROM dual;

-- ���ڰ��� ����, ��� ���� ���(���� -1, 0, ��� 1)
SELECT SIGN(-15) FROM dual;

-- �Ҽ��� �߶� ���
SELECT TRUNC(15.7) FROM dual;

-- �ƽ�Ű�ڵ��� 67���� ����� �� ���
SELECT CHR(67) FROM dual;

-- a���ڿ��� �����ϸ� bũ�Ⱑ �� ������ c�� ���ڿ��� ���ڿ� ���ʿ� �߰��Ͽ� ���
SELECT LPAD('Page 1', 15, '*.') FROM dual;

-- a���ڿ� ���ʿ��� b���ڿ� �����Ͽ� ���
SELECT LTRIM('Page 1', 'ae') FROM dual;

-- a���ڿ����� b���ڿ��� c���ڿ��� ��ȯ�Ͽ� ���
SELECT REPLACE('JACK', 'J', 'BL') FROM dual;

-- a���ڿ��� �����ϸ� bũ�Ⱑ �� ������ c�� ���ڿ��� ���ڿ� �����ʿ� �߰��Ͽ� ���
SELECT RPAD('Page 1', 15, '*.') FROM dual;

-- a���ڿ� �����ʿ��� b���ڿ� �����Ͽ� ���
SELECT RTRIM('Page 1', 'ae') FROM dual;

-- a���ڿ� b��°���� c��°���� ���
SELECT SUBSTR('ABCDEFG', 3, 4) FROM dual;

-- b���ڿ����� a���ڿ��� �ƴ� ���ڿ��� ���ö����� ��� �����Ͽ� ���
SELECT TRIM(LEADING 0 FROM '00AA00') FROM dual;

-- �빮�ڷ� ���
SELECT UPPER('Birthday') FROM dual;

-- ���ڿ��� �ƽ�Ű�ڵ尪�� ���
SELECT ASCII('A') FROM dual;

-- a���ڿ����� b���ڿ��� c��° ���ں��� �˻��ؼ� d��°�� ������ ���ڿ��� ��ġ ���
SELECT INSTR('CORPORATE FLOOR','OR', 3, 2) FROM dual;

-- ���ڿ��� ũ�� ���
SELECT LENGTH('Birthday') FROM dual;

-- ������ ���ڿ� a�� ���� b��ŭ �߰�
SELECT ADD_MONTHS('14/05/21', 1) FROM dual;

-- �߸��� ����
-- �ι�° ���ڸ� �����ؾ� ��
-- a��¥ ���Ŀ��� b�� �ش��ϴ� ��¥ ���
SELECT NEXT_DAY(SYSDATE) FROM dual;

-- ������ �Լ��� �ݿø��Ͽ� ���
-- �⺻�� : �ð� �ݿø�, �ι�° ���ڿ��� �ݿø��� ���� ����
SELECT ROUND(SYSDATE) FROM dual;

-- ��ǻ�� �ý����� ��¥ ���
SELECT SYSDATE FROM dual;

-- ��ǻ�� �ý����� ��¥�� ���ڿ��� ���
SELECT TO_CHAR(SYSDATE) FROM dual;

-- a�� ���ڿ��� ���
SELECT TO_CHAR(123) FROM dual;

-- a���ڿ��� b���Ŀ� �°� ��¥������ ���
SELECT TO_DATE('12 05 2014', 'DD MM YYYY') FROM dual;

-- ���ڿ� a�� ���������� ���
SELECT TO_NUMBER('12.3') FROM dual;

-- a���� b�� ������ c, �ٸ��� d ���
SELECT DECODE(1,1,'aa','bb') FROM dual;

-- a�� b�� ������ null, �ٸ��� a ���
SELECT NULLIF(123, 345) FROM dual;

-- �񱳴�� a�� ���� null�̸� b ���
SELECT NVL(NULL, 123) FROM dual;