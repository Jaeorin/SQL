[SCOTT ������ emp ���̺� ����]


1. ����) �μ���ȣ�� 10���� �μ��� ��� �� �����ȣ, �̸�, ������ ����϶�

SELECT deptno, ename, sal
FROM emp
WHERE deptno = 10
;



2. ����) �����ȣ�� 7369�� ��� �� �̸�, �Ի���, �μ���ȣ�� ����϶�.

SELECT ename, hiredate, deptno
FROM emp
WHERE empno = 7369
;



3. ����) �̸��� ALLEN�� ����� ��� ������ ����϶�.

SELECT *
FROM emp
WHERE ename = 'ALLEN'
;



4. ����) �Ի����� 81/02/20�� ����� �̸�, �μ���ȣ, ������ ����϶�.

SELECT ename, deptno, sal
FROM emp
WHERE hiredate = '81/02/20'
;



5. ����) ������ MANAGER�� �ƴ� ����� ��� ������ ����϶�.

SELECT *
FROM emp
WHERE job <> 'MANAGER'
;



6. ����) �Ի����� 81/04/02 ���Ŀ� �Ի��� ����� ������ ����϶�.

SELECT *
FROM emp
WHERE hiredate >= '81/04/02'
;



7. ����) �޿��� $800 �̻��� ����� �̸�, �޿�, �μ���ȣ�� ����϶�.

SELECT ename, sal, deptno
FROM emp
WHERE sal >= 800
;



8. ����) �μ���ȣ�� 20�� �̻��� ����� ��� ������ ����϶�.

SELECT *
FROM emp
WHERE deptno = 20
;



9. ����) �̸��� K�� �����ϴ� ������� ���� �̸��� ���� ����� ��� ������ ����϶�.

SELECT *
FROM emp
WHERE ename < 'K%'
;



10. ����) �Ի����� 81/12/09 ���� ���� �Ի��� ������� ��� ������ ����϶�.

SELECT *
FROM emp
WHERE hiredate < '81/12/09'
;



11. ����) �Ի��ȣ�� 7698���� �۰ų� ���� ������� �Ի��ȣ�� �̸��� ����϶�.

SELECT empno, ename
FROM emp
WHERE empno <= 7698
;



12. ����) �Ի����� 81/04/02 ���� �ʰ� 82/12/09 ���� ���� ����� �̸�,����, �μ���ȣ�� ����϶�.

SELECT ename, sal, deptno
FROM emp
WHERE hiredate > '81/04/02' AND hiredate < '82/12/09'
;



13. ����) �޿��� $1,600���� ũ�� $3,000���� ���� ����� �̸�, ����, �޿��� ����϶�.

SELECT ename, job, sal
FROM emp
WHERE sal > 1600 AND sal < 3000
;



14. ����) �����ȣ�� 7654�� 7782 ���� �̿��� ����� ��� ������ ����϶�.

SELECT *
FROM emp
WHERE empno >= 7654 AND empno <= 7782
;



15. ����) �̸��� B�� J ������ ��� ����� ������ ����϶�.

SELECT *
FROM emp
WHERE ename >= 'B%' AND ename <= 'J%'
;



16. ����) �Ի����� 81�� �̿ܿ� �Ի��� ����� ��� ������ ����϶�.

SELECT *
FROM emp
WHERE hiredate NOT LIKE '81/%'
;



17. ����) ������ MANAGER�̰ų� SALESMAN�� ����� ��� ������ ����϶�.

SELECT *
FROM emp
WHERE job = 'MANAGER' OR job = 'SALESMAN'
;



18. ����) �μ���ȣ�� 20, 30���� ������ ��� ����� �̸�, �����ȣ, �μ���ȣ�� ����϶�.

SELECT ename, empno, deptno
FROM emp
WHERE deptno <> 20 AND deptno <> 30
;



19. ����) �̸��� S�� �����ϴ� ����� �����ȣ, �̸�, �Ի���, �μ���ȣ�� ����϶�.

SELECT ename, hiredate, deptno
FROM emp
WHERE ename LIKE 'S%'
;



20. ����) �Ի����� 81�⵵�� ����� ��� ������ ����϶�

SELECT *
FROM emp
WHERE hiredate LIKE '81%'
;



21. ����) �̸� �� S�ڰ� �� �ִ� ����� ��� ������ ����϶�.

SELECT *
FROM emp
WHERE ename LIKE '%S%'
;



22. ����) �̸��� S�� �����ϰ� ������ ���ڰ� H�� ����� ��� ������ ����϶�
-- (��, �̸��� ��ü 5�ڸ��̴�)

SELECT *
FROM emp
WHERE ename LIKE 'S___H'
;



23. ����) �̸��� ù ��° ���ڴ� �������, �� ��° ���ڰ� A�� ����� ������ ����϶�.

SELECT *
FROM emp
WHERE ename LIKE '_A%'
;



24. ����) Ŀ�̼��� NULL�� ����� ������ ����϶�.

SELECT *
FROM emp
WHERE comm IS NULL
;



25. ����) Ŀ�̼��� NULL�� �ƴ� ����� ��� ������ ����϶�.

SELECT *
FROM emp
WHERE comm IS NOT NULL
;



26. ����) �μ��� 30�� �μ��̰� �޿��� $1,500 �̻��� ����� �̸�, �μ� ,������ ����϶�.

SELECT ename, deptno, sal
FROM emp
WHERE deptno = 30 AND sal >= 1500
;



27. ����) �̸��� ù ���ڰ� K�� �����ϰų� �μ���ȣ�� 30�� ����� �����ȣ, �̸�, �μ���ȣ�� ����϶�.

SELECT empno, ename, deptno
FROM emp
WHERE ename LIKE 'K%' OR deptno = 30
;



28. ����) �޿��� $1,500 �̻��̰� �μ���ȣ�� 30���� ��� �� ������MANAGER�� ����� ������ ����϶�

SELECT *
FROM emp
WHERE sal >= 1500 AND deptno = 30 AND job = 'MANAGER'
;



29. ����) �μ���ȣ�� 30�� ��� �� �����ȣ SORT�϶�.

SELECT empno
FROM emp
WHERE deptno = 30
ORDER BY deptno
;



30. ����) �޿��� ���� ������ SORT�϶�.

SELECT *
FROM emp
ORDER BY sal DESC
;



31. ����) �μ���ȣ�� ASCENDING SORT�� �� �޿��� ���� ��� ������ ����϶�.

SELECT *
FROM emp
ORDER BY deptno, SAL DESC
;



32. ����) �μ���ȣ�� DESCENDING SORT�ϰ�, �̸� ������ ascending sort �޿� ������ descending sort �϶�.

SELECT *
FROM emp
ORDER BY deptno DESC, ename ASC, sal DESC
;
