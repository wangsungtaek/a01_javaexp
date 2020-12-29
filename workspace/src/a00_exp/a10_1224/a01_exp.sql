SELECT * FROM emp;
--1. 컬럼과 테이블의 별칭에 대하여 예제를 통해서 기술하세요.
SELECT ename 이름, empno 사원번호 FROM emp; -- 별칭 사용 1
SELECT ename "이 름", empno "사원 번호" FROM emp; -- 별칭 사용 2
SELECT ename AS 이름, empno AS 사원번호 FROM emp; -- 별칭 사용 3
SELECT ename AS "이 름", empno AS "#사원번호#" FROM emp; -- 별칭 사용 4
-- 공백이나 특수 문자가 포함하면 ""큰따움표로 감싼다.

--2. 아래의 형식으로 emp 테이블을 출력하세요. 사원명(사원번호)의 급여는 @@, 보너스는 @@ 합계 @@ 이다.
SELECT ename||'('||empno||')의 급여는 '||
	   sal||', 보너스는 '||comm||' 합계 '||
	   (sal+nvl(comm,0))||' 이다.' AS show
  FROM emp;

--3. sql 명령문의 표준 형식을 간단한 예제를 통해서 설명하세요.
SELECT * -- 조회할 컬럼을 SELECT절을 통해 지정할 수 있다.
  FROM emp -- 조회할 테이블을 FROM절을 통해 지정한다.
 WHERE sal >= 1000; --조회 데이터 중 WHERE절의 조건문을 이용 조건에 만족하는 값만 조회할 수 있다.
 
--4. sql에서 null이란 무엇을 의미하는지 기술하고, null인 컬럼과 그렇지 않는 컬럼을 구분하세요.
--null은 존재하지 않음을 의미한다.
SELECT *
  FROM emp
 WHERE comm IS NOT NULL;
SELECT *
  FROM emp
 WHERE comm IS NULL;

/*
5. sql의 논리연산자와 비교연산자를 구분하여 기술하세요. 
	1) 논리연산자 : 조건의 진위 여부를 확인한다.
		OR, AND
	2) 비교연산자 : 두 식의 진위 여부를 확인한다.
		=,>,<,<=,>=,!= 등..

6. 데이터베이스에서 사용하는 데이터 타입의 종류를 기술하세요.
	1) varchar2(size) : 가변형 문자열 데이터타입. 최대 4000byte 저장가능
	2) number(p,s) : 정수, 실수 등 숫자형 데이터타입.
	3) date : 날짜/시간를 저장할 수 있는 데이터타입
	4) char(size) : 고정형 문자열 데이터타입. 최대 2000byte 저장가능
	-------------------------------------------------
	5) nvarchar2(size) : 국가별 문자 집합에 따른 최고 크기의 문자를 설정하는 가변형 데이터 처리.
	6) rowid : 테이블 내 행의 고유 주소를 가지는 64진수 문자 타입. 행당 6바이트 또는 10바이트
	7) blob : 대용량의 바이너리 데이터를 저장하기 위한 데이터타입 최대, 4gb
	8) clob : 대용량의 문자열 데이터를 저장하기 위한 데이터타입 최대, 4gb
	9) bfile : 대용량의 바이너리 데이터를 파일 형태로 저장하기 위한 데이터 타입, 4gb
	10) timestamp(n) : 날짜형 데이터타입의 확정된 형태 n은 millisecond, 자리수는 최대 9자리까지 표현이 가능
 **/
-- 7. 학번, 이름, 전공, 주소, 학년, 입학일 의  테이블을 구성하고, 데이터를 입력하세요.
CREATE TABLE STUDENT (
	no char(10),
	name varchar2(20),
	major varchar2(10),
	adress varchar2(30),
	year NUMBER,
	day number
);
INSERT INTO student Values('2012240001','홍길동','수학','서울시',1,30);
INSERT INTO student Values('2012240002','홍길순','국어','수원시',3,2);
INSERT INTO student Values('2012240003','홍막동','영어','청주시',2,15);
SELECT *
  FROM student;

/*
8. 함수란 무엇이며, 함수에 단일행 함수와 다중행 함수의 차이점을 예시를 통해서 설명하세요.
	1. 함수
		1) 컬럼의 값이나 데이터 타입이 변경하는 경우
		2) 숫자 또는 날짜 데이터의출력 형식이 변경하는 경우
		3) 하나 이상의 행에 대한 집계를 하는 경우
	2. 단일행
		1) 테이블에 저장되어 있는 개별 행을 대상으로 하는 함수를 적용하여 하나의 결과를 반환하는 함수
	3. 복수행
		1) 조건에 따라 여러 행을 그룹화하여 그룹별로 결과를 하나씩 반환하는 함수
**/
 
-- 9. 문자 함수가 사용되는 용도에서 웹화면에 물품명을 대소문자 관련없이 검색한다고 가정할 때,
-- 	product(테이블명), pname(검색할 물건명) 을 기준으로 sql을 작성하세요.
SELECT *
  FROM product
 WHERE upper(pname) LIKE '%'||upper(pname)||'%';

/*
-- 10. length와 lengthb를 차이를 기술하고, dual을 이용해서 한글과 영문을 비교하세요.
		1) length : 문자열의 길이를 반환한다.
		2) lengthb : 문자열의 바이트수를 반환한다.
			- 한글과, 특수문자는 3바이트, 영어와 숫자는 1바이트로 할당된다.
**/
SELECT LENGTH('hello') AS 문자열길이,
	   LENGTHB('hello') AS 문자열바이트,
	   LENGTH('안녕') AS 문자열길이,
	   LENGTHB('안녕') AS 문자열바이트
  FROM dual;
-- 11. ||, substr  이용하여  [ename(deptno)의 직책은 job 입니다. ] 형식으로 출력하세요.   
--    ename : 앞에서 3자 추출
--    job :뒤에서 5자 추출
SELECT ename, job,
	   '[ '||substr(ename,1,3)
	   ||'('||deptno||')의 직책은 '
	   ||substr(job,-5)
	   ||' 입니다. ]' AS show
  FROM emp;
	
-- 12. lpad와 ltrim의 기본적인 형식을 기본예제와 함께 기술하세요.
SELECT lpad('12345',9,'*') AS lpad, -- 총9바이트 구성된 문자열 중 빈공간을 왼쪽으로 *로 채움
	   rpad('12345',9,'*') AS rpad  -- 총9바이트 구성된 문자열 중 빈공간을 오른쪽으로 *로 채움
  FROM dual;

SELECT ltrim('**12345**','*') AS lpad, -- 왼쪽의 *을 삭제
	   rtrim('**12345**','*') AS rpad --  오른쪽의 *을 삭제
  FROM dual;