SELECT * FROM emp;
--1. 부서 10과 30에 속하는 모든 사원의 이름과 부서번호를 이름과 알파벳 순으로 정렬되도록 질의문을 만드세요.
SELECT ename 이름, deptno 부서번호 FROM emp
WHERE deptno IN(10,30)
ORDER BY ename; -- default는 오름차순이므로 ASC
--2. 1982년도에 입사한 모든 사원의 이름과 입사일을 출력하세요(like %활용).
SELECT ename 이름, hiredate 입사일 FROM emp
WHERE hiredate LIKE '%82%';
--3. 보너스가 급여의 20%이상이고 부서번호가 30인 모든 사원에 대하여 이름, 급여, 그리고 보너스를 출력하세요. 
--		급여(sal), 보너스(comm)
SELECT ename 이름, sal 급여, comm 보너스, deptno 부서번호 FROM emp
WHERE comm >= sal*0.2
AND deptno = 30;
--4. like 키워드에서 %, _ 의미를 기술하고 간단한 예제를 만드세요.
--	1) % : 모든 문자라는 의미이다.
-- 	2) _ : 한 글자라는 의미이다.
SELECT ename FROM emp WHERE ename LIKE '%A%'; -- 문자열 'A'를 포함하고 있는 조건에 해당하는 것만 조회
SELECT ename FROM emp WHERE ename LIKE 'A%'; -- 문자열 'A'로 시작하는 것만 조회
SELECT ename FROM emp WHERE ename LIKE '%D'; -- 문자열 'D'로 끝나는 것만 조회
SELECT ename FROM emp WHERE ename LIKE '%R_'; -- 뒤에서 두번째 문자열이 'R'인것만 조회
SELECT ename FROM emp WHERE ename LIKE '__A%'; -- 앞에서 세번째 문자열이 A'인것만 조회

--5. 가장 최근에 입사한 사원의 이름과 입사일을 출력하세요(in subquery구문 활용)
SELECT ename 이름, hiredate 입사일 FROM emp
WHERE hiredate IN (SELECT max(hiredate) FROM emp);
