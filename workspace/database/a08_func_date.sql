/*
# 날짜 함수
1. 날짜형 데이터 타입에 사용하는 함수
2. 기본연산
	1) 날짜 +(-) 숫자 : 해당 일자의 일수를 가산(감산)하여 처리.
	2) 날짜 +/- 1/24 : 시간단위 연산 처리.
	1일이 24시간이기 때문에 5시간 이후인 경우, 날짜 + 5/24로 처리한다.
cf) sysdate 현재날짜시간을 나타낸다.
 */

-- sysdate 예제1
SELECT sysdate AS "현재날짜와 시간",
	   sysdate+1 AS "내일 현재시간",
	   sysdate-1 AS "어제 현재시간",
	   sysdate+(8/24) AS "현재시간에서8"
  FROM DUAL;

-- ex) 사원명과, 입사일, 입사 120일후 인턴기간, 입사 8시간 전
-- 		근무일수
SELECT ENAME AS 사원명,
	   HIREDATE AS 입사일,
	   HIREDATE+120 AS "인턴만료일",
	   HIREDATE-(8/24) AS "8시간 전",
	   sysdate-HIREDATE AS "근무일1",
	   floor(sysdate-HIREDATE) AS "근무일2"
  FROM EMP; 
-- 소수점 이하로 시간이 나오기 때문에, 나머지 시간을 절삭을 처리

/*
# 날짜 함수
1. sysdate : 오라클 서버시스템의 현재 날짜와 시간
2. moths_between(날짜데이터1, 날짜데이터2) : 날짜와 날짜 사이의 개월을 계산
	1개월 = 1, 15일 = 0.5로 기준하여 날짜/시간/분/초 등을 소수점으로 계산이된다.
 * 
 */
SELECT ENAME,
	   HIREDATE,
	   sysdate,
	   months_between(sysdate, hiredate) AS 근무개월,
	   floor(months_between(sysdate, hiredate)) AS 근무개월,
	   floor(months_between(sysdate, hiredate)/12) AS 근무연한
  FROM EMP;
 
-- ex1) dual테이블로 오늘을 1일로 해서, 만난 지 100, 1000후 날짜와 10년 후 날짜를 출력
SELECT sysdate AS 오늘,g
	   sysdate+100 AS "100일",
	   sysdate+1000 AS "1000일"
  FROM DUAL;

-- ex2) emp테이블에서 근무개월이 470~480사이 데이터를 출력하세요.
SELECT *
  FROM EMP
 WHERE floor(months_between(sysdate, hiredate)) BETWEEN 470 AND 480;
-- 함수를 이용해서 조건문에 데이터 조회할 때 활용된다.

/*
3. add_months(날짜데이터, 추가개월) : 날짜에 개월을 더한 날짜 계산
*/	   
SELECT sysdate, add_months(sysdate, 3) AS "3개월 후"
  FROM DUAL;
 
-- ex) 사원번호는 부서별 업무파악을 난이도에 따라 3개로 분류한다. 바로 파악되는 0,
-- 		1개월 1, 2개월 2로 사원번호에 나머지값으로 처리하였다.
--		입사해서 업무파악 만료일을 출력하세요
-- 		(회사에서 사원번호의 마지막 자리를 업무난이도에 따라서 분류하여 만든 경우를 말한다.
--		3으로 나누었을 때 0이면 1개월미만으로 업무파악되는 난이도, 1이면 1개월정도,
--		사원번호, 사원명, 업무파악난이도, 입사일, 업무파악만료일 로 출력해보세요.

SELECT EMPNO, ENAME, mod(EMPNO, 3), HIREDATE,
	   add_months(hiredate, mod(empNO, 3)) "업무파악만료일"
  FROM EMP;






