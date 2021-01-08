/*
# 서브 쿼리
1. 하나의 sql명령문의 결과를 이를 포함하고 있는 상위 sql명령문에 전달하기 위해
두 개 이상의 sql명령문에 상위 sql명령문과 연결하여 처리하는 방법을 말한다.
*/
-- 사원명 ALLEN의 직책과 같은 사원의 정보를 출력하세요.
SELECT *
  FROM EMP
 WHERE JOB = (
	SELECT JOB
	  FROM EMP
	 WHERE ENAME = 'ALLEN');
	 
-- EX1) SMITH와 같은 부서번호를 가진 사원정보를 출력하세요.
SELECT *
  FROM EMP
 WHERE DEPTNO = (
	SELECT DEPTNO
	  FROM EMP
	 WHERE ENAME = 'SMITH');
	
-- EX2) MARTIN의 급여보다 같거나 작은 사원정보를 출력하세요.
SELECT *
  FROM EMP
 WHERE SAL <= (
	SELECT SAL
	  FROM EMP
	 WHERE ENAME = 'MARTIN');
	 
/*
# 단일행 서브쿼리
1. 단 하나의 행만을 검색하여 메인쿼리에 반환하는 질의문을 말한다.
2. 비교 연산자 : =, >=, >, <=, <, <>
*/
-- DEPTNO가 10인 사원의 평균 급여 보다 많은 사원을 출력하세요.
SELECT *
  FROM EMP
 WHERE SAL > (
	SELECT AVG(SAL)	
	  FROM EMP
	 WHERE DEPTNO = 10);
	 
-- ex) SALESMAN 중에서 가장 많은 급여보다 많이 받는 사원을 출력하세요.
SELECT *
  FROM EMP
 WHERE SAL > (
	SELECT MAX(SAL)
	  FROM EMP
	 WHERE JOB = 'SALESMAN');
	 
/*
# 다중행 서브쿼리
1. 서브쿼리에서 실행한 결과값이 1행이상일 때, 사용하는 쿼리.
2. 사용되는 연산자
	in : 결과값이 or 조건으로 처리해야할 필요가 있는 경우 활용된다.
	any, some : 결과값이 1개라도 있는 경우 min(조회데이터)과 동일
	all : 모든 결과값이 일치하는 경우 max(조회데이터)과 동일
	exist, not exist : 해당 sub query값 존재하는 경우, 존재하지 않는 경우.
*/
-- JOB이 SALESMAN인 모든 사원번호에 해당하는 데이터를 조회하세요.
SELECT *
  FROM EMP
 WHERE EMPNO IN(SELECT EMPNO
				  FROM EMP
				 WHERE JOB='SALESMAN');

-- ex) BLAKE를 관리자로 하는 사원을 조회하세요(SUB_QUERY 활용)
SELECT *
  FROM EMP
 WHERE MGR IN(SELECT E1.MGR
 				FROM EMP E1, EMP E2
			   WHERE E1.MGR = E2.EMPNO
				 AND E2.ENAME = 'BLAKE');
-- 풀이
SELECT *
  FROM EMP
 WHERE MGR IN(SELECT EMPNO
			    FROM EMP
			   WHERE ENAME='BLAKE');
			  
-- # any, some : 하나라도 일치하면 참이 되는 연산자.
-- 부서번호가 10인 사원의 급여 중 하나라도 보다 많으며 처리.
SELECT ENAME, SAL
  FROM EMP
 WHERE SAL > ANY(SELECT SAL
				   FROM EMP
				  WHERE DEPTNO = 10)
ORDER BY SAL;

SELECT ENAME, SAL
  FROM EMP
 WHERE SAL > (SELECT MIN(SAL)
				FROM EMP
			   WHERE DEPTNO = 10)
ORDER BY SAL;

-- # all은 모두다 일치하면 참이 되는 연산자.
SELECT *
  FROM EMP
 WHERE SAL > ALL(SELECT SAL
				   FROM EMP
				  WHERE DEPTNO = 20);
SELECT *
  FROM EMP
 WHERE SAL > (SELECT MAX(SAL)
			    FROM EMP
			   WHERE DEPTNO = 20);

/*
# exists연산자
1. 서버쿼리의 결과값이 있는지 여부를 확인해서 메인쿼리를 실행해준다.
*/
SELECT *
  FROM EMP
 WHERE COMM IS NOT NULL;

-- SUBQUER 데이터 있을 때
SELECT *
  FROM EMP
 WHERE EXISTS(SELECT *
 				FROM EMP
			   WHERE COMM IS NOT NULL);
		
-- SUBQUERY 데이터가 없을 때.			  
SELECT *
  FROM EMP
 WHERE EXISTS(SELECT *
 				FROM EMP
			   WHERE DEPTNO = 40);	
			  