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
 