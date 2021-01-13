/*
--[하] 1. case문의 기본 형식을 기술하세요.
	1) 조건문 형태 활용
	CASE when 논리|산술|관계 than 처리할 데이터
		 when 논리|산술|관계 than 처리할 데이터
		 else 기타 처리할 데이터
	END
	
	2) switch case 문 형태
	CASE [컬럼명]
		when 데이터1 than 처리할 데이터
		when 데이터1 than 처리할 데이터
		else 그외 데이터
	end
*/
SELECT ENAME,
  CASE WHEN DEPTNO = 30 THEN SAL*0.5
	   ELSE SAL*0.2
   END show
  FROM EMP;
 
--[하] 2. job에 따른 인턴기간을 다르게 설정하였다고 한다.
--		ANALYST 5, CLERK 1, MANAER 4, PRESIDENT 6, SALESMAN 2 개월
-- 		사원별 인턴기간의 만료일을 입사일과 인턴기간의 만료일을 설정하세요.
SELECT ENAME AS 이름,
	   JOB AS 직업,
	   HIREDATE AS 입사일,
  CASE JOB 
	WHEN 'CLERK' THEN ADD_MONTHS(HIREDATE, 1)
  	WHEN 'SALESMAN' THEN ADD_MONTHS(HIREDATE, 2)
  	WHEN 'MANAGER' THEN ADD_MONTHS(HIREDATE, 4)
  	WHEN 'ANALYST' THEN ADD_MONTHS(HIREDATE, 5)
  	WHEN 'PRESIDENT' THEN ADD_MONTHS(HIREDATE, 6)
   END AS 인턴만료일
  FROM EMP;

/*
[풀이]
1단계
JOB에 대한 인턴 개월 수 처리,
	CASE JOB
  		WHEN 'ANALYST' THEN 5
  		WHEN 'CLERK' THEN 1
  		WHEN 'MANAGER' THEN 4
  		WHEN 'PRESIDENT' THEN 6
  		WHEN 'SALESMAN' THEN 2
  		ELSE 0
  		END AS 개월
2단계
	add_months(컬럼명, 추가할월);
	입사일과 위 case문에 의해 계산된 결과 데이터 추가월에 입력하여
	인턴마지막일을 계산한다.
*/

SELECT ENAME, JOB, HIREDATE,
  CASE JOB
  	WHEN 'ANALYST' THEN 5
  	WHEN 'CLERK' THEN 1
  	WHEN 'MANAGER' THEN 4
  	WHEN 'PRESIDENT' THEN 6
  	WHEN 'SALESMAN' THEN 2
  	ELSE 0
  	END AS 개월,
  ADD_MONTHS(HIREDATE,   CASE JOB
						  	WHEN 'ANALYST' THEN 5
						  	WHEN 'CLERK' THEN 1
						  	WHEN 'MANAGER' THEN 4
						  	WHEN 'PRESIDENT' THEN 6
						  	WHEN 'SALESMAN' THEN 2
						  	ELSE 0
						  	END ) AS 인턴만료일
 FROM EMP;
  	
SELECT * FROM EMP;
--[중] 3. sal등급을 만들고 0~999,1000~1999,.... 등급별 인원수를 group 함수를 통해 처리하세요.
SELECT
  CASE FLOOR(SAL/1000)
  	WHEN 0 THEN 'F등급'
  	WHEN 1 THEN 'E등급'
  	WHEN 2 THEN 'D등급'
  	WHEN 3 THEN 'C등급'
  	WHEN 4 THEN 'B등급'
  	ELSE 'A등급'
  END AS 등급,
  COUNT(*) AS 인원수
  FROM EMP
GROUP BY FLOOR(SAL/1000)
ORDER BY FLOOR(SAL/1000) DESC;

-- 풀이
-- FLOOR(SAL/1000) SAL가 0~999일때는 0.0~0.999... ==> FLOOR함수 0
-- FLOOR(SAL/1000) SAL가 1000~1999일때는 1.0~1.999... ==> FLOOR함수 1
-- ..
-- FLOOR(SAL/1000) SAL가 5000~5999일때는 5.0~5.999... ==> FLOOR함수 5
-- DECODE(데이터, 경우1, 결과1, 경우2, 결과2 ...  그외결과);
SELECT DECODE(FLOOR(SAL/1000), 5, 'A', 4, 'B', 3, 'C', 2, 'D', 1, 'E', 'F') AS 등급,
	   COUNT(*) AS 인원수
  FROM EMP
GROUP BY FLOOR(SAL/1000)
ORDER BY FLOOR(SAL/1000) DESC;