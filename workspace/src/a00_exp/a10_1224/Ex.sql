-- 1
컬럼명의 별칭은 데이터 리스트 상단에 컬럼명으로 표기,
	특수문자나 공백을 사용할 때는 ""사이에 입력하여 처리한다.
cf_추후 데이터 연결시 중요한 컬럼지칭명으로 사용된다.
테이블 별치은 다른 테이블과 중복적으로 조인시 활용되고,
전체 테이블의 컬럼에서 추가적인 컬럼으 처리할 때, 활용된다.
	
	SELECT 컬럼 별칭
	  FROM 테이블 별칭;
	  
	SELECT a.*, empno AS NO, ename name, job "직 책"
	  FROM emp a;
	  
-- 2
	 SELECT ename||'('||empno||')'||
	 		'의 급여는 '||sal||', 보너스는 '||comm||' 합계 '
	 		||nvl(comm,0)+sal||'만원 이다.' show
	   FROM emp;
	   
-- 3
	  SELECT 컬럼명, 그룹함수()
	    FROM 테이블명
	   WHERE 조건(비교연산자/논리연산자)
	   GROUP BY 그룹처리할 컬럼명
	   HAVING 그룹함수()의 결과를 기준으로 (비교/논리자)
	   ORDER BY 컬럼명 ASC(디폴트로 오름차순), DESC(내림 차순 정렬);

	  SELECT deptno, avg(sal) AS savg -- 부서번호 별 평균 급여
	    FROM emp
	   WHERE deptno >= 20 -- 부서번호 20이상인 것
	   GROUP BY deptno -- 부서번호를 그룹함수로 처리
	   HAVING savg >= 2000 -- svg(sal) 사용, alias이름으로도 가능
	   ORDER BY detpno DESC;
	  
-- 4. 
null이란 특정 테이블의 컬럼에 데이터가 할당되지 않는 것을 말한다.
데이터베이스에서는 숫자나 문자열 상관없이 null입력/출력.
이렇게 NULL으로 된 내용을 프로그래밍(java)에서 호출을 하면 숫자형 데이터는 0으로
처리되고 String(문자열)로 된 데이터만 null로 할당되어 사용한다.
	SELECT * FROM emp
	WHERE comm IS NULL; comm이 NULL 데이터를 로딩할 때 활용한다.
	
-- 5.
	SQL 구문으로는 WHERE 문과 having에서 활용한다.
	논리연산자 (TRUE/false)로 처리되는 구분. (=,!=,>?,<,<=,>,>=)
	논리연산자를 AND, or로 연결한 것을 비교연산자.(조건1 AND 조건2, 조건1 OR 조건2)
	추가하여 NOT 연산자, BETWEEN A AND B, IS NULL, IN 구분을 활용하여
	조건문에 사용된다.

-- 6.
	varchar2(n) : 가변 문자열, N을 최고 크기로 설정하여 문자열 데이터 할당.
	char(n) : 고정 문자열, n크기로 데이터가 입력되는 문자열
	 ex) char(5) 데이터 'a' 할당되면 'a    ' 뒤에는 공백이 할당되어 크기를
	 	동일하게 설정된다.
	 	 number(p,s) : 전체크기와 소숫점이하의 크기를 설정할 수 있는 숫자형 데이터 타입
	 	 DATE : 날짜/시간을 입력할 수 있는 데이터 유형.
	 	 timestamp(n) : date형의 확장 형태로 n millisecond로 세부적인 시간까지 처리해준다.
	 	 blob : 대용량 바이너리 데이터(일반파일, 이미지 등등)를 데이터 유형으로 할당 최대 4gb
	 	 clob : 대용량 텍스트 데이터 할당. 최대 4gb
	 	 bfile : 대용량의 파일형 데이터를 파일형으로 저장하기 위한 데이터 타입 최대 4GB 
	 	 rowid : 테이블 내 행의 고유 주소를 가지는 64진수 문자 유형
	 	 
-- 7.
	CREATE TABLE student(
		schid char(10),  -- 입학년도, 단과정보, 그외 sequence(순서)
		name varchar2(50),
		major varchar2(30),
		address varchar2(200),
		grade NUMBER,
		cre_dte DATE -- 입학/등록 정보를 날짜유형으로 설정..
	);
	INSERT INTO student VALUES('hr2170885','홍길동','컴퓨터공학과','서울 신림동..',1, sysdate);
	INSERT INTO student VALUES('hr1870885','김형철','산업디자인과','서울 방배동..',4, '2018-03-01');
	날짜 형식을 입력시는 문자열 ==> 날짜로 변환하는 함수인 to_date()를 확용하여 입력한다.

	sysdate : 현재 날짜와 시간을 date형으로 입력할 때, 활용한다.
	ex) SELECT sysdate FROM dual;

-- 8.
	함수의 매개변수를 통해 데이터가 입력되면, 함수로 인하여 원하는 데이터 형식으로 변경하여
	효율적으로 활용하기 위하여 사용된다.
	단일행 함수 : 입력한 데이터의 갯수와 출력한 데이터의 갯수가 동일할 때를 말한다.
	일반적인 함수
	복수행 함수 : 여러 입력한 데이터에 의해서 그룹으로 처리하여, 단일 또는 그룹이 데이터
	건수에 의해서 처리되는 함수.
	
-- 9.
	물건명 [     ] [검색] 검색 클릭시, 대소문자 관련 없이 키워드 검색이 되게 처리하려면,,
	SELECT *
	  FROM product
	 WHERE upper(pname) LIKE upper('%'||검색데이터||'%');
	
-- 10.
	LENGTH : 문자열의 크기를 처리해주는 함수. 영문/한글 구분없이 글자당 처리
	LENGTHB : 문자열의 byte 크기를 처리해주는 함수. 영문은 한글자당 1byte
		한글은 3바이트(oracle)
	
	SELECT '안녕하세요' s1, length('안녕하세요') s2, lengthb('안녕하세요') s3,
		'hello' se1, length('hello') se2, lengthb('hello') se3
  	  FROM dual;
	
-- 11.
	ename : 앞에서 3자 추출
	job : 뒤에서 5자 추출
	SELECT substr(ename,1,3)||'('||deptno||')'||'의 직책은 '||
		   substr(job,-5,5)||'입니다.' AS show
	  FROM emp
	substr(컬럼명, -5, 5) : 마이너스는 뒤에서 부터 5를 추출해서 시작한다.
	
-- 12.
	lpad(컬럼명, 기준이되는 자리수, 자리수보다 적을 때 채워놓는 문자)
	SELECT ename, lpad(ename, 10, '#') show FROM emp;
	ltrim(컬럼명, 왼쪽에서부터 삭제할 문자)
	SELECT job, ltrim(job, 'A') FROM emp;


	    
	

	   