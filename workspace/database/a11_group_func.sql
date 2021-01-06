/*
# 그룹함수란?
1. 테이블의 전체 행을 하나 이상의 컬럼을 기준으로 그룹화하여 그룹별로 결과를 출력하는 함수
	그룹함수는 통계적인 결과를 출력하는데 자주 사용
2. 기본형식
	SELECT 컬럼명, 그룹함수()
	FROM 테이블명
	WHERE 조건문
	GROUP BY 그룹할컬럼
	HAVING 그룹함수의 조건
3. 그룹함수의 종류
	count() : 행의 갯수
	max, min, sum, avg
	stddev(표준편차), variance(분산) - 데이터 분포의 밀집도
	grouping : 해당 컬럼이 그룹에 사용 여부(1/0)
	grouping sets : 한 번의 질의로 여러 그룹화 기능.
*/
-- ex) 부서별 인원수
SELECT DEPTNO, COUNT(*) AS 인원
  FROM EMP
GROUP BY DEPTNO
ORDER BY DEPTNO;

-- ex1) job별 인원 수 출력
SELECT JOB, COUNT(*) AS 인원
 FROM EMP
GROUP BY JOB
ORDER BY JOB;

-- ex) 입사 분기별로 인원수를 출력
SELECT TO_CHAR(HIREDATE, 'Q') AS 분기,
	   COUNT(*) AS 인원
  FROM EMP
GROUP BY TO_CHAR(HIREDATE, 'Q')
ORDER BY TO_CHAR(HIREDATE, 'Q');
 
/*
# avg(컬럼) : 평균값
  sum(컬럼) : 합산값
  min(컬럼) : 최소값
  max(컬럼) : 최대값
  stddev(컬럼명) : 표준편차
  variance(컬럼명) : 분산
*/
SELECT DEPTNO, AVG(SAL) AS 평균, SUM(SAL) AS 종합,
	   MIN(SAL) AS 최소연봉,
	   MAX(SAL) AS 최대연봉,
	   STDDEV(SAL) AS 표준편차,
	   VARIANCE(SAL) AS 분산
  FROM EMP
GROUP BY DEPTNO
ORDER BY DEPTNO;

-- ex1) 부서별로 가장 최근에 입사한 사람의 입사일과 입사일이 가장 오래된 입사일을 출력하세요
SELECT DEPTNO,
	   MAX(HIREDATE) AS "가장 최근 입사일",
	   MIN(HIREDATE) AS "가장 오래된 입사일"
  FROM EMP
GROUP BY DEPTNO
ORDER BY DEPTNO;

-- cf) 부서별로 가장 최근에 입사한 사람의 이름, 입사일, 부서번호를 출력하세요
SELECT ENAME, HIREDATE, DEPTNO 
  FROM EMP
 WHERE (DEPTNO, HIREDATE) 
 		in(
 		SELECT DEPTNO, MAX(HIREDATE)
 		FROM EMP
 		GROUP BY DEPTNO)
 ORDER BY DEPTNO;
/*
#rollup
1. group by절과 같이 사용되며, group by절에 의해서 그룹 지어진 집합 결과에 대해서
	좀 더 상세한 정보를 반환하는 기능을 수행한다.
2. 그룹데이터와 데이터의 총계를 구할 수 있다.
*/
-- job별로 급여 합계
SELECT JOB, SUM(SAL)
  FROM EMP
GROUP BY JOB;

-- 급여 합계의 총계를 다시 구할 때.
SELECT JOB, SUM(SAL)
  FROM EMP
GROUP BY ROLLUP(JOB);

-- 부서와 직책별로 급여와 데이터 건수
-- 그룹할 컬럼이 2개일 때, group by에 컬럼명1, 컬럼명2
SELECT DEPTNO, JOB, SUM(SAL) AS 합계,
	   COUNT(*) AS 데이터건수
  FROM EMP
GROUP BY DEPTNO, JOB
ORDER BY DEPTNO, JOB;
-- 각각의 상위 항목별 통계치와 전체 통계치를 처리할때 rollup을 활용한다.
SELECT DEPTNO, JOB, SUM(SAL) AS 합계,
	   COUNT(*) AS 데이터건수
  FROM EMP
GROUP BY ROLLUP(DEPTNO, JOB)
ORDER BY DEPTNO, JOB;

/*
# cube : rollup에서 전체데이터 summary기능을 포함할 때, 활용된다.
 */
SELECT DEPTNO, JOB, SUM(SAL) AS 합계,
	   COUNT(*) AS 데이터건수
  FROM EMP
GROUP BY CUBE(DEPTNO, JOB)
ORDER BY DEPTNO, JOB;