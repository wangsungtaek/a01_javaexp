SELECT * FROM emp;
/*
# in 키워드를 활용한 조건 검색 처리..
1. 기본 형식
	where 컬렁명 in (데이터1, 데이터2, 데이터3)
		해당 데이터1, 데이터2, 데이터3에 하나라도 맞으면 데이터를 처리해주는
		구분.

2. 같은 컬럼명에서 여러 데이터가 맞을 때, 쓰이는 구문으로
	where 컬럼명 = 데이터1
	   or 컬렴명 = 데이터2
	   or 컬렴명 = 데이터3 을 간편하게 처리하는 구문이다.

3. subquery를 활용할 때도 이용된다.
	where 컬럼명 in ( select 컬럼명 from 테이블명 )	   
*/
-- 부서번호가 10이거나 20일 데이터 조회하는 2가지 방법.
-- 방법1.
SELECT *
FROM  emp
WHERE deptno = 10 OR deptno = 20;
-- 방법2.
SELECT *
FROM emp
WHERE deptno IN (10,20);

-- ex) job이 SALESMAN 이거나, MANAGER 인 경우를 IN 구문을 이용해서
--		출력하세요
SELECT *
FROM emp
WHERE job IN('SALESMAN','MANAGER');

-- SUBQUERY 로 활용해서 - 최고 연봉자인 사람의 정보 출력하세요..
-- 					 - 부서번호가 30인 사람의 연봉이 같은 사람을 출력하세요.
SELECT *
FROM emp
WHERE sal IN (SELECT max(sal) FROM emp );
SELECT *
FROM emp
WHERE sal IN ( SELECT sal FROM emp WHERE deptno = 30);

/*
# like 연산자를 이용한 조건 검색
1. 컬럼에 저장된 문자열 중에서 like 연산자에서 지정한 문자 패턴과 부분적으로 일치하면
참이 되어 조건문에서 검색되게 하는 것을 말한다.
	ex) 사원명이 'A'라는 문자열을 포함하면 조회되게 처리..
	1) 위치 상관없이 검색 : 검색컬럼 like '%A%'
	2) A시작하여 검색 : 검색컬럼 like 'A%'
	3) N로 끝나는 검색 : 검색 컬럼 like '%K'
	4) 자릿수 위치에 맞는 데이터 검색 세번째자리에 A나오는 데이터 검색 : 검색컬럼명 like '__A%'
*/
SELECT empno, ename FROM emp WHERE ename LIKE '%A%';
SELECT empno, ename FROM emp WHERE ename LIKE 'A%';
SELECT empno, ename FROM emp WHERE ename LIKE '%N';
SELECT empno, ename FROM emp WHERE ename LIKE '__A%';

-- ex1) job컬럼에 MAN이라는 글자가 포함되어 있으면 출력하세요..
SELECT * FROM emp WHERE job LIKE '%MAN%';
-- ex2) ename에서 A로 시작하는 글자와 A를 포함하는 글자가 있는 데이터를 구분해서 sql을 2개 작성하세요.
SELECT * FROM emp WHERE ename LIKE 'A%';
SELECT * FROM emp WHERE ename LIKE '%A%';
-- ex3) ename이나 job의 마지막에서 두번째 글자가 E가 들어 가는 데이터를 조회하세요
SELECT * FROM emp 
WHERE ename LIKE '%E_'
OR job LIKE '%E_';

/*
# 정렬처리
1. SQL 명령문에서 검색된 결과는 테이블에 데이터가 입력된 순서대로 출력
2. 데이터의 출력  순서를 특정 컬럼을 기준으로 오름차순/내림차순으로 정렬하는 경우가
	발생한다.
3. 여러 개의 컬럼에 대해 정렬 순서를 지정해서 처리해야 할 경우가 발생한다.
	- 입사일은 오름차순, 급여 기준으로 내림차순.
4. 기본적인 정렬 방법
	- 문자값을 알파벳순으로 출력되고, 한글은 가나다라 순으로 출력된다.
	- 숫자 값을 가장 작은 값으로 먼저 출력
	- 날짜 과거의 날짜순으로 출력된다.
5. 기본형식
	select *
	from 테이블
	where ..
	order by 컬럼 [ASC/DESC]
 */
-- 사원번호를 역순으로 사원번호와 이름을 조회
SELECT empno, ename FROM emp ORDER BY empno DESC;

-- 입사일을 기준으로 최근 입사한 사람 부터 출력
SELECT ename, hiredate FROM emp ORDER BY hiredate DESC;

-- deptno 기준을 오름차순, job기준 내림차순으로 정렬하여 조회
SELECT ename, deptno, job
FROM emp
ORDER BY deptno ASC, job DESC;

-- ex1) 관리자번호 mgr 기준, 내림 차순으로 정렬하세요.
SELECT ename, mgr FROM emp ORDER BY mgr DESC;

-- ex2) 급여 sal 기준, 오름차순 정렬
SELECT ename, sal FROM emp ORDER BY sal ASC;
SELECT ename, sal FROM emp ORDER BY sal; -- 오름차순을 컬럼명만 지정하면 default로 처리된다.

-- ex3) 부서번호 deptno기준 내림차순, sal기준 오름차순으로 정렬처리하세요
SELECT ename, deptno, sal FROM emp ORDER BY deptno DESC, sal ASC;

