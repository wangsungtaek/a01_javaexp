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
