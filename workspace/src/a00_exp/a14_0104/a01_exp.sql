/*
--[하] 1. case문의 기본 형식을 기술하세요.
	CASE [컬럼명]
		when 논리|산술|관계 than 처리할 데이터,
		when 논리|산술|관계 than 처리할 데이터,
		else 기타 처리할 데이터
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
SELECT * FROM EMP;
--[중] 3. sal등급을 만들고 0~999,1000~1999,.... 등급별 인원수를 group 함수를 통해 처리하세요.
SELECT
  CASE FLOOR(SAL/1000)
  	WHEN 0 THEN '6등급'
  	WHEN 1 THEN '5등급'
  	WHEN 2 THEN '4등급'
  	WHEN 3 THEN '3등급'
  	WHEN 4 THEN '2등급'
  	ELSE '1등급'
  END AS 등급,
  COUNT(*) AS 인원수
  FROM EMP
GROUP BY FLOOR(SAL/1000);
