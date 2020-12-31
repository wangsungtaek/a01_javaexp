/*
# 중첩함수
1. 가장 내부에 있는 함수 f1의 결과값을 다음 함수 f2에 인수로 적용하고,
	다시 f2의 결과값을 f3에 인수로 사용할 때 활용하는 함수형태를 말한다.
	f3(f2(f1(데이터,매개변수),매개변수),매개변수)
	- 특정한 데이터에서 여러가지 함수의 기능을 처리하고자 할 때, 활용된다.
*/
-- 현재데이터의 입사년를 올해연도로 변경하여 출력하려고 한다.
-- 합쳐서 날짜 데이터로 변경처리.

-- 중첩함수 예제
SELECT ENAME AS 이름,
	   to_char(sysdate, 'YYYY') AS 올해년도,
	   to_char(HIREDATE, 'MMDD') AS 사원의입사월일,
	   to_char(sysdate, 'YYYY')||to_char(HIREDATE, 'MMDD') AS 올해입사년월,
	   to_date(to_char(sysdate, 'YYYY')||to_char(HIREDATE, 'MMDD'), 'YYYYMMDD') AS 날짜형데이터
  FROM EMP;
 
-- ex) 입사일, 분기를 추출하여 해당 보너스의 기준으로 설정하려고한다.
--	1) 입사일, 분기, 급여
--	2) 분기 1 ==> 10%, 2 ==> 20%, 3 ==> 30%, 4 ==> 40%
--		to_char(hiredate, 'Q')*10 : 묵시적 형변환으로 일어나는 부분.
--	3) 급여와 연산하여 보너스금액 출력
--	to_char(@@@, 'Q'), 숫자형데이터 to_number()

SELECT ENAME AS 이름,
	   SAL AS 급여,
	   to_char(HIREDATE, 'Q') AS 분기,
	   to_number(to_char(HIREDATE, 'Q')*10)||'%' AS "보너스%",
	   SAL*(to_number(to_char(HIREDATE, 'Q')*10)/100) AS 보너스,
	   SAL+SAL*(to_number(to_char(HIREDATE, 'Q')*10)/100) AS "급여+보너스"
  FROM EMP;

/*
# 일반함수
1. nvl(데이터, null값일때 처리할데이터)
	1) 해당 데이터가 null값일 때, 처리할 데이터를 설정함으로 null에 대한 연산처리시
		필요하다.
*/
-- nvl 사용예제
SELECT ENAME, SAL, COMM, SAL+COMM, nvl(COMM, 0), SAL+nvl(COMM, 0)
  FROM EMP;
 
/*
2, nvl2(데이터, null아닐때 처리할 내용, null일때 처리할 데이터)
*/
-- comm이 null일때는 100으로 설정이 되고, null이 아닐때는 comm에서 10%더 추가해서 결과값을 처리한다.
SELECT ENAME, SAL, COMM, nvl2(COMM, COMM*1.1, 100) AS 보너스
  FROM EMP;
 
-- ex1) comm이 Null일때는 sal의 15%로 설정하고, null이 아닐 때는 comm에서 sal의 5%
--		보너스금액을 설정하여 사원명 연봉 보너스를 출력하세요.
SELECT ENAME, SAL, COMM, nvl2(COMM, COMM+(SAL*0.05), SAL*0.15) AS 보너스
  FROM EMP;
 
/*
3. nullif(데이터1, 데이터2)
1. 두 개의 매개변수로 받는 데이터를 비교하여 동일하면 null을 반환하고, 동일하지 않으면
	첫번째 데이터1을 반환처리하는 함수를 말한다.
*/
SELECT nullif('a','a') AS show1,
	   nullif('a','b') AS show2,
	   nvl(NULLIF('a','a'),'동일') show3,
	   nvl(NULLIF('a','b'),'동일') show4
  FROM DUAL;
  
-- ex) 회사에서 일괄보너스 지급 금액이 60이라고 정하는데, 연봉의 5%와 같으면
-- 		60, 다르면 연봉의 5%로 처리하는 sql을 작성하세요.
SELECT ENAME,
	   SAL AS 연봉,
	   trunc(sal*0.05, -1) AS "연봉의 5%",
	   nullif(trunc(sal*0.05,-1),60) AS "같은지 여부(null)",
	   nvl2(nullif(trunc(sal*0.05,-1),60), sal*0.05, 60) AS 보너스
  FROM EMP;
  
/*
# decode 함수
1. 프로그래밍 언어의 if문이나 case문으로 표현되는 내용을 하나의 함수로 처리할 수 있게 해준다.
2. 기본형식
	decode(데이터, case1, case1일때처리할데이터, 
					case2, case2일때처리할데이터, 
					case3, case3일때처리할데이터, 
	위 내용에 해당하지 않을 때 처리 할데이터)
**/
SELECT ENAME, DEPTNO,
	   decode(DEPTNO,10,'인사과',
	   				 20,'총무',
	   				 30,'회계',
	   		'부서정하지않음') AS 부서명
  FROM EMP;

-- ex) 사원번호를 기준으로 짝수이면, 홀수이면 청팀으로 처리하여 출력하세요.
SELECT ENAME, EMPNO,
	   decode(mod(EMPNO,2),0,'홍팀','청팀') AS 팀
  FROM EMP;