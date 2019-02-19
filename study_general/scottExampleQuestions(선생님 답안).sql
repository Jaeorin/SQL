���� ���� �̸���
swkim917@daum.net �� ������
��������: "SQLȰ�� ���� - ȫ�浿"


[SCOTT ������ emp ���̺� ����]


1. ����) �μ���ȣ�� 10���� �μ��� ��� �� �����ȣ, �̸�, ������ ����϶�

SELECT empno, ename, sal
FROM emp
WHERE deptno = 10;


2. ����) �����ȣ�� 7369�� ��� �� �̸�, �Ի���, �μ���ȣ�� ����϶�.

SELECT ename, hiredate, deptno
FROM emp
WHERE empno = 7369;


3. ����) �̸��� ALLEN�� ����� ��� ������ ����϶�.

SELECT *
FROM emp
WHERE ename = 'ALLEN';


4. ����) �Ի����� 81/02/20�� ����� �̸�, �μ���ȣ, ������ ����϶�.

SELECT ename, deptno, sal
FROM emp
WHERE hiredate = '1981-02-20';


5. ����) ������ MANAGER�� �ƴ� ����� ��� ������ ����϶�.

SELECT *
FROM emp
WHERE job <> 'MANAGER';


6. ����) �Ի����� 81/04/02 ���Ŀ� �Ի��� ����� ������ ����϶�.

SELECT *
FROM emp
WHERE hiredate >= '1981-04-02';


7. ����) �޿��� $800 �̻��� ����� �̸�, �޿�, �μ���ȣ�� ����϶�.

SELECT ename, sal, deptno
FROM emp
WHERE sal >= 800;


8. ����) �μ���ȣ�� 20�� �̻��� ����� ��� ������ ����϶�.

SELECT *
FROM emp
WHERE deptno >= 20;


9. ����) �̸��� K�� �����ϴ� ������� ���� �̸��� ���� ����� ��� ������ ����϶�.

SELECT *
FROM emp
WHERE ename >= 'L';


10. ����) �Ի����� 81/12/09 ���� ���� �Ի��� ������� ��� ������ ����϶�.

SELECT *
FROM emp
WHERE hiredate < '1981-12-09';


11. ����) �Ի��ȣ�� 7698���� �۰ų� ���� ������� �Ի��ȣ�� �̸��� ����϶�.

SELECT empno, ename
FROM emp
WHERE empno <= 7698;


12. ����) �Ի����� 81/04/02 ���� �ʰ� 82/12/09 ���� ���� ����� �̸�,����, �μ���ȣ�� ����϶�.

SELECT ename, sal, deptno
FROM emp
WHERE hiredate > '1981-04-02'
AND hiredate < '1982-12-09';


13. ����) �޿��� $1,600���� ũ�� $3,000���� ���� ����� �̸�, ����, �޿��� ����϶�.

SELECT ename, job, sal
FROM emp
WHERE sal > 1600
AND sal < 3000;

SELECT ename, job, sal
FROM emp
WHERE sal BETWEEN 1600+1 AND 3000-1;


14. ����) �����ȣ�� 7654�� 7782 ���� �̿��� ����� ��� ������ ����϶�.

SELECT *
FROM emp
WHERE NOT (empno >= 7654 AND empno <= 7782);

SELECT *
FROM emp
WHERE empno NOT BETWEEN 7654 AND 7782;

SELECT *
FROM emp
WHERE empno < 7654 OR empno > 7782;


15. ����) �̸��� B�� J ������ ��� ����� ������ ����϶�.

SELECT *
FROM emp
WHERE ename >= 'B' AND ename <= 'J';

SELECT *
FROM emp
WHERE ename BETWEEN 'B' AND 'J';


16. ����) �Ի����� 81�� �̿ܿ� �Ի��� ����� ��� ������ ����϶�.

SELECT *
FROM emp
WHERE hiredate NOT BETWEEN '1981-01-01' AND '1981-12-31';

SELECT *
FROM emp
WHERE hiredate NOT LIKE '81%';


17. ����) ������ MANAGER�̰ų� SALESMAN�� ����� ��� ������ ����϶�.

SELECT *
FROM emp
WHERE job = 'MANAGER'
OR job = 'SALESMAN';

SELECT *
FROM emp
WHERE job IN ('MANAGER', 'SALESMAN');


18. ����) �μ���ȣ�� 20, 30���� ������ ��� ����� �̸�, �����ȣ, �μ���ȣ�� ����϶�.

SELECT ename, empno, deptno
FROM emp
WHERE NOT (deptno = 20 OR deptno = 30);

SELECT ename, empno, deptno
FROM emp
WHERE deptno NOT IN (20, 30);

SELECT ename, empno, deptno
FROM emp
WHERE deptno <> 20 and deptno <> 30;


19. ����) �̸��� S�� �����ϴ� ����� �����ȣ, �̸�, �Ի���, �μ���ȣ�� ����϶�.

SELECT empno, ename, hiredate, deptno
FROM emp
WHERE ename LIKE 'S%';


20. ����) �Ի����� 81�⵵�� ����� ��� ������ ����϶�

SELECT *
FROM emp
WHERE hiredate BETWEEN '1981-01-01' AND '1981-12-31';


21. ����) �̸� �� S�ڰ� �� �ִ� ����� ��� ������ ����϶�.

SELECT *
FROM emp
WHERE ename LIKE '%S%';


22. ����) �̸��� S�� �����ϰ� ������ ���ڰ� H�� ����� ��� ������ ����϶�
(��, �̸��� ��ü 5�ڸ��̴�)

SELECT *
FROM emp
WHERE ename LIKE 'S___H';


23. ����) �̸��� ù ��° ���ڴ� �������, �� ��° ���ڰ� A�� ����� ������ ����϶�.

SELECT *
FROM emp
WHERE ename LIKE '_A%';


24. ����) Ŀ�̼��� NULL�� ����� ������ ����϶�.

SELECT *
FROM emp
WHERE comm IS NULL;


25. ����) Ŀ�̼��� NULL�� �ƴ� ����� ��� ������ ����϶�.

SELECT *
FROM emp
WHERE comm IS NOT NULL;


26. ����) �μ��� 30�� �μ��̰� �޿��� $1,500 �̻��� ����� �̸�, �μ� ,������ ����϶�.

SELECT ename, deptno, sal
FROM emp
WHERE deptno = 30
AND sal >= 1500;


27. ����) �̸��� ù ���ڰ� K�� �����ϰų� �μ���ȣ�� 30�� ����� �����ȣ, �̸�, �μ���ȣ�� ����϶�.

SELECT empno, ename, deptno
FROM emp
WHERE ename LIKE 'K%'
OR deptno = 30;


28. ����) �޿��� $1,500 �̻��̰� �μ���ȣ�� 30���� ��� �� ������MANAGER�� ����� ������ ����϶�

SELECT *
FROM emp
WHERE sal >= 1500
AND deptno = 30
AND job = 'MANAGER';


29. ����) �μ���ȣ�� 30�� ��� �� �����ȣ�� �����϶�.

SELECT *
FROM emp
WHERE deptno = 30
ORDER BY empno;


30. ����) �޿��� ���� ������ SORT�϶�.

SELECT *
FROM emp
ORDER BY sal DESC;


31. ����) �μ���ȣ�� ASCENDING SORT�� �� �޿��� ���� ��� ������ ����϶�.

SELECT deptno, sal
FROM emp
ORDER BY deptno ASC, sal DESC;


32. ����) �μ���ȣ�� DESCENDING SORT�ϰ�, �̸� ������ ASCENDING SORT �޿� ������ DESCENDING SORT �϶�.

SELECT deptno, ename, sal
FROM emp
ORDER BY deptno DESC, ename, sal DESC;




