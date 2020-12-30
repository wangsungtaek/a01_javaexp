
/*
1. 숫자형 함수의 종류와 기능상 특징을 기술하세요.
	1) round : 반올림 기능
		ex) round(123.9833, 2) ==> 123.98
	2) trunc : 지정한 소숫점 자리만 남기고 모두 절삭
		ex) trunc(441.434, 1) ==> 441.4
	3) mod : 나머지를 구한다.
		ex) mod(10,3) ==> 1
	4) ceil : 올림 정수
		ex) ceil(34,69) ==> 35
	5) floor : 내림 정ㅇ수
		ex) floor(34.69 ==> 34
*/
/*
2. 부서 번호를 %로 해서, 10 ==> 10%, 20==>20%..
   보너스를 정하여, sal기준으로 원금+보너스 합산을 출력하되,
   10자리단위로 반올림 처리하여 출력하세요
   사원명, 급여, 보너스(%), 보너스, 총계
 */
SELECT * FROM EMP;
SELECT ENAME AS 사원명,
	   SAL AS 급여,
	   DEPTNO||'%' AS "보너스(%)",
	   SAL*(DEPTNO/100) AS 보너스,
	   round(SAL+(SAL*(DEPTNO/100)),-1) AS 총계
  FROM EMP;

/*
3. 사번이 짝수인 사원의 사번과 이름과 급여를 출력하되, 급여는 100자리 수로 절삭하여 처리하세요.
 */
SELECT ENAME AS 사원명,
	   EMPNO AS 사번,
	   SAL AS 급여,
	   trunc(SAL, -2) AS "급여(절삭)"
  FROM EMP
 WHERE MOD(EMPNO, 2) = 0;

/*
4. floor와 trunc의 차이점을 기본 예제로 설명하세요.
 	floor() : 정수로 절삭(소숫점이하는 절삭)
 	trunc() : 지정한 자리수만큼 확보하여 절삭
 **/
SELECT floor(3415.88) AS floor, -- floor는 가장 가까운 정수를 반환한다.
	   trunc(3415.88,1) AS trunc -- 소수점1자리까지 표현하고 나머지 절삭
  FROM DUAL;

/*
5. 날짜형 데이터에 증감단위를 일, 월, 년을 정할 때, 사용되는 연산자와 함수 또는 연산자+함수 조합으로
    처리되는 내용을 예제로 기술하세요.
    
    날짜형 데이터 + 1 : 일단위 증가, add_months(날짜데이터, 1) : 한달 증가,
    add_months(날짜데이터, 월*12) : 연단위 증가.
 */
SELECT ENAME AS 이름,
	   HIREDATE AS 입사일,
	   HIREDATE+1 AS "입사후 1알후",
	   add_months(HIREDATE, 1) AS "입사후 한달",
	   add_months(HIREDATE, 12) AS "입사후 일년",
	   add_months(HIREDATE, 12*10) AS "입사후 10년"
  FROM EMP;

/*
6. 사원, 이름과 입사후 300일 날짜, 지금까지 근무연한(일년 - 365 기준)를 출력
 */
SELECT ENAME AS 이름,
	   HIREDATE AS 입사일,
	   HIREDATE+300 AS "입사후 300일",
	   floor(months_between(sysdate, HIREDATE)/12)||'년' AS 근무연한
  FROM EMP;
 
/*
7. 오늘을 1일로, 1000일 후 개월수, 10000 후 년수를 출력하세요.
 */
SELECT sysdate AS "오늘",
	   substr(sysdate+1000, 4, 2) AS "개월",
	   substr(sysdate+10000, 1, 2) AS "년",
	   floor(MONTHS_BETWEEN(sysdate+1000, sysdate))||'개월' AS "1000일 후 개월",
	   floor(MONTHS_BETWEEN(sysdate+10000, sysdate)/12)||'년' AS "1000일 후 년"
  FROM DUAL;