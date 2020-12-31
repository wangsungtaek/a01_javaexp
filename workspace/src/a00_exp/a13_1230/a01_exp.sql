/*
--[하]1. nvl2, nullif의 기본형식을 예제를 통해 기술하세요
	nvl2(데이터, null이아닐때, null일때)
	nullif(매개변수1, 매개변수2) : 두 매개변수가 같으면 null을 반환하고
	그렇지 않으면 매개변수1을 반환한다.
**/
-- nvl2 예제
SELECT ENAME AS 이름,
	   SAL AS 월급,
	   COMM AS 보너스,
	   nvl2(COMM,COMM,100) AS 보너스1 -- null이면, 100
  FROM EMP;

SELECT nullif('a','b') AS "nullif1",
	   nullif('a','a') AS "nullif2"
  FROM DUAL;
 
--[중]2. deptno가 30이면 보너스는 100%, 그외에는 deptno로 보너스를 처리하고자 한다.
--      이름, 부서번호, 보너스(%), 보너스 를 출력하세요
SELECT ENAME AS 이름,
	   DEPTNO AS 부서번호,
	   SAL AS 월급,
	   nvl2(nullif(DEPTNO,30), DEPTNO, 100)||'%' AS "보너스%",
	   SAL*(nvl2(nullif(DEPTNO,30), DEPTNO, 100)/100) AS 보너스
  FROM EMP;

/*
 --[하]3. decode함수의 기본형식을 예제를 통해 기술하세요.
	decode(데이터, case1, case1일때 처리할 데이터,
					case2, cas2일때 처리할 데이터,
					case3, case3일때 처리할 데이터,
		 case에 해당하지 않을때 처리할 데이터
*/
SELECT DECODE(to_char(HIREDATE,'YYYY'), '1980', '1980년입사',
										'1981', '1980년입사',
									 	'그외입사') AS 입사일
  FROM EMP;
 
--[중]4. hiredate기준  상반기(1~6), 하반기(7~12) 하여 sal 기준으로 보너스를 100%, 200%
--      처리하고자 한다. 중첩함수 이용해서 출력하세요
--      사원명, 상/하반기구분(보너스%), 급여, 보너스 
SELECT ENAME AS 이름,
	   HIREDATE AS 입사일,
	   decode((to_number(to_char(HIREDATE, 'MM'))), 1, '100%',
	   												2, '100%',
	   												3, '100%',
	   												4, '100%',
	   												5, '100%',
	   												6, '100%',
	   												'200%') AS "보너스(%)",
	   SAL AS 급여
  FROM EMP;

 --[하]5. sal를 기준으로 5000이상 A등급, 4000이상 B등급, 3000이상 C등급, 2000이상 D등급, 
--      1000이상 E등급, 1000미만 F등급으로 급여등급표기하세요
--      사원명, 급여, 등급
SELECT ENAME AS 사원명,
	   SAL AS 급여,
  FROM EMP;
