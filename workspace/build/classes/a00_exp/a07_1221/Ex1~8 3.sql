/*
--1. 조회의 기본 형식을 기술하고, 예제를 통해서 그 의미를 기술하세요.
	1) SELECT * FROM emp; : emp테이블의 전체 컬럼을 조회한다.
	2) SELECT ename FROM emp; : emp테이블의 ename컬럼을 조회한다.
	3) SELECT ename, job FROM emp; : emp테이블의 ename, job컬럼을 조회한다.
**/
/*
	SELECT * 테이블 전체 조회
	FROM 테이블명;
	SELECT 컬럼명1, 컬럼명2 컬럼별 조회
	FROM 테이블;
	
	SELECT 컬럼명1 AS 별칭명1, 컬럼명2 별칭명2
 */
--2. 컬럼의 별칭사용 형식을 기술하고, 기본 예제를 통해 기술하세요.
	SELECT empno 번호, ename 이름
	FROM emp;

--3. dbeaver에서 데이터 베이스서버에 연결하는 핵심 정보를 기술하세요.
/*
	1) jdbc 드라이버 설정 : 클라이언트 툴에 jdbc 드라이버를 설정..
		ex) dbeaver : 메뉴(데이터베이스  ==> 드라이버관리자)
	2) 데이터베이스 서버 연결(서버에서 클라이언트 접근시 핵심 정보) :
		host : 특정 db서버의 ip주소,
			현재 사용자(클라이언트) 컴퓨터와 서버 위치가 동일하면 localhost
		port : db서버를 접근할 port ex) 1521
		database sid : 데이터베이스 식별자 ex) xe
		username : 사용자 계정명 ex) scott
		password : 비밀번호 ex) tiger
 */
--4. @@님의 사원번호는 @@이고, 올해 연말보너스는 연봉의 20%인 @@원입니다.
SELECT ename||'님의 사원본호는 '||empno||'이고, 올해 연말보너스는 연봉의 20%인 '||
	round(sal*0.2)||'만원입니다.' show
FROM emp;

--5. sql문의 기본형식을 기술하고, 각 기본 형식에서 활용되는 keyword를 예제별로 기술하세요.
/*
	SELECT 
		distinct : 데이터의 중복을 삭제해준다.
		* : 전체데이터
		컬러명 : 특정 컬럼
		as 별칭 [열단위] 선택
	FROM 테이블 : 데이터를 호출할 테이블을 지칭
	WHERE 조건 : 컬럼명 = 데이터, >,<,>=,<=,!=,<> 비교연산자 AND, OR, IN
		BETWEEN A AND B 등의 키워드를 이용해서 데이터의 선택 조건을 [행단위] 선택 처리한다.
	GROUP BY 컬럼명 : 특정 컬럼의 데이터를 그룹으로 분류하여 그룹함수(min(), max(), avg(), count())
		등을 이용하여 데이터를 처리할 때, 활용된다.
		ex)
			SELECT deptno, avg(sal)
			FROM emp
			GROUP BY deptno
			ORDER BY deptno;
	HAVING 조건 : 그룹함수를 통한 결과값을 조건에 따라 FILTERING할 때, 사용 된다.
	ORDER BY 정렬할컬럼 (ASC/DESC) : ASC(오름차순), DESC(내림차순)으로 특정한 컬럼으로 정렬할 때,
		활용된다.
	기타 SQL : SUBQUERY, 내장함수이용을 이용해서 데이터를 조회하고, UPDATE, INSERT, DELETE
		구문으로 데이터를 수정, 등록, 삭제 처리한다.
*/
--6. 컬럼명을 별칭명으로 사용할 때, ""를 활용하는 이유는 무엇인가?
/*
	select 컬럼명 별칭
	컬렴명에 별칭을 공백을 추가하거나, 특수문자를 사용할 때, 활용한다.
 */
	SELECT  ename "공 백", job "#@"
	FROM emp;
--7./sql에서 ||와 + 의 차이점을 기술하세요.
/*
	
	SELECT 컬럼||데이터 : 컬럼 또는 데이터를 연결(concatenate)을 처리할 때, 활용한다.
			일반프로그램에서 + 연산자를 통해서 처리되는 것과 구분하여야 한다.
			숫자형컬럼 + 숫자데이터 : 숫자형 데이터를 덧셈 연산을 처리할 때, 활용된다.
 */
	SELECT ename ||'('||empno||')' "이름(사번)", sal + deptno "연봉과 부서 덧셈"
	FROM  emp;
/*
--8. sql을 이용하여 
 @@번 부서의  사원 @@@(사원번호)의 현재 연봉은 @@ 만원입니다.
 를 한 라인으로 출력하되, 연봉이 3000이상인 사원만 출력되게 하세요.
 */
SELECT deptno||'번 부서의  사원'||ename||'('||empno||') 의 현재 연봉은 '
	||sal||' 만원입니다.' show
FROM emp
WHERE sal >= 3000;