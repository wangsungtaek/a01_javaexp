SELECT *
FROM emp;
/*
1. 조회의 기본 형식을 기술하고, 예제를 통해서 그 의미를 기술하세요.
	1) SELECT * FROM emp; : emp테이블의 전체 컬럼을 조회한다.
	2) SELECT ename FROM emp; : emp테이블의 ename컬럼을 조회한다.
	3) SELECT ename, job FROM emp; : emp테이블의 ename, job컬럼을 조회한다.
**/
SELECT * FROM emp; -- 전체 컬럼 조회
SELECT ename FROM emp; -- ename 컬럼만 조회
SELECT ename, job FROM emp; -- ename, job 컬럼 조회


/*
2. 컬럼의 별칭사용 형식을 기술하고, 기본 예제를 통해 기술하세요.
	기본 개념
		1) 기본 테이블의 컬럼명을 다른 명칭으로 변경하고자 할때, 컬럼의 별칭을 사용한다.
		2) 컬럼명에 공백이나 특수문자가 있을경우 "" 쌍따움표를 사용하여 "금 액"과 같이 처리한다.
	형식
		1) SELECT [컬럼명] AS [변경할 컬럼명] FROM [테이블이름];
		2) SELECT [컬럼명] [변경할 컬럼명] FROM [테이블이름];
**/
SELECT empno, empno AS no, ename, job -- as를 사용하여 empno -> no로 변경하여 조회
FROM emp; 
SELECT empno, sal AS 급여, ename, job -- as를 사용하여 empno -> no로 변경하여 조회
FROM emp;
SELECT sal AS 급여 FROM emp;
SELECT empno 사원번호, ename 이름 FROM emp;


--3. dbeaver에서 데이터 베이스서버에 연결하는 핵심 정보를 기술하세요.


--4. @@님의 사원번호는 @@이고, 올해 연말보너스는 연봉의 20%인 @@원입니다.
SELECT ename||'님의 사원번호는 '||empno||'이고, 올해 연말보너스는 연봉의 20%인 '
	||(sal*(20/100))||'원 입니다.'
FROM emp;

/*
5. sql문의 기본형식을 기술하고, 각 기본 형식에서 활용되는 keyword를 예제별로 기술하세요.
	1) SELECT : 테이블에 저장된 데이터를 조회하기 위한 명령문
	2) FROM : SELECT문과 함께 쓰이며, 조회할 테이블을 지정한다.
	3) AS : 기존컬럼의 명칭을 다른이름으로 변경하고자 할때 사용한다.
	4) DISTINCT : SELECT문 다음에 위치하고, 중복을 배제할때 사용한다.
	5) WHERE : sql 구문에 조건을 입력하기 위해 사용된다.
	6) ORDER BY : 정렬할 컬럼을 지정할 때 사용한다.
	7) GROUP BY : 그룹을 지정할 때 사용한다.
**/
SELECT * FROM emp; -- SELECT / FROM 기본예제
SELECT ename AS 이름 FROM emp; -- AS 사용예제
SELECT DISTINCT mgr FROM emp; -- DISTINCT 사용예제
SELECT * FROM emp WHERE sal>=2000; -- WHERE 사용예제
SELECT * FROM emp ORDER BY empno; -- ORDER BY 사용예제
SELECT job 직업, max(sal) 최고연봉, min(sal) 최저연봉
FROM emp
GROUP BY job; -- GROUP BY 사용예제

/*
6. 컬럼명을 별칭명으로 사용할 때, ""를 활용하는 이유는 무엇인가?
	1) 컬럼명으로 특수문자가 있을경우
		ex) "#이름#"
	2) 컬러명에 공백이 있을경우
		ex) "이 름"

				
7./sql에서 ||와 + 의 차이점을 기술하세요.
	1) 연결연산자 ||
		- 문자와 문자를 연결할 수 있다.
		- 문자와 숫자를 연결하여 새로운 문자열을 만든다.
	2) 수식연산자 +
		- 숫자형 데이터 컬럼끼리 연산을하여 새로운 컬럼을 만들 수 있다.
**/
SELECT ename||'-'||job 프로필 FROM emp; -- 문자와 문자를 연결
SELECT ename||'-'||empno 프로필 FROM emp; -- 문자와 숫자를 연결
SELECT sal+sal "2달월급" FROM emp; -- 숫자형 + 숫자형


/*
 8. sql을 이용하여 
 @@번 부서의  사원 @@@(사원번호)의 현재 연봉은 @@ 만원입니다.
 를 한 라인으로 출력하되, 연봉이 3000이상인 사원만 출력되게 하세요.
 */
SELECT job||' 부서의 사원 '||ename||'('||empno||')의 현재 연봉은 '||sal||' 만원입니다.'
FROM emp
WHERE sal >= 3000;


