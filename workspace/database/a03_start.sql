/*
# sql문 명령문 기초..
1. SELECT 명령문
	- 테이블에 저장된 데이터를 검색하기 위한 명령문
	- SELECT명령문에서 SELECT절과 FROM절은 필수절.
2. 사용법
	SELECT * | 컬럼리스트
	FROM 테이블명;
**/
/*
 여러줄 주석 
**/
SELECT * -- 한줄 주석 * : 전체 컬럼..
FROM emp; -- ctrl + enter로 마지막 명령
-- emp테이블 초기에 선언 컬럼이 순서대로 출력을 한다.
SELECT empno, job, sal, deptno -- select 컬럼명1, 컬럼명2, 선택
FROM emp;

-- ex1) dept 테이블의 전체 컬럼 내용을 출력하세요...
SELECT *
FROM dept;
-- ex2) emp 테이블의 empno, sal, ename을 출력하세요.
SELECT empno, sal, ename FROM emp;
/*
3. 컬럼명 별칭처리하기..
select 컬럼명 as 별칭명, 컬럼명 별칭명
	1) 기본 테이블에서 지정한 컬럼명이외에 다른 이름으로 컬럼명을 위 형식으로 처리하면,
 		출력할 수 있다.
 	2) 컬럼명 안에 공백이나 특수문자(#,@)를 활용할 때는 "별칭" 형식으로 쌍따옴표
 		사이에 별칭을 지정하면 된다.
**/
SELECT empno, empno AS NO, ename, ename name
FROM emp;
SELECT empno "번 호", ename "# 이 름 #", deptno "@부서 번호@"
FROM emp;
-- ex) 사원테이블에 사원번호(empno), 사원명(ename), 관리자번호(mgr),
--		급 여(sal)로 별칭을 데이터를 표현하세요.
SELECT empno "사원 번호", ename "사 원 명", mgr "관리자 번호", sal "급   여"
FROM emp;
-- 연결이 끊기시는 부분 : 상단에 선택해서 연결 처리하시고, sql 처리 하면 됩니다.
/*
# 데이터의 컬럼간의 문자열 연결과 산술연산 처리..
1. 문자열형 컬럼은 문자열컬럼1 || 문자열컬럼2 형식으로 연결하면, 해당 컬럼에
	있는 데이터가 연결되어 출력된다.
	연결된 내용은 하나의 컬럼으로 선언하여 출력이 가능하다.
2. 숫자형 데이터로 문자열과 함께 ||를 활용하면, 문자열로 전환된 데이터를 확인할 수 있다.
3. 숫자형 데이터는 컬럼끼리, 또는 추가 데이터를 통해 연산이 가능하다.
***/
SELECT ename, job, ename ||'-'|| job "연결 문자"
FROM emp;
SELECT empno ||'('||ename||')' "사원번호(사원명)", job
FROM emp;
SELECT * FROM  emp;
SELECT ename "사원명", sal "급여", sal*0.1 "급여의 10%", sal/13 "연봉의 1/13"
FROM emp;
SELECT ename||'의 사원번호는 '||empno||'이고, 10%인상된 급여는 '
	||(sal+(sal*0.1))||'만원 이다' "급여 정보"
FROM emp;
-- ex1) ename(empno)의 월급여는 sal/13 입니다. 를 한문장으로 출력하세요.
--		round() : 소숫점이하 절삭 (함수시 진행)
SELECT ename||'('||empno||')의 월급여는 '||round(sal/13)||'만원 입니다.' show
FROM emp;
-- ex2) ename님의 이달 보너스는 sal 의 deptno % 기준으로 sal*(depto/100) 만원이다.
SELECT ename||'님의 이달 보너스는 연봉 '||sal||'만원의 '||deptno||'% 기준으로 '
	||(sal*(deptno/100))||' 만원이다.' show
FROM emp;
/*
# SQL 명령문의 표준 형식..
1. sql 명령문
	select distinct { /컬럼명} distinct 중복된 데이터 배제 처리..
	from 테이블명
	where 조건 : 특정 컬럼의 조건
	group by 그룹함수를 활용할 때, 그룹핑할 컬럼.
	order by 정렬할 컬럼.
**/
SELECT DISTINCT deptno
FROM emp;
SELECT *
FROM emp
WHERE sal>=3000;
SELECT deptno, sal
FROM emp
ORDER BY deptno; --정렬
-- 각 deptno를 데이터별로 그룹지어 최고의 sal를 출력.
SELECT  deptno, max(sal) 최고, min(sal) 최저, round(avg(sal)) 평균
FROM emp
GROUP BY deptno;
-- ex1) emp테이블 mgr을 중복을 배제하고 출력하세요.
SELECT DISTINCT mgr
FROM emp;
-- ex2) emp테이블 deptno가 10인 데이터를 출력하세요.
SELECT *
FROM emp
WHERE deptno=10; -- database 에서는 =, >=, <, >, !=
-- ex3) emp테이블 job별 최고 연봉(sal)을 출력하세요.
SELECT job, max(sal) "최고연봉"
FROM emp
GROUP BY job;
-- ex4) emp테이블 sal별로 정렬하여 출력하세요.
SELECT *
FROM emp
ORDER BY sal;
/*
# where
1. 테이블에 저장된 데이터 중에서 원하는 데이터만 선택적으로 검색하는 기능을
처리할 때, 사용된다.
*/
	SELECT * FROM emp e2;
	WHERE deptno = 10;
/*
2. where 절의 조건문은 컬럼 이름, 연산자, 상수, 산술 표현식을 결합하여
다양한 형태로 표현 한다.
3. where 절에서 사용되는 데이터 타입은 문자, 숫자 날짜 타입이 있다.
4. 문자와 날짜 타입의 상수 값을 작은 따옴표(')로 묶어서 표현하고 숫자는
그대로 사용한다.
*/
	SELECT * FROM emp
	WHERE job = 'SALESMAN';
/*
5. 상수 값에서 영문자는 대소문자를 구별한다.
	컬럼명과 테이블명, 명령문은 대소문자를 구별하지 않으나 데이터는 대소문자를 구분한다.
*/
	select * from emp
	WHERE job = 'SALESMAN';
/*
6. 논리 연산자
	조건1 (논리연산자) 조건2
	and, or, not
*/
	SELECT *
	FROM emp
	WHERE deptno = 10
	AND sal >= 3000; -- 조건1 and 조건2
	SELECT empno, ename, sal
	FROM emp
	WHERE deptno = 10
	OR sal >= 3000; -- 조건1 or 조건2
	
-- ex1) job이 'SALESMAN'인 데이터를 출력하되, 칼럼은 ENAME, JOB, SAL를 선택하세요.
	SELECT ename, job, sal
	FROM emp
	WHERE job = 'SALESMAN';
-- ex2) 부서번호(deptno)가 20이고, sal가 4000미만인 데이터를 출력하세요.
	SELECT *
	FROM emp
	WHERE deptno = 20
	AND sal < 4000;
-- ex3) 연봉(sal) 이 2000에서 3000사이 이거나, 직책(job)이 'SALESMAN'인 사원의 사원번호(EMPNO),
--		사원명(ENAME), 직책(JOB), 연봉(SAL)을 출력하세요
	SELECT empno, ename, job, sal
	FROM emp
	WHERE ( sal >= 2000 AND sal <= 3000 )
	OR job = 'SALESMAN';

-- not 연산자 처리..
-- 부서번호가 10이 아닌 경우 처리.
SELECT * FROM emp
WHERE deptno != 10;

-- 컬럼명 between A and B == 컬럼명 >= A and 컬럼명 <= B
-- sal가 1000에서 2000사이인 데이터 출력..
SELECT * FROM emp
WHERE sal BETWEEN 1000 AND 2000;

-- # null 데이터 처리
-- 데이터가 할당되지 않는 경우를 의미한다.
-- 컬럼명 is null : 해당 컬럼에 데이터가 할당되지 않는 경우.
-- 컬럼명 is not null : 해당 컬럼에 데이터가 할당된 경우.
SELECT sal, comm
FROM emp
WHERE comm IS NULL; -- comm = null (버그로 정상적인 데이터를 가져오지 못 한다)
SELECT sal, comm 
FROM emp
WHERE comm IS not NULL;
SELECT * FROM emp;
SELECT * FROM emp;

-- ex1) job이 CLERK가 아닌 데이터를 출력하세요.
SELECT *
FROM emp
WHERE job != 'CLERK';

-- ex2) between을 이용하여 sal가 2000에서 3000사이 데이터를 출력하세요.
SELECT *
FROM emp
WHERE sal BETWEEN 2000 AND 3000;

-- ex3) comm이 null이 아닌 데이터를 ename과 sal의 comm의 합산한 급여로 출력하세요.
SELECT ename, sal, comm, sal+comm show -- comm이 null이면 합산 처리에 문제가 있다.
FROM emp
-- null 아닌 경우만 호출
SELECT ename, sal, comm, sal+comm 합산
FROM emp
WHERE comm IS NOT NULL;
-- nvl함수 이용 nvl(컬럼, null경우초기데이터)
SELECT ename, sal, comm, sal+nvl(comm,0) 합산
FROM emp;