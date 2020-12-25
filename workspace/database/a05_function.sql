/*
# database에서 함수(function)
1. sql에서 함수(주로 내장함수)
	1) 컬럼의 값이나 데이터 타입이 변경하는 경우
	2) 숫자 또는 날짜 데이터의출력 형식이 변경하는 경우
	3) 하나 이상의 행에 대한 집계(aggregation)를 하는 경우

2. sql 함수의 유형
	1) 	단일 행 함수 : 테이블에 저장되어 있는 개별 행을 대상으로 하는 함수를
		적용하여 하나의 결과를 반환하는 함수
	2) 복수 행 함수 : 조건에 따라 여러 행을 그룹화하여 그룹별로 결과를 하나씩
		반환하는 함수...
3. 단일행 함수
	1) 데이터 값을 조작하는데 주로 사용한다.
	2) 행별로 함수를 적용하여 하나의 결과를 반환하는 함수이다.
	3) 단일행 함수의 종류
		문자함수, 숫자함수, 날짜함수,
		변환함수(묵시적데이터변환/명시적데이터변환 - 문자 => 숫자, 숫자 => 날짜, 날짜 => 문자),
		일반함수
4. 단일행 함수의 사용법
	SELECT 함수명(컬럼명/데이터, 매개변수1, 매개변수2..)
	WHERE 컬럼 = 함수명(컬럼명/데이터, 매개변수1, 매개변수2..)
# 문자함수
1. 문자 데이터를 입력하여 문자나 숫자를 결과로 반환하는 함수
2. 문자 함수의 종류
	1) 대소문자 변환 함수
	2) 문자조작 함수
	3) 문자열 길이반환 함수.
3. initcap : 문자열의 첫 번째 문자만 대문자로 변환 처리 함수.
	lower : 문자열 전체를 소문자로 변환
	upper : 문자열 전체를 대문자로 변환
*/
SELECT * FROM EMP;
SELECT ename, initcap(ename), lower(ename), upper(ename)
  FROM emp;
  
 -- ex1) 함수를 이용하여 다음과 같은 형태로 출력하세요
 --		 The job of Smith is a Clerk!
SELECT 'The job of '||INITCAP(ename)||' is a '||INITCAP(ename)||'!' AS show
  FROM EMP;
 
-- ex2) emp 테이블에 job 컬럼을 'Man'이라는 문자열로 대소문자 관계없이
--		키워드 검색을 할려고 한다. 해당 처리 sql을 작성하세요
-- 		해당내용이 데이터에 있는 내용으로 검색하려면 데이터베이스에 형태를 변경하거나
--		입력하는 데이터 자체를 소문자/대문자로 변경하여야 한다.
SELECT ename, job
  FROM emp
 WHERE upper(job) LIKE '%'||upper('%man%')||'%';

/*
# 문자열 길이 반환 함수
1. length : 입력되는 문자열의 길이(글자수)를 반환하는 함수.
2. lengthb : 입력되는 문자열의 바이트를 반환하는 함수.
	- 한글이나 특수문자는 1글자의 바이트가 3byte인 경우가 있어, 글자수와 byte수의 차이가 있다.
	- dual : 오라클에서 지원되는 가상테이블로 테이트 용으로 한라인에 데이터와
		함수를 적용할 때, 사용된다.
*/
SELECT '안녕하세요' AS greet, 'hello' AS greet2
  FROM dual;
 
SELECT '안녕하세요' AS 기본출력,
		LENGTH('안녕하세요') AS "length(한)",
		LENGTHb('안녕하세요') AS "lengthb(한)",
		LENGTH('hello!') AS "length(영)",
		LENGTHb('hello!') AS "lengthb(영)"
  FROM dual;

-- ex) emp테이블의 사원명과 직책, 글자수 각각 표현하되, job의 글자수가 6이상인 경우를 검색하여 출력하세요.
SELECT ename AS 사원명,
		job AS 직업,
		LENGTH(ename) AS 사원명글자수, 
		LENGTH(job) AS 직책글자수
  FROM emp
 WHERE LENGTH(job) >= 6;

/*
# 기타 문자열 조작함수
1. concat(문자열1, 문자열2) : 두 문자열을 결합처리한다. 문자열1 || 문자열2 동일..
	concat(concat(문자열1, 문자열2),'문자열3') 문자열1 || 문자열2 || 문자열3
	ex) concat('sql','plus') => sqlplus
2. substr(문자열데이터, 시작위치, 마지막위치) : 문자열 데이터를 시작위치와 마지막위치를
	기준으로 절삭처리하여 사용하는 것을 말한다.
	ex) substr('sql*plus',5,4) ==> plus
		5번째 부터 시작해서 4개의 문자를 추출하여 데이터를 표현한다.
	코드성 데이터 - 사원, 주민번호, 학번에는 각각의 위치별로 의미하는 바가 있기 때문에 추출하여
	데이터 활용한다. 주민번호의 경우 생년월일을 위치에 따라 추출할 수 있다.
*/
SELECT empno, ename, job, concat(ename, job) AS "이름과 직책"
  FROM emp;

SELECT '19'||substr('951210-2801629',1,2)||'년생' AS 년도
  FROM dual; -- 주민번호를 통해서 몇년도에 태어났는지를 추출해서 사용할 수 있다.
  
-- ex1) || 쓰지말고 concat를 이중으로 활용하여, 사원명-사번을 형식으로 표기하세요
SELECT CONCAT(ename,'-') AS "1단계",
	   CONCAT(CONCAT(ename,'-'),empno) AS "2단계"
  FROM emp;
 
 -- ex2) 951210-2801629 주민번호를 이용해서 1995년 12우러 10일 생 입니다. 라고 dual 테이블로 출력하세요.
SELECT '19'||substr('951210-2801629',1,2)||' 년도 '
 		||substr('951210-2801629',1,2)||'월 '
 		||substr('951210-2801629',1,2)||'일 생 입니다. ' AS show
  FROM dual;
SELECT ''||hiredate,'19'
		 ||substr(hiredate,1,2)||'년 '
		 ||substr(hiredate,4,2)||'월 '
		 ||substr(hiredate,7,2)||'일'AS 입사일
  FROM emp;
-- hiredate는 데이터 타입이 date이고,
-- 그래서 tool나타나는 모양과 문자열로 변환해서 나타나는 모양에 차이가 있습니다.
-- 데이터 함수를 이용해서 처리하는 부분은 문자열로 처리해서 나타나는 부분입니다.