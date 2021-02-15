--[하] 1. 직책별로 급여가 가장 많은 사람과 가장 적은 사람을 출력하세요
SELECT JOB, MAX(SAL), MIN(SAL)
  FROM EMP
GROUP BY JOB
ORDER BY JOB;
---------------------
-- 쿼리1 union all 쿼리2 : 쿼리1과 쿼리2를 순차적으로 출력
SELECT *
  FROM EMP
 WHERE (JOB, SAL) IN (
 	SELECT JOB, MAX(SAL) AS SAL
 	  FROM EMP
 	GROUP BY JOB)
UNION ALL
SELECT *
  FROM EMP
 WHERE (JOB, SAL) IN (
 	SELECT JOB, MIN(SAL) AS SAL
 	  FROM EMP
 	GROUP BY JOB);
 

--[중] 2. 월별로 평균 급여(소수점1자리 반올림)를 출력하세요.
SELECT TO_CHAR(HIREDATE, 'MM') AS 월,
	   ROUND(AVG(SAL), 1) AS 평균급여
  FROM EMP
GROUP BY TO_CHAR(HIREDATE, 'MM')
ORDER BY TO_CHAR(HIREDATE, 'MM');

--[중] 3. 직책별로 근무일수가 가장 오래된 사원의 직책, 이름, 입사일을 출력(직책으로 정렬)하세요
SELECT JOB, ENAME, HIREDATE
  FROM EMP
 WHERE (JOB, HIREDATE) 
 	IN(
 	SELECT JOB, MIN(HIREDATE)
  	FROM EMP
	GROUP BY JOB)
ORDER BY JOB;
-- 해당 데이터가 단일 데이터 일 경우에는 대입연산자 활용 한다.

/*
4. rollup와 cube의 차이점을 기본예제를 통해서 기술하세요.
	1) rollup : 그룹화된 집합 열의 결과를 조금더 상세히 보기위해 사용된다.
	2) cube : rollup 기능 + summary 기능 추가
 * */
-- ROLLUP
SELECT DEPTNO, JOB, COUNT(*)
  FROM EMP
GROUP BY ROLLUP(DEPTNO, JOB);

-- CUBE
SELECT DEPTNO, JOB, COUNT(*)
  FROM EMP
GROUP BY CUBE(DEPTNO, JOB)
ORDER BY DEPTNO, JOB;

/*
5. 조인이란 무엇인가? 개념과 기본형식을 기술하세요.
	두 개 이상의 테이블을 연결하여 하나의 테이블처럼 출력할 때 사용하는 것
*/
SELECT ENAME, JOB, E.DEPTNO, LOC
  FROM EMP E, DEPT D
 WHERE E.DEPTNO = D.DEPTNO;

--[하] 6. 급여가 3000~4000 사이에 있는 부서명과 사원명,급여를 출력하세요.
SELECT DNAME, ENAME, SAL
  FROM EMP E, DEPT D
 WHERE E.DEPTNO = D.DEPTNO
   AND SAL BETWEEN 3000 AND 4000;₩	
  
--[하] 7. 부서위치가 DALLAS인 사원정보를 출력하세요.
SELECT E.*, LOC AS 부서위치
  FROM EMP E, DEPT D
 WHERE E.DEPTNO = D.DEPTNO
   AND LOC = 'DALLAS';
 
/*
8. natural join과 일반 where문에 의한 조인을 차이점을 기술하세요.
기본형식
SELECT *
FROM EMP NATURAL JOIN DEPT;
SELECT *
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO;
두 형식에서 테이블에서 JOIN하는 컬럼명을 지정하는 부분에 있어서, 명시성과 내부적
자동 조인처리에서 차이가 난다.
NATURAL JOIN은 FOREGIN KEY 관계(제약키)에 있으면 자동으로 해당 컬럼을 명시적으로
지정하지 않더라도 JOIN이 된다.
*/
/*
9. non equi join에 대하여 emp, salgrade를 활용하여 설명하세요.
	non equi join : 두 개 이상의 테이블을 조인할때 동일 조건이 아닌, 범위를
		지정할 때 사용한다.
*/
SELECT ENAME, SAL, GRADE
  FROM EMP E, SALGRADE S
 WHERE SAL BETWEEN LOSAL AND HISAL;

/*
10. outer join과 일반 공통 컬럼 join과의 차이점을 기술하세요.
	join은 null 값의 데이터를 배제하지만 outer join은 null 값을 배제하지않는다.
*/