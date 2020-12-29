/*
# 숫자형 처리함수
1. 숫자형 데이터를 원하는 형태로 수학적 처리나 연산을 처리해주는 함수를 말한다.
2. 종류
	1) round : 지정한 소숫점 자리로 반올림 처리를 해준다.
		round(데이터, 자릿수)
		자릿수 : +값은 소수점 이하 자리수를 말한다.
			ex) round(45.2432, 2) ==> 45.24
				-값은 소수점 기준을 10, 100, 1000 단위로 처리해 주는 것을 말한다.
					10단위 이상의 자릿수 반올림 처리.
				round(2456435, -3) ==> 2456000
	
	2) trunc : 지정한 소수점 자리까지 남기고 절삭처리
		trunc(데이터, 자릿수) cf) floor() : 정사로 절삭
*/
-- round 예제1
SELECT ROUND(222452.7552, 2) AS round_1,
	   ROUND(222452.7552) AS round_2,
	   ROUND(222452.7552, -3) AS round_3
  FROM DUAL;

-- ex1) sal의 15% 인상 금액을 100자리 단위와 소숫점 1자리 단위로 출력하세요.
SELECT SAL,
	   (SAL*0.15) AS "15%",
	   (SAL*0.15)+SAL AS "result_1",
	   ROUND((SAL*0.15)+SAL, -2) AS "인상금액형식1",
	   ROUND((SAL*0.15)+SAL, 1) AS "인상금액형식2"
  FROM EMP;

-- trunc 예제1
SELECT TRUNC(5734.24599, 2),
	   TRUNC(5734.24598),
	   TRUNC(5734.24599, -2)
  FROM DUAL;
 
-- ex1) 급여를 부서번호 기준으로 %로 올해 인상급여를 지정한다고 할때,
-- 		100자리 단위 절삭과 소숫점 2자리 절삭을 사원명과 함께 출력하세요.
SELECT SAL AS 급여,
	   DEPTNO AS 부서번호,
	   ENAME AS 이름,
	   (SAL*(DEPTNO/100)) AS "인상분",
	   TRUNC(SAL*(DEPTNO/100), -2) AS "형식1",
	   TRUNC(SAL*(DEPTNO/100), 2) AS "형식2",
	   TRUNC((SAL + SAL*(DEPTNO/100)), 2) AS "총계"
  FROM EMP;

/*
	3) mod : 데이터베이스에서 산술연산자 %대신 쓰이는 나머지 처리 함수를 말한다.
		mod(데이터, m) : 데이터를 m으로 나눈 나머지값
		ex) mod(10, 3) ==> 1
 */
SELECT mod(10, 3) AS 예제1,
	   mod(10, 2) AS 예제2
  FROM DUAL;

-- 사번이 짝수인 데이터를 출력하세요
SELECT e.*, mod(empno, 2)
  FROM EMP e
 WHERE mod(empno, 2) = 0;

/*
	4) ceil : 지정한 값보다 큰 수 중에서 가장 작은 정수
		소수점이하의 내용에 대하여 올림 정수.
	5) floor : 지정한 값보다 작은 수 중에서 가장 큰 정수
		소수점이하의 내용에 대하여 내림 정수.
  */

-- ceil, floor 예제1
SELECT ceil(25.75) AS "올림 정수",
	   floor(25.75) AS "내림 정수"
  FROM DUAL;

-- ex) 사원 중에서 홀수 번호가 sal와 comm의 합산한 금액에 5% 향상된 최종 금액을 내년 급여로
--		선정하였다고 한다.
--		소수점이하 올림금액, 내린 금액을 출력하세요 해당 데이터를 list하세요
SELECT ENAME AS 이름,
	   SAL AS 월급,
	   COMM AS 보너스,
	   (SAL+nvl(COMM,0))*0.05 AS 향상금액,
	   ceil((SAL+nvl(COMM,0))*0.05) AS 올림금액,
	   floor((SAL+nvl(COMM,0))*0.05) AS 내린금액
  FROM EMP;
 WHERE mod(EMPNO, 2) != 0; 